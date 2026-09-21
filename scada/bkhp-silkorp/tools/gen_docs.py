#!/usr/bin/env python3
"""Generate the machine-derived reference tables under docs/reference/."""
import os
import re
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import check_tags
import parse_ssc
import parse_svr
import parse_svrr

OUT = 'docs/reference'
PLC_PREFIX = '|var|PLC210 (Arm32bit + Linux ).Application.PLC_PRG.'


def short_item(item):
    """Strip the constant PLC path and escape pipes so markdown tables hold."""
    if item.startswith(PLC_PREFIX):
        item = item[len(PLC_PREFIX):]
    return item.replace('|', r'\|')
KIND = {0x00: 'событие объекта', 0x05: 'периодический',
        0x08: 'по изменению переменной', 0x01: 'при запуске проекта',
        0x0e: 'callback пинга'}


def scripts_meta():
    d, recs = parse_ssc.parse('project/Scripts/Scripts.ssc')
    # Scripts.ssc stores folder captions in order but not their nesting depth,
    # so only the leaf folder each script sits in can be stated reliably.
    leaf = []
    for r in recs:
        j = r['start'] + 4 + len(r['name']) * 2
        r['kind'] = KIND.get(d[j + 1], f'0x{d[j + 1]:02x}')
        if r['folders']:
            leaf = r['folders']
        r['path'] = list(leaf)
    return recs


def gen_scripts_tree(recs, byid):
    with open(f'{OUT}/scripts.md', 'w', encoding='utf-8') as f:
        f.write('# Скрипты проекта\n\n'
                f'Всего {len(recs)} скриптов. `Тип` — как скрипт запускается '
                '(поле в бинарной записи `Scripts.ssc`).\n\n'
                '| Скрипт | Тип | Строк | Привязан к переменным | Папка (лист) |\n'
                '|---|---|---|---|---|\n')
        for r in recs:
            links = ', '.join(byid.get(i, f'id{i}') for i in r['links'][:4])
            if len(r['links']) > 4:
                links += f' … (+{len(r["links"]) - 4})'
            f.write(f'| `{r["name"]}` | {r["kind"]} | {len(r["lines"])} | '
                    f'{links or "—"} | {" → ".join(r["path"])} |\n')


def gen_io_map(tags):
    rows = [(n, t) for n, t in tags.items() if t['item']]
    rows.sort(key=lambda x: x[1]['item'])
    with open(f'{OUT}/io-map.md', 'w', encoding='utf-8') as f:
        f.write('# Карта привязки к ПЛК и весовому терминалу\n\n'
                f'Привязано {len(rows)} тегов из {len(tags)}.\n\n'
                '* OPC UA `opc.tcp://192.168.40.200:4840` — ОВЕН ПЛК210; '
                'полный путь элемента — `|var|PLC210 (Arm32bit + Linux )'
                '.Application.PLC_PRG.<символ>`, ниже указан только символ\n'
                '* OPC DA `TENSO_OPC_DA2.1` на `localhost` — весовой терминал Тензо-М\n\n'
                '| Символ в ПЛК / позиция | Тег SCADA | Тип | Группа |\n|---|---|---|---|\n')
        for n, t in rows:
            f.write(f'| `{short_item(t["item"])}` | `{n}` | {t["type"]} | '
                    f'{t["group"]} |\n')


def gen_tag_usage(tags, reads, writes):
    with open(f'{OUT}/tag-usage.tsv', 'w', encoding='utf-8') as f:
        f.write('name\ttype\tgroup\topc_item\twrites\treads\tdescription\n')
        for n in sorted(tags):
            t = tags[n]
            f.write(f'{n}\t{t["type"]}\t{t["group"]}\t{t["item"]}\t'
                    f'{",".join(sorted(writes.get(n, [])))}\t'
                    f'{",".join(sorted(reads.get(n, [])))}\t{t.get("desc", "")}\n')


def gen_variables(tags):
    roots, _ = parse_svrr.parse('project/Variables.svrr')
    with open(f'{OUT}/variables.md', 'w', encoding='utf-8') as f:
        f.write('# Таблица переменных (теги)\n\n'
                f'Всего {len(tags)} тегов в 64 группах. Дерево групп — как в '
                'редакторе Simple-Scada.\n\n'
                '`Привязка` — символ в ПЛК210 (CODESYS) либо позиция OPC DA '
                'весового терминала; пусто = внутренняя переменная SCADA.\n\n')
        for node in parse_svrr.walk(roots):
            if not node['vars']:
                continue
            f.write(f'\n## {" / ".join(node["path"])}\n\n')
            f.write('| Тег | Тип | Привязка | Описание |\n|---|---|---|---|\n')
            for v in node['vars']:
                t = tags.get(v['name'], {})
                item = short_item(t['item']) if t.get('item') else ''
                f.write(f'| `{v["name"]}` | {parse_svrr.TYPES.get(v["type"], "?")} | '
                        f'{"`" + item + "`" if item else ""} | '
                        f'{v["desc"] or ""} |\n')


if __name__ == '__main__':
    os.makedirs(OUT, exist_ok=True)
    tags, reads, writes = check_tags.main()
    recs = scripts_meta()
    byid = {}
    roots, _ = parse_svrr.parse('project/Variables.svrr')
    for node in parse_svrr.walk(roots):
        for v in node['vars']:
            byid[v['id']] = v['name']
    gen_scripts_tree(recs, byid)
    gen_io_map(tags)
    gen_tag_usage(tags, reads, writes)
    gen_variables(tags)
    print('готово:', ', '.join(sorted(os.listdir(OUT))))
