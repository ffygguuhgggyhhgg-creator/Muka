begin
if T1LatchCalCloseTime2.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte2.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CloseStatus2.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 1 маршрут Т1-Т5!', True, True);
end;
end;
end;
if T1LatchCalCloseTime2.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 1 маршрут Т1-Т5! Время открытия равно нулю!', True, True);
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
