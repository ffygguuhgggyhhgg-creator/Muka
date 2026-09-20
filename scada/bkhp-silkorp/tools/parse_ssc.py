#!/usr/bin/env python3
"""Structural parser for Simple-Scada 2 `Scripts.ssc`.

Record layout (established by inspecting the binary):

    <u32 len><name>            script (event handler) name, len*2 bytes UTF-16LE
    <14 bytes>                 flags: enabled, id, colour/handle, ...
    <u32 nlinks>               number of linked variables/objects
    nlinks * <u32 id><u32 0>   ids of the linked variables
    <u32 nlines>               number of source lines
    nlines * (<u32 len><line>) source text, one record per line

Folder captions live between records as UTF-8 strings (<u32 bytelen><bytes>).
"""
import os
import re
import struct
import sys

IDENT = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*$')
FLAGS = 14


def u32(d, i):
    return struct.unpack_from('<I', d, i)[0]


def read_u16str(d, i, limit=100000):
    """Return (text, next_offset) for a <u32 len><UTF-16LE> string, else None."""
    if i + 4 > len(d):
        return None
    n = u32(d, i)
    if n > limit or i + 4 + n * 2 > len(d):
        return None
    try:
        return d[i + 4:i + 4 + n * 2].decode('utf-16-le'), i + 4 + n * 2
    except UnicodeDecodeError:
        return None


def read_utf8str(d, i, limit=4096):
    if i + 4 > len(d):
        return None
    n = u32(d, i)
    if not 0 < n <= limit or i + 4 + n > len(d):
        return None
    try:
        s = d[i + 4:i + 4 + n].decode('utf-8')
    except UnicodeDecodeError:
        return None
    return (s, i + 4 + n) if all(ord(c) >= 32 for c in s) else None


def parse_record(d, i):
    """Parse one script record starting at offset i, or return None."""
    r = read_u16str(d, i, limit=200)
    if not r or not IDENT.match(r[0]):
        return None
    name, j = r
    if j + FLAGS + 4 > len(d):
        return None
    nlinks = u32(d, j + FLAGS)
    if nlinks > 4096:
        return None
    k = j + FLAGS + 4
    links = []
    for _ in range(nlinks):
        if k + 8 > len(d):
            return None
        links.append(u32(d, k))
        k += 8
    if k + 4 > len(d):
        return None
    nlines = u32(d, k)
    if not 0 < nlines <= 20000:
        return None
    k += 4
    lines = []
    for _ in range(nlines):
        rr = read_u16str(d, k)
        if not rr:
            return None
        lines.append(rr[0])
        k = rr[1]
    tail = [l for l in lines if l.strip()]
    if not tail or not tail[-1].strip().lower().startswith('end'):
        return None
    return {'name': name, 'start': i, 'end': k, 'links': links, 'lines': lines}


def parse(path):
    d = open(path, 'rb').read()
    scripts, i = [], 0
    while i < len(d) - 4:
        rec = parse_record(d, i)
        if rec:
            scripts.append(rec)
            i = rec['end']
        else:
            i += 1
    prev = 0
    for s in scripts:
        s['folders'] = folders_between(d, prev, s['start'])
        prev = s['end']
    return d, scripts


def folders_between(d, a, b):
    """UTF-8 captions (folder names) in the gap between two records."""
    out, i = [], a
    while i < b - 4:
        r = read_utf8str(d, i)
        if r and len(r[0]) > 2 and re.search(r'[А-Яа-яЁёA-Za-z]', r[0]):
            out.append(r[0])
            i = r[1]
        else:
            i += 1
    return out


if __name__ == '__main__':
    src = sys.argv[1] if len(sys.argv) > 1 else 'project/Scripts/Scripts.ssc'
    outdir = sys.argv[2] if len(sys.argv) > 2 else None
    data, recs = parse(src)
    covered = sum(s['end'] - s['start'] for s in recs)
    print(f'scripts: {len(recs)}   coverage: {covered}/{len(data)} '
          f'({100 * covered / len(data):.1f}%)', file=sys.stderr)
    if outdir:
        os.makedirs(outdir, exist_ok=True)
        for s in recs:
            body = '\n'.join(l.rstrip() for l in s['lines']).rstrip() + '\n'
            open(os.path.join(outdir, s['name'] + '.pas'), 'w',
                 encoding='utf-8').write(body)
    for s in recs:
        for f in s['folders']:
            print('[folder]', f)
        print(f"    {s['name']:38s} {len(s['lines']):5d} lines  "
              f"{len(s['links'])} links")
