begin
if T6BlockSelectStatus.AsBool = True then
begin
T6BlockText.Color := clRed;
T6BlockText.Alpha := 100;
end;
if T6BlockSelectStatus.AsBool = False then
begin
T6BlockText.Alpha := 0;
T6BlockText.Color := clGray;
end;

if T6BlockSelectStatus.AsBool = False then
begin
if T6LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT6Latch1.Color := clGreen;
T6LatchStatusByte1.Value := 2;
end;
if T6LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT6Latch2.Color := clGreen;
T6LatchStatusByte2.Value := 2;
end;
if T6LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT6Latch3.Color := clGreen;
T6LatchStatusByte3.Value := 2;
end;
if T6LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT6Latch4.Color := clGreen;
T6LatchStatusByte4.Value := 2;
end;
if T6LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT6Latch5.Color := clGreen;
T6LatchStatusByte5.Value := 2;
end;
if T6LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT6Latch6.Color := clGreen;
T6LatchStatusByte6.Value := 2;
end;
if T6LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT6Latch7.Color := clGreen;
T6LatchStatusByte7.Value := 2;
end;
if T6LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT6Latch8.Color := clGreen;
T6LatchStatusByte8.Value := 2;
end;
if T6LatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT6Latch9.Color := clGreen;
T6LatchStatusByte9.Value := 2;
end;
if T6LatchOpen10.AsBool = True then // Если задвижка открыта
begin
LineT6Latch10.Color := clGreen;
T6LatchStatusByte10.Value := 2;
end;
if T6LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch1.Color := clRed;
T6LatchStatusByte1.Value := 3;
end;
if T6LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch2.Color := clRed;
T6LatchStatusByte2.Value := 3;
end;
if T6LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch3.Color := clRed;
T6LatchStatusByte3.Value := 3;
end;
if T6LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch4.Color := clRed;
T6LatchStatusByte4.Value := 3;
end;
if T6LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch5.Color := clRed;
T6LatchStatusByte5.Value := 3;
end;
if T6LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch6.Color := clRed;
T6LatchStatusByte6.Value := 3;
end;
if T6LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch7.Color := clRed;
T6LatchStatusByte7.Value := 3;
end;
if T6LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch8.Color := clRed;
T6LatchStatusByte8.Value := 3;
end;
if T6LatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch9.Color := clRed;
T6LatchStatusByte9.Value := 3;
end;
if T6LatchClose10.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch10.Color := clRed;
T6LatchStatusByte10.Value := 3;
end;

if T6LatchOpen1.AsBool = False then // Если задвижка не открыта
if T6LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch1.Color := clYellow;
end;
if T6LatchOpen2.AsBool = False then // Если задвижка не открыта
if T6LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch2.Color := clYellow;
end;
if T6LatchOpen3.AsBool = False then // Если задвижка не открыта
if T6LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch3.Color := clYellow;
end;
if T6LatchOpen4.AsBool = False then // Если задвижка не открыта
if T6LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch4.Color := clYellow;
end;
if T6LatchOpen5.AsBool = False then // Если задвижка не открыта
if T6LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch5.Color := clYellow;
end;
if T6LatchOpen6.AsBool = False then // Если задвижка не открыта
if T6LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch6.Color := clYellow;
end;
if T6LatchOpen7.AsBool = False then // Если задвижка не открыта
if T6LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch7.Color := clYellow;
end;
if T6LatchOpen8.AsBool = False then // Если задвижка не открыта
if T6LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch8.Color := clYellow;
end;
if T6LatchOpen9.AsBool = False then // Если задвижка не открыта
if T6LatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch9.Color := clYellow;
end;
if T6LatchOpen10.AsBool = False then // Если задвижка не открыта
if T6LatchClose10.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch10.Color := clYellow;
end;
end;
end.
