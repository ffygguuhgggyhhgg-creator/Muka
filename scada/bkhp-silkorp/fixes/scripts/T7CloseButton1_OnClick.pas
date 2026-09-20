var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T7BlockSelectStatus.AsBool;
if T7LatchCalCloseTime1.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte1.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7CloseStatus1.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 7 Силос 51!', True, True);
end;
end;
end;
if T7LatchCalCloseTime1.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 7 Силос 51! Время открытия равно нулю!', True, True);
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
