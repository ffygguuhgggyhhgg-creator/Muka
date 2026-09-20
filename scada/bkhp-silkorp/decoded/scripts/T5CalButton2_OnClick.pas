begin
if T5BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5LatchStatusByte2.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5CalStatus2.Value := True;
T5BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 5 Силос 24-34!', True, True);
end;
end;
if T5BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
