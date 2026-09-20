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
T5ClapLatchStatusBar
begin
if T5ClapLatchStatusByte1.Value = 0 then
begin
T5ClapStatusTextLatch1.Text := 'Ожидание';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clBlue;
end;
if T5ClapLatchStatusByte1.Value = 1 then
begin
T5ClapStatusTextLatch1.Text := 'Движение';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clYellow;
end;
if T5ClapLatchStatusByte1.Value = 2 then
begin
T5ClapStatusTextLatch1.Text := 'Открыта (в 23)';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clGreen;
end;                                            
if T5ClapLatchStatusByte1.Value = 3 then
begin
T5ClapStatusTextLatch1.Text := 'Открыта (в 33)';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clRed;
end;
if T5ClapLatchStatusByte1.Value = 4 then
begin
T5ClapStatusTextLatch1.Text := 'Калибровка';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clPurple;
end;
if T5ClapLatchStatusByte1.Value = 5 then
begin
T5ClapStatusTextLatch1.Text := 'Авария';
T5ClapStatusTextLatch1.Alpha := 50;
T5ClapStatusTextLatch1.Color := clPurple;
end;
if T5ClapLatchStatusByte2.Value = 0 then
begin
T5ClapStatusTextLatch2.Text := 'Ожидание';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clBlue;
end;
if T5ClapLatchStatusByte2.Value = 1 then
begin
T5ClapStatusTextLatch2.Text := 'Движение';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clYellow;
end;
if T5ClapLatchStatusByte2.Value = 2 then
begin
T5ClapStatusTextLatch2.Text := 'Открыта (в 24)';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clGreen;
end;
if T5ClapLatchStatusByte2.Value = 3 then
begin
T5ClapStatusTextLatch2.Text := 'Открыта (в 34)';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clRed;
end;
if T5ClapLatchStatusByte2.Value = 4 then
begin
T5ClapStatusTextLatch2.Text := 'Калибровка';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clPurple;
end;
if T5ClapLatchStatusByte2.Value = 5 then
begin
T5ClapStatusTextLatch2.Text := 'Авария';
T5ClapStatusTextLatch2.Alpha := 50;
T5ClapStatusTextLatch2.Color := clPurple;
end;
if T5ClapLatchStatusByte3.Value = 0 then
begin
T5ClapStatusTextLatch3.Text := 'Ожидание';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clBlue;
end;
if T5ClapLatchStatusByte3.Value = 1 then
begin
T5ClapStatusTextLatch3.Text := 'Движение';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clYellow;
end;
if T5ClapLatchStatusByte3.Value = 2 then
begin
T5ClapStatusTextLatch3.Text := 'Открыта (в 25)';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clGreen;
end;
if T5ClapLatchStatusByte3.Value = 3 then
begin
T5ClapStatusTextLatch3.Text := 'Открыта (в 35)';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clRed;
end;
if T5ClapLatchStatusByte3.Value = 4 then
begin
T5ClapStatusTextLatch3.Text := 'Калибровка';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clPurple;
end;
if T5ClapLatchStatusByte3.Value = 5 then
begin
T5ClapStatusTextLatch3.Text := 'Авария';
T5ClapStatusTextLatch3.Alpha := 50;
T5ClapStatusTextLatch3.Color := clPurple;
end;
if T5ClapLatchStatusByte4.Value = 0 then
begin
T5ClapStatusTextLatch4.Text := 'Ожидание';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clBlue;
end;
if T5ClapLatchStatusByte4.Value = 1 then
begin
T5ClapStatusTextLatch4.Text := 'Движение';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clYellow;
end;
if T5ClapLatchStatusByte4.Value = 2 then
begin
T5ClapStatusTextLatch4.Text := 'Открыта (в 26)';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clGreen;
end;
if T5ClapLatchStatusByte4.Value = 3 then
begin
T5ClapStatusTextLatch4.Text := 'Открыта (в 36)';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clRed;
end;
if T5ClapLatchStatusByte4.Value = 4 then
begin
T5ClapStatusTextLatch4.Text := 'Калибровка';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clPurple;
end;
if T5ClapLatchStatusByte4.Value = 5 then
begin
T5ClapStatusTextLatch4.Text := 'Авария';
T5ClapStatusTextLatch4.Alpha := 50;
T5ClapStatusTextLatch4.Color := clPurple;
end;
if T5ClapLatchStatusByte5.Value = 0 then
begin
T5ClapStatusTextLatch5.Text := 'Ожидание';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clBlue;
end;
if T5ClapLatchStatusByte5.Value = 1 then
begin
T5ClapStatusTextLatch5.Text := 'Движение';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clYellow;
end;
if T5ClapLatchStatusByte5.Value = 2 then
begin
T5ClapStatusTextLatch5.Text := 'Открыта (в 27)';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clGreen;
end;
if T5ClapLatchStatusByte5.Value = 3 then
begin
T5ClapStatusTextLatch5.Text := 'Открыта (в 37)';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clRed;
end;
if T5ClapLatchStatusByte5.Value = 4 then
begin
T5ClapStatusTextLatch5.Text := 'Калибровка';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clPurple;
end;
if T5ClapLatchStatusByte5.Value = 5 then
begin
T5ClapStatusTextLatch5.Text := 'Авария';
T5ClapStatusTextLatch5.Alpha := 50;
T5ClapStatusTextLatch5.Color := clPurple;
end;
if T5ClapLatchStatusByte6.Value = 0 then
begin
T5ClapStatusTextLatch6.Text := 'Ожидание';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clBlue;
end;
if T5ClapLatchStatusByte6.Value = 1 then
begin
T5ClapStatusTextLatch6.Text := 'Движение';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clYellow;
end;
if T5ClapLatchStatusByte6.Value = 2 then
begin
T5ClapStatusTextLatch6.Text := 'Открыта (в 28)';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clGreen;
end;
if T5ClapLatchStatusByte6.Value = 3 then
begin
T5ClapStatusTextLatch6.Text := 'Открыта (в 38)';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clRed;
end;
if T5ClapLatchStatusByte6.Value = 4 then
begin
T5ClapStatusTextLatch6.Text := 'Калибровка';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clPurple;
end;
if T5ClapLatchStatusByte6.Value = 5 then
begin
T5ClapStatusTextLatch6.Text := 'Авария';
T5ClapStatusTextLatch6.Alpha := 50;
T5ClapStatusTextLatch6.Color := clPurple;
end;
if T5ClapLatchStatusByte7.Value = 0 then
begin
T5ClapStatusTextLatch7.Text := 'Ожидание';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clBlue;
end;
if T5ClapLatchStatusByte7.Value = 1 then
begin
T5ClapStatusTextLatch7.Text := 'Движение';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clYellow;
end;
if T5ClapLatchStatusByte7.Value = 2 then
begin
T5ClapStatusTextLatch7.Text := 'Открыта (в 29)';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clGreen;
end;
if T5ClapLatchStatusByte7.Value = 3 then
begin
T5ClapStatusTextLatch7.Text := 'Открыта (в 39)';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clRed;
end;
if T5ClapLatchStatusByte7.Value = 4 then
begin
T5ClapStatusTextLatch7.Text := 'Калибровка';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clPurple;
end;
if T5ClapLatchStatusByte7.Value = 5 then
begin
T5ClapStatusTextLatch7.Text := 'Авария';
T5ClapStatusTextLatch7.Alpha := 50;
T5ClapStatusTextLatch7.Color := clPurple;
end;
if T5ClapLatchStatusByte8.Value = 0 then
begin
T5ClapStatusTextLatch8.Text := 'Ожидание';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clBlue;
end;
if T5ClapLatchStatusByte8.Value = 1 then
begin
T5ClapStatusTextLatch8.Text := 'Движение';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clYellow;
end;
if T5ClapLatchStatusByte8.Value = 2 then
begin
T5ClapStatusTextLatch8.Text := 'Открыта (в 30)';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clGreen;
end;
if T5ClapLatchStatusByte8.Value = 3 then
begin
T5ClapStatusTextLatch8.Text := 'Открыта (в 40)';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clRed;
end;
if T5ClapLatchStatusByte8.Value = 4 then
begin
T5ClapStatusTextLatch8.Text := 'Калибровка';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clPurple;
end;
if T5ClapLatchStatusByte8.Value = 5 then
begin
T5ClapStatusTextLatch8.Text := 'Авария';
T5ClapStatusTextLatch8.Alpha := 50;
T5ClapStatusTextLatch8.Color := clPurple;
end;
end.
T5ClapCalValueBar
begin
T5ClapCalOpenText1.Text := T5ClapLatchCalOpenTime1.Value;
T5ClapCalOpenText2.Text := T5ClapLatchCalOpenTime2.Value;
T5ClapCalOpenText3.Text := T5ClapLatchCalOpenTime3.Value;
T5ClapCalOpenText4.Text := T5ClapLatchCalOpenTime4.Value;
T5ClapCalOpenText5.Text := T5ClapLatchCalOpenTime5.Value;
T5ClapCalOpenText6.Text := T5ClapLatchCalOpenTime6.Value;
T5ClapCalOpenText7.Text := T5ClapLatchCalOpenTime7.Value;
T5ClapCalOpenText8.Text := T5ClapLatchCalOpenTime8.Value;
T5ClapCalCloseText1.Text := T5ClapLatchCalCloseTime1.Value;
T5ClapCalCloseText2.Text := T5ClapLatchCalCloseTime2.Value;
T5ClapCalCloseText3.Text := T5ClapLatchCalCloseTime3.Value;
T5ClapCalCloseText4.Text := T5ClapLatchCalCloseTime4.Value;                
T5ClapCalCloseText5.Text := T5ClapLatchCalCloseTime5.Value;
T5ClapCalCloseText6.Text := T5ClapLatchCalCloseTime6.Value;
T5ClapCalCloseText7.Text := T5ClapLatchCalCloseTime7.Value;
T5ClapCalCloseText8.Text := T5ClapLatchCalCloseTime8.Value;
end.
T5ClapLightControl
begin
if T5ClapLatchRunOpen.AsBool = True then
begin
if T5ClapLatchSelect1.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect2.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect3.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect4.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect5.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect6.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;                           
end;
if T5ClapLatchSelect7.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;
end;                                        
if T5ClapLatchSelect8.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;
end;
end;
if T5ClapLatchRunOpen.AsBool = False then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchRunClose.AsBool = True then
begin
if T5ClapLatchSelect1.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect2.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect3.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect4.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect5.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect6.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
if T5ClapLatchSelect7.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
if T5ClapLatchSelect8.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
end;
if T5ClapLatchRunClose.AsBool = False then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGray;
end;
end.
