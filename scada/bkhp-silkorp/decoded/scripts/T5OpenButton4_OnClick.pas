begin
if T5LatchCalOpenTime4.Value > 0 then  // Условие пуска по выполненной калибровке
begin
if T5BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5OpenStatus4.Value := True;
T5BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало открытия задвижки Транспортера 5 Силос 26-36!', True, True);
end;
end;
end;
if T5LatchCalOpenTime4.Value = 0 then
begin
AddMessage(Now, mkAlarm, 'Произведите калибровку открытия задвижки Транспортера 5 Силос 26-36! Время открытия равно нулю!', True, True);
end;
if T5BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
