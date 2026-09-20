begin
if T5ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte3.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapCalStatus3.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки переброса клапана Транспортера 5 Силос 25-35!', True, True);
end;
end;
if T5ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
