begin
if T6LatchCalCloseTime10.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T6BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T6LatchStatusByte10.Value < 5 then // Условие пуска алгоритма по аварии
begin
T6CloseStatus10.Value := True;
T6BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 6 Силос 50!', True, True);
end;
end;
end;
if T6LatchCalCloseTime10.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 6 Силос 50! Время открытия равно нулю!', True, True);
end;
if T6BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
