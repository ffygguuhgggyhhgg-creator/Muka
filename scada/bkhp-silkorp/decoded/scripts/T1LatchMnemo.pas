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
T1LatchStatusBar
begin
if T1LatchStatusByte1.Value = 0 then
begin
T1StatusTextLatch1.Text := 'Ожидание';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clBlue;
end;
if T1LatchStatusByte1.Value = 1 then
begin
T1StatusTextLatch1.Text := 'Движение';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clYellow;
end;
if T1LatchStatusByte1.Value = 2 then
begin
T1StatusTextLatch1.Text := 'Открыта';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clGreen;
end;
if T1LatchStatusByte1.Value = 3 then
begin
T1StatusTextLatch1.Text := 'Закрыта';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clRed;
end;
if T1LatchStatusByte1.Value = 4 then
begin
T1StatusTextLatch1.Text := 'Калибровка';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clPurple;
end;
if T1LatchStatusByte1.Value = 5 then
begin
T1StatusTextLatch1.Text := 'Авария';
T1StatusTextLatch1.Alpha := 50;
T1StatusTextLatch1.Color := clPurple;
end;
if T1LatchStatusByte2.Value = 0 then
begin
T1StatusTextLatch2.Text := 'Ожидание';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clBlue;
end;
if T1LatchStatusByte2.Value = 1 then
begin
T1StatusTextLatch2.Text := 'Движение';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clYellow;
end;
if T1LatchStatusByte2.Value = 2 then
begin
T1StatusTextLatch2.Text := 'Открыта';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clGreen;
end;
if T1LatchStatusByte2.Value = 3 then
begin
T1StatusTextLatch2.Text := 'Закрыта';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clRed;
end;
if T1LatchStatusByte2.Value = 4 then
begin
T1StatusTextLatch2.Text := 'Калибровка';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clPurple;
end;
if T1LatchStatusByte2.Value = 5 then
begin
T1StatusTextLatch2.Text := 'Авария';
T1StatusTextLatch2.Alpha := 50;
T1StatusTextLatch2.Color := clPurple;
end;
if T1LatchStatusByte3.Value = 0 then
begin
T1StatusTextLatch3.Text := 'Ожидание';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clBlue;
end;
if T1LatchStatusByte3.Value = 1 then
begin
T1StatusTextLatch3.Text := 'Движение';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clYellow;
end;
if T1LatchStatusByte3.Value = 2 then
begin
T1StatusTextLatch3.Text := 'Открыта';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clGreen;
end;
if T1LatchStatusByte3.Value = 3 then
begin
T1StatusTextLatch3.Text := 'Закрыта';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clRed;
end;
if T1LatchStatusByte3.Value = 4 then
begin
T1StatusTextLatch3.Text := 'Калибровка';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clPurple;
end;
if T1LatchStatusByte3.Value = 5 then
begin
T1StatusTextLatch3.Text := 'Авария';
T1StatusTextLatch3.Alpha := 50;
T1StatusTextLatch3.Color := clPurple;
end;
if T1LatchStatusByte4.Value = 0 then
begin
T1StatusTextLatch4.Text := 'Ожидание';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clBlue;
end;
if T1LatchStatusByte4.Value = 1 then
begin
T1StatusTextLatch4.Text := 'Движение';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clYellow;
end;
if T1LatchStatusByte4.Value = 2 then
begin
T1StatusTextLatch4.Text := 'Открыта';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clGreen;
end;
if T1LatchStatusByte4.Value = 3 then
begin
T1StatusTextLatch4.Text := 'Закрыта';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clRed;
end;
if T1LatchStatusByte4.Value = 4 then
begin
T1StatusTextLatch4.Text := 'Калибровка';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clPurple;
end;
if T1LatchStatusByte4.Value = 5 then
begin
T1StatusTextLatch4.Text := 'Авария';
T1StatusTextLatch4.Alpha := 50;
T1StatusTextLatch4.Color := clPurple;
end;
if T1LatchStatusByte5.Value = 0 then
begin
T1StatusTextLatch5.Text := 'Ожидание';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clBlue;
end;
if T1LatchStatusByte5.Value = 1 then
begin
T1StatusTextLatch5.Text := 'Движение';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clYellow;
end;
if T1LatchStatusByte5.Value = 2 then
begin
T1StatusTextLatch5.Text := 'Открыта';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clGreen;
end;
if T1LatchStatusByte5.Value = 3 then
begin
T1StatusTextLatch5.Text := 'Закрыта';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clRed;
end;
if T1LatchStatusByte5.Value = 4 then
begin
T1StatusTextLatch5.Text := 'Калибровка';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clPurple;
end;
if T1LatchStatusByte5.Value = 5 then
begin
T1StatusTextLatch5.Text := 'Авария';
T1StatusTextLatch5.Alpha := 50;
T1StatusTextLatch5.Color := clPurple;
end;
if T1LatchStatusByte6.Value = 0 then
begin
T1StatusTextLatch6.Text := 'Ожидание';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clBlue;
end;
if T1LatchStatusByte6.Value = 1 then
begin
T1StatusTextLatch6.Text := 'Движение';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clYellow;
end;
if T1LatchStatusByte6.Value = 2 then
begin
T1StatusTextLatch6.Text := 'Открыта';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clGreen;
end;
if T1LatchStatusByte6.Value = 3 then
begin
T1StatusTextLatch6.Text := 'Закрыта';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clRed;
end;
if T1LatchStatusByte6.Value = 4 then
begin
T1StatusTextLatch6.Text := 'Калибровка';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clPurple;
end;
if T1LatchStatusByte6.Value = 5 then
begin
T1StatusTextLatch6.Text := 'Авария';
T1StatusTextLatch6.Alpha := 50;
T1StatusTextLatch6.Color := clPurple;
end;
if T1LatchStatusByte7.Value = 0 then
begin
T1StatusTextLatch7.Text := 'Ожидание';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clBlue;
end;
if T1LatchStatusByte7.Value = 1 then
begin
T1StatusTextLatch7.Text := 'Движение';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clYellow;
end;
if T1LatchStatusByte7.Value = 2 then
begin
T1StatusTextLatch7.Text := 'Открыта';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clGreen;
end;
if T1LatchStatusByte7.Value = 3 then
begin
T1StatusTextLatch7.Text := 'Закрыта';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clRed;
end;
if T1LatchStatusByte7.Value = 4 then
begin
T1StatusTextLatch7.Text := 'Калибровка';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clPurple;
end;
if T1LatchStatusByte7.Value = 5 then
begin
T1StatusTextLatch7.Text := 'Авария';
T1StatusTextLatch7.Alpha := 50;
T1StatusTextLatch7.Color := clPurple;
end;
if T1LatchStatusByte8.Value = 0 then
begin
T1StatusTextLatch8.Text := 'Ожидание';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clBlue;
end;
if T1LatchStatusByte8.Value = 1 then
begin
T1StatusTextLatch8.Text := 'Движение';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clYellow;
end;
if T1LatchStatusByte8.Value = 2 then
begin
T1StatusTextLatch8.Text := 'Открыта';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clGreen;
end;
if T1LatchStatusByte8.Value = 3 then
begin
T1StatusTextLatch8.Text := 'Закрыта';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clRed;
end;
if T1LatchStatusByte8.Value = 4 then
begin
T1StatusTextLatch8.Text := 'Калибровка';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clPurple;
end;
if T1LatchStatusByte8.Value = 5 then
begin
T1StatusTextLatch8.Text := 'Авария';
T1StatusTextLatch8.Alpha := 50;
T1StatusTextLatch8.Color := clPurple;
end;
if T1LatchStatusByte9.Value = 0 then
begin
T1StatusTextLatch9.Text := 'Ожидание';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clBlue;
end;                                   
if T1LatchStatusByte9.Value = 1 then
begin
T1StatusTextLatch9.Text := 'Движение';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clYellow;
end;
if T1LatchStatusByte9.Value = 2 then
begin
T1StatusTextLatch9.Text := 'Открыта';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clGreen;
end;
if T1LatchStatusByte9.Value = 3 then
begin
T1StatusTextLatch9.Text := 'Закрыта';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clRed;
end;
if T1LatchStatusByte9.Value = 4 then
begin
T1StatusTextLatch9.Text := 'Калибровка';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clPurple;
end;
if T1LatchStatusByte9.Value = 5 then
begin
T1StatusTextLatch9.Text := 'Авария';
T1StatusTextLatch9.Alpha := 50;
T1StatusTextLatch9.Color := clPurple;
end;
end.
T1LightControl
begin
if T1LatchRunOpen.AsBool = True then
begin
if T1LatchSelect1.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect2.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect3.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect4.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect5.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;              
end;
if T1LatchSelect6.AsBool = True then         
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
if T1LatchSelect7.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;                                        
if T1LatchSelect8.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
if T1LatchSelect9.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
end;
if T1LatchRunOpen.AsBool = False then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchRunClose.AsBool = True then
begin
if T1LatchSelect1.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect2.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect3.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect4.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect5.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect6.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;                                       
if T1LatchSelect7.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
if T1LatchSelect8.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
if T1LatchSelect9.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
end;
if T1LatchRunClose.AsBool = False then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGray;
end;
end.
T1CalValueBar
begin
T1CalOpenText1.Text := T1LatchCalOpenTime1.Value;
T1CalOpenText2.Text := T1LatchCalOpenTime2.Value;
T1CalOpenText3.Text := T1LatchCalOpenTime3.Value;
T1CalOpenText4.Text := T1LatchCalOpenTime4.Value;
T1CalOpenText5.Text := T1LatchCalOpenTime5.Value;
T1CalOpenText6.Text := T1LatchCalOpenTime6.Value;
T1CalOpenText7.Text := T1LatchCalOpenTime7.Value;
T1CalOpenText8.Text := T1LatchCalOpenTime8.Value;
T1CalOpenText9.Text := T1LatchCalOpenTime9.Value;
T1CalCloseText1.Text := T1LatchCalCloseTime1.Value;
T1CalCloseText2.Text := T1LatchCalCloseTime2.Value;
T1CalCloseText3.Text := T1LatchCalCloseTime3.Value;
T1CalCloseText4.Text := T1LatchCalCloseTime4.Value;
T1CalCloseText5.Text := T1LatchCalCloseTime5.Value;
T1CalCloseText6.Text := T1LatchCalCloseTime6.Value;
T1CalCloseText7.Text := T1LatchCalCloseTime7.Value;
T1CalCloseText8.Text := T1LatchCalCloseTime8.Value;
T1CalCloseText9.Text := T1LatchCalCloseTime9.Value;
end.
