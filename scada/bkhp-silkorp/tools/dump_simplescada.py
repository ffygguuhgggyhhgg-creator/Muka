import sys, struct, unicodedata

def printable(s):
    if not s: return False
    bad = 0
    for ch in s:
        cat = unicodedata.category(ch)
        if ch in '\t\n\r': continue
        if cat.startswith('C') or cat == 'Cs': bad += 1
    return bad == 0

def dump(path):
    data = open(path,'rb').read()
    out = []
    i = 0
    n = len(data)
    while i + 4 <= n:
        ln = struct.unpack_from('<I', data, i)[0]
        got = None
        if 1 <= ln <= 200000 and i+4+ln*2 <= n:
            try:
                s = data[i+4:i+4+ln*2].decode('utf-16-le')
                if printable(s): got = ('u16', s, 4+ln*2)
            except Exception: pass
        if got is None and 1 <= ln <= 200000 and i+4+ln <= n:
            try:
                s = data[i+4:i+4+ln].decode('utf-8')
                if printable(s) and any(c.isalnum() for c in s): got = ('u8', s, 4+ln)
            except Exception: pass
        if got:
            out.append(got[1]); i += got[2]
        else:
            i += 1
    return out

for p in sys.argv[1:]:
    strs = dump(p)
    print('='*70)
    print(f'FILE: {p}   ({len(strs)} strings)')
    print('='*70)
    for s in strs:
        print(s)
