var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T7BlockSelectStatus.AsBool;
if T7LatchCalOpenTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7OpenStatus4.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 7 Силос 54!', True, True);
end;
end;
end;
if T7LatchCalOpenTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 7 Силос 54! Время открытия равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
