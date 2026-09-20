begin
if T1LatchCalCloseTime9.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte9.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CloseStatus9.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 3 маршрут Т3-Т5!', True, True);
end;
end;
end;
if T1LatchCalCloseTime9.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 3 маршрут Т3-Т5! Время открытия равно нулю!', True, True);
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
