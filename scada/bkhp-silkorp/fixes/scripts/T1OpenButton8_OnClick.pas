var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T1BlockSelectStatus.AsBool;
if T1LatchCalOpenTime8.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte8.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1OpenStatus8.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 3 маршрут Т3-Т7!', True, True);
end;
end;
end;
if T1LatchCalOpenTime8.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 3 маршрут Т3-Т7! Время открытия равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
