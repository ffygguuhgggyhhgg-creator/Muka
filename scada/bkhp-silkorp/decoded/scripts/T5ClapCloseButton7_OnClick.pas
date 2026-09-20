begin
if T5ClapLatchCalCloseTime7.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T5ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte7.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapCloseStatus7.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало переброса клапана Транспортера 5 в Силос 39!', True, True);
end;
end;
end;
if T5ClapLatchCalCloseTime7.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку переброса клапана Транспортера 5  Силос 29-39! Время переброса равно нулю!', True, True);
end;
if T5ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
