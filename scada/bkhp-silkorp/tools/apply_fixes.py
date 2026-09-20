#!/usr/bin/env python3
"""Generate corrected copies of the Simple-Scada scripts in `fixes/scripts/`.

Every transformation asserts on the pattern it expects, so a silent partial
edit is impossible: if the source does not look as expected the run fails.
Nothing here touches `decoded/` (the faithful decode) or `project/`.
"""
import os
import re
import shutil
import sys

SRC = 'decoded/scripts'
DST = 'fixes/scripts'
log = []


def read(name):
    return open(f'{SRC}/{name}.pas', encoding='utf-8').read()


def write(name, text, fix, note):
    os.makedirs(DST, exist_ok=True)
    os.makedirs(DST, exist_ok=True)
    open(f'{DST}/{name}.pas', 'w', encoding='utf-8').write(text)
    log.append((fix, name, note))


def need(cond, msg):
    if not cond:
        raise SystemExit(f'ОШИБКА шаблона: {msg}')


# ─────────────────────────── FIX-01 ───────────────────────────
def fix01():
    name = 'AlarmStopButton_OnClick'
    s = read(name)
    pat = re.compile(r'\b(RelayOut(?:C|ForwardT|ReversT)\d+)\.Value := True\b')
    n = len(pat.findall(s))
    need(n == 48, f'{name}: ожидалось 48 ошибочных присваиваний, найдено {n}')
    s = pat.sub(r'\1.Value := False', s)
    need('RelayOut' not in s or ':= True' not in s.split('АСПИРАЦИЯ')[1],
         f'{name}: остались присваивания True')
    write(name, s, 'FIX-01',
          f'аварийный стоп: {n} выходов аспирации и транспортёров переведены True → False')


# ─────────────────────────── FIX-02 ───────────────────────────
def fix02():
    name = 'StopButtonsControl'
    s = read(name)
    blocks = re.findall(r'(//Транспортер ([^\n]*?) начало\n)(begin\n)', s)
    need(len(blocks) == 18, f'{name}: ожидалось 18 блоков транспортёров, найдено {len(blocks)}')
    out, cnt = s, 0
    for head, num, beg in blocks:
        m = re.search(re.escape(head) + r'begin\n(.*?)//Транспортер '
                      + re.escape(num) + r' конец', s, re.S)
        need(m, f'{name}: блок «Транспортер {num}» не разобран')
        idx = re.search(r'RelayStopInT(\d+)', m.group(1))
        need(idx, f'{name}: в блоке «Транспортер {num}» нет RelayStopInT')
        guard = f'{head}if StatusT{idx.group(1)}.Value = 1 then\nbegin\n'
        out = out.replace(head + 'begin\n', guard, 1)
        cnt += 1
    need(cnt == 18, f'{name}: вставлено {cnt} условий вместо 18')
    write(name, out, 'FIX-02',
          'в 18 блоков транспортёров добавлено потерянное условие '
          '«if StatusT<n>.Value = 1 then» (как у норий и аспирации)')


# ─────────────────────────── FIX-03 ───────────────────────────
def fix03():
    names = [f[:-4] for f in sorted(os.listdir(SRC))
             if re.fullmatch(r'T\d+(?:Clap)?(?:Open|Close|Cal)Button\d+_OnClick', f[:-4])]
    need(names, 'FIX-03: не найдено ни одного скрипта кнопок задвижек')
    done = 0
    for name in names:
        s = read(name)
        flag = re.search(r'\b(T\d+(?:Clap)?BlockSelectStatus)\b', s)
        need(flag, f'{name}: не найден флаг BlockSelectStatus')
        flag = flag.group(1)
        if s.count(f'{flag}.AsBool') != 2:
            continue
        need(s.startswith('begin'), f'{name}: скрипт не начинается с begin')
        body = s[len('begin'):]
        body = body.replace(f'{flag}.AsBool', 'BlockedBefore')
        s = ('var\n'
             '  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия\n'
             'begin\n'
             f'BlockedBefore := {flag}.AsBool;' + body)
        write(name, s, 'FIX-03',
              f'ложный аларм «Активна блокировка пуска»: {flag} снимается в снимок '
              'BlockedBefore до изменения')
        done += 1
    need(done == 194, f'FIX-03: обработано {done} скриптов вместо 194')


