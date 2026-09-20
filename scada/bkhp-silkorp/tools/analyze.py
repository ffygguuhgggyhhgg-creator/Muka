#!/usr/bin/env python3
"""Static analysis of the decoded Simple-Scada scripts.

Resolves every identifier to a tag, a screen object, another script or a
built-in, then reports unresolved names, dead tags, unbound I/O, type misuse
and copy-paste index mismatches.
"""
import os
import re
import sys
from collections import defaultdict

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import parse_svr
import parse_svrr

KEYWORDS = set('''begin end if then else while do for to downto repeat until case of var
const and or not xor div mod true false nil exit continue break function procedure with
as is try except finally raise array record string integer boolean double single real byte
word cardinal shortint smallint longint int64 tdatetime variant char label goto in shl shr
set file packed object class inherited out'''.split())

# Simple-Scada 2 run-time API and VCL-ish members used by this project
BUILTIN = set('''Now AddMessage StartPing ConfirmMessage ConfirmAllMessages GetClientName
ReportBuild Value AsBool AsInt AsFloat AsString AsDouble AsByte AsWord Text Color FontColor
Alpha Visible Enabled Sender Result Position Caption Width Height Left Top Angle Hint
mkAlarm mkMessage mkWarning mkEvent
clGreen clRed clYellow clGray clWhite clBlack clBlue clLime clSilver clAqua clFuchsia
clMaroon clNavy clOlive clPurple clTeal clOrange
TM_CheckBox TM_Button TM_Text TM_Field TM_Image TM_Line TM_Tank TM_Report TM_Table
TM_TrendView TM_ProgressBar TM_Shape
ShowWindow HideWindow OpenPage ClosePage View Show Hide Close Open Free Create
Format FormatFloat FloatToStr IntToStr StrToInt StrToFloat StrToIntDef Round Trunc Ceil
Floor Abs Inc Dec Length Copy Pos Trim UpperCase LowerCase DateTimeToStr StrToDateTime
EncodeDate EncodeTime DayOf MonthOf YearOf HourOf MinuteOf SecondOf DateOf TimeOf
MessageBox ShowMessage Beep PlaySound Sleep Random Randomize Sqr Sqrt Sin Cos Tan Exp Ln
Power Min Max Ord Chr High Low SizeOf Assigned
Timer TImer Interval PingData Ping'''.split())


def load():
    roots, _ = parse_svrr.parse('project/Variables.svrr')
    tags = {}
    for node in parse_svrr.walk(roots):
        g = ' / '.join(node['path'])
        for v in node['vars']:
            tags[v['name']] = {'type': parse_svrr.TYPES.get(v['type'], '?'),
                               'group': g, 'desc': v['desc'], 'id': v['id']}
    for r in parse_svr.parse('project/Variables.svr'):
        if r['name'] in tags:
            tags[r['name']]['item'] = r['item']
            tags[r['name']]['server'] = r['server']
    objs = set()
    for f in ('decoded/pages.txt', 'decoded/windows.txt'):
        for l in open(f, encoding='utf-8'):
            l = l.strip()
            if re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*', l):
                objs.add(l)
    scripts = {}
    for f in sorted(os.listdir('decoded/scripts')):
        scripts[f[:-4]] = open('decoded/scripts/' + f, encoding='utf-8').read()
    return tags, objs, scripts


def strip(src):
    """Remove comments and string literals, keeping line structure."""
    src = re.sub(r"'(?:[^'\n]|'')*'", "''", src)
    src = re.sub(r'\{[^}]*\}', ' ', src)
    src = re.sub(r'//[^\n]*', '', src)
    return src


def refs(src):
    """Yield (identifier, member, is_write) for each reference."""
    for line in strip(src).split('\n'):
        assign = line.split(':=')[0] if ':=' in line else None
        for m in re.finditer(r'\b([A-Za-z_][A-Za-z0-9_]*)\b(\s*\.\s*([A-Za-z_][A-Za-z0-9_]*))?',
                             line):
            name, member = m.group(1), m.group(3) or ''
            if name.lower() in KEYWORDS:
                continue
            write = assign is not None and m.start() < len(assign)
            yield name, member, write
