begin
if T7LatchCalOpenTime10.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T7BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte10.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7OpenStatus10.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 7 Силос 60!', True, True);
end;
end;
end;
if T7LatchCalOpenTime10.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 7 Силос 60! Время открытия равно нулю!', True, True);
end;
if T7BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