# ─────────────────────────── FIX-04 ───────────────────────────
def fix04():
    names = [f[:-4] for f in sorted(os.listdir(SRC))
             if re.fullmatch(r'T\d+(?:Clap)?CalScript\d+', f[:-4])]
    need(names, 'FIX-04: не найдено Cal-скриптов')
    done = 0
    for name in names:
        s = read(name)
        pat = re.compile(
            r'(begin\n(T\d+(?:Clap)?LatchRunOpen)\.Value := True;[^\n]*\n)'
            r'((T\d+(?:Clap)?LatchCalOpenTime\d+)\.Value := \4\.Value \+ 1;[^\n]*\n)'
            r'(end;)')
        m = pat.search(s)
        need(m, f'{name}: не найден блок двойного инкремента времени открытия')
        s = pat.sub(lambda g: f'begin\n{g.group(2)}.Value := True '
                              f'// Дискретный выход управления задвижкой\n{g.group(5)}', s)
        need(len(re.findall(r'LatchCalOpenTime\d+\.Value := \w+\.Value \+ 1', s)) == 1,
             f'{name}: после правки осталось не одно место счёта времени открытия')
        write(name, s, 'FIX-04',
              'калибровка: убран двойной инкремент LatchCalOpenTime на такте пуска '
              '(время открытия завышалось на 1 с)')
        done += 1
    need(done == 65, f'FIX-04: обработано {done} скриптов вместо 65')


# ─────────────────────────── FIX-05 ───────────────────────────
def fix05():
    name = 'BlockControlButton_OnClick'
    s = read(name)
    need(s.count('if BlockControl.AsBool') == 2, f'{name}: ожидалось два if')
    new = """begin
if BlockControl.AsBool = False then
begin
BlockControl.Value := True;
AddMessage(Now, mkWarning , 'Включена защитная блокировка связей механизмов!', True, True);
end
else
begin
BlockControl.Value := False;
AddMessage(Now, mkAlarm , 'Отключена защитная блокировка связей механизмов!', True, True);
end;
end.
"""
    write(name, new, 'FIX-05',
          'кнопка-тумблер: второй if заменён на else, иначе блокировка включалась '
          'и тут же снималась в одном нажатии')


# ─────────────────────────── FIX-06 ───────────────────────────
def fix06():
    s = read('AlarmTest_OnClick')
    need('Alarm16Level' in s and 'Alarm1Level' in s, 'AlarmTest_OnClick: неожиданное тело')
    new = """begin
 if (Alarm16Level.AsBool = True) and (Alarm1Level.AsBool = True) then
 begin
     Alarm16Level.Value := False;  // Деактивация выхода модуля для сигнализации
     Alarm1Level.Value := False;   // Деактивация выхода модуля для сигнализации
 end
 else
 begin
     Alarm16Level.Value := True;
     Alarm1Level.Value := True;
 end;
end.
"""
    # the handler must be named after the button object to fire at all
    write('AlarmTestButton_OnClick', new, 'FIX-06',
          'потерянные begin/end у else (Alarm1Level включался всегда) + скрипт '
          'переименован в AlarmTestButton_OnClick, иначе он не привязан к кнопке')


# ─────────────────────────── FIX-07 ───────────────────────────
def fix07():
    name = 'VesErrorOff_OnClick'
    s = read(name)
    need('L1_D1_S_Error.Value := 1' in s, f'{name}: неожиданное тело')
    write(name, s.replace('L1_D1_S_Error.Value := 1', 'L1_D1_S_Error.Value := 0'),
          'FIX-07',
          'кнопка сброса ошибки весов ставила признак ошибки в 1 (то есть включала её); '
          'ВНИМАНИЕ: сброс через статусный тег требует проверки по протоколу Тензо-М')


# ─────────────────────────── FIX-08 ───────────────────────────
def fix08():
    name = 'ClearLocalCounterButton_OnClick'
    s = read(name)
    need('ClearLocalCounter.AsBool = True' in s, f'{name}: неожиданное тело')
    new = """begin
 LocalCounter.Value := 0;
 AddMessage(Now, mkWarning, 'Локальный счётчик отпуска обнулён оператором', True, False);
end.
"""
    write(name, new, 'FIX-08',
          'условие «if ClearLocalCounter = True» всегда ложно (тег никто не пишет), '
          'кнопка не работала')


