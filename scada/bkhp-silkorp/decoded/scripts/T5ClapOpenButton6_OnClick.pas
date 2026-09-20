begin
if T5ClapLatchCalOpenTime6.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T5ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte6.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapOpenStatus6.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало переброса клапана Транспортера 5 в Силос 28!', True, True);
end;
end;
end;
if T5ClapLatchCalOpenTime6.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку переброса клапана Транспортера 5  Силос 28-38! Время переброса равно нулю!', True, True);
end;
if T5ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
