var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T1BlockSelectStatus.AsBool;
if T1LatchCalCloseTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CloseStatus4.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 1 маршрут Т1-Т7!', True, True);
end;
end;
end;
if T1LatchCalCloseTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 1 маршрут Т1-Т7! Время открытия равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
