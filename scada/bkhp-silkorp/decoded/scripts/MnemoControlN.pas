begin
if PingPLC16Flor.AsBool = True then //Если установлена связь с контроллером
begin
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////НОРИИ начало///////////////////////////////////////////////////////
//Нория 1 начало
if StatusAlarmN1.AsBool = False then
begin
 if RelayOutN1.AsBool = True then
     if RelayInN1.AsBool = True then
   begin
   N1OutLine.Color := clGreen;
   ImageTopN1.Color := clGreen;
   ImageBottomN1.Color := clGreen;
   StatusN1.Value := 1;
   StartTimeN1.Value := 0;
   end;
 if RelayOutN1.AsBool = False then
     if RelayInN1.AsBool = True then
   begin
   N1OutLine.Color := clYellow;
   ImageTopN1.Color := clYellow;
   ImageBottomN1.Color := clYellow;
   StatusN1.Value := 2;
   StartTimeN1.Value := 0;
   end;
 if RelayOutN1.AsBool = True then
     if RelayInN1.AsBool = False then
   begin
   N1OutLine.Color := clRed;
   ImageTopN1.Color := clRed;
   ImageBottomN1.Color := clRed;
   StartTimeN1.Value := StartTimeN1.Value + 1;
   if StartTimeN1.Value > 3 then
   begin
   RelayOutN1.Value := False;
   StartTimeN1.Value := 0;
   StatusStartN1.Value := 6;
   StatusN1.Value := 3;
   end;
   end;
 if RelayOutN1.AsBool = False then
     if RelayInN1.AsBool = False then
   begin
   N1OutLine.Color := clRed;
   ImageTopN1.Color := clRed;
   ImageBottomN1.Color := clRed;
   StatusN1.Value := 4;
   StartTimeN1.Value := 0;
   end;
end
else
StatusN1.Value := 10;
//Нория 1 конец
//Нория 2 начало
if StatusAlarmN2.AsBool = False then
begin
 if RelayOutN2.AsBool = True then
     if RelayInN2.AsBool = True then
   begin
   N2OutLine.Color := clGreen;
   ImageTopN2.Color := clGreen;
   ImageBottomN2.Color := clGreen;
   StatusN2.Value := 1;
   StartTimeN2.Value := 0;
   end;
 if RelayOutN2.AsBool = False then
     if RelayInN2.AsBool = True then
   begin
   N2OutLine.Color := clYellow;
   ImageTopN2.Color := clYellow;
   ImageBottomN2.Color := clYellow;
   StartTimeN2.Value := 0;
   end;
 if RelayOutN2.AsBool = True then
     if RelayInN2.AsBool = False then
   begin
   N2OutLine.Color := clRed;
   ImageTopN2.Color := clRed;
   ImageBottomN2.Color := clRed;
   StartTimeN2.Value := StartTimeN2.Value + 1;
   if StartTimeN2.Value > 3 then
   begin
   RelayOutN2.Value := False;
   StartTimeN2.Value := 0;
   StatusStartN2.Value := 6;
   StatusN2.Value := 3;
   end;
   end;
 if RelayOutN2.AsBool = False then
     if RelayInN2.AsBool = False then
   begin
   N2OutLine.Color := clRed;
   ImageTopN2.Color := clRed;
   ImageBottomN2.Color := clRed;
   StatusN2.Value := 4;
   StartTimeN2.Value := 0;
   end;
