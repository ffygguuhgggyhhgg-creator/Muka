begin
if T5ClapBlockSelectStatus.AsBool = True then
begin
T5ClapBlockText.Color := clRed;
T5ClapBlockText.Alpha := 100;
end;
if T5ClapBlockSelectStatus.AsBool = False then
begin
T5ClapBlockText.Alpha := 0;
T5ClapBlockText.Color := clGray;
end;

if T5ClapBlockSelectStatus.AsBool = False then
begin
if T5ClapLatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT5Klap1_1.Color := clGreen;
LineT5Klap1_2.Color := clRed;
T5ClapLatchStatusByte1.Value := 2;
end;
if T5ClapLatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT5Klap2_1.Color := clGreen;
LineT5Klap2_2.Color := clRed;
T5ClapLatchStatusByte2.Value := 2;
end;
if T5ClapLatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT5Klap3_1.Color := clGreen;
LineT5Klap3_2.Color := clRed;
T5ClapLatchStatusByte3.Value := 2;
end;
if T5ClapLatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT5Klap4_1.Color := clGreen;
LineT5Klap4_2.Color := clRed;
T5ClapLatchStatusByte4.Value := 2;
end;
if T5ClapLatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT5Klap5_1.Color := clGreen;
LineT5Klap5_2.Color := clRed;
T5ClapLatchStatusByte5.Value := 2;
end;
if T5ClapLatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT5Klap6_1.Color := clGreen;
LineT5Klap6_2.Color := clRed;
T5ClapLatchStatusByte6.Value := 2;
end;
if T5ClapLatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT5Klap7_1.Color := clGreen;
LineT5Klap7_2.Color := clRed;
T5ClapLatchStatusByte7.Value := 2;
end;
if T5ClapLatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT5Klap8_1.Color := clGreen;
LineT5Klap8_2.Color := clRed;
T5ClapLatchStatusByte8.Value := 2;
end;

if T5ClapLatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap1_1.Color := clRed;
LineT5Klap1_2.Color := clGreen;
T5ClapLatchStatusByte1.Value := 3;
end;
if T5ClapLatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap2_1.Color := clRed;
LineT5Klap2_2.Color := clGreen;
T5ClapLatchStatusByte2.Value := 3;
end;
if T5ClapLatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap3_1.Color := clRed;
LineT5Klap3_2.Color := clGreen;
T5ClapLatchStatusByte3.Value := 3;
end;
if T5ClapLatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap4_1.Color := clRed;
LineT5Klap4_2.Color := clGreen;
T5ClapLatchStatusByte4.Value := 3;
end;
if T5ClapLatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap5_1.Color := clRed;
LineT5Klap5_2.Color := clGreen;
T5ClapLatchStatusByte5.Value := 3;
end;
if T5ClapLatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap6_1.Color := clRed;
LineT5Klap6_2.Color := clGreen;
T5ClapLatchStatusByte6.Value := 3;
end;
if T5ClapLatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap7_1.Color := clRed;
LineT5Klap7_2.Color := clGreen;
T5ClapLatchStatusByte7.Value := 3;
end;
if T5ClapLatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT5Klap8_1.Color := clRed;
LineT5Klap8_2.Color := clGreen;
T5ClapLatchStatusByte8.Value := 3;
end;

if T5ClapLatchOpen1.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap1_1.Color := clYellow;
LineT5Klap1_2.Color := clYellow;
end;
if T5ClapLatchOpen2.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap2_1.Color := clYellow;
LineT5Klap2_2.Color := clYellow;
end;
if T5ClapLatchOpen3.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap3_1.Color := clYellow;
LineT5Klap3_2.Color := clYellow;
end;
if T5ClapLatchOpen4.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap4_1.Color := clYellow;
LineT5Klap4_2.Color := clYellow;
end;
if T5ClapLatchOpen5.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap5_1.Color := clYellow;
LineT5Klap5_2.Color := clYellow;
end;
if T5ClapLatchOpen6.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap6_1.Color := clYellow;
LineT5Klap6_2.Color := clYellow;
end;
if T5ClapLatchOpen7.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap7_1.Color := clYellow;
LineT5Klap7_2.Color := clYellow;
end;
if T5ClapLatchOpen8.AsBool = False then // Если задвижка не открыта
if T5ClapLatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT5Klap8_1.Color := clYellow;
LineT5Klap8_2.Color := clYellow;
end;
end;
end.
