var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T5ClapBlockSelectStatus.AsBool;
if T5ClapLatchCalCloseTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapCloseStatus4.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало переброса клапана Транспортера 5 в Силос 36!', True, True);
end;
end;
end;
if T5ClapLatchCalCloseTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку переброса клапана Транспортера 5  Силос 26-36! Время переброса равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
