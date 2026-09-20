begin
if T4LatchCalOpenTime1.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T4BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4LatchStatusByte1.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4OpenStatus1.Value := True;
T4BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 4 Силос 1-11!', True, True);
end;
end;
end;
if T4LatchCalOpenTime1.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 4 Силос 1-11! Время открытия равно нулю!', True, True);
end;
if T4BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
