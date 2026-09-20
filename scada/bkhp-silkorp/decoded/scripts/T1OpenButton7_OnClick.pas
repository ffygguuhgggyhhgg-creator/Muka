begin
if T1LatchCalOpenTime7.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte7.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1OpenStatus7.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 3 маршрут Т3-Т6!', True, True);
end;
end;
end;
if T1LatchCalOpenTime7.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 3 маршрут Т3-Т6! Время открытия равно нулю!', True, True);
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
