#!/usr/bin/env python3
"""Tag read/write analysis across all scripts."""
import os
import re
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import parse_svr
import parse_svrr


def strip(src):
    src = re.sub(r"'(?:[^'\n]|'')*'", "''", src)
    src = re.sub(r'"[^"\n]*"', "''", src)
    src = re.sub(r'\{[^}]*\}', ' ', src)
    return re.sub(r'//[^\n]*', '', src)


def main():
    roots, _ = parse_svrr.parse('project/Variables.svrr')
    tags = {}
    for node in parse_svrr.walk(roots):
        for v in node['vars']:
            tags[v['name']] = {'group': ' / '.join(node['path']),
                               'type': parse_svrr.TYPES.get(v['type'], '?'),
                               'desc': v['desc'], 'item': ''}
    for r in parse_svr.parse('project/Variables.svr'):
        if r['name'] in tags:
            tags[r['name']]['item'] = r['item']

    reads, writes = defaultdict(set), defaultdict(set)
    for f in sorted(os.listdir('decoded/scripts')):
        src = strip(open('decoded/scripts/' + f, encoding='utf-8').read())
        for line in src.split('\n'):
            lhs, _, rhs = line.partition(':=')
            if _:
                for m in re.finditer(r'\b([A-Za-z_]\w*)\s*\.\s*Value\b', lhs):
                    if m.group(1) in tags:
                        writes[m.group(1)].add(f[:-4])
                scan = rhs
            else:
                scan = line
            for m in re.finditer(r'\b([A-Za-z_]\w*)\s*\.\s*(Value|As\w+)\b', scan):
                if m.group(1) in tags:
                    reads[m.group(1)].add(f[:-4])
    return tags, reads, writes


if __name__ == '__main__':
    tags, reads, writes = main()
    used = set(reads) | set(writes)
    sysv = {n for n, t in tags.items() if t['group'] == 'Системные переменные'}

    def show(title, names, extra=lambda n: ''):
        names = sorted(names)
        print(f'\n### {title}: {len(names)}')
        for n in names:
            print(f'  {n:30s} {tags[n]["type"]:9s} {tags[n]["group"][:46]:46s} {extra(n)}')

    show('Выходы в ПЛК, в которые скрипты НИЧЕГО не пишут',
         [n for n, t in tags.items() if t['item'] and 'Выходные' in t['group']
          and n not in writes])
    show('Входы из ПЛК, которые скрипты НЕ читают',
         [n for n, t in tags.items() if t['item'] and 'Входные' in t['group']
          and n not in reads])
    show('Теги, в которые пишут, но никто не читает',
         [n for n in writes if n not in reads and n not in sysv],
         lambda n: 'пишут: ' + ', '.join(sorted(writes[n])[:3]))
    show('Теги, которые читают, но никто не пишет (и нет привязки к ПЛК)',
         [n for n in reads if n not in writes and not tags[n]['item'] and n not in sysv],
         lambda n: 'читают: ' + ', '.join(sorted(reads[n])[:3]))
    unused = [n for n in tags if n not in used and n not in sysv]
    print(f'\n### Теги, не используемые ни в одном скрипте: {len(unused)}')
    byg = defaultdict(list)
    for n in unused:
        byg[tags[n]['group']].append(n)
    for g, v in sorted(byg.items()):
        print(f'  {g}: {len(v)}  ({", ".join(sorted(v)[:8])}{" ..." if len(v) > 8 else ""})')
