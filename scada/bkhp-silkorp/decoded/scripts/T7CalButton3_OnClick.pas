begin
if T7BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte3.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7CalStatus3.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 7 Силос 53!', True, True);
end;
end;
if T7BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
