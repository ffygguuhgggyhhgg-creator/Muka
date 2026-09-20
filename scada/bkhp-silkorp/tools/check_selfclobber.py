#!/usr/bin/env python3
"""Find the `if X=a ... X:=b ... if X=b` anti-pattern.

A guard that tests a flag the same script has already changed fires on the
value the script itself just wrote, so the second branch always runs.
"""
import os
import re

SCRIPTS = 'decoded/scripts'


def strip(src):
    src = re.sub(r"'(?:[^'\n]|'')*'", "''", src)
    return re.sub(r'//[^\n]*', '', src)


hits = []
for f in sorted(os.listdir(SCRIPTS)):
    src = strip(open(os.path.join(SCRIPTS, f), encoding='utf-8').read())
    # flag -> offset of first write of each value
    for m in re.finditer(r'\b(\w+)\s*\.\s*Value\s*:=\s*(True|False)\b', src, re.I):
        flag, val = m.group(1), m.group(2).capitalize()
        later = src[m.end():]
        g = re.search(r'\bif\s+' + re.escape(flag) +
                      r'\s*\.\s*(?:AsBool|Value)\s*=\s*' + val + r'\b', later, re.I)
        if g:
            hits.append((f[:-4], flag, val))
            break

print(f'скриптов с самоперекрытием условия: {len(hits)}')
byflag = {}
for s, flag, val in hits:
    byflag.setdefault((re.sub(r'^T\d+(Clap)?', 'T*', flag), val), []).append(s)
for (flag, val), v in sorted(byflag.items(), key=lambda x: -len(x[1])):
    print(f'\n  флаг {flag} := {val}  → затем «if {flag} = {val}»   ({len(v)} скриптов)')
    print('    ' + ', '.join(sorted(v)[:8]) + (' ...' if len(v) > 8 else ''))