# ─────────────────────────── FIX-09 ───────────────────────────
def fix09():
    name = 'CalculateLocalCounter'
    s = read(name)
    need('LocalCounterTimer' in s, f'{name}: неожиданное тело')
    new = """begin
  // База пересчитывается на КАЖДОМ такте, иначе приращение за такт
  // перебазирования терялось (недоучёт отпуска).
  if L1_D1_C_E.Value > CalculateCount.Value then
  begin
    LocalCounter.Value := LocalCounter.Value + (L1_D1_C_E.Value - CalculateCount.Value);
  end;
  CalculateCount.Value := L1_D1_C_E.Value;
end.
"""
    write(name, new, 'FIX-09',
          'потеря импульсов счётчика: база обновляется каждый такт; тег '
          'LocalCounterTimer больше не нужен')


# ─────────────────────────── FIX-10 ───────────────────────────
def fix10():
    name = 'Prod'
    s = read(name)
    need('Timer.Value - 1' in s, f'{name}: неожиданное тело')
    new = """begin
  Timer.Value := Timer.Value + 1;
  if L1_D1_C_C.Value > Count.Value then
  begin
    // Timer = число тактов интервала; деления на нуль больше нет
    if Timer.Value > 0 then
    begin
      Capacity.Value := ((L1_D1_C_C.Value - Count.Value) * (3600 / Timer.Value)) / 1000;
    end;
    Count.Value := L1_D1_C_C.Value;
    Timer.Value := 0;
  end;
  // Подача прекратилась — производительность обнуляется, а не «залипает»
  if Timer.Value > 120 then
  begin
    Capacity.Value := 0;
    Count.Value := L1_D1_C_C.Value;
    Timer.Value := 0;
  end;
end.
"""
    write(name, new, 'FIX-10',
          'деление на нуль при Timer = 1, занижение производительности после простоя '
          'и «залипание» последнего значения; порог простоя 120 с — уточнить на объекте')


# ─────────────────────────── FIX-11 ───────────────────────────
def fix11():
    name = 'ErrorCapacitControl'
    s = read(name)
    need('Capacity.Value < 100' in s, f'{name}: неожиданное тело')
    new = """begin
 // Верхняя граница 100 убрана: при подаче >= 100 т/ч аларма не было вовсе,
 // а значение 34 ровно не обрабатывалось ни одной ветвью.
 if Capacity.Value > 34 then
 begin
   ErrorCapacityImage.Color := clRed;
   AddMessage(Now, mkAlarm, 'Слишком высокая подача на бункерные весы. Убавьте подачу!', True, True);
 end
 else
 begin
   ErrorCapacityImage.Color := clGray;
 end;
end.
"""
    write(name, new, 'FIX-11',
          'провал в уставке (>=100 и ровно 34); сообщение по-прежнему выдаётся каждый '
          'такт — для защёлки нужен отдельный тег')


# ─────────────────────────── FIX-12 ───────────────────────────
def fix12():
    name = 'AlarmDropButton_OnClick'
    s = read(name)
    n = len(re.findall(r'\bAlarmStatus([NT])(\d+)\.Value := False', s))
    need(n == 27, f'{name}: ожидалось 27 сбросов AlarmStatus, найдено {n}')
    s = re.sub(r'\bAlarmStatus([NT])(\d+)\.Value := False',
               r'StatusAlarm\1\2.Value := False', s)
    need('AlarmStatus' not in s, f'{name}: остались ссылки на AlarmStatus*')
    write(name, s, 'FIX-12',
          'сброс аварий писал в AlarmStatus* (никто не читает); заменено на '
          'StatusAlarm* — признак, который проверяют MnemoControlN/MnemoControlT')


# ─────────────────────────── FIX-13 ───────────────────────────
def fix13():
    name = 'T7CloseScript6'
    s = read(name)
    need(s.count('Транспортера 6 Силос 46') == 2, f'{name}: ожидалось 2 неверных подписи')
    s = s.replace('Транспортера 6 Силос 46', 'Транспортера 7 Силос 56')
    write(name, s, 'FIX-13',
          'в двух сообщениях указан чужой силос: «Транспортера 6 Силос 46» → '
          '«Транспортера 7 Силос 56» (остальные 5 скриптов этой задвижки говорят 56)')


