begin
if T4LatchCalCloseTime5.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T4BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4LatchStatusByte5.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4CloseStatus5.Value := True;
T4BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 4 Силос 5-15!', True, True);
end;
end;
end;                                                                                   
if T4LatchCalCloseTime5.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 4 Силос 5-15! Время открытия равно нулю!', True, True);
end;
if T4BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
