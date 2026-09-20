begin
if T7BlockSelectStatus.AsBool = True then
begin
T7BlockText.Color := clRed;
T7BlockText.Alpha := 100;
end;
if T7BlockSelectStatus.AsBool = False then
begin
T7BlockText.Alpha := 0;
T7BlockText.Color := clGray;
end;

if T7BlockSelectStatus.AsBool = False then
begin
if T7LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT7Latch1.Color := clGreen;
T7LatchStatusByte1.Value := 2;
end;
if T7LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT7Latch2.Color := clGreen;
T7LatchStatusByte2.Value := 2;
end;
if T7LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT7Latch3.Color := clGreen;
T7LatchStatusByte3.Value := 2;
end;
if T7LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT7Latch4.Color := clGreen;
T7LatchStatusByte4.Value := 2;
end;
if T7LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT7Latch5.Color := clGreen;
T7LatchStatusByte5.Value := 2;
end;
if T7LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT7Latch6.Color := clGreen;
T7LatchStatusByte6.Value := 2;
end;
if T7LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT7Latch7.Color := clGreen;
T7LatchStatusByte7.Value := 2;
end;
if T7LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT7Latch8.Color := clGreen;
T7LatchStatusByte8.Value := 2;
end;
if T7LatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT7Latch9.Color := clGreen;
T7LatchStatusByte9.Value := 2;
end;
if T7LatchOpen10.AsBool = True then // Если задвижка открыта
begin
LineT7Latch10.Color := clGreen;
T7LatchStatusByte10.Value := 2;
end;
if T7LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch1.Color := clRed;
T7LatchStatusByte1.Value := 3;
end;
if T7LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch2.Color := clRed;
T7LatchStatusByte2.Value := 3;
end;
if T7LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch3.Color := clRed;
T7LatchStatusByte3.Value := 3;
end;
if T7LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch4.Color := clRed;
T7LatchStatusByte4.Value := 3;
end;
if T7LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch5.Color := clRed;
T7LatchStatusByte5.Value := 3;
end;
if T7LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch6.Color := clRed;
T7LatchStatusByte6.Value := 3;
end;
if T7LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch7.Color := clRed;
T7LatchStatusByte7.Value := 3;
end;
if T7LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch8.Color := clRed;
T7LatchStatusByte8.Value := 3;
end;
if T7LatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch9.Color := clRed;
T7LatchStatusByte9.Value := 3;
end;
if T7LatchClose10.AsBool = True then // Если задвижка закрыта
begin
LineT7Latch10.Color := clRed;
T7LatchStatusByte10.Value := 3;
end;

if T7LatchOpen1.AsBool = False then // Если задвижка не открыта
if T7LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch1.Color := clYellow;
end;
if T7LatchOpen2.AsBool = False then // Если задвижка не открыта
if T7LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch2.Color := clYellow;
end;
if T7LatchOpen3.AsBool = False then // Если задвижка не открыта
if T7LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch3.Color := clYellow;
end;
if T7LatchOpen4.AsBool = False then // Если задвижка не открыта
if T7LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch4.Color := clYellow;
end;
if T7LatchOpen5.AsBool = False then // Если задвижка не открыта
if T7LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch5.Color := clYellow;
end;
if T7LatchOpen6.AsBool = False then // Если задвижка не открыта
if T7LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch6.Color := clYellow;
end;
if T7LatchOpen7.AsBool = False then // Если задвижка не открыта
if T7LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch7.Color := clYellow;
end;
if T7LatchOpen8.AsBool = False then // Если задвижка не открыта
if T7LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch8.Color := clYellow;
end;
if T7LatchOpen9.AsBool = False then // Если задвижка не открыта
if T7LatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch9.Color := clYellow;
end;
if T7LatchOpen10.AsBool = False then // Если задвижка не открыта
if T7LatchClose10.AsBool = False then // Если задвижка не закрыта
begin
LineT7Latch10.Color := clYellow;
end;
end;
end.
