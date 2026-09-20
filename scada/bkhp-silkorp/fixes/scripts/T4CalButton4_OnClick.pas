var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T4BlockSelectStatus.AsBool;
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T4LatchStatusByte4.Value < 5 then // Условие пуска алгоритма по аварии
begin
T4CalStatus4.Value := True;
T4BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 4 Силос 4-14!', True, True);
end;
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
