begin
if T4BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4CalStatus4.Value := True;
T4BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 4 Силос 4-14!', True, True);
end;
end;
if T4BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
