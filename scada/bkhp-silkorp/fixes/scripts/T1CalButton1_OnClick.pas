var
  BlockedBefore: Boolean;   // состояние блокировки ДО этого нажатия
begin
BlockedBefore := T1BlockSelectStatus.AsBool;
if BlockedBefore = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte1.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CalStatus1.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 1 маршрут Т1-Т4!', True, True);
end;
end;
if BlockedBefore = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
