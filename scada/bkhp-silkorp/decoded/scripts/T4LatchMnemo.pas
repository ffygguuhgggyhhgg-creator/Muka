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
T4LatchStatusBar
begin
if T4LatchStatusByte1.Value = 0 then
begin
T4StatusTextLatch1.Text := 'Ожидание';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clBlue;
end;
if T4LatchStatusByte1.Value = 1 then
begin
T4StatusTextLatch1.Text := 'Движение';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clYellow;
end;
if T4LatchStatusByte1.Value = 2 then
begin
T4StatusTextLatch1.Text := 'Открыта';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clGreen;
end;
if T4LatchStatusByte1.Value = 3 then
begin
T4StatusTextLatch1.Text := 'Закрыта';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clRed;
end;
if T4LatchStatusByte1.Value = 4 then
begin
T4StatusTextLatch1.Text := 'Калибровка';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clPurple;
end;
if T4LatchStatusByte1.Value = 5 then
begin
T4StatusTextLatch1.Text := 'Авария';
T4StatusTextLatch1.Alpha := 50;
T4StatusTextLatch1.Color := clPurple;
end;
if T4LatchStatusByte2.Value = 0 then
begin
T4StatusTextLatch2.Text := 'Ожидание';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clBlue;
end;
if T4LatchStatusByte2.Value = 1 then
begin
T4StatusTextLatch2.Text := 'Движение';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clYellow;
end;
if T4LatchStatusByte2.Value = 2 then
begin
T4StatusTextLatch2.Text := 'Открыта';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clGreen;
end;
if T4LatchStatusByte2.Value = 3 then
begin
T4StatusTextLatch2.Text := 'Закрыта';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clRed;
end;
if T4LatchStatusByte2.Value = 4 then
begin
T4StatusTextLatch2.Text := 'Калибровка';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clPurple;
end;
if T4LatchStatusByte2.Value = 5 then
begin
T4StatusTextLatch2.Text := 'Авария';
T4StatusTextLatch2.Alpha := 50;
T4StatusTextLatch2.Color := clPurple;
end;
if T4LatchStatusByte3.Value = 0 then
begin
T4StatusTextLatch3.Text := 'Ожидание';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clBlue;
end;
if T4LatchStatusByte3.Value = 1 then
begin
T4StatusTextLatch3.Text := 'Движение';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clYellow;
end;
if T4LatchStatusByte3.Value = 2 then
begin
T4StatusTextLatch3.Text := 'Открыта';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clGreen;
end;
if T4LatchStatusByte3.Value = 3 then
begin
T4StatusTextLatch3.Text := 'Закрыта';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clRed;
end;
if T4LatchStatusByte3.Value = 4 then
begin
T4StatusTextLatch3.Text := 'Калибровка';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clPurple;
end;
if T4LatchStatusByte3.Value = 5 then
begin
T4StatusTextLatch3.Text := 'Авария';
T4StatusTextLatch3.Alpha := 50;
T4StatusTextLatch3.Color := clPurple;
end;
if T4LatchStatusByte4.Value = 0 then
begin
T4StatusTextLatch4.Text := 'Ожидание';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clBlue;
end;
if T4LatchStatusByte4.Value = 1 then
begin
T4StatusTextLatch4.Text := 'Движение';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clYellow;
end;
if T4LatchStatusByte4.Value = 2 then
begin
T4StatusTextLatch4.Text := 'Открыта';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clGreen;
end;
if T4LatchStatusByte4.Value = 3 then
begin
T4StatusTextLatch4.Text := 'Закрыта';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clRed;
end;
if T4LatchStatusByte4.Value = 4 then
begin
T4StatusTextLatch4.Text := 'Калибровка';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clPurple;
end;
if T4LatchStatusByte4.Value = 5 then
begin
T4StatusTextLatch4.Text := 'Авария';
T4StatusTextLatch4.Alpha := 50;
T4StatusTextLatch4.Color := clPurple;
end;
if T4LatchStatusByte5.Value = 0 then
begin
T4StatusTextLatch5.Text := 'Ожидание';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clBlue;
end;
if T4LatchStatusByte5.Value = 1 then
begin
T4StatusTextLatch5.Text := 'Движение';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clYellow;
end;
if T4LatchStatusByte5.Value = 2 then
begin
T4StatusTextLatch5.Text := 'Открыта';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clGreen;
end;
if T4LatchStatusByte5.Value = 3 then
begin
T4StatusTextLatch5.Text := 'Закрыта';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clRed;
end;
if T4LatchStatusByte5.Value = 4 then
begin
T4StatusTextLatch5.Text := 'Калибровка';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clPurple;
end;
if T4LatchStatusByte5.Value = 5 then
begin
T4StatusTextLatch5.Text := 'Авария';
T4StatusTextLatch5.Alpha := 50;
T4StatusTextLatch5.Color := clPurple;
end;
if T4LatchStatusByte6.Value = 0 then
begin
T4StatusTextLatch6.Text := 'Ожидание';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clBlue;
end;
if T4LatchStatusByte6.Value = 1 then
begin
T4StatusTextLatch6.Text := 'Движение';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clYellow;
end;
if T4LatchStatusByte6.Value = 2 then
begin
T4StatusTextLatch6.Text := 'Открыта';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clGreen;
end;
if T4LatchStatusByte6.Value = 3 then
begin
T4StatusTextLatch6.Text := 'Закрыта';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clRed;
end;
if T4LatchStatusByte6.Value = 4 then
begin
T4StatusTextLatch6.Text := 'Калибровка';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clPurple;
end;
if T4LatchStatusByte6.Value = 5 then
begin
T4StatusTextLatch6.Text := 'Авария';
T4StatusTextLatch6.Alpha := 50;
T4StatusTextLatch6.Color := clPurple;
end;
if T4LatchStatusByte7.Value = 0 then
begin
T4StatusTextLatch7.Text := 'Ожидание';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clBlue;
end;
if T4LatchStatusByte7.Value = 1 then
begin
T4StatusTextLatch7.Text := 'Движение';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clYellow;
end;
if T4LatchStatusByte7.Value = 2 then
begin
T4StatusTextLatch7.Text := 'Открыта';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clGreen;
end;
if T4LatchStatusByte7.Value = 3 then
begin
T4StatusTextLatch7.Text := 'Закрыта';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clRed;
end;
if T4LatchStatusByte7.Value = 4 then
begin
T4StatusTextLatch7.Text := 'Калибровка';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clPurple;
end;
if T4LatchStatusByte7.Value = 5 then
begin
T4StatusTextLatch7.Text := 'Авария';
T4StatusTextLatch7.Alpha := 50;
T4StatusTextLatch7.Color := clPurple;
end;
if T4LatchStatusByte8.Value = 0 then
begin
T4StatusTextLatch8.Text := 'Ожидание';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clBlue;
end;
if T4LatchStatusByte8.Value = 1 then
begin
T4StatusTextLatch8.Text := 'Движение';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clYellow;
end;
if T4LatchStatusByte8.Value = 2 then
begin
T4StatusTextLatch8.Text := 'Открыта';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clGreen;
end;
if T4LatchStatusByte8.Value = 3 then
begin
T4StatusTextLatch8.Text := 'Закрыта';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clRed;
end;
if T4LatchStatusByte8.Value = 4 then
begin
T4StatusTextLatch8.Text := 'Калибровка';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clPurple;
end;
if T4LatchStatusByte8.Value = 5 then
begin
T4StatusTextLatch8.Text := 'Авария';
T4StatusTextLatch8.Alpha := 50;
T4StatusTextLatch8.Color := clPurple;
end;
if T4LatchStatusByte9.Value = 0 then
begin
T4StatusTextLatch9.Text := 'Ожидание';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clBlue;
end;
if T4LatchStatusByte9.Value = 1 then
begin
T4StatusTextLatch9.Text := 'Движение';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clYellow;
end;
if T4LatchStatusByte9.Value = 2 then
begin
T4StatusTextLatch9.Text := 'Открыта';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clGreen;
end;
if T4LatchStatusByte9.Value = 3 then
begin
T4StatusTextLatch9.Text := 'Закрыта';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clRed;
end;
if T4LatchStatusByte9.Value = 4 then
begin
T4StatusTextLatch9.Text := 'Калибровка';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clPurple;
end;
if T4LatchStatusByte9.Value = 5 then
begin
T4StatusTextLatch9.Text := 'Авария';
T4StatusTextLatch9.Alpha := 50;
T4StatusTextLatch9.Color := clPurple;
end;
if T4LatchStatusByte10.Value = 0 then
begin
T4StatusTextLatch10.Text := 'Ожидание';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clBlue;
end;
if T4LatchStatusByte10.Value = 1 then
begin
T4StatusTextLatch10.Text := 'Движение';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clYellow;
end;
if T4LatchStatusByte10.Value = 2 then
begin
T4StatusTextLatch10.Text := 'Открыта';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clGreen;       
end;
if T4LatchStatusByte10.Value = 3 then
begin
T4StatusTextLatch10.Text := 'Закрыта';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clRed;
end;
if T4LatchStatusByte10.Value = 4 then
begin
T4StatusTextLatch10.Text := 'Калибровка';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clPurple;
end;
if T4LatchStatusByte10.Value = 5 then
begin
T4StatusTextLatch10.Text := 'Авария';
T4StatusTextLatch10.Alpha := 50;
T4StatusTextLatch10.Color := clPurple;
end;
end.
T4LightControl
begin
if T4LatchRunOpen.AsBool = True then
begin
if T4LatchSelect1.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect2.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect3.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect4.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect5.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect6.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;                           
end;
if T4LatchSelect7.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;                                        
if T4LatchSelect8.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect9.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect10.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
end;
if T4LatchRunOpen.AsBool = False then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchRunClose.AsBool = True then
begin
if T4LatchSelect1.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect2.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect3.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect4.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect5.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect6.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect7.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect8.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect9.AsBool = True then
begin
T4LightClose_1.Color := ClGray;                      
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect10.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
end;
if T4LatchRunClose.AsBool = False then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGray;
end;
end.
T4CalValueBar
begin
T4CalOpenText1.Text := T4LatchCalOpenTime1.Value;
T4CalOpenText2.Text := T4LatchCalOpenTime2.Value;
T4CalOpenText3.Text := T4LatchCalOpenTime3.Value;
T4CalOpenText4.Text := T4LatchCalOpenTime4.Value;
T4CalOpenText5.Text := T4LatchCalOpenTime5.Value;
T4CalOpenText6.Text := T4LatchCalOpenTime6.Value;
T4CalOpenText7.Text := T4LatchCalOpenTime7.Value;
T4CalOpenText8.Text := T4LatchCalOpenTime8.Value;
T4CalOpenText9.Text := T4LatchCalOpenTime9.Value;
T4CalOpenText10.Text := T4LatchCalOpenTime10.Value;
T4CalCloseText1.Text := T4LatchCalCloseTime1.Value;
T4CalCloseText2.Text := T4LatchCalCloseTime2.Value;
T4CalCloseText3.Text := T4LatchCalCloseTime3.Value;
T4CalCloseText4.Text := T4LatchCalCloseTime4.Value;
T4CalCloseText5.Text := T4LatchCalCloseTime5.Value;
T4CalCloseText6.Text := T4LatchCalCloseTime6.Value;
T4CalCloseText7.Text := T4LatchCalCloseTime7.Value;
T4CalCloseText8.Text := T4LatchCalCloseTime8.Value;
T4CalCloseText9.Text := T4LatchCalCloseTime9.Value;
T4CalCloseText10.Text := T4LatchCalCloseTime10.Value;
end.
