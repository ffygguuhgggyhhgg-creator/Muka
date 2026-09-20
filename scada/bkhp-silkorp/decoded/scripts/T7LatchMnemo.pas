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
T7LatchStatusBar
begin
if T7LatchStatusByte1.Value = 0 then
begin
T7StatusTextLatch1.Text := 'Ожидание';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clBlue;
end;
if T7LatchStatusByte1.Value = 1 then
begin
T7StatusTextLatch1.Text := 'Движение';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clYellow;
end;
if T7LatchStatusByte1.Value = 2 then
begin
T7StatusTextLatch1.Text := 'Открыта';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clGreen;
end;
if T7LatchStatusByte1.Value = 3 then
begin
T7StatusTextLatch1.Text := 'Закрыта';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clRed;
end;
if T7LatchStatusByte1.Value = 4 then
begin
T7StatusTextLatch1.Text := 'Калибровка';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clPurple;
end;
if T7LatchStatusByte1.Value = 5 then
begin
T7StatusTextLatch1.Text := 'Авария';
T7StatusTextLatch1.Alpha := 50;
T7StatusTextLatch1.Color := clPurple;
end;
if T7LatchStatusByte2.Value = 0 then
begin
T7StatusTextLatch2.Text := 'Ожидание';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clBlue;
end;
if T7LatchStatusByte2.Value = 1 then
begin
T7StatusTextLatch2.Text := 'Движение';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clYellow;
end;
if T7LatchStatusByte2.Value = 2 then
begin
T7StatusTextLatch2.Text := 'Открыта';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clGreen;
end;
if T7LatchStatusByte2.Value = 3 then
begin
T7StatusTextLatch2.Text := 'Закрыта';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clRed;
end;
if T7LatchStatusByte2.Value = 4 then
begin
T7StatusTextLatch2.Text := 'Калибровка';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clPurple;
end;
if T7LatchStatusByte2.Value = 5 then
begin
T7StatusTextLatch2.Text := 'Авария';
T7StatusTextLatch2.Alpha := 50;
T7StatusTextLatch2.Color := clPurple;
end;
if T7LatchStatusByte3.Value = 0 then
begin
T7StatusTextLatch3.Text := 'Ожидание';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clBlue;
end;
if T7LatchStatusByte3.Value = 1 then
begin
T7StatusTextLatch3.Text := 'Движение';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clYellow;
end;
if T7LatchStatusByte3.Value = 2 then
begin
T7StatusTextLatch3.Text := 'Открыта';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clGreen;
end;
if T7LatchStatusByte3.Value = 3 then
begin
T7StatusTextLatch3.Text := 'Закрыта';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clRed;
end;
if T7LatchStatusByte3.Value = 4 then
begin
T7StatusTextLatch3.Text := 'Калибровка';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clPurple;
end;
if T7LatchStatusByte3.Value = 5 then
begin
T7StatusTextLatch3.Text := 'Авария';
T7StatusTextLatch3.Alpha := 50;
T7StatusTextLatch3.Color := clPurple;
end;
if T7LatchStatusByte4.Value = 0 then
begin
T7StatusTextLatch4.Text := 'Ожидание';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clBlue;
end;
if T7LatchStatusByte4.Value = 1 then
begin
T7StatusTextLatch4.Text := 'Движение';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clYellow;
end;
if T7LatchStatusByte4.Value = 2 then
begin
T7StatusTextLatch4.Text := 'Открыта';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clGreen;
end;
if T7LatchStatusByte4.Value = 3 then
begin
T7StatusTextLatch4.Text := 'Закрыта';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clRed;
end;
if T7LatchStatusByte4.Value = 4 then
begin
T7StatusTextLatch4.Text := 'Калибровка';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clPurple;
end;
if T7LatchStatusByte4.Value = 5 then
begin
T7StatusTextLatch4.Text := 'Авария';
T7StatusTextLatch4.Alpha := 50;
T7StatusTextLatch4.Color := clPurple;
end;
if T7LatchStatusByte5.Value = 0 then
begin
T7StatusTextLatch5.Text := 'Ожидание';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clBlue;
end;
if T7LatchStatusByte5.Value = 1 then
begin
T7StatusTextLatch5.Text := 'Движение';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clYellow;
end;
if T7LatchStatusByte5.Value = 2 then
begin
T7StatusTextLatch5.Text := 'Открыта';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clGreen;
end;
if T7LatchStatusByte5.Value = 3 then
begin
T7StatusTextLatch5.Text := 'Закрыта';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clRed;
end;
if T7LatchStatusByte5.Value = 4 then
begin
T7StatusTextLatch5.Text := 'Калибровка';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clPurple;
end;
if T7LatchStatusByte5.Value = 5 then
begin
T7StatusTextLatch5.Text := 'Авария';
T7StatusTextLatch5.Alpha := 50;
T7StatusTextLatch5.Color := clPurple;
end;
if T7LatchStatusByte6.Value = 0 then
begin
T7StatusTextLatch6.Text := 'Ожидание';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clBlue;
end;
if T7LatchStatusByte6.Value = 1 then
begin
T7StatusTextLatch6.Text := 'Движение';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clYellow;
end;
if T7LatchStatusByte6.Value = 2 then
begin
T7StatusTextLatch6.Text := 'Открыта';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clGreen;
end;
if T7LatchStatusByte6.Value = 3 then
begin
T7StatusTextLatch6.Text := 'Закрыта';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clRed;
end;
if T7LatchStatusByte6.Value = 4 then
begin
T7StatusTextLatch6.Text := 'Калибровка';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clPurple;
end;
if T7LatchStatusByte6.Value = 5 then
begin
T7StatusTextLatch6.Text := 'Авария';
T7StatusTextLatch6.Alpha := 50;
T7StatusTextLatch6.Color := clPurple;
end;
if T7LatchStatusByte7.Value = 0 then
begin
T7StatusTextLatch7.Text := 'Ожидание';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clBlue;
end;
if T7LatchStatusByte7.Value = 1 then
begin
T7StatusTextLatch7.Text := 'Движение';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clYellow;
end;
if T7LatchStatusByte7.Value = 2 then
begin
T7StatusTextLatch7.Text := 'Открыта';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clGreen;
end;
if T7LatchStatusByte7.Value = 3 then
begin
T7StatusTextLatch7.Text := 'Закрыта';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clRed;
end;
if T7LatchStatusByte7.Value = 4 then
begin
T7StatusTextLatch7.Text := 'Калибровка';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clPurple;
end;
if T7LatchStatusByte7.Value = 5 then
begin
T7StatusTextLatch7.Text := 'Авария';
T7StatusTextLatch7.Alpha := 50;
T7StatusTextLatch7.Color := clPurple;
end;
if T7LatchStatusByte8.Value = 0 then
begin
T7StatusTextLatch8.Text := 'Ожидание';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clBlue;
end;
if T7LatchStatusByte8.Value = 1 then
begin
T7StatusTextLatch8.Text := 'Движение';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clYellow;
end;
if T7LatchStatusByte8.Value = 2 then
begin
T7StatusTextLatch8.Text := 'Открыта';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clGreen;
end;
if T7LatchStatusByte8.Value = 3 then
begin
T7StatusTextLatch8.Text := 'Закрыта';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clRed;
end;
if T7LatchStatusByte8.Value = 4 then
begin
T7StatusTextLatch8.Text := 'Калибровка';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clPurple;
end;
if T7LatchStatusByte8.Value = 5 then
begin
T7StatusTextLatch8.Text := 'Авария';
T7StatusTextLatch8.Alpha := 50;
T7StatusTextLatch8.Color := clPurple;
end;
if T7LatchStatusByte9.Value = 0 then
begin
T7StatusTextLatch9.Text := 'Ожидание';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clBlue;
end;
if T7LatchStatusByte9.Value = 1 then
begin
T7StatusTextLatch9.Text := 'Движение';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clYellow;
end;
if T7LatchStatusByte9.Value = 2 then
begin
T7StatusTextLatch9.Text := 'Открыта';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clGreen;
end;
if T7LatchStatusByte9.Value = 3 then
begin
T7StatusTextLatch9.Text := 'Закрыта';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clRed;
end;
if T7LatchStatusByte9.Value = 4 then
begin
T7StatusTextLatch9.Text := 'Калибровка';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clPurple;
end;
if T7LatchStatusByte9.Value = 5 then
begin
T7StatusTextLatch9.Text := 'Авария';
T7StatusTextLatch9.Alpha := 50;
T7StatusTextLatch9.Color := clPurple;
end;
if T7LatchStatusByte10.Value = 0 then
begin
T7StatusTextLatch10.Text := 'Ожидание';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clBlue;
end;
if T7LatchStatusByte10.Value = 1 then
begin
T7StatusTextLatch10.Text := 'Движение';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clYellow;
end;
if T7LatchStatusByte10.Value = 2 then
begin
T7StatusTextLatch10.Text := 'Открыта';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clGreen;       
end;
if T7LatchStatusByte10.Value = 3 then
begin
T7StatusTextLatch10.Text := 'Закрыта';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clRed; 
end;
if T7LatchStatusByte10.Value = 4 then
begin
T7StatusTextLatch10.Text := 'Калибровка';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clPurple;
end;
if T7LatchStatusByte10.Value = 5 then
begin
T7StatusTextLatch10.Text := 'Авария';
T7StatusTextLatch10.Alpha := 50;
T7StatusTextLatch10.Color := clPurple;
end;
end.
T7LightControl
begin
if T7LatchRunOpen.AsBool = True then
begin
if T7LatchSelect1.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect2.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect3.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect4.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect5.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect6.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect7.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;                                        
if T7LatchSelect8.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect9.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect10.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
end;
if T7LatchRunOpen.AsBool = False then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchRunClose.AsBool = True then
begin
if T7LatchSelect1.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect2.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect3.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect4.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect5.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect6.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect7.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect8.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect9.AsBool = True then
begin
T7LightClose_1.Color := ClGray;                      
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect10.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
end;
if T7LatchRunClose.AsBool = False then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGray;
end;
end.
T7CalValueBar
begin
T7CalOpenText1.Text := T7LatchCalOpenTime1.Value;
T7CalOpenText2.Text := T7LatchCalOpenTime2.Value;
T7CalOpenText3.Text := T7LatchCalOpenTime3.Value;
T7CalOpenText4.Text := T7LatchCalOpenTime4.Value;
T7CalOpenText5.Text := T7LatchCalOpenTime5.Value;
T7CalOpenText6.Text := T7LatchCalOpenTime6.Value;
T7CalOpenText7.Text := T7LatchCalOpenTime7.Value;
T7CalOpenText8.Text := T7LatchCalOpenTime8.Value;
T7CalOpenText9.Text := T7LatchCalOpenTime9.Value;
T7CalOpenText10.Text := T7LatchCalOpenTime10.Value;
T7CalCloseText1.Text := T7LatchCalCloseTime1.Value;
T7CalCloseText2.Text := T7LatchCalCloseTime2.Value;
T7CalCloseText3.Text := T7LatchCalCloseTime3.Value;
T7CalCloseText4.Text := T7LatchCalCloseTime4.Value;
T7CalCloseText5.Text := T7LatchCalCloseTime5.Value;
T7CalCloseText6.Text := T7LatchCalCloseTime6.Value;
T7CalCloseText7.Text := T7LatchCalCloseTime7.Value;
T7CalCloseText8.Text := T7LatchCalCloseTime8.Value;
T7CalCloseText9.Text := T7LatchCalCloseTime9.Value;
T7CalCloseText10.Text := T7LatchCalCloseTime10.Value;
end.
