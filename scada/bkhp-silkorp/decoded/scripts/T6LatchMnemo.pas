begin
if T6BlockSelectStatus.AsBool = True then
begin
T6BlockText.Color := clRed;
T6BlockText.Alpha := 100;
end;
if T6BlockSelectStatus.AsBool = False then
begin
T6BlockText.Alpha := 0;
T6BlockText.Color := clGray;
end;
if T6BlockSelectStatus.AsBool = False then
begin
if T6LatchOpen1.AsBool = True then // Если задвижка открыта
begin
LineT6Latch1.Color := clGreen;
T6LatchStatusByte1.Value := 2;
end;
if T6LatchOpen2.AsBool = True then // Если задвижка открыта
begin
LineT6Latch2.Color := clGreen;
T6LatchStatusByte2.Value := 2;
end;
if T6LatchOpen3.AsBool = True then // Если задвижка открыта
begin
LineT6Latch3.Color := clGreen;
T6LatchStatusByte3.Value := 2;
end;
if T6LatchOpen4.AsBool = True then // Если задвижка открыта
begin
LineT6Latch4.Color := clGreen;
T6LatchStatusByte4.Value := 2;
end;
if T6LatchOpen5.AsBool = True then // Если задвижка открыта
begin
LineT6Latch5.Color := clGreen;
T6LatchStatusByte5.Value := 2;
end;
if T6LatchOpen6.AsBool = True then // Если задвижка открыта
begin
LineT6Latch6.Color := clGreen;
T6LatchStatusByte6.Value := 2;
end;
if T6LatchOpen7.AsBool = True then // Если задвижка открыта
begin
LineT6Latch7.Color := clGreen;
T6LatchStatusByte7.Value := 2;
end;
if T6LatchOpen8.AsBool = True then // Если задвижка открыта
begin
LineT6Latch8.Color := clGreen;
T6LatchStatusByte8.Value := 2;
end;
if T6LatchOpen9.AsBool = True then // Если задвижка открыта
begin
LineT6Latch9.Color := clGreen;
T6LatchStatusByte9.Value := 2;
end;
if T6LatchOpen10.AsBool = True then // Если задвижка открыта
begin
LineT6Latch10.Color := clGreen;
T6LatchStatusByte10.Value := 2;
end;
if T6LatchClose1.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch1.Color := clRed;
T6LatchStatusByte1.Value := 3;
end;
if T6LatchClose2.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch2.Color := clRed;
T6LatchStatusByte2.Value := 3;
end;
if T6LatchClose3.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch3.Color := clRed;
T6LatchStatusByte3.Value := 3;
end;
if T6LatchClose4.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch4.Color := clRed;
T6LatchStatusByte4.Value := 3;
end;
if T6LatchClose5.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch5.Color := clRed;
T6LatchStatusByte5.Value := 3;
end;
if T6LatchClose6.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch6.Color := clRed;
T6LatchStatusByte6.Value := 3;
end;
if T6LatchClose7.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch7.Color := clRed;
T6LatchStatusByte7.Value := 3;
end;
if T6LatchClose8.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch8.Color := clRed;
T6LatchStatusByte8.Value := 3;
end;
if T6LatchClose9.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch9.Color := clRed;
T6LatchStatusByte9.Value := 3;
end;
if T6LatchClose10.AsBool = True then // Если задвижка закрыта
begin
LineT6Latch10.Color := clRed;
T6LatchStatusByte10.Value := 3;
end;
if T6LatchOpen1.AsBool = False then // Если задвижка не открыта
if T6LatchClose1.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch1.Color := clYellow;
end;
if T6LatchOpen2.AsBool = False then // Если задвижка не открыта
if T6LatchClose2.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch2.Color := clYellow;
end;
if T6LatchOpen3.AsBool = False then // Если задвижка не открыта
if T6LatchClose3.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch3.Color := clYellow;
end;
if T6LatchOpen4.AsBool = False then // Если задвижка не открыта
if T6LatchClose4.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch4.Color := clYellow;
end;
if T6LatchOpen5.AsBool = False then // Если задвижка не открыта
if T6LatchClose5.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch5.Color := clYellow;
end;
if T6LatchOpen6.AsBool = False then // Если задвижка не открыта
if T6LatchClose6.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch6.Color := clYellow;
end;
if T6LatchOpen7.AsBool = False then // Если задвижка не открыта
if T6LatchClose7.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch7.Color := clYellow;
end;
if T6LatchOpen8.AsBool = False then // Если задвижка не открыта
if T6LatchClose8.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch8.Color := clYellow;
end;                                
if T6LatchOpen9.AsBool = False then // Если задвижка не открыта
if T6LatchClose9.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch9.Color := clYellow;
end;
if T6LatchOpen10.AsBool = False then // Если задвижка не открыта
if T6LatchClose10.AsBool = False then // Если задвижка не закрыта
begin
LineT6Latch10.Color := clYellow;
end;
end;     
end.
T6LatchStatusBar
begin
if T6LatchStatusByte1.Value = 0 then
begin
T6StatusTextLatch1.Text := 'Ожидание';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clBlue;
end;
if T6LatchStatusByte1.Value = 1 then
begin
T6StatusTextLatch1.Text := 'Движение';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clYellow;
end;
if T6LatchStatusByte1.Value = 2 then
begin
T6StatusTextLatch1.Text := 'Открыта';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clGreen;
end;
if T6LatchStatusByte1.Value = 3 then
begin
T6StatusTextLatch1.Text := 'Закрыта';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clRed;
end;
if T6LatchStatusByte1.Value = 4 then
begin
T6StatusTextLatch1.Text := 'Калибровка';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clPurple;
end;
if T6LatchStatusByte1.Value = 5 then
begin
T6StatusTextLatch1.Text := 'Авария';
T6StatusTextLatch1.Alpha := 50;
T6StatusTextLatch1.Color := clPurple;
end;
if T6LatchStatusByte2.Value = 0 then
begin
T6StatusTextLatch2.Text := 'Ожидание';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clBlue;
end;
if T6LatchStatusByte2.Value = 1 then
begin
T6StatusTextLatch2.Text := 'Движение';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clYellow;
end;
if T6LatchStatusByte2.Value = 2 then
begin
T6StatusTextLatch2.Text := 'Открыта';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clGreen;
end;
if T6LatchStatusByte2.Value = 3 then
begin
T6StatusTextLatch2.Text := 'Закрыта';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clRed;
end;
if T6LatchStatusByte2.Value = 4 then
begin
T6StatusTextLatch2.Text := 'Калибровка';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clPurple;
end;
if T6LatchStatusByte2.Value = 5 then
begin
T6StatusTextLatch2.Text := 'Авария';
T6StatusTextLatch2.Alpha := 50;
T6StatusTextLatch2.Color := clPurple;
end;
if T6LatchStatusByte3.Value = 0 then
begin
T6StatusTextLatch3.Text := 'Ожидание';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clBlue;
end;
if T6LatchStatusByte3.Value = 1 then
begin
T6StatusTextLatch3.Text := 'Движение';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clYellow;
end;
if T6LatchStatusByte3.Value = 2 then
begin
T6StatusTextLatch3.Text := 'Открыта';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clGreen;
end;
if T6LatchStatusByte3.Value = 3 then
begin
T6StatusTextLatch3.Text := 'Закрыта';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clRed;
end;
if T6LatchStatusByte3.Value = 4 then
begin
T6StatusTextLatch3.Text := 'Калибровка';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clPurple;
end;
if T6LatchStatusByte3.Value = 5 then
begin
T6StatusTextLatch3.Text := 'Авария';
T6StatusTextLatch3.Alpha := 50;
T6StatusTextLatch3.Color := clPurple;
end;
if T6LatchStatusByte4.Value = 0 then
begin
T6StatusTextLatch4.Text := 'Ожидание';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clBlue;
end;
if T6LatchStatusByte4.Value = 1 then
begin
T6StatusTextLatch4.Text := 'Движение';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clYellow;
end;
if T6LatchStatusByte4.Value = 2 then
begin
T6StatusTextLatch4.Text := 'Открыта';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clGreen;
end;
if T6LatchStatusByte4.Value = 3 then
begin
T6StatusTextLatch4.Text := 'Закрыта';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clRed;
end;
if T6LatchStatusByte4.Value = 4 then
begin
T6StatusTextLatch4.Text := 'Калибровка';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clPurple;
end;
if T6LatchStatusByte4.Value = 5 then
begin
T6StatusTextLatch4.Text := 'Авария';
T6StatusTextLatch4.Alpha := 50;
T6StatusTextLatch4.Color := clPurple;
end;
if T6LatchStatusByte5.Value = 0 then
begin
T6StatusTextLatch5.Text := 'Ожидание';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clBlue;
end;
if T6LatchStatusByte5.Value = 1 then
begin
T6StatusTextLatch5.Text := 'Движение';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clYellow;
end;
if T6LatchStatusByte5.Value = 2 then
begin
T6StatusTextLatch5.Text := 'Открыта';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clGreen;
end;
if T6LatchStatusByte5.Value = 3 then
begin
T6StatusTextLatch5.Text := 'Закрыта';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clRed;
end;
if T6LatchStatusByte5.Value = 4 then
begin
T6StatusTextLatch5.Text := 'Калибровка';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clPurple;
end;
if T6LatchStatusByte5.Value = 5 then
begin
T6StatusTextLatch5.Text := 'Авария';
T6StatusTextLatch5.Alpha := 50;
T6StatusTextLatch5.Color := clPurple;
end;
if T6LatchStatusByte6.Value = 0 then
begin
T6StatusTextLatch6.Text := 'Ожидание';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clBlue;
end;
if T6LatchStatusByte6.Value = 1 then
begin
T6StatusTextLatch6.Text := 'Движение';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clYellow;
end;
if T6LatchStatusByte6.Value = 2 then
begin
T6StatusTextLatch6.Text := 'Открыта';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clGreen;
end;
if T6LatchStatusByte6.Value = 3 then
begin
T6StatusTextLatch6.Text := 'Закрыта';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clRed;
end;
if T6LatchStatusByte6.Value = 4 then
begin
T6StatusTextLatch6.Text := 'Калибровка';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clPurple;
end;
if T6LatchStatusByte6.Value = 5 then
begin
T6StatusTextLatch6.Text := 'Авария';
T6StatusTextLatch6.Alpha := 50;
T6StatusTextLatch6.Color := clPurple;
end;
if T6LatchStatusByte7.Value = 0 then
begin
T6StatusTextLatch7.Text := 'Ожидание';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clBlue;
end;
if T6LatchStatusByte7.Value = 1 then
begin
T6StatusTextLatch7.Text := 'Движение';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clYellow;
end;
if T6LatchStatusByte7.Value = 2 then
begin
T6StatusTextLatch7.Text := 'Открыта';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clGreen;
end;
if T6LatchStatusByte7.Value = 3 then
begin
T6StatusTextLatch7.Text := 'Закрыта';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clRed;
end;
if T6LatchStatusByte7.Value = 4 then
begin
T6StatusTextLatch7.Text := 'Калибровка';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clPurple;
end;
if T6LatchStatusByte7.Value = 5 then
begin
T6StatusTextLatch7.Text := 'Авария';
T6StatusTextLatch7.Alpha := 50;
T6StatusTextLatch7.Color := clPurple;
end;
if T6LatchStatusByte8.Value = 0 then
begin
T6StatusTextLatch8.Text := 'Ожидание';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clBlue;
end;
if T6LatchStatusByte8.Value = 1 then
begin
T6StatusTextLatch8.Text := 'Движение';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clYellow;
end;
if T6LatchStatusByte8.Value = 2 then
begin
T6StatusTextLatch8.Text := 'Открыта';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clGreen;
end;
if T6LatchStatusByte8.Value = 3 then
begin
T6StatusTextLatch8.Text := 'Закрыта';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clRed;
end;
if T6LatchStatusByte8.Value = 4 then
begin
T6StatusTextLatch8.Text := 'Калибровка';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clPurple;
end;
if T6LatchStatusByte8.Value = 5 then
begin
T6StatusTextLatch8.Text := 'Авария';
T6StatusTextLatch8.Alpha := 50;
T6StatusTextLatch8.Color := clPurple;
end;
if T6LatchStatusByte9.Value = 0 then
begin
T6StatusTextLatch9.Text := 'Ожидание';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clBlue;
end;
if T6LatchStatusByte9.Value = 1 then
begin
T6StatusTextLatch9.Text := 'Движение';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clYellow;
end;
if T6LatchStatusByte9.Value = 2 then
begin
T6StatusTextLatch9.Text := 'Открыта';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clGreen;
end;
if T6LatchStatusByte9.Value = 3 then
begin
T6StatusTextLatch9.Text := 'Закрыта';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clRed;
end;
if T6LatchStatusByte9.Value = 4 then
begin
T6StatusTextLatch9.Text := 'Калибровка';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clPurple;
end;
if T6LatchStatusByte9.Value = 5 then
begin
T6StatusTextLatch9.Text := 'Авария';
T6StatusTextLatch9.Alpha := 50;
T6StatusTextLatch9.Color := clPurple;
end;
if T6LatchStatusByte10.Value = 0 then
begin
T6StatusTextLatch10.Text := 'Ожидание';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clBlue;
end;
if T6LatchStatusByte10.Value = 1 then
begin
T6StatusTextLatch10.Text := 'Движение';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clYellow;
end;
if T6LatchStatusByte10.Value = 2 then
begin
T6StatusTextLatch10.Text := 'Открыта';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clGreen;
end;
if T6LatchStatusByte10.Value = 3 then
begin
T6StatusTextLatch10.Text := 'Закрыта';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clRed;
end;                                                  
if T6LatchStatusByte10.Value = 4 then
begin
T6StatusTextLatch10.Text := 'Калибровка';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clPurple;
end;
if T6LatchStatusByte10.Value = 5 then
begin
T6StatusTextLatch10.Text := 'Авария';
T6StatusTextLatch10.Alpha := 50;
T6StatusTextLatch10.Color := clPurple;
end;
end.
T6LightControl
begin
if T6LatchRunOpen.AsBool = True then
begin
if T6LatchSelect1.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect2.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect3.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect4.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect5.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect6.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect7.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect8.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect9.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect10.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
end;
if T6LatchRunOpen.AsBool = False then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchRunClose.AsBool = True then
begin
if T6LatchSelect1.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect2.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect3.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect4.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect5.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect6.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect7.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect8.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect9.AsBool = True then
begin
T6LightClose_1.Color := ClGray;                      
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect10.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
end;
if T6LatchRunClose.AsBool = False then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGray;
end;
end.
T6CalValueBar
begin
T6CalOpenText1.Text := T6LatchCalOpenTime1.Value;
T6CalOpenText2.Text := T6LatchCalOpenTime2.Value;
T6CalOpenText3.Text := T6LatchCalOpenTime3.Value;
T6CalOpenText4.Text := T6LatchCalOpenTime4.Value;
T6CalOpenText5.Text := T6LatchCalOpenTime5.Value;
T6CalOpenText6.Text := T6LatchCalOpenTime6.Value;
T6CalOpenText7.Text := T6LatchCalOpenTime7.Value;
T6CalOpenText8.Text := T6LatchCalOpenTime8.Value;
T6CalOpenText9.Text := T6LatchCalOpenTime9.Value;
T6CalOpenText10.Text := T6LatchCalOpenTime10.Value;
T6CalCloseText1.Text := T6LatchCalCloseTime1.Value;
T6CalCloseText2.Text := T6LatchCalCloseTime2.Value;
T6CalCloseText3.Text := T6LatchCalCloseTime3.Value;
T6CalCloseText4.Text := T6LatchCalCloseTime4.Value;
T6CalCloseText5.Text := T6LatchCalCloseTime5.Value;
T6CalCloseText6.Text := T6LatchCalCloseTime6.Value;
T6CalCloseText7.Text := T6LatchCalCloseTime7.Value;
T6CalCloseText8.Text := T6LatchCalCloseTime8.Value;
T6CalCloseText9.Text := T6LatchCalCloseTime9.Value;
T6CalCloseText10.Text := T6LatchCalCloseTime10.Value;
end.
