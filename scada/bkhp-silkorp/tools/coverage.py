#!/usr/bin/env python3
"""Per-mechanism coverage matrix: tag -> screen object -> handler -> PLC I/O."""
import os
import re
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import parse_ssc
import parse_svr
import parse_svrr

FAMILIES = {'N': ('Нории', 10), 'C': ('Аспирация', 14), 'T': ('Транспортеры', 20)}


def load():
    roots, _ = parse_svrr.parse('project/Variables.svrr')
    tags = {}
    for node in parse_svrr.walk(roots):
        for v in node['vars']:
            tags[v['name']] = {'type': parse_svrr.TYPES.get(v['type'], '?'),
                               'group': ' / '.join(node['path'])}
    for r in parse_svr.parse('project/Variables.svr'):
        if r['name'] in tags:
            tags[r['name']]['item'] = r['item']
    objs = set()
    for f in ('decoded/pages.txt', 'decoded/windows.txt'):
        for l in open(f, encoding='utf-8'):
            if re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', l.strip()):
                objs.add(l.strip())
    d, recs = parse_ssc.parse('project/Scripts/Scripts.ssc')
    kinds = {}
    for r in recs:
        j = r['start'] + 4 + len(r['name']) * 2
        kinds[r['name']] = d[j + 1]
    srcs = {f[:-4]: open('decoded/scripts/' + f, encoding='utf-8').read()
            for f in os.listdir('decoded/scripts')}
    return tags, objs, kinds, srcs


def drivers(srcs):
    """script -> set of (family, index) whose Status* tags it touches."""
    pat = re.compile(r'\bStatus(?:Start)?(?:Forward|Revers)?([NCT])(\d+)\b')
    out = {}
    for n, s in srcs.items():
        out[n] = {(m.group(1), int(m.group(2))) for m in pat.finditer(s)}
    return out


if __name__ == '__main__':
    tags, objs, kinds, srcs = load()
    drv = drivers(srcs)
    print('| Мех. | Status | RelayOut→ПЛК | Кнопка пуска (объект) | Обработчик пуска |'
          ' Кнопка стоп | Обработчик стоп | TextStatus | Обработчик текста |')
    print('|---|---|---|---|---|---|---|---|---|')
    for fam, (title, count) in FAMILIES.items():
        for i in range(1, count + 1):
            key = (fam, i)
            st = f'Status{fam}{i}'
            if fam == 'T':
                ro = [f'RelayOutForwardT{i}', f'RelayOutReversT{i}']
                sb, stb = f'StartForwardButtonT{i}', f'StopButtonT{i}'
            else:
                ro = [f'RelayOut{fam}{i}']
                sb, stb = f'StartButton{fam}{i}', f'StopButton{fam}{i}'
            opc = all(tags.get(r, {}).get('item') for r in ro)
            start_h = sorted(n for n, k in drv.items()
                             if key in k and n.startswith(('StartButton', 'StartForwardButton')))
            stop_h = sorted(n for n, k in drv.items()
                            if key in k and n.startswith('StopButton'))
            txt = f'TextStatus{fam}{i}'
            txt_h = txt + '_OnDataChange'
            row = [f'{fam}{i}',
                   'да' if st in tags else '**НЕТ**',
                   'да' if opc else '**нет**',
                   'да' if sb in objs else '**нет**',
                   ', '.join(start_h) or '**НЕТ**',
                   'да' if stb in objs else '**нет**',
                   ', '.join(stop_h) or '**НЕТ**',
                   'да' if txt in objs else '**нет**',
                   'да' if txt_h in srcs else '**НЕТ**']
            print('| ' + ' | '.join(row) + ' |')
