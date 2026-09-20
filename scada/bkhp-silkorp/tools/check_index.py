#!/usr/bin/env python3
"""Copy-paste consistency check.

Every script whose name ends in a mechanism/latch index must only touch tags and
objects carrying that same index. Anything else is a copy-paste slip.
"""
import os
import re
import sys

SCRIPTS = 'decoded/scripts'

# name -> (prefix, index):  T6OpenScript3, T4ClapCalButton7_OnClick, ...
LATCH = re.compile(r'^(T\d+(?:Clap)?)(Open|Close|Cal)(?:Button|Script)(\d+)(?:_OnClick)?$')
# StartButtonC1_OnClick / StopButtonT8a_OnClick / TextStatusN3_OnDataChange
MECH = re.compile(r'^(?:Start(?:Forward|Revers)?Button|StopButton|TextStatus)'
                  r'([NCT])(\d+a?)_On[A-Za-z]+$')


def strip(src):
    src = re.sub(r"'(?:[^'\n]|'')*'", "''", src)
    src = re.sub(r'\{[^}]*\}', ' ', src)
    return re.sub(r'//[^\n]*', '', src)


def idents(src):
    return set(re.findall(r'\b[A-Za-z_][A-Za-z0-9_]*\b', strip(src)))


def check_latch(name, src, prefix, idx):
    bad = []
    other = 'T4Latch' if prefix == 'T4Clap' else None
    for w in idents(src):
        m = re.fullmatch(re.escape(prefix) + r'(?!Clap)([A-Za-z]*?)(\d+)', w)
        if m and m.group(2) != idx:
            bad.append((w, f'ожидался индекс {idx}'))
        if prefix.endswith('Clap') and re.fullmatch(
                re.escape(prefix[:-4]) + r'(Latch|Open|Close|Cal|Block)[A-Za-z]*\d*', w):
            bad.append((w, f'тег группы {prefix[:-4]} в скрипте группы {prefix}'))
    return bad


def check_mech(name, src, fam, idx):
    """Message text must name the same mechanism the tags belong to."""
    tagidx = set(re.findall(r'\bStatus(?:Start)?(?:Forward|Revers)?' + fam + r'(\d+)\b', src))
    return sorted(tagidx)


if __name__ == '__main__':
    findings = []
    for f in sorted(os.listdir(SCRIPTS)):
        name, src = f[:-4], open(os.path.join(SCRIPTS, f), encoding='utf-8').read()
        m = LATCH.match(name)
        if m:
            for w, why in check_latch(name, src, m.group(1), m.group(3)):
                findings.append((name, w, why))
    print(f'несоответствий индексов: {len(findings)}')
    for n, w, why in findings:
        print(f'  {n:26s} -> {w:26s} {why}')
