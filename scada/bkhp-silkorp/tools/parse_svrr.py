#!/usr/bin/env python3
"""Parser for Simple-Scada 2 `Variables.svrr` — the tag *tree*.

Layout (exact):
    root   := <u32 nchildren> node*
    node   := <u32 namelen><name UTF-8><u32 nvars> var* <u32 nchildren> node*
    var    := <u32 namelen><name UTF-8><u64 id><u32 type><2 bytes>
              <u32 desclen><desc UTF-16LE><1 byte>
"""
import struct
import sys

TYPES = {1: 'Boolean', 2: 'Byte', 3: 'Single', 6: 'Integer', 8: 'Double',
         11: 'DateTime', 12: 'Word'}


class R:
    def __init__(self, d):
        self.d, self.i = d, 0

    def u32(self):
        v = struct.unpack_from('<I', self.d, self.i)[0]
        self.i += 4
        return v

    def u64(self):
        v = struct.unpack_from('<Q', self.d, self.i)[0]
        self.i += 8
        return v

    def utf8(self, n):
        s = self.d[self.i:self.i + n].decode('utf-8')
        self.i += n
        return s

    def utf16(self, n):
        s = self.d[self.i:self.i + n * 2].decode('utf-16-le')
        self.i += n * 2
        return s

    def skip(self, n):
        self.i += n


def read_var(r):
    name = r.utf8(r.u32())
    vid = r.u64()
    vtype = r.u32()
    r.skip(2)
    desc = r.utf16(r.u32())
    r.skip(1)
    return {'name': name, 'id': vid, 'type': vtype, 'desc': desc}


def read_node(r, path):
    name = r.utf8(r.u32())
    here = path + [name]
    vars_ = [read_var(r) for _ in range(r.u32())]
    kids = [read_node(r, here) for _ in range(r.u32())]
    return {'name': name, 'path': here, 'vars': vars_, 'children': kids}


def parse(path):
    r = R(open(path, 'rb').read())
    return [read_node(r, []) for _ in range(r.u32())], r


def walk(nodes):
    for n in nodes:
        yield n
        yield from walk(n['children'])


if __name__ == '__main__':
    src = sys.argv[1] if len(sys.argv) > 1 else 'project/Variables.svrr'
    mode = sys.argv[2] if len(sys.argv) > 2 else 'tree'
    roots, r = parse(src)
    nodes = list(walk(roots))
    nvars = sum(len(n['vars']) for n in nodes)
    print(f'# groups: {len(nodes)}  variables: {nvars}  '
          f'bytes consumed: {r.i}/{len(r.d)}', file=sys.stderr)
    if mode == 'tsv':
        print('id\tname\ttype\tgroup\tdescription')
        for n in nodes:
            g = ' / '.join(n['path'])
            for v in n['vars']:
                print(f"{v['id']}\t{v['name']}\t{TYPES.get(v['type'], '?%d' % v['type'])}"
                      f"\t{g}\t{v['desc']}")
    else:
        for n in nodes:
            print('  ' * (len(n['path']) - 1) + f"{n['name']}  [{len(n['vars'])}]")
