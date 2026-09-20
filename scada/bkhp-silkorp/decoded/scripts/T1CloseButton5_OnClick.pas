begin
if T1LatchCalCloseTime5.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte5.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CloseStatus5.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 2 маршрут Т2-Т4!', True, True);
end;
end;
end;                                                                                   
if T1LatchCalCloseTime5.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 2 маршрут Т2-Т4! Время открытия равно нулю!', True, True);
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
