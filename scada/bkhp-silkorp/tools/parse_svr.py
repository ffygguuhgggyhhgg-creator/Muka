#!/usr/bin/env python3
"""Parser for Simple-Scada 2 `Variables.svr` (tag database).

Record layout:
    <u32 bytelen><name, UTF-8 ASCII>
    <u64 id><u64 handle><byte 0xff><u32 type>   ... fixed block
    ... <u32 len><UTF-16LE string> * n          description, OPC binding, format
Group captions sit between records as UTF-8 Cyrillic strings.
"""
import re
import struct
import sys

TYPES = {1: 'Boolean', 2: 'Byte', 3: 'Single', 6: 'Integer', 8: 'Double',
         11: 'DateTime', 12: 'Word'}
PLACEHOLDERS = {'Noname server', 'Noname caption', 'Noname computer',
                'Noname ClsID'}


def u32(d, i):
    return struct.unpack_from('<I', d, i)[0]


def u64(d, i):
    return struct.unpack_from('<Q', d, i)[0]


def read_name(d, i):
    if i + 4 > len(d):
        return None
    n = u32(d, i)
    if not 2 <= n <= 64 or i + 4 + n > len(d):
        return None
    try:
        s = d[i + 4:i + 4 + n].decode('ascii')
    except UnicodeDecodeError:
        return None
    return (s, i + 4 + n) if re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', s) else None


def read_u16str(d, i, limit=4000):
    if i + 4 > len(d):
        return None
    n = u32(d, i)
    if n > limit or i + 4 + n * 2 > len(d):
        return None
    try:
        s = d[i + 4:i + 4 + n * 2].decode('utf-16-le')
    except UnicodeDecodeError:
        return None
    return (s, i + 4 + n * 2) if all(ord(c) >= 32 or c == '\t' for c in s) else None


def read_caption(d, i):
    """UTF-8 Cyrillic group caption."""
    if i + 4 > len(d):
        return None
    n = u32(d, i)
    if not 3 <= n <= 200 or i + 4 + n > len(d):
        return None
    try:
        s = d[i + 4:i + 4 + n].decode('utf-8')
    except UnicodeDecodeError:
        return None
    if not re.search(r'[А-Яа-яЁё]', s) or any(ord(c) < 32 for c in s):
        return None
    return s, i + 4 + n


def parse(path):
    d = open(path, 'rb').read()
    heads, i = [], 0
    while i < len(d) - 4:
        r = read_name(d, i)
        if not r:
            i += 1
            continue
        base = i + 4 + len(r[0])
        # Two record shapes: the 0xff type marker sits either right after the
        # id/handle pair, or after an OPC-DA item alias stored as UTF-16.
        cands = [(base + 16, '')]
        for p in (12, 16):
            a = read_u16str(d, base + p, limit=300)
            if a and a[0] and all(ord(c) >= 32 for c in a[0]):
                cands.append((a[1], a[0]))
        for m, alias in cands:
            if m + 5 <= len(d) and d[m] == 0xff:
                heads.append({'off': i, 'name': r[0], 'id': u64(d, base),
                              'type': u32(d, m + 1), 'body': r[1], 'alias': alias})
                break
        else:
            i += 1
            continue
        i = r[1]
    out = []
    for k, h in enumerate(heads):
        stop = heads[k + 1]['off'] if k + 1 < len(heads) else len(d)
        strs, groups, i = [], [], h['body']
        while i < stop - 4:
            r = read_u16str(d, i)
            if r and len(r[0].strip()) > 1:
                strs.append(r[0])
                i = r[1]
                continue
            c = read_caption(d, i)
            if c:
                groups.append(c[0])
                i = c[1]
                continue
            i += 1
        fmt = strs.pop() if strs else ''
        alias = h.get('alias', '')
        item = next((s for s in strs if s.startswith('|var|') or s.startswith('|ns=')),
                    alias)
        server = next((s for s in strs if s.startswith('opc.tcp') or '://' in s), '')
        if not server and alias:
            # OPC DA tag: the server name follows the item alias
            server = next((s for s in strs
                           if s not in PLACEHOLDERS and s != alias
                           and not s.startswith('{') and s != 'localhost'), '')
        rest = [s for s in strs
                if s not in PLACEHOLDERS and s not in (item, server, alias)
                and not s.startswith('{') and s != 'localhost']
        desc = rest[0] if rest else ''
        h.update({'desc': desc, 'item': item, 'server': server, 'fmt': fmt,
                  'groups_after': groups})
        out.append(h)
    return out


if __name__ == '__main__':
    src = sys.argv[1] if len(sys.argv) > 1 else 'project/Variables.svr'
    recs = parse(src)
    print('id\tname\ttype\tgroup\topc_item\topc_server\tformat\tdescription')
    group = ''
    for r in recs:
        print('\t'.join([str(r['id']), r['name'], TYPES.get(r['type'], f"?{r['type']}"),
                         group, r['item'], r['server'], r['fmt'], r['desc']]))
        if r['groups_after']:
            group = ' / '.join(r['groups_after'])
    print(f'# variables: {len(recs)}', file=sys.stderr)
