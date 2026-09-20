begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte3.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CalStatus3.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 1 маршрут Т1-Т6!', True, True);
end;
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
