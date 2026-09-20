begin
if T5ClapBlockSelectStatus.AsBool = False then  // Условие пуска алгоритма по блокировке
begin
if T5ClapLatchStatusByte8.Value < 5 then // Условие пуска алгоритма по аварии
begin
T5ClapCalStatus8.Value := True;
T5ClapBlockSelectStatus.Value := True;
AddMessage(Now, mkWarning , 'Начало калибровки переброса клапана Транспортера 5 Силос 30-40!', True, True);
end;
end;
if T5ClapBlockSelectStatus.AsBool = True then
begin
AddMessage(Now, mkAlarm, 'Активна блокировка пуска! Дождитесь выполнение операции или отмените блокировку!', True, True);
end;                 
end.
T5ClapErrorOffButton_OnClick
begin
T5ClapLatchStatusByte1.Value := 0;
T5ClapLatchStatusByte2.Value := 0;
T5ClapLatchStatusByte3.Value := 0;
T5ClapLatchStatusByte4.Value := 0;
T5ClapLatchStatusByte5.Value := 0;
T5ClapLatchStatusByte6.Value := 0;
T5ClapLatchStatusByte7.Value := 0;
T5ClapLatchStatusByte8.Value := 0;
end.
