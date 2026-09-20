begin
if T1LatchCalOpenTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1OpenStatus4.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 1 маршрут Т1-Т7!', True, True);
end;
end;
end;
if T1LatchCalOpenTime4.Value = 0 then
begin                 
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 1 маршрут Т1-Т7! Время открытия равно нулю!', True, True);
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
