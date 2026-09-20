begin
if T5BlockSelectStatus.AsBool = True then
begin
T5BlockText.Color := clRed;
T5BlockText.Alpha := 100;
end;
if T5BlockSelectStatus.AsBool = False then
begin
T5BlockText.Alpha := 0;
T5BlockText.Color := clGray;
end;

if T5BlockSelectStatus.AsBool = False then
begin
if T5LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT5Latch1.Color := clGreen;
T5LatchStatusByte1.Value := 2;
end;
if T5LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT5Latch2.Color := clGreen;
T5LatchStatusByte2.Value := 2;
end;
if T5LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT5Latch3.Color := clGreen;
T5LatchStatusByte3.Value := 2;
end;
if T5LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT5Latch4.Color := clGreen;
T5LatchStatusByte4.Value := 2;
end;
if T5LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT5Latch5.Color := clGreen;
T5LatchStatusByte5.Value := 2;
end;
if T5LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT5Latch6.Color := clGreen;
T5LatchStatusByte6.Value := 2;
end;
if T5LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT5Latch7.Color := clGreen;
T5LatchStatusByte7.Value := 2;
end;
if T5LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT5Latch8.Color := clGreen;
T5LatchStatusByte8.Value := 2;
end;
if T5LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch1.Color := clRed;
T5LatchStatusByte1.Value := 3;
end;
if T5LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch2.Color := clRed;
T5LatchStatusByte2.Value := 3;
end;
if T5LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch3.Color := clRed;
T5LatchStatusByte3.Value := 3;
end;
if T5LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch4.Color := clRed;
T5LatchStatusByte4.Value := 3;
end;
if T5LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch5.Color := clRed;
T5LatchStatusByte5.Value := 3;
end;
if T5LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch6.Color := clRed;
T5LatchStatusByte6.Value := 3;
end;
if T5LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch7.Color := clRed;
T5LatchStatusByte7.Value := 3;
end;
if T5LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT5Latch8.Color := clRed;
T5LatchStatusByte8.Value := 3;
end;

if T5LatchOpen1.AsBool = False then // Если задвижка не открыта
if T5LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch1.Color := clYellow;
end;
if T5LatchOpen2.AsBool = False then // Если задвижка не открыта
if T5LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch2.Color := clYellow;
end;
if T5LatchOpen3.AsBool = False then // Если задвижка не открыта
if T5LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch3.Color := clYellow;
end;
if T5LatchOpen4.AsBool = False then // Если задвижка не открыта
if T5LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch4.Color := clYellow;
end;
if T5LatchOpen5.AsBool = False then // Если задвижка не открыта
if T5LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch5.Color := clYellow;
end;
if T5LatchOpen6.AsBool = False then // Если задвижка не открыта
if T5LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch6.Color := clYellow;
end;
if T5LatchOpen7.AsBool = False then // Если задвижка не открыта
if T5LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch7.Color := clYellow;
end;
if T5LatchOpen8.AsBool = False then // Если задвижка не открыта
if T5LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT5Latch8.Color := clYellow;
end;
end;
end.
