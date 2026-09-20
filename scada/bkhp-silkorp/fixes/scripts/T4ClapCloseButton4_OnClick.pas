var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T4ClapBlockSelectStatus.AsBool;
if T4ClapLatchCalCloseTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T4ClapLatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4ClapCloseStatus4.Value := True;
T4ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало переброса клапана Транспортера 4 в Силос 14!', True, True);
end;
end;
end;
if T4ClapLatchCalCloseTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку переброса клапана Транспортера 4  Силос 4-14! Время открытия равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
