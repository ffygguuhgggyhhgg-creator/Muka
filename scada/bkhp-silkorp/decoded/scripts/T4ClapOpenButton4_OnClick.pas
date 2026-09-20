begin
if T4ClapLatchCalOpenTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T4ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4ClapLatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4ClapOpenStatus4.Value := True;
T4ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало переброса клапана Транспортера 4 в Силос 4!', True, True);
end;
end;
end;
if T4ClapLatchCalOpenTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку переброса клапана Транспортера 4  Силос 4-14! Время открытия равно нулю!', True, True);
end;
if T4ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
