begin
if T5BlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5LatchStatusByte8.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5CalStatus8.Value := True;
T5BlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки задвижки Транспортера 5 Силос 30-40!', True, True);
end;
end;
if T5BlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;
end.                     
T5ErrorOffButton_OnClick
begin
T5LatchStatusByte1.Value := 0;
T5LatchStatusByte2.Value := 0;
T5LatchStatusByte3.Value := 0;
T5LatchStatusByte4.Value := 0;
T5LatchStatusByte5.Value := 0;
T5LatchStatusByte6.Value := 0;
T5LatchStatusByte7.Value := 0;
T5LatchStatusByte8.Value := 0;
end.
