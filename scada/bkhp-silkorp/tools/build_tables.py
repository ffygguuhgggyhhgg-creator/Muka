#!/usr/bin/env python3
"""Join the tag tree (Variables.svrr) with the OPC bindings (Variables.svr)."""
import sys

sys.path.insert(0, 'tools')
import parse_svr
import parse_svrr

roots, _ = parse_svrr.parse('project/Variables.svrr')
tree = list(parse_svrr.walk(roots))
opc = {r['name']: r for r in parse_svr.parse('project/Variables.svr')}

print('id\tname\ttype\tgroup\topc_item\tdescription')
n = miss = 0
for node in tree:
    group = ' / '.join(node['path'])
    for v in node['vars']:
        o = opc.get(v['name'])
        item = o['item'] if o else ''
        if o is None:
            miss += 1
        # keep the CODESYS symbol only — the PLC prefix is identical everywhere
        item = item.replace('|var|PLC210 (Arm32bit + Linux ).Application.PLC_PRG.', '')
        desc = v['desc'] or (o['desc'] if o else '')
        print(f"{v['id']}\t{v['name']}\t{parse_svrr.TYPES.get(v['type'], '?')}\t"
              f"{group}\t{item}\t{desc}")
        n += 1
print(f'# rows: {n}, no svr record: {miss}', file=sys.stderr)
