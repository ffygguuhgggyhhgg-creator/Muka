begin
if T1BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T1LatchStatusByte8.Value < 5 then // Условие пуска алгоритма по аварии
begin
T1CalStatus8.Value := True;
T1BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 3 маршрут Т3-Т7!', True, True);
end;
end;
if T1BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.
T1ErrorOffButton_OnClick
begin
T1LatchStatusByte1.Value := 0;
T1LatchStatusByte2.Value := 0;
T1LatchStatusByte3.Value := 0;
T1LatchStatusByte4.Value := 0;
T1LatchStatusByte5.Value := 0;
T1LatchStatusByte6.Value := 0;
T1LatchStatusByte7.Value := 0;
T1LatchStatusByte8.Value := 0;
T1LatchStatusByte9.Value := 0;
end.
