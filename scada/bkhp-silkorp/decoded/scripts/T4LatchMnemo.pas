begin
if T4BlockSelectStatus.AsBool = True then
begin
T4BlockText.Color := clRed;
T4BlockText.Alpha := 100;
end;
if T4BlockSelectStatus.AsBool = False then
begin
T4BlockText.Alpha := 0;
T4BlockText.Color := clGray;
end;

if T4BlockSelectStatus.AsBool = False then
begin
if T4LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT4Latch1.Color := clGreen;
T4LatchStatusByte1.Value := 2;
end;
if T4LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT4Latch2.Color := clGreen;
T4LatchStatusByte2.Value := 2;
end;
if T4LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT4Latch3.Color := clGreen;
T4LatchStatusByte3.Value := 2;
end;
if T4LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT4Latch4.Color := clGreen;
T4LatchStatusByte4.Value := 2;
end;
if T4LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT4Latch5.Color := clGreen;
T4LatchStatusByte5.Value := 2;
end;
if T4LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT4Latch6.Color := clGreen;
T4LatchStatusByte6.Value := 2;
end;
if T4LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT4Latch7.Color := clGreen;
T4LatchStatusByte7.Value := 2;
end;
if T4LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT4Latch8.Color := clGreen;
T4LatchStatusByte8.Value := 2;
end;
if T4LatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT4Latch9.Color := clGreen;
T4LatchStatusByte9.Value := 2;
end;
if T4LatchOpen10.AsBool = True then // Если задвижка открыта
begin
LineT4Latch10.Color := clGreen;
T4LatchStatusByte10.Value := 2;
end;
if T4LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch1.Color := clRed;
T4LatchStatusByte1.Value := 3;
end;
if T4LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch2.Color := clRed;
T4LatchStatusByte2.Value := 3;
end;
if T4LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch3.Color := clRed;
T4LatchStatusByte3.Value := 3;
end;
if T4LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch4.Color := clRed;
T4LatchStatusByte4.Value := 3;
end;
if T4LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch5.Color := clRed;
T4LatchStatusByte5.Value := 3;
end;
if T4LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch6.Color := clRed;
T4LatchStatusByte6.Value := 3;
end;
if T4LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch7.Color := clRed;
T4LatchStatusByte7.Value := 3;
end;
if T4LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch8.Color := clRed;
T4LatchStatusByte8.Value := 3;
end;
if T4LatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch9.Color := clRed;
T4LatchStatusByte9.Value := 3;
end;
if T4LatchClose10.AsBool = True then // Если задвижка закрыта
begin
LineT4Latch10.Color := clRed;
T4LatchStatusByte10.Value := 3;
end;

if T4LatchOpen1.AsBool = False then // Если задвижка не открыта
if T4LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch1.Color := clYellow;
end;
if T4LatchOpen2.AsBool = False then // Если задвижка не открыта
if T4LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch2.Color := clYellow;
end;
if T4LatchOpen3.AsBool = False then // Если задвижка не открыта
if T4LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch3.Color := clYellow;
end;
if T4LatchOpen4.AsBool = False then // Если задвижка не открыта
if T4LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch4.Color := clYellow;
end;
if T4LatchOpen5.AsBool = False then // Если задвижка не открыта
if T4LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch5.Color := clYellow;
end;
if T4LatchOpen6.AsBool = False then // Если задвижка не открыта
if T4LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch6.Color := clYellow;
end;
if T4LatchOpen7.AsBool = False then // Если задвижка не открыта
if T4LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch7.Color := clYellow;
end;
if T4LatchOpen8.AsBool = False then // Если задвижка не открыта
if T4LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch8.Color := clYellow;
end;
if T4LatchOpen9.AsBool = False then // Если задвижка не открыта
if T4LatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch9.Color := clYellow;
end;
if T4LatchOpen10.AsBool = False then // Если задвижка не открыта
if T4LatchClose10.AsBool = False then // Если задвижка не закрыта
begin
LineT4Latch10.Color := clYellow;
end;
end;
end.
