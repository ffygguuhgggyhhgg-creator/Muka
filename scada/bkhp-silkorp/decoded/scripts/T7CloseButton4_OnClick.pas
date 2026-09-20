begin
if T7LatchCalCloseTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T7BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7CloseStatus4.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало закрытия задвижки Транспортера 7 Силос 54!', True, True);
end;
end;
end;
if T7LatchCalCloseTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку закрытия задвижки Транспортера 7 Силос 54! Время открытия равно нулю!', True, True);
end;
if T7BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
