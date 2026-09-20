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
T4ClapLatchStatusBar
begin
if T4ClapLatchStatusByte1.Value = 0 then
begin
T4ClapStatusTextLatch1.Text := 'Ожидание';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clBlue;
end;
if T4ClapLatchStatusByte1.Value = 1 then
begin
T4ClapStatusTextLatch1.Text := 'Движение';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clYellow;
end;
if T4ClapLatchStatusByte1.Value = 2 then
begin
T4ClapStatusTextLatch1.Text := 'Открыта (в 1)';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clGreen;
end;
if T4ClapLatchStatusByte1.Value = 3 then
begin
T4ClapStatusTextLatch1.Text := 'Открыта (в 11)';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clRed;
end;
if T4ClapLatchStatusByte1.Value = 4 then
begin
T4ClapStatusTextLatch1.Text := 'Калибровка';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clPurple;
end;
if T4ClapLatchStatusByte1.Value = 5 then
begin
T4ClapStatusTextLatch1.Text := 'Авария';
T4ClapStatusTextLatch1.Alpha := 50;
T4ClapStatusTextLatch1.Color := clPurple;
end;
if T4ClapLatchStatusByte2.Value = 0 then
begin
T4ClapStatusTextLatch2.Text := 'Ожидание';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clBlue;
end;
if T4ClapLatchStatusByte2.Value = 1 then
begin
T4ClapStatusTextLatch2.Text := 'Движение';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clYellow;
end;
if T4ClapLatchStatusByte2.Value = 2 then
begin
T4ClapStatusTextLatch2.Text := 'Открыта (в 2)';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clGreen;
end;
if T4ClapLatchStatusByte2.Value = 3 then
begin
T4ClapStatusTextLatch2.Text := 'Открыта (в 12)';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clRed;
end;
if T4ClapLatchStatusByte2.Value = 4 then
begin
T4ClapStatusTextLatch2.Text := 'Калибровка';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clPurple;
end;
if T4ClapLatchStatusByte2.Value = 5 then
begin
T4ClapStatusTextLatch2.Text := 'Авария';
T4ClapStatusTextLatch2.Alpha := 50;
T4ClapStatusTextLatch2.Color := clPurple;
end;
if T4ClapLatchStatusByte3.Value = 0 then
begin
T4ClapStatusTextLatch3.Text := 'Ожидание';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clBlue;
end;
if T4ClapLatchStatusByte3.Value = 1 then
begin
T4ClapStatusTextLatch3.Text := 'Движение';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clYellow;
end;
if T4ClapLatchStatusByte3.Value = 2 then
begin
T4ClapStatusTextLatch3.Text := 'Открыта (в 3)';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clGreen;
end;
if T4ClapLatchStatusByte3.Value = 3 then
begin
T4ClapStatusTextLatch3.Text := 'Открыта (в 13)';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clRed;
end;
if T4ClapLatchStatusByte3.Value = 4 then
begin
T4ClapStatusTextLatch3.Text := 'Калибровка';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clPurple;
end;
if T4ClapLatchStatusByte3.Value = 5 then
begin
T4ClapStatusTextLatch3.Text := 'Авария';
T4ClapStatusTextLatch3.Alpha := 50;
T4ClapStatusTextLatch3.Color := clPurple;
end;
if T4ClapLatchStatusByte4.Value = 0 then
begin
T4ClapStatusTextLatch4.Text := 'Ожидание';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clBlue;
end;
if T4ClapLatchStatusByte4.Value = 1 then
begin
T4ClapStatusTextLatch4.Text := 'Движение';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clYellow;
end;
if T4ClapLatchStatusByte4.Value = 2 then
begin
T4ClapStatusTextLatch4.Text := 'Открыта (в 4)';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clGreen;
end;
if T4ClapLatchStatusByte4.Value = 3 then
begin
T4ClapStatusTextLatch4.Text := 'Открыта (в 14)';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clRed;
end;
if T4ClapLatchStatusByte4.Value = 4 then
begin
T4ClapStatusTextLatch4.Text := 'Калибровка';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clPurple;
end;
if T4ClapLatchStatusByte4.Value = 5 then
begin
T4ClapStatusTextLatch4.Text := 'Авария';
T4ClapStatusTextLatch4.Alpha := 50;
T4ClapStatusTextLatch4.Color := clPurple;
end;
if T4ClapLatchStatusByte5.Value = 0 then
begin
T4ClapStatusTextLatch5.Text := 'Ожидание';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clBlue;
end;
if T4ClapLatchStatusByte5.Value = 1 then
begin
T4ClapStatusTextLatch5.Text := 'Движение';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clYellow;
end;
if T4ClapLatchStatusByte5.Value = 2 then
begin
T4ClapStatusTextLatch5.Text := 'Открыта (в 5)';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clGreen;
end;
if T4ClapLatchStatusByte5.Value = 3 then
begin
T4ClapStatusTextLatch5.Text := 'Открыта (в 15)';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clRed;
end;
if T4ClapLatchStatusByte5.Value = 4 then
begin
T4ClapStatusTextLatch5.Text := 'Калибровка';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clPurple;
end;
if T4ClapLatchStatusByte5.Value = 5 then
begin
T4ClapStatusTextLatch5.Text := 'Авария';
T4ClapStatusTextLatch5.Alpha := 50;
T4ClapStatusTextLatch5.Color := clPurple;
end;
if T4ClapLatchStatusByte6.Value = 0 then
begin
T4ClapStatusTextLatch6.Text := 'Ожидание';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clBlue;
end;
if T4ClapLatchStatusByte6.Value = 1 then
begin
T4ClapStatusTextLatch6.Text := 'Движение';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clYellow;
end;
if T4ClapLatchStatusByte6.Value = 2 then
begin
T4ClapStatusTextLatch6.Text := 'Открыта (в 6)';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clGreen;
end;
if T4ClapLatchStatusByte6.Value = 3 then
begin
T4ClapStatusTextLatch6.Text := 'Открыта (в 16)';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clRed;
end;
if T4ClapLatchStatusByte6.Value = 4 then
begin
T4ClapStatusTextLatch6.Text := 'Калибровка';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clPurple;
end;
if T4ClapLatchStatusByte6.Value = 5 then
begin
T4ClapStatusTextLatch6.Text := 'Авария';
T4ClapStatusTextLatch6.Alpha := 50;
T4ClapStatusTextLatch6.Color := clPurple;
end;
if T4ClapLatchStatusByte7.Value = 0 then
begin
T4ClapStatusTextLatch7.Text := 'Ожидание';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clBlue;
end;
if T4ClapLatchStatusByte7.Value = 1 then
begin
T4ClapStatusTextLatch7.Text := 'Движение';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clYellow;
end;
if T4ClapLatchStatusByte7.Value = 2 then
begin
T4ClapStatusTextLatch7.Text := 'Открыта (в 7)';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clGreen;
end;
if T4ClapLatchStatusByte7.Value = 3 then
begin
T4ClapStatusTextLatch7.Text := 'Открыта (в 17)';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clRed;
end;
if T4ClapLatchStatusByte7.Value = 4 then
begin
T4ClapStatusTextLatch7.Text := 'Калибровка';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clPurple;
end;
if T4ClapLatchStatusByte7.Value = 5 then
begin
T4ClapStatusTextLatch7.Text := 'Авария';
T4ClapStatusTextLatch7.Alpha := 50;
T4ClapStatusTextLatch7.Color := clPurple;
end;
if T4ClapLatchStatusByte8.Value = 0 then
begin
T4ClapStatusTextLatch8.Text := 'Ожидание';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clBlue;
end;
if T4ClapLatchStatusByte8.Value = 1 then
begin
T4ClapStatusTextLatch8.Text := 'Движение';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clYellow;
end;
if T4ClapLatchStatusByte8.Value = 2 then
begin
T4ClapStatusTextLatch8.Text := 'Открыта (в 8)';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clGreen;
end;
if T4ClapLatchStatusByte8.Value = 3 then
begin
T4ClapStatusTextLatch8.Text := 'Открыта (в 18)';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clRed;
end;
if T4ClapLatchStatusByte8.Value = 4 then
begin
T4ClapStatusTextLatch8.Text := 'Калибровка';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clPurple;
end;
if T4ClapLatchStatusByte8.Value = 5 then
begin
T4ClapStatusTextLatch8.Text := 'Авария';
T4ClapStatusTextLatch8.Alpha := 50;
T4ClapStatusTextLatch8.Color := clPurple;
end;
if T4ClapLatchStatusByte9.Value = 0 then
begin
T4ClapStatusTextLatch9.Text := 'Ожидание';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clBlue;
end;
if T4ClapLatchStatusByte9.Value = 1 then
begin
T4ClapStatusTextLatch9.Text := 'Движение';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clYellow;
end;
if T4ClapLatchStatusByte9.Value = 2 then
begin
T4ClapStatusTextLatch9.Text := 'Открыта (в 9)';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clGreen;
end;
if T4ClapLatchStatusByte9.Value = 3 then
begin
T4ClapStatusTextLatch9.Text := 'Открыта (в 19)';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clRed;
end;
if T4ClapLatchStatusByte9.Value = 4 then
begin
T4ClapStatusTextLatch9.Text := 'Калибровка';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clPurple;
end;
if T4ClapLatchStatusByte9.Value = 5 then
begin
T4ClapStatusTextLatch9.Text := 'Авария';
T4ClapStatusTextLatch9.Alpha := 50;
T4ClapStatusTextLatch9.Color := clPurple;
end;
if T4ClapLatchStatusByte10.Value = 0 then
begin
T4ClapStatusTextLatch10.Text := 'Ожидание';
T4ClapStatusTextLatch10.Alpha := 50;
T4ClapStatusTextLatch10.Color := clBlue;
end;
if T4ClapLatchStatusByte10.Value = 1 then
begin
T4ClapStatusTextLatch10.Text := 'Движение';
T4ClapStatusTextLatch10.Alpha := 50;
T4ClapStatusTextLatch10.Color := clYellow;
end;
if T4ClapLatchStatusByte10.Value = 2 then
begin
T4ClapStatusTextLatch10.Text := 'Открыта (в 10)';
T4ClapStatusTextLatch10.Alpha := 50;
T4ClapStatusTextLatch10.Color := clGreen;       
end;
if T4ClapLatchStatusByte10.Value = 3 then
begin
T4ClapStatusTextLatch10.Text := 'Открыта (в 20)';
T4ClapStatusTextLatch10.Alpha := 50;                 
T4ClapStatusTextLatch10.Color := clRed;
end;
if T4ClapLatchStatusByte10.Value = 4 then
begin
T4ClapStatusTextLatch10.Text := 'Калибровка';
T4ClapStatusTextLatch10.Alpha := 50;
T4ClapStatusTextLatch10.Color := clPurple;
end;
if T4ClapLatchStatusByte10.Value = 5 then
begin
T4ClapStatusTextLatch10.Text := 'Авария';
T4ClapStatusTextLatch10.Alpha := 50;
T4ClapStatusTextLatch10.Color := clPurple;
end;
end.
T4ClapCalValueBar
begin
T4ClapCalOpenText1.Text := T4ClapLatchCalOpenTime1.Value;
T4ClapCalOpenText2.Text := T4ClapLatchCalOpenTime2.Value;
T4ClapCalOpenText3.Text := T4ClapLatchCalOpenTime3.Value;
T4ClapCalOpenText4.Text := T4ClapLatchCalOpenTime4.Value;
T4ClapCalOpenText5.Text := T4ClapLatchCalOpenTime5.Value;
T4ClapCalOpenText6.Text := T4ClapLatchCalOpenTime6.Value;
T4ClapCalOpenText7.Text := T4ClapLatchCalOpenTime7.Value;
T4ClapCalOpenText8.Text := T4ClapLatchCalOpenTime8.Value;
T4ClapCalOpenText9.Text := T4ClapLatchCalOpenTime9.Value;
T4ClapCalOpenText10.Text := T4ClapLatchCalOpenTime10.Value;
T4ClapCalCloseText1.Text := T4ClapLatchCalCloseTime1.Value;
T4ClapCalCloseText2.Text := T4ClapLatchCalCloseTime2.Value;
T4ClapCalCloseText3.Text := T4ClapLatchCalCloseTime3.Value;
T4ClapCalCloseText4.Text := T4ClapLatchCalCloseTime4.Value;
T4ClapCalCloseText5.Text := T4ClapLatchCalCloseTime5.Value;
T4ClapCalCloseText6.Text := T4ClapLatchCalCloseTime6.Value;
T4ClapCalCloseText7.Text := T4ClapLatchCalCloseTime7.Value;
T4ClapCalCloseText8.Text := T4ClapLatchCalCloseTime8.Value;
T4ClapCalCloseText9.Text := T4ClapLatchCalCloseTime9.Value;
T4ClapCalCloseText10.Text := T4ClapLatchCalCloseTime10.Value;
end.                                  
T4ClapLightControl
begin
if T4ClapLatchRunOpen.AsBool = True then
begin
if T4ClapLatchSelect1.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect2.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect3.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect4.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;              
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect5.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect6.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;                           
end;
if T4ClapLatchSelect7.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;                                        
if T4ClapLatchSelect8.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect9.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect10.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
end;
if T4ClapLatchRunOpen.AsBool = False then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchRunClose.AsBool = True then
begin
if T4ClapLatchSelect1.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect2.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect3.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect4.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect5.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect6.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect7.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect8.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect9.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;                      
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect10.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
end;
if T4ClapLatchRunClose.AsBool = False then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGray;
end;
end.
