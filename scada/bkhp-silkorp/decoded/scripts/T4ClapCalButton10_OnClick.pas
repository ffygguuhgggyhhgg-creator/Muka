begin
if T4ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4ClapLatchStatusByte10.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4ClapCalStatus10.Value := True;
T4ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки переброса клапана Транспортера 4  Силос 10-20!', True, True);
end;
end;
if T4ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
