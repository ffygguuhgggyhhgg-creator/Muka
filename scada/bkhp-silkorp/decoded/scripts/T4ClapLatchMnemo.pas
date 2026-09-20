begin
if T4ClapBlockSelectStatus.AsBool = True then
begin
T4ClapBlockText.Color := clRed;
T4ClapBlockText.Alpha := 100;
end;
if T4ClapBlockSelectStatus.AsBool = False then
begin
T4ClapBlockText.Alpha := 0;
T4ClapBlockText.Color := clGray;
end;

if T4ClapBlockSelectStatus.AsBool = False then
begin
if T4ClapLatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT4Klap1_1.Color := clGreen;
LineT4Klap1_2.Color := clRed;
T4ClapLatchStatusByte1.Value := 2;
end;
if T4ClapLatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT4Klap2_1.Color := clGreen;
LineT4Klap2_2.Color := clRed;
T4ClapLatchStatusByte2.Value := 2;
end;
if T4ClapLatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT4Klap3_1.Color := clGreen;
LineT4Klap3_2.Color := clRed;
T4ClapLatchStatusByte3.Value := 2;
end;
if T4ClapLatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT4Klap4_1.Color := clGreen;
LineT4Klap4_2.Color := clRed;
T4ClapLatchStatusByte4.Value := 2;
end;
if T4ClapLatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT4Klap5_1.Color := clGreen;
LineT4Klap5_2.Color := clRed;
T4ClapLatchStatusByte5.Value := 2;
end;
if T4ClapLatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT4Klap6_1.Color := clGreen;
LineT4Klap6_2.Color := clRed;
T4ClapLatchStatusByte6.Value := 2;
end;
if T4ClapLatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT4Klap7_1.Color := clGreen;
LineT4Klap7_2.Color := clRed;
T4ClapLatchStatusByte7.Value := 2;
end;
if T4ClapLatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT4Klap8_1.Color := clGreen;
LineT4Klap8_2.Color := clRed;
T4ClapLatchStatusByte8.Value := 2;
end;
if T4ClapLatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT4Klap9_1.Color := clGreen;
LineT4Klap9_2.Color := clRed;
T4ClapLatchStatusByte9.Value := 2;
end;
if T4ClapLatchOpen10.AsBool = True then // Если задвижка открыта
begin
LineT4Klap10_1.Color := clGreen;
LineT4Klap10_2.Color := clRed;
T4ClapLatchStatusByte10.Value := 2;
end;
if T4ClapLatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap1_1.Color := clRed;
LineT4Klap1_2.Color := clGreen;
T4ClapLatchStatusByte1.Value := 3;
end;
if T4ClapLatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap2_1.Color := clRed;
LineT4Klap2_2.Color := clGreen;
T4ClapLatchStatusByte2.Value := 3;
end;
if T4ClapLatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap3_1.Color := clRed;
LineT4Klap3_2.Color := clGreen;
T4ClapLatchStatusByte3.Value := 3;
end;
if T4ClapLatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap4_1.Color := clRed;
LineT4Klap4_2.Color := clGreen;
T4ClapLatchStatusByte4.Value := 3;
end;
if T4ClapLatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap5_1.Color := clRed;
LineT4Klap5_2.Color := clGreen;
T4ClapLatchStatusByte5.Value := 3;
end;
if T4ClapLatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap6_1.Color := clRed;
LineT4Klap6_2.Color := clGreen;
T4ClapLatchStatusByte6.Value := 3;
end;
if T4ClapLatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap7_1.Color := clRed;
LineT4Klap7_2.Color := clGreen;
T4ClapLatchStatusByte7.Value := 3;
end;
if T4ClapLatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap8_1.Color := clRed;
LineT4Klap8_2.Color := clGreen;
T4ClapLatchStatusByte8.Value := 3;
end;
if T4ClapLatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap9_1.Color := clRed;
LineT4Klap9_2.Color := clGreen;
T4ClapLatchStatusByte9.Value := 3;
end;
if T4ClapLatchClose10.AsBool = True then // Если задвижка закрыта
begin
LineT4Klap10_1.Color := clRed;
LineT4Klap10_2.Color := clGreen;
T4ClapLatchStatusByte10.Value := 3;
end;

if T4ClapLatchOpen1.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap1_1.Color := clYellow;
LineT4Klap1_2.Color := clYellow;
end;
if T4ClapLatchOpen2.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap2_1.Color := clYellow;
LineT4Klap2_2.Color := clYellow;
end;
if T4ClapLatchOpen3.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap3_1.Color := clYellow;
LineT4Klap3_2.Color := clYellow;
end;
if T4ClapLatchOpen4.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap4_1.Color := clYellow;
LineT4Klap4_2.Color := clYellow;
end;
if T4ClapLatchOpen5.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap5_1.Color := clYellow;
LineT4Klap5_2.Color := clYellow;
end;
if T4ClapLatchOpen6.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap6_1.Color := clYellow;
LineT4Klap6_2.Color := clYellow;
end;
if T4ClapLatchOpen7.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap7_1.Color := clYellow;
LineT4Klap7_2.Color := clYellow;
end;
if T4ClapLatchOpen8.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap8_1.Color := clYellow;
LineT4Klap8_2.Color := clYellow;
end;
if T4ClapLatchOpen9.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap9_1.Color := clYellow;
LineT4Klap9_2.Color := clYellow;
end;
if T4ClapLatchOpen10.AsBool = False then // Если задвижка не открыта
if T4ClapLatchClose10.AsBool = False then // Если задвижка не закрыта
begin
LineT4Klap10_1.Color := clYellow;
LineT4Klap10_2.Color := clYellow;
end;
end;
end.
