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
T5LatchStatusBar
begin
if T5LatchStatusByte1.Value = 0 then
begin
T5StatusTextLatch1.Text := 'Ожидание';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clBlue;
end;
if T5LatchStatusByte1.Value = 1 then
begin
T5StatusTextLatch1.Text := 'Движение';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clYellow;
end;
if T5LatchStatusByte1.Value = 2 then
begin
T5StatusTextLatch1.Text := 'Открыта';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clGreen;
end;
if T5LatchStatusByte1.Value = 3 then
begin
T5StatusTextLatch1.Text := 'Закрыта';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clRed;
end;
if T5LatchStatusByte1.Value = 4 then
begin
T5StatusTextLatch1.Text := 'Калибровка';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clPurple;
end;
if T5LatchStatusByte1.Value = 5 then
begin
T5StatusTextLatch1.Text := 'Авария';
T5StatusTextLatch1.Alpha := 50;
T5StatusTextLatch1.Color := clPurple;
end;
if T5LatchStatusByte2.Value = 0 then
begin
T5StatusTextLatch2.Text := 'Ожидание';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clBlue;
end;
if T5LatchStatusByte2.Value = 1 then
begin
T5StatusTextLatch2.Text := 'Движение';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clYellow;
end;
if T5LatchStatusByte2.Value = 2 then
begin
T5StatusTextLatch2.Text := 'Открыта';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clGreen;
end;
if T5LatchStatusByte2.Value = 3 then
begin
T5StatusTextLatch2.Text := 'Закрыта';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clRed;
end;
if T5LatchStatusByte2.Value = 4 then
begin
T5StatusTextLatch2.Text := 'Калибровка';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clPurple;
end;
if T5LatchStatusByte2.Value = 5 then
begin
T5StatusTextLatch2.Text := 'Авария';
T5StatusTextLatch2.Alpha := 50;
T5StatusTextLatch2.Color := clPurple;
end;
if T5LatchStatusByte3.Value = 0 then
begin
T5StatusTextLatch3.Text := 'Ожидание';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clBlue;
end;
if T5LatchStatusByte3.Value = 1 then
begin
T5StatusTextLatch3.Text := 'Движение';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clYellow;
end;
if T5LatchStatusByte3.Value = 2 then
begin
T5StatusTextLatch3.Text := 'Открыта';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clGreen;
end;
if T5LatchStatusByte3.Value = 3 then
begin
T5StatusTextLatch3.Text := 'Закрыта';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clRed;
end;
if T5LatchStatusByte3.Value = 4 then
begin
T5StatusTextLatch3.Text := 'Калибровка';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clPurple;
end;
if T5LatchStatusByte3.Value = 5 then
begin
T5StatusTextLatch3.Text := 'Авария';
T5StatusTextLatch3.Alpha := 50;
T5StatusTextLatch3.Color := clPurple;
end;
if T5LatchStatusByte4.Value = 0 then
begin
T5StatusTextLatch4.Text := 'Ожидание';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clBlue;
end;
if T5LatchStatusByte4.Value = 1 then
begin
T5StatusTextLatch4.Text := 'Движение';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clYellow;
end;
if T5LatchStatusByte4.Value = 2 then
begin
T5StatusTextLatch4.Text := 'Открыта';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clGreen;
end;
if T5LatchStatusByte4.Value = 3 then
begin
T5StatusTextLatch4.Text := 'Закрыта';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clRed;
end;
if T5LatchStatusByte4.Value = 4 then
begin
T5StatusTextLatch4.Text := 'Калибровка';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clPurple;
end;
if T5LatchStatusByte4.Value = 5 then
begin
T5StatusTextLatch4.Text := 'Авария';
T5StatusTextLatch4.Alpha := 50;
T5StatusTextLatch4.Color := clPurple;
end;
if T5LatchStatusByte5.Value = 0 then
begin
T5StatusTextLatch5.Text := 'Ожидание';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clBlue;
end;
if T5LatchStatusByte5.Value = 1 then
begin
T5StatusTextLatch5.Text := 'Движение';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clYellow;
end;
if T5LatchStatusByte5.Value = 2 then
begin
T5StatusTextLatch5.Text := 'Открыта';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clGreen;
end;
if T5LatchStatusByte5.Value = 3 then
begin
T5StatusTextLatch5.Text := 'Закрыта';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clRed;
end;
if T5LatchStatusByte5.Value = 4 then
begin
T5StatusTextLatch5.Text := 'Калибровка';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clPurple;
end;
if T5LatchStatusByte5.Value = 5 then
begin
T5StatusTextLatch5.Text := 'Авария';
T5StatusTextLatch5.Alpha := 50;
T5StatusTextLatch5.Color := clPurple;
end;
if T5LatchStatusByte6.Value = 0 then
begin
T5StatusTextLatch6.Text := 'Ожидание';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clBlue;
end;
if T5LatchStatusByte6.Value = 1 then
begin
T5StatusTextLatch6.Text := 'Движение';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clYellow;
end;
if T5LatchStatusByte6.Value = 2 then
begin
T5StatusTextLatch6.Text := 'Открыта';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clGreen;
end;
if T5LatchStatusByte6.Value = 3 then
begin
T5StatusTextLatch6.Text := 'Закрыта';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clRed;
end;
if T5LatchStatusByte6.Value = 4 then
begin
T5StatusTextLatch6.Text := 'Калибровка';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clPurple;
end;
if T5LatchStatusByte6.Value = 5 then
begin
T5StatusTextLatch6.Text := 'Авария';
T5StatusTextLatch6.Alpha := 50;
T5StatusTextLatch6.Color := clPurple;
end;
if T5LatchStatusByte7.Value = 0 then
begin
T5StatusTextLatch7.Text := 'Ожидание';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clBlue;
end;
if T5LatchStatusByte7.Value = 1 then
begin
T5StatusTextLatch7.Text := 'Движение';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clYellow;
end;
if T5LatchStatusByte7.Value = 2 then
begin
T5StatusTextLatch7.Text := 'Открыта';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clGreen;
end;
if T5LatchStatusByte7.Value = 3 then
begin
T5StatusTextLatch7.Text := 'Закрыта';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clRed;
end;
if T5LatchStatusByte7.Value = 4 then
begin
T5StatusTextLatch7.Text := 'Калибровка';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clPurple;
end;
if T5LatchStatusByte7.Value = 5 then
begin
T5StatusTextLatch7.Text := 'Авария';
T5StatusTextLatch7.Alpha := 50;
T5StatusTextLatch7.Color := clPurple;
end;
if T5LatchStatusByte8.Value = 0 then
begin
T5StatusTextLatch8.Text := 'Ожидание';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clBlue;
end;
if T5LatchStatusByte8.Value = 1 then
begin
T5StatusTextLatch8.Text := 'Движение';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clYellow;
end;
if T5LatchStatusByte8.Value = 2 then
begin
T5StatusTextLatch8.Text := 'Открыта';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clGreen;
end;
if T5LatchStatusByte8.Value = 3 then          
begin
T5StatusTextLatch8.Text := 'Закрыта';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clRed;
end;
if T5LatchStatusByte8.Value = 4 then
begin
T5StatusTextLatch8.Text := 'Калибровка';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clPurple;
end;
if T5LatchStatusByte8.Value = 5 then
begin
T5StatusTextLatch8.Text := 'Авария';
T5StatusTextLatch8.Alpha := 50;
T5StatusTextLatch8.Color := clPurple;
end;
end.
T5LightControl
begin
if T5LatchRunOpen.AsBool = True then
begin
if T5LatchSelect1.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect2.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect3.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect4.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect5.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;              
end;
if T5LatchSelect6.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;
if T5LatchSelect7.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;                                        
if T5LatchSelect8.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;
end;
if T5LatchRunOpen.AsBool = False then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchRunClose.AsBool = True then
begin
if T5LatchSelect1.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect2.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect3.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect4.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect5.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect6.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;
if T5LatchSelect7.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;                                                    
if T5LatchSelect8.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;
end;
if T5LatchRunClose.AsBool = False then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGray;
end;
end.
T5CalValueBar
begin
T5CalOpenText1.Text := T5LatchCalOpenTime1.Value;
T5CalOpenText2.Text := T5LatchCalOpenTime2.Value;
T5CalOpenText3.Text := T5LatchCalOpenTime3.Value;
T5CalOpenText4.Text := T5LatchCalOpenTime4.Value;
T5CalOpenText5.Text := T5LatchCalOpenTime5.Value;
T5CalOpenText6.Text := T5LatchCalOpenTime6.Value;
T5CalOpenText7.Text := T5LatchCalOpenTime7.Value;
T5CalOpenText8.Text := T5LatchCalOpenTime8.Value;
T5CalCloseText1.Text := T5LatchCalCloseTime1.Value;
T5CalCloseText2.Text := T5LatchCalCloseTime2.Value;
T5CalCloseText3.Text := T5LatchCalCloseTime3.Value;
T5CalCloseText4.Text := T5LatchCalCloseTime4.Value;
T5CalCloseText5.Text := T5LatchCalCloseTime5.Value;
T5CalCloseText6.Text := T5LatchCalCloseTime6.Value;
T5CalCloseText7.Text := T5LatchCalCloseTime7.Value;
T5CalCloseText8.Text := T5LatchCalCloseTime8.Value;
end.
