begin
if T6LatchCalCloseTime5.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T6BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T6LatchStatusByte5.Value < 5 then // Условие пуска алгоритма по аварии
begin
T6CloseStatus5.Value := True;
T6BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 6 Силос 45!', True, True);
end;
end;
end;                                                                                   
if T6LatchCalCloseTime5.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 6 Силос 45! Время открытия равно нулю!', True, True);
end;
if T6BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