end
else
StatusN2.Value := 10;
//Нория 2 конец
//Нория 3 начало
if StatusAlarmN3.AsBool = False then
begin
 if RelayOutN3.AsBool = True then
     if RelayInN3.AsBool = True then
   begin
   N3OutLine.Color := clGreen;
   ImageTopN3.Color := clGreen;
   ImageBottomN3.Color := clGreen;
   StatusN3.Value := 1;
   StartTimeN3.Value := 0;
   end;
 if RelayOutN3.AsBool = False then
     if RelayInN3.AsBool = True then
   begin
   N3OutLine.Color := clYellow;
   ImageTopN3.Color := clYellow;
   ImageBottomN3.Color := clYellow;
   StatusN3.Value := 2;
   StartTimeN3.Value := 0;
   end;
 if RelayOutN3.AsBool = True then
     if RelayInN3.AsBool = False then
   begin
   N3OutLine.Color := clRed;
   ImageTopN3.Color := clRed;
   ImageBottomN3.Color := clRed;
   StartTimeN3.Value := StartTimeN3.Value + 1;
   if StartTimeN3.Value > 3 then
   begin
   RelayOutN3.Value := False;
   StartTimeN3.Value := 0;
   StatusStartN3.Value := 6;
   StatusN3.Value := 3;
   end;
   end;
 if RelayOutN3.AsBool = False then
     if RelayInN3.AsBool = False then
   begin
   N3OutLine.Color := clRed;
   ImageTopN3.Color := clRed;
   ImageBottomN3.Color := clRed;
   StatusN3.Value := 4;
   StartTimeN3.Value := 0;
   end;
end
else
StatusN3.Value := 10;
//Нория 3 конец
//Нория 4 начало
if StatusAlarmN4.AsBool = False then
begin
 if RelayOutN4.AsBool = True then
     if RelayInN4.AsBool = True then
   begin
   N4KlapOutLine.Color := clGreen;
   ImageTopN4.Color := clGreen;
   ImageBottomN4.Color := clGreen;
   StatusN4.Value := 1;
   StartTimeN4.Value := 0;
   end;
 if RelayOutN4.AsBool = False then
     if RelayInN4.AsBool = True then
   begin
   N4KlapOutLine.Color := clYellow;
   ImageTopN4.Color := clYellow;
   ImageBottomN4.Color := clYellow;
   StatusN4.Value := 2;
   StartTimeN4.Value := 0;
   end;
 if RelayOutN4.AsBool = True then
     if RelayInN4.AsBool = False then
   begin
   N4KlapOutLine.Color := clRed;
   ImageTopN4.Color := clRed;
   ImageBottomN4.Color := clRed;
   StartTimeN4.Value := StartTimeN4.Value + 1;
   if StartTimeN4.Value > 3 then
   begin
   RelayOutN4.Value := False;
   StartTimeN4.Value := 0;
   StatusStartN4.Value := 6;
   StatusN4.Value := 3;
   end;
   end;
 if RelayOutN4.AsBool = False then
     if RelayInN4.AsBool = False then
   begin
   N4KlapOutLine.Color := clRed;
   ImageTopN4.Color := clRed;
   ImageBottomN4.Color := clRed;
   StatusN4.Value := 4;
   StartTimeN4.Value := 0;
   end;
end
else
StatusN4.Value := 10;
//Нория 4 конец
//Нория 5 начало
if StatusAlarmN5.AsBool = False then
begin
 if RelayOutN5.AsBool = True then
     if RelayInN5.AsBool = True then
   begin
   N5KlapOutLine.Color := clGreen;
   ImageTopN5.Color := clGreen;
   ImageBottomN5.Color := clGreen;
   StatusN5.Value := 1;
   StartTimeN5.Value := 0;
   end;
 if RelayOutN5.AsBool = False then
     if RelayInN5.AsBool = True then
   begin
   N5KlapOutLine.Color := clYellow;
   ImageTopN5.Color := clYellow;
   ImageBottomN5.Color := clYellow;
   StatusN5.Value := 2;
   StartTimeN5.Value := 0;
   end;
 if RelayOutN5.AsBool = True then
     if RelayInN5.AsBool = False then
   begin
   N5KlapOutLine.Color := clRed;
   ImageTopN5.Color := clRed;
   ImageBottomN5.Color := clRed;
   StartTimeN5.Value := StartTimeN5.Value + 1;
   if StartTimeN5.Value > 3 then
   begin
   RelayOutN5.Value := False;
   StartTimeN5.Value := 0;
   StatusStartN5.Value := 6;
   StatusN5.Value := 3;
   end;
   end;
 if RelayOutN5.AsBool = False then
     if RelayInN5.AsBool = False then
   begin
   N5KlapOutLine.Color := clRed;
   ImageTopN5.Color := clRed;
   ImageBottomN5.Color := clRed;
   StatusN5.Value := 4;
   StartTimeN5.Value := 0;
   end;
