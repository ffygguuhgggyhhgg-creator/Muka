begin
if T7LatchCalCloseTime5.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T7BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte5.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7CloseStatus5.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 7 Силос 55!', True, True);
end;
end;
end;
if T7LatchCalCloseTime5.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 7 Силос 55! Время открытия равно нулю!', True, True);
end;
if T7BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