# ───────────────────── по согласованию (OPT) ──────────────────
def write_opt(name, text, fix, note):
    os.makedirs('fixes/scripts-optional', exist_ok=True)
    open(f'fixes/scripts-optional/{name}.pas', 'w', encoding='utf-8').write(text)
    log.append((fix, name, note))


def opt01():
    """Restart the pre-start siren for every new start request."""
    names = [f[:-4] for f in sorted(os.listdir(SRC))
             if re.fullmatch(r'Start(?:Forward|Revers)?Button[NCT]\d+a?_OnClick', f[:-4])]
    done = 0
    for name in names:
        s = read(name)
        if 'ManualStartStatus.Value := True' not in s:
            continue
        s, cnt = re.subn(
            r'ManualStartStatus\.Value := True;?[^\n]*',
            'ManualStartStatus.Value := True;  // запуск подготовки включения\n'
            'ManualTimer.Value := 0;           // перезапуск окна алгоритма\n'
            'ManualTimerDelay.Value := 0;      // заново отсчитать 20 с до пуска\n'
            'ManualTimerAlarm.Value := 0       // заново дать предпусковую сигнализацию',
            s, count=1)
        need(cnt == 1, f'{name}: не найдено ManualStartStatus := True')
        write_opt(name, s, 'OPT-01',
                  'каждая новая заявка на пуск заново запускает предпусковую '
                  'сигнализацию и задержку 20 с')
        done += 1
    need(done > 0, 'OPT-01: не найдено скриптов пуска с ManualStartStatus')


def opt02():
    """Absolute time limit for the calibration state machine."""
    names = [f[:-4] for f in sorted(os.listdir(SRC))
             if re.fullmatch(r'T\d+(?:Clap)?CalScript\d+', f[:-4])]
    for name in names:
        src = 'fixes/scripts/' + name + '.pas'
        s = open(src, encoding='utf-8').read()
        pre = re.match(r'T(\d+)(Clap)?CalScript(\d+)', name)
        grp = 'T' + pre.group(1) + (pre.group(2) or '')
        idx = pre.group(3)
        tail = f"""
if {grp}CalTimer{idx}.Value > 600 then // предельное время калибровки, 10 мин
begin
{grp}LatchRunOpen.Value := False;
{grp}LatchRunClose.Value := False;
{grp}BlockSelectStatus.Value := False;
{grp}LatchStatusByte{idx}.Value := 5;
{grp}CalStatus{idx}.Value := False;
{grp}LatchSelect{idx}.Value := False;
{grp}CalTimer{idx}.Value := 0;
AddMessage(Now, mkAlarm , 'Калибровка задвижки прервана по предельному времени! Проверьте концевые выключатели.', True, True);
end;

"""
        need(s.rstrip().endswith('end;\nend.') or s.rstrip().endswith('end;\r\nend.')
             or s.rstrip().endswith('end.'), f'{name}: неожиданный хвост')
        cut = s.rstrip()
        need(cut.endswith('end.'), f'{name}: нет end.')
        body = cut[:-len('end.')].rstrip()
        need(body.endswith('end;'), f'{name}: тело не закрыто end;')
        body = body[:-len('end;')] + tail + 'end;\n'
        write_opt(name, body + 'end.\n', 'OPT-02',
                  'добавлен предельный тайм-аут калибровки 600 с — иначе при '
                  'неисправном концевике блокировка группы задвижек висит бесконечно')


if __name__ == '__main__':
    if os.path.isdir(DST):
        shutil.rmtree(DST)
    if os.path.isdir('fixes/scripts-optional'):
        shutil.rmtree('fixes/scripts-optional')
    for fn in (fix01, fix02, fix03, fix04, fix05, fix06, fix07, fix08,
               fix09, fix10, fix11, fix12, fix13, opt01, opt02):
        fn()
    print(f'всего правок: {len(log)}')
    from collections import Counter
    for fix, cnt in sorted(Counter(f for f, _, _ in log).items()):
        print(f'  {fix}: {cnt}')