end
else
StatusN5.Value := 10;
//Нория 5 конец
//Нория 6 начало
if StatusAlarmN6.AsBool = False then
begin
 if RelayOutN6.AsBool = True then
     if RelayInN6.AsBool = True then
   begin
   N6OutLine.Color := clGreen;
   ImageTopN6.Color := clGreen;
   ImageBottomN6.Color := clGreen;
   StatusN6.Value := 1;
   StartTimeN6.Value := 0;
   end;
 if RelayOutN6.AsBool = False then
     if RelayInN6.AsBool = True then
   begin
   N6OutLine.Color := clYellow;
   ImageTopN6.Color := clYellow;
   ImageBottomN6.Color := clYellow;
   StatusN6.Value := 2;
   StartTimeN6.Value := 0;
   end;
 if RelayOutN6.AsBool = True then
     if RelayInN6.AsBool = False then
   begin
   N6OutLine.Color := clRed;
   ImageTopN6.Color := clRed;
   ImageBottomN6.Color := clRed;
   StartTimeN6.Value := StartTimeN6.Value + 1;
   if StartTimeN6.Value > 3 then
   begin
   RelayOutN6.Value := False;
   StartTimeN6.Value := 0;
   StatusStartN6.Value := 6;
   StatusN6.Value := 3;
   end;
   end;
 if RelayOutN6.AsBool = False then
     if RelayInN6.AsBool = False then
   begin
   N6OutLine.Color := clRed;
   ImageTopN6.Color := clRed;
   ImageBottomN6.Color := clRed;
   StatusN6.Value := 4;
   StartTimeN6.Value := 0;
   end;
end
else
StatusN6.Value := 10;
//Нория 6 конец
//Нория 7 начало
if StatusAlarmN7.AsBool = False then
begin
 if RelayOutN7.AsBool = True then
     if RelayInN7.AsBool = True then
   begin
   N1aOutLine.Color := clGreen;
   ImageTopN7.Color := clGreen;
   ImageBottomN7.Color := clGreen;
   StatusN7.Value := 1;
   StartTimeN7.Value := 0;
   end;
 if RelayOutN7.AsBool = False then
     if RelayInN7.AsBool = True then
   begin
   N1aOutLine.Color := clYellow;
   ImageTopN7.Color := clYellow;
   ImageBottomN7.Color := clYellow;
   StatusN7.Value := 2;
   StartTimeN7.Value := 0;
   end;
 if RelayOutN7.AsBool = True then
     if RelayInN7.AsBool = False then
   begin
   N1aOutLine.Color := clRed;
   ImageTopN7.Color := clRed;
   ImageBottomN7.Color := clRed;
   StartTimeN7.Value := StartTimeN7.Value + 1;
   if StartTimeN7.Value > 3 then
   begin
   RelayOutN7.Value := False;
   StartTimeN7.Value := 0;
   StatusStartN7.Value := 6;
   StatusN7.Value := 3;
   end;
   end;
 if RelayOutN7.AsBool = False then
     if RelayInN7.AsBool = False then
   begin
   N1aOutLine.Color := clRed;
   ImageTopN7.Color := clRed;
   ImageBottomN7.Color := clRed;
   StatusN7.Value := 4;
   StartTimeN7.Value := 0;
   end;
