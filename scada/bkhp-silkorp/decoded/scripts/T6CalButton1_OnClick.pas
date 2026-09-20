begin
if T6BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T6LatchStatusByte1.Value < 5 then // Условие пуска алгоритма по аварии
begin
T6CalStatus1.Value := True;
T6BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 6 Силос 41!', True, True);
end;
end;
if T6BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
