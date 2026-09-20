begin
if T4BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T4LatchStatusByte6.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4CalStatus6.Value := True;
T4BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 4 Силос 6-16!', True, True);
end;
end;
if T4BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
