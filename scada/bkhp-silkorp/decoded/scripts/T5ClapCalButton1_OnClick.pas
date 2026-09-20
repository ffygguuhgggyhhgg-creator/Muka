begin
if T5ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte1.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapCalStatus1.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки переброса клапана Транспортера 5 Силос 23-33!', True, True);
end;
end;
if T5ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
