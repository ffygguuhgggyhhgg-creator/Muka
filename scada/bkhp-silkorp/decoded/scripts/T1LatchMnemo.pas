begin
if T1BlockSelectStatus.AsBool = True then
begin
T1BlockText.Color := clRed;
T1BlockText.Alpha := 100;
end;
if T1BlockSelectStatus.AsBool = False then
begin
T1BlockText.Alpha := 0;
T1BlockText.Color := clGray;
end;

if T1BlockSelectStatus.AsBool = False then
begin
if T1LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT1Latch1.Color := clGreen;
T1LatchStatusByte1.Value := 2;
end;
if T1LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT1Latch2.Color := clGreen;
T1LatchStatusByte2.Value := 2;
end;
if T1LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT1Latch3.Color := clGreen;
T1LatchStatusByte3.Value := 2;
end;
if T1LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT1Latch4.Color := clGreen;
T1LatchStatusByte4.Value := 2;
end;
if T1LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT1Latch5.Color := clGreen;
T1LatchStatusByte5.Value := 2;
end;
if T1LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT1Latch6.Color := clGreen;
T1LatchStatusByte6.Value := 2;
end;
if T1LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT1Latch7.Color := clGreen;
T1LatchStatusByte7.Value := 2;
end;
if T1LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT1Latch8.Color := clGreen;
T1LatchStatusByte8.Value := 2;
end;
if T1LatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT1Latch9.Color := clGreen;
T1LatchStatusByte9.Value := 2;
end;


if T1LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch1.Color := clRed;
T1LatchStatusByte1.Value := 3;
end;
if T1LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch2.Color := clRed;
T1LatchStatusByte2.Value := 3;
end;
if T1LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch3.Color := clRed;
T1LatchStatusByte3.Value := 3;
end;
if T1LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch4.Color := clRed;
T1LatchStatusByte4.Value := 3;
end;
if T1LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch5.Color := clRed;
T1LatchStatusByte5.Value := 3;
end;
if T1LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch6.Color := clRed;
T1LatchStatusByte6.Value := 3;
end;
if T1LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch7.Color := clRed;
T1LatchStatusByte7.Value := 3;
end;
if T1LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch8.Color := clRed;
T1LatchStatusByte8.Value := 3;
end;
if T1LatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT1Latch9.Color := clRed;
T1LatchStatusByte9.Value := 3;
end;



if T1LatchOpen1.AsBool = False then // Если задвижка не открыта
if T1LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch1.Color := clYellow;
end;
if T1LatchOpen2.AsBool = False then // Если задвижка не открыта
if T1LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch2.Color := clYellow;
end;
if T1LatchOpen3.AsBool = False then // Если задвижка не открыта
if T1LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch3.Color := clYellow;
end;
if T1LatchOpen4.AsBool = False then // Если задвижка не открыта
if T1LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch4.Color := clYellow;
end;
if T1LatchOpen5.AsBool = False then // Если задвижка не открыта
if T1LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch5.Color := clYellow;
end;
if T1LatchOpen6.AsBool = False then // Если задвижка не открыта
if T1LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch6.Color := clYellow;
end;
if T1LatchOpen7.AsBool = False then // Если задвижка не открыта
if T1LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch7.Color := clYellow;
end;
if T1LatchOpen8.AsBool = False then // Если задвижка не открыта
if T1LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch8.Color := clYellow;
end;
if T1LatchOpen9.AsBool = False then // Если задвижка не открыта
if T1LatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT1Latch9.Color := clYellow;
end;
end;
end.
