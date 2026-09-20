begin
if T7BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T7LatchStatusByte8.Value < 5 then // Условие пуска алгоритма по аварии
begin
T7CalStatus8.Value := True;
T7BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 7 Силос 58!', True, True);
end;
end;
if T7BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