end
else
StatusN7.Value := 10;
//Нория 7 конец
//Нория 8 начало
if StatusAlarmN8.AsBool = False then
begin
 if RelayOutN8.AsBool = True then
     if RelayInN8.AsBool = True then
   begin
   N2aOutLine.Color := clGreen;
   ImageTopN8.Color := clGreen;
   ImageBottomN8.Color := clGreen;
   StatusN8.Value := 1;
   StartTimeN8.Value := 0;
   end;
 if RelayOutN8.AsBool = False then
     if RelayInN8.AsBool = True then
   begin
   N2aOutLine.Color := clYellow;
   ImageTopN8.Color := clYellow;
   ImageBottomN8.Color := clYellow;
   StatusN8.Value := 2;
   StartTimeN8.Value := 0;
   end;
 if RelayOutN8.AsBool = True then
     if RelayInN8.AsBool = False then
   begin
   N2aOutLine.Color := clRed;
   ImageTopN8.Color := clRed;
   ImageBottomN8.Color := clRed;
   StartTimeN8.Value := StartTimeN8.Value + 1;
   if StartTimeN8.Value > 3 then
   begin
   RelayOutN8.Value := False;
   StartTimeN8.Value := 0;
   StatusStartN8.Value := 6;
   StatusN8.Value := 3;
   end;
   end;
 if RelayOutN8.AsBool = False then
     if RelayInN8.AsBool = False then
   begin
   N2aOutLine.Color := clRed;
   ImageTopN8.Color := clRed;
   ImageBottomN8.Color := clRed;
   StatusN8.Value := 4;
   StartTimeN8.Value := 0;
   end;
end
else
StatusN8.Value := 10;
//Нория 8 конец
//Нория 9 начало
if StatusAlarmN9.AsBool = False then
begin
 if RelayOutN9.AsBool = True then
     if RelayInN9.AsBool = True then
   begin
   N11OutLine.Color := clGreen;
   ImageTopN9.Color := clGreen;
   ImageBottomN9.Color := clGreen;
   StatusN9.Value := 1;
   StartTimeN9.Value := 0;
   end;
 if RelayOutN9.AsBool = False then
     if RelayInN9.AsBool = True then
   begin
   N11OutLine.Color := clYellow;
   ImageTopN9.Color := clYellow;
   ImageBottomN9.Color := clYellow;
   StatusN9.Value := 2;
   StartTimeN9.Value := 0;
   end;
 if RelayOutN9.AsBool = True then
     if RelayInN9.AsBool = False then
   begin
   N11OutLine.Color := clRed;
   ImageTopN9.Color := clRed;
   ImageBottomN9.Color := clRed;
   StartTimeN9.Value := StartTimeN9.Value + 1;
   if StartTimeN9.Value > 3 then
   begin
   RelayOutN9.Value := False;
   StartTimeN9.Value := 0;
   StatusStartN9.Value := 6;
   StatusN9.Value := 3;
   end;
   end;
 if RelayOutN9.AsBool = False then
     if RelayInN9.AsBool = False then
   begin
   N11OutLine.Color := clRed;
   ImageTopN9.Color := clRed;
   ImageBottomN9.Color := clRed;
   StatusN9.Value := 4;
   StartTimeN9.Value := 0;
   end;
end
else
StatusN9.Value := 10;
//Нория 9 конец
//////////////////////////////////////////////////////////НОРИИ конец///////////////////////////////////////////////////////

////////////////////////////////////Контроль Аварии Норий НАЧАЛО////////////////////////////////////////////
 // Нория 1 Авария начало
  if RelayOutN1.AsBool = True then
  if RelayAlarmN1.AsBool = True then
  begin
 AlarmTimeN1.Value := AlarmTimeN1.Value + 1;
  if AlarmTimeN1.Value >= 10 then
  begin
  RelayOutN1.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN1.Value := True;
  AlarmTimeN1.Value := 0
  end;
  end;
 if RelayAlarmN1.AsBool = False then
  begin
 StatusAlarmN1.Value := False;
 AlarmTimeN1.Value := 0
 end;
 // Нория 1 Авария конец
  // Нория 2 Авария начало
  if RelayOutN2.AsBool = True then
  if RelayAlarmN2.AsBool = True then
  begin
 AlarmTimeN2.Value := AlarmTimeN2.Value + 1;
  if AlarmTimeN2.Value >= 10 then
  begin
  RelayOutN2.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN2.Value := True;
  AlarmTimeN2.Value := 0
  end;
  end;
 if RelayAlarmN2.AsBool = False then
  begin
 StatusAlarmN2.Value := False;
 AlarmTimeN2.Value := 0
 end;
 // Нория 2 Авария конец
  // Нория 3 Авария начало
  if RelayOutN3.AsBool = True then
  if RelayAlarmN3.AsBool = True then
  begin
 AlarmTimeN3.Value := AlarmTimeN3.Value + 1;
  if AlarmTimeN3.Value >= 10 then
  begin
  RelayOutN3.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN3.Value := True;
  AlarmTimeN3.Value := 0
  end;
  end;
 if RelayAlarmN3.AsBool = False then
  begin
 StatusAlarmN3.Value := False;
 AlarmTimeN3.Value := 0
 end;
 // Нория 3 Авария конец
  // Нория 4 Авария начало
  if RelayOutN4.AsBool = True then
  if RelayAlarmN4.AsBool = True then
  begin
 AlarmTimeN4.Value := AlarmTimeN4.Value + 1;
  if AlarmTimeN4.Value >= 10 then
  begin
  RelayOutN4.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN4.Value := True;
  AlarmTimeN4.Value := 0
  end;
  end;
 if RelayAlarmN4.AsBool = False then
  begin
 StatusAlarmN4.Value := False;
 AlarmTimeN4.Value := 0
 end;
 // Нория 4 Авария конец
  // Нория 5 Авария начало
  if RelayOutN5.AsBool = True then
  if RelayAlarmN5.AsBool = True then
  begin
 AlarmTimeN5.Value := AlarmTimeN5.Value + 1;
  if AlarmTimeN5.Value >= 10 then
  begin
  RelayOutN5.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN5.Value := True;
  AlarmTimeN5.Value := 0
  end;
  end;
 if RelayAlarmN5.AsBool = False then
  begin
 StatusAlarmN5.Value := False;
 AlarmTimeN5.Value := 0
 end;
 // Нория 5 Авария конец
  // Нория 6 Авария начало
  if RelayOutN6.AsBool = True then
  if RelayAlarmN6.AsBool = True then
  begin
 AlarmTimeN6.Value := AlarmTimeN6.Value + 1;
  if AlarmTimeN6.Value >= 10 then
  begin
  RelayOutN6.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN6.Value := True;
  AlarmTimeN6.Value := 0
  end;
  end;
 if RelayAlarmN6.AsBool = False then
  begin
 StatusAlarmN6.Value := False;
 AlarmTimeN6.Value := 0
 end;
 // Нория 6 Авария конец
  // Нория 7 Авария начало
  if RelayOutN7.AsBool = True then
  if RelayAlarmN7.AsBool = True then
  begin
 AlarmTimeN7.Value := AlarmTimeN7.Value + 1;
  if AlarmTimeN7.Value >= 10 then
  begin
  RelayOutN7.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN7.Value := True;
  AlarmTimeN7.Value := 0
  end;
  end;
 if RelayAlarmN7.AsBool = False then
  begin
 StatusAlarmN7.Value := False;
 AlarmTimeN7.Value := 0
 end;
 // Нория 7 Авария конец
  // Нория 8 Авария начало
  if RelayOutN8.AsBool = True then
  if RelayAlarmN8.AsBool = True then
  begin
 AlarmTimeN8.Value := AlarmTimeN8.Value + 1;
  if AlarmTimeN8.Value >= 10 then
  begin
  RelayOutN8.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN8.Value := True;
  AlarmTimeN8.Value := 0
  end;
  end;
 if RelayAlarmN8.AsBool = False then
  begin
 StatusAlarmN8.Value := False;
 AlarmTimeN8.Value := 0
 end;
 // Нория 8 Авария конец
  // Нория 9 Авария начало
  if RelayOutN9.AsBool = True then
  if RelayAlarmN9.AsBool = True then
  begin
 AlarmTimeN9.Value := AlarmTimeN9.Value + 1;
  if AlarmTimeN9.Value >= 10 then
  begin
  RelayOutN9.Value := False;
  AlarmStatus.Value := True;
  StatusAlarmN9.Value := True;
  AlarmTimeN9.Value := 0
  end;
  end;
 if RelayAlarmN9.AsBool = False then
  begin
 StatusAlarmN9.Value := False;
 AlarmTimeN9.Value := 0
 end;
 // Нория 9 Авария конец
////////////////////////////////////Контроль Аварии Норий КОНЕЦ////////////////////////////////////////////
end;
end.
