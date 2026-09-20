begin
if PingPLC16Flor.AsBool = True then //Если установлена связь с контроллером
begin
/////////////////////////////////////////////////////ТРАНСПОРТЕРЫ начало///////////////////////////////////////////////////
//Транспортер номер 1 начало
if StatusAlarmT1.AsBool = False then
begin
if RelayInReversT1.AsBool = True then
if RelayInForwardT1.AsBool = True then
begin
if RelayOutForwardT1.AsBool = True then
   begin
   LineReversT1.Color := clRed;
   LineForwardT1.Color := clGreen;
   ImageT1.Color := clGreen;
   StatusT1.Value := 1;
   StartTimeT1.Value := 0;
   end;
 end;
if RelayInReversT1.AsBool = False then
begin
 if RelayOutForwardT1.AsBool = False then
     if RelayInForwardT1.AsBool = True then
   begin
   LineReversT1.Color := clRed;
   LineForwardT1.Color := clYellow;
   ImageT1.Color := clYellow;
   StatusT1.Value := 2;
   StartTimeT1.Value := 0;
   end;
 if RelayOutForwardT1.AsBool = True then
     if RelayInForwardT1.AsBool = False then
   begin
   LineReversT1.Color := clRed;
   LineForwardT1.Color := clRed;
   ImageT1.Color := clRed;
   StartTimeT1.Value := StartTimeT1.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT1.Value := False;
   StartTimeT1.Value := 0;
   StatusStartForwardT1.Value := 6;
   StatusT1.Value := 3;
   end;
   end;
 if RelayOutForwardT1.AsBool = False then
     if RelayInForwardT1.AsBool = False then
   begin
   LineReversT1.Color := clRed;
   LineForwardT1.Color := clRed;
   ImageT1.Color := clRed;
   StatusT1.Value := 4;
   StartTimeT1.Value := 0;
   end;
end;
end
else
StatusT1.Value := 10;

if StatusAlarmT1.AsBool = False then
begin
if RelayInForwardT1.AsBool = True then
if RelayInReversT1.AsBool = True then
begin
 if RelayOutReversT1.AsBool = True then
     if RelayInReversT1.AsBool = True then
   begin
   LineForwardT1.Color := clRed;
   LineReversT1.Color := clGreen;
   ImageT1.Color := clGreen;
   StatusT1.Value := 11;
   StartTimeT1.Value := 0;
end;
end;
if RelayInForwardT1.AsBool = False then
begin
 if RelayOutReversT1.AsBool = False then
     if RelayInReversT1.AsBool = True then
   begin
   LineForwardT1.Color := clRed;
   LineReversT1.Color := clYellow;
   ImageT1.Color := clYellow;
   StatusT1.Value := 12;
   StartTimeT1.Value := 0;
   end;
 if RelayOutReversT1.AsBool = True then
     if RelayInReversT1.AsBool = False then
   begin
   LineForwardT1.Color := clRed;
   LineReversT1.Color := clRed;
   ImageT1.Color := clRed;
   StartTimeT1.Value := StartTimeT1.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT1.Value := False;
   StartTimeT1.Value := 0;
   StatusStartForwardT1.Value := 6;
   StatusT1.Value := 3;
   end;
   end;
 if RelayOutReversT1.AsBool = False then
     if RelayInReversT1.AsBool = False then
   begin
   LineForwardT1.Color := clRed;
   LineReversT1.Color := clRed;
   ImageT1.Color := clRed;
   StatusT1.Value := 4;
   StartTimeT1.Value := 0;
   end;
end;
end
else
StatusT1.Value := 10;
//Транспортер номер 1 конец
//Транспортер номер 2 начало
if StatusAlarmT2.AsBool = False then
begin
if RelayInReversT2.AsBool = False then
begin
if RelayOutForwardT2.AsBool = True then
if RelayInForwardT2.AsBool = True then
begin
   LineReversT2.Color := clRed;
   LineForwardT2.Color := clGreen;
   ImageT2.Color := clGreen;
   StatusT2.Value := 1;
   StartTimeT2.Value := 0;
   end;
 if RelayOutForwardT2.AsBool = False then
     if RelayInForwardT2.AsBool = True then
   begin
   LineReversT2.Color := clRed;
   LineForwardT2.Color := clYellow;
   ImageT2.Color := clYellow;
   StatusT2.Value := 2;
   StartTimeT2.Value := 0;
   end;
 if RelayOutForwardT2.AsBool = True then
     if RelayInForwardT2.AsBool = False then
   begin
   LineReversT2.Color := clRed;
   LineForwardT2.Color := clRed;
   ImageT2.Color := clRed;
   StartTimeT2.Value := StartTimeT2.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT2.Value := False;
   StartTimeT2.Value := 0;
   StatusStartForwardT2.Value := 6;
   StatusT2.Value := 3;
   end;
   end;
 if RelayOutForwardT2.AsBool = False then
     if RelayInForwardT2.AsBool = False then
   begin
   LineReversT2.Color := clRed;
   LineForwardT2.Color := clRed;
   ImageT2.Color := clRed;
   StatusT2.Value := 4;
   StartTimeT2.Value := 0;
   end;
end;
end
else
StatusT2.Value := 10;

if StatusAlarmT2.AsBool = False then
begin
if RelayInForwardT2.AsBool = False then
begin
 if RelayOutReversT2.AsBool = True then
     if RelayInReversT2.AsBool = True then
   begin
   LineForwardT2.Color := clRed;
   LineReversT2.Color := clGreen;
   ImageT2.Color := clGreen;
   StatusT2.Value := 11;
   StartTimeT2.Value := 0;
end;
 if RelayOutReversT2.AsBool = False then
     if RelayInReversT2.AsBool = True then
   begin
   LineForwardT2.Color := clRed;
   LineReversT2.Color := clYellow;
   ImageT2.Color := clYellow;
   StatusT2.Value := 12;
   StartTimeT2.Value := 0;
   end;
 if RelayOutReversT2.AsBool = True then
     if RelayInReversT2.AsBool = False then
   begin
   LineForwardT2.Color := clRed;
   LineReversT2.Color := clRed;
   ImageT2.Color := clRed;
   StartTimeT2.Value := StartTimeT2.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT2.Value := False;
   StartTimeT2.Value := 0;
   StatusStartForwardT2.Value := 6;
   StatusT2.Value := 3;
   end;
   end;
 if RelayOutReversT2.AsBool = False then
     if RelayInReversT2.AsBool = False then
   begin
   LineForwardT2.Color := clRed;
   LineReversT2.Color := clRed;
   ImageT2.Color := clRed;
   StatusT2.Value := 4;
   StartTimeT2.Value := 0;
   end;
end;
end
else
StatusT2.Value := 10;
//Транспортер номер 2 конец
//Транспортер номер 3 начало
if StatusAlarmT3.AsBool = False then
begin
if RelayInReversT3.AsBool = False then
begin
if RelayOutForwardT3.AsBool = True then
if RelayInForwardT3.AsBool = True then
   begin
   LineReversT3.Color := clRed;
   LineForwardT3.Color := clGreen;
   ImageT3.Color := clGreen;
   StatusT3.Value := 1;
   StartTimeT3.Value := 0;
   end;
 if RelayOutForwardT3.AsBool = False then
     if RelayInForwardT3.AsBool = True then
   begin
   LineReversT3.Color := clRed;
   LineForwardT3.Color := clYellow;
   ImageT3.Color := clYellow;
   StatusT3.Value := 2;
   StartTimeT3.Value := 0;
   end;
 if RelayOutForwardT3.AsBool = True then
     if RelayInForwardT3.AsBool = False then
   begin
   LineReversT3.Color := clRed;
   LineForwardT3.Color := clRed;
   ImageT3.Color := clRed;
   StartTimeT3.Value := StartTimeT3.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT3.Value := False;
   StartTimeT3.Value := 0;
   StatusStartForwardT3.Value := 6;
   StatusT3.Value := 3;
   end;
   end;
 if RelayOutForwardT3.AsBool = False then
     if RelayInForwardT3.AsBool = False then
   begin
   LineReversT3.Color := clRed;
   LineForwardT3.Color := clRed;
   ImageT3.Color := clRed;
   StatusT3.Value := 4;
   StartTimeT3.Value := 0;
   end;
end;
end
else
StatusT3.Value := 10;

if StatusAlarmT3.AsBool = False then
begin
if RelayInForwardT3.AsBool = False then
begin
 if RelayOutReversT3.AsBool = True then
     if RelayInReversT3.AsBool = True then
   begin
   LineForwardT3.Color := clRed;
   LineReversT3.Color := clGreen;
   ImageT3.Color := clGreen;
   StatusT3.Value := 11;
   StartTimeT3.Value := 0;
end;
 if RelayOutReversT3.AsBool = False then
     if RelayInReversT3.AsBool = True then
   begin
   LineForwardT3.Color := clRed;
   LineReversT3.Color := clYellow;
   ImageT3.Color := clYellow;
   StatusT3.Value := 12;
   StartTimeT3.Value := 0;
   end;
 if RelayOutReversT3.AsBool = True then
     if RelayInReversT3.AsBool = False then
   begin
   LineForwardT3.Color := clRed;
   LineReversT3.Color := clRed;
   ImageT3.Color := clRed;
   StartTimeT3.Value := StartTimeT3.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT3.Value := False;
   StartTimeT3.Value := 0;
   StatusStartForwardT3.Value := 6;
   StatusT3.Value := 3;
   end;
   end;
 if RelayOutReversT3.AsBool = False then
     if RelayInReversT3.AsBool = False then
   begin
   LineForwardT3.Color := clRed;
   LineReversT3.Color := clRed;
   ImageT3.Color := clRed;
   StatusT3.Value := 4;
   StartTimeT3.Value := 0;
   end;
end;
end
else
StatusT3.Value := 10;
//Транспортер номер 3 конец
//Транспортер номер 4 начало
if StatusAlarmT4.AsBool = False then
begin
if RelayInReversT4.AsBool = True then
if RelayInForwardT4.AsBool = True then
begin
 if RelayOutForwardT4.AsBool = True then
   begin
   LineReversT4.Color := clRed;
   LineForwardT4.Color := clGreen;
   ImageT4_1.Color := clGreen;
   ImageT4_2.Color := clGreen;
   StatusT4.Value := 1;
   StartTimeT4.Value := 0;
   end;
 end;
if RelayInReversT4.AsBool = False then
begin
 if RelayOutForwardT4.AsBool = False then
     if RelayInForwardT4.AsBool = True then
   begin
   LineReversT4.Color := clRed;
   LineForwardT4.Color := clYellow;
   ImageT4_1.Color := clYellow;
   ImageT4_2.Color := clYellow;
   StatusT4.Value := 2;
   StartTimeT4.Value := 0;
   end;
 if RelayOutForwardT4.AsBool = True then
     if RelayInForwardT4.AsBool = False then
   begin
   LineReversT4.Color := clRed;
   LineForwardT4.Color := clRed;
   ImageT4_1.Color := clRed;
   ImageT4_2.Color := clRed;
   StartTimeT4.Value := StartTimeT4.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT4.Value := False;
   StartTimeT4.Value := 0;
   StatusStartForwardT4.Value := 6;
   StatusT4.Value := 3;
   end;
   end;
 if RelayOutForwardT4.AsBool = False then
     if RelayInForwardT4.AsBool = False then
   begin
   LineReversT4.Color := clRed;
   LineForwardT4.Color := clRed;
   ImageT4_1.Color := clRed;
   ImageT4_2.Color := clRed;
   StatusT4.Value := 4;
   StartTimeT4.Value := 0;
   end;
end;
end
else
StatusT4.Value := 10;

if StatusAlarmT4.AsBool = False then
begin
if RelayInForwardT4.AsBool = True then
if RelayInReversT4.AsBool = True then
begin
 if RelayOutReversT4.AsBool = True then
     if RelayInReversT4.AsBool = True then
   begin
   LineForwardT4.Color := clRed;
   LineReversT4.Color := clGreen;
   ImageT4_1.Color := clGreen;
   ImageT4_2.Color := clGreen;
   StatusT4.Value := 11;
   StartTimeT4.Value := 0;
end;
end;
if RelayInForwardT4.AsBool = False then
begin
 if RelayOutReversT4.AsBool = False then
     if RelayInReversT4.AsBool = True then
   begin
   LineForwardT4.Color := clRed;
   LineReversT4.Color := clYellow;
   ImageT4_1.Color := clYellow;
   ImageT4_2.Color := clYellow;
   StatusT4.Value := 12;
   StartTimeT4.Value := 0;
   end;
 if RelayOutReversT4.AsBool = True then
     if RelayInReversT4.AsBool = False then
   begin
   LineForwardT4.Color := clRed;
   LineReversT4.Color := clRed;
   ImageT4_1.Color := clRed;
   ImageT4_2.Color := clRed;
   StartTimeT4.Value := StartTimeT4.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT4.Value := False;
   StartTimeT4.Value := 0;
   StatusStartForwardT4.Value := 6;
   StatusT4.Value := 3;
   end;
   end;
 if RelayOutReversT4.AsBool = False then
     if RelayInReversT4.AsBool = False then
   begin
   LineForwardT4.Color := clRed;
   LineReversT4.Color := clRed;
   ImageT4_1.Color := clRed;
   ImageT4_2.Color := clRed;
   StatusT4.Value := 4;
   StartTimeT4.Value := 0;
   end;
end;
end
else
StatusT4.Value := 10;
//Транспортер номер 4 конец
//Транспортер номер 5 начало
if StatusAlarmT5.AsBool = False then
begin
if RelayInReversT5.AsBool = True then
if RelayInForwardT5.AsBool = True then
begin
 if RelayOutForwardT5.AsBool = True then
   begin
   LineReversT5.Color := clRed;
   LineForwardT5.Color := clGreen;
   ImageT5_1.Color := clGreen;
   ImageT5_2.Color := clGreen;
   StatusT5.Value := 1;
   StartTimeT5.Value := 0;
   end;
 end;
if RelayInReversT5.AsBool = False then
begin
 if RelayOutForwardT5.AsBool = False then
     if RelayInForwardT5.AsBool = True then
   begin
   LineReversT5.Color := clRed;
   LineForwardT5.Color := clYellow;
   ImageT5_1.Color := clYellow;
   ImageT5_2.Color := clYellow;
   StatusT5.Value := 2;
   StartTimeT5.Value := 0;
   end;
 if RelayOutForwardT5.AsBool = True then
     if RelayInForwardT5.AsBool = False then
   begin
   LineReversT5.Color := clRed;
   LineForwardT5.Color := clRed;
   ImageT5_1.Color := clRed;
   ImageT5_2.Color := clRed;
   StartTimeT5.Value := StartTimeT5.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT5.Value := False;
   StartTimeT5.Value := 0;
   StatusStartForwardT5.Value := 6;
   StatusT5.Value := 3;
   end;
   end;
 if RelayOutForwardT5.AsBool = False then
     if RelayInForwardT5.AsBool = False then
   begin
   LineReversT5.Color := clRed;
   LineForwardT5.Color := clRed;
   ImageT5_1.Color := clRed;
   ImageT5_2.Color := clRed;
   StatusT5.Value := 4;
   StartTimeT5.Value := 0;
   end;
end;
end
else
StatusT5.Value := 10;

if StatusAlarmT5.AsBool = False then
begin
if RelayInForwardT5.AsBool = True then
if RelayInReversT5.AsBool = True then
begin
 if RelayOutReversT5.AsBool = True then
     if RelayInReversT5.AsBool = True then
   begin
   LineForwardT5.Color := clRed;
   LineReversT5.Color := clGreen;
   ImageT5_1.Color := clGreen;
   ImageT5_2.Color := clGreen;
   StatusT5.Value := 11;
   StartTimeT5.Value := 0;
end;
end;
if RelayInForwardT5.AsBool = False then
begin
 if RelayOutReversT5.AsBool = False then
     if RelayInReversT5.AsBool = True then
   begin
   LineForwardT5.Color := clRed;
   LineReversT5.Color := clYellow;
   ImageT5_1.Color := clYellow;
   ImageT5_2.Color := clYellow;
   StatusT5.Value := 12;
   StartTimeT5.Value := 0;
   end;
 if RelayOutReversT5.AsBool = True then
     if RelayInReversT5.AsBool = False then
   begin
   LineForwardT5.Color := clRed;
   LineReversT5.Color := clRed;
   ImageT5_1.Color := clRed;
   ImageT5_2.Color := clRed;
   StartTimeT5.Value := StartTimeT5.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT5.Value := False;
   StartTimeT5.Value := 0;
   StatusStartForwardT5.Value := 6;
   StatusT5.Value := 3;
   end;
   end;
 if RelayOutReversT5.AsBool = False then
     if RelayInReversT5.AsBool = False then
   begin
   LineForwardT5.Color := clRed;
   LineReversT5.Color := clRed;
   ImageT5_1.Color := clRed;
   ImageT5_2.Color := clRed;
   StatusT5.Value := 4;
   StartTimeT5.Value := 0;
   end;
end;
end
else
StatusT5.Value := 10;
//Транспортер номер 5 конец
//Транспортер номер 6 начало
if StatusAlarmT6.AsBool = False then
begin
if RelayInReversT6.AsBool = True then
if RelayInForwardT6.AsBool = True then
begin
 if RelayOutForwardT6.AsBool = True then
   begin
   LineReversT6.Color := clRed;
   LineForwardT6.Color := clGreen;
   ImageT6.Color := clGreen;
   StatusT6.Value := 1;
   StartTimeT6.Value := 0;
   end;
 end;
if RelayInReversT6.AsBool = False then
begin
 if RelayOutForwardT6.AsBool = False then
     if RelayInForwardT6.AsBool = True then
   begin
   LineReversT6.Color := clRed;
   LineForwardT6.Color := clYellow;
   ImageT6.Color := clYellow;
   StatusT6.Value := 2;
   StartTimeT6.Value := 0;
   end;
 if RelayOutForwardT6.AsBool = True then
     if RelayInForwardT6.AsBool = False then
   begin
   LineReversT6.Color := clRed;
   LineForwardT6.Color := clRed;
   ImageT6.Color := clRed;
   StartTimeT6.Value := StartTimeT6.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT6.Value := False;
   StartTimeT6.Value := 0;
   StatusStartForwardT6.Value := 6;
   StatusT6.Value := 3;
   end;
   end;
 if RelayOutForwardT6.AsBool = False then
     if RelayInForwardT6.AsBool = False then
   begin
   LineReversT6.Color := clRed;
   LineForwardT6.Color := clRed;
   ImageT6.Color := clRed;
   StatusT6.Value := 4;
   StartTimeT6.Value := 0;
   end;
end;
end
else
StatusT6.Value := 10;

if StatusAlarmT6.AsBool = False then
begin
if RelayInForwardT6.AsBool = True then
if RelayInReversT6.AsBool = True then
begin
 if RelayOutReversT6.AsBool = True then
     if RelayInReversT6.AsBool = True then
   begin
   LineForwardT6.Color := clRed;
   LineReversT6.Color := clGreen;
   ImageT6.Color := clGreen;
   StatusT6.Value := 11;
   StartTimeT6.Value := 0;
end;
end;
if RelayInForwardT6.AsBool = False then
begin
 if RelayOutReversT6.AsBool = False then
     if RelayInReversT6.AsBool = True then
   begin
   LineForwardT6.Color := clRed;
   LineReversT6.Color := clYellow;
   ImageT6.Color := clYellow;
   StatusT6.Value := 12;
   StartTimeT6.Value := 0;
   end;
 if RelayOutReversT6.AsBool = True then
     if RelayInReversT6.AsBool = False then
   begin
   LineForwardT6.Color := clRed;
   LineReversT6.Color := clRed;
   ImageT6.Color := clRed;
   StartTimeT6.Value := StartTimeT6.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT6.Value := False;
   StartTimeT6.Value := 0;
   StatusStartForwardT6.Value := 6;
   StatusT6.Value := 3;
   end;
   end;
 if RelayOutReversT6.AsBool = False then
     if RelayInReversT6.AsBool = False then
   begin
   LineForwardT6.Color := clRed;
   LineReversT6.Color := clRed;
   ImageT6.Color := clRed;
   StatusT6.Value := 4;
   StartTimeT6.Value := 0;
   end;
end;
end
else
StatusT6.Value := 10;
//Транспортер номер 6 конец
//Транспортер номер 7 начало
if StatusAlarmT7.AsBool = False then
begin
if RelayInReversT7.AsBool = True then
if RelayInForwardT7.AsBool = True then
begin
 if RelayOutForwardT7.AsBool = True then
   begin
   LineReversT7.Color := clRed;
   LineForwardT7.Color := clGreen;
   ImageT7.Color := clGreen;
   StatusT7.Value := 1;
   StartTimeT7.Value := 0;
   end;
 end;
if RelayInReversT7.AsBool = False then
begin
 if RelayOutForwardT7.AsBool = False then
     if RelayInForwardT7.AsBool = True then
   begin
   LineReversT7.Color := clRed;
   LineForwardT7.Color := clYellow;
   ImageT7.Color := clYellow;
   StatusT7.Value := 2;
   StartTimeT7.Value := 0;
   end;
 if RelayOutForwardT7.AsBool = True then
     if RelayInForwardT7.AsBool = False then
   begin
   LineReversT7.Color := clRed;
   LineForwardT7.Color := clRed;
   ImageT7.Color := clRed;
   StartTimeT7.Value := StartTimeT7.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT7.Value := False;
   StartTimeT7.Value := 0;
   StatusStartForwardT7.Value := 6;
   StatusT7.Value := 3;
   end;
   end;
 if RelayOutForwardT7.AsBool = False then
     if RelayInForwardT7.AsBool = False then
   begin
   LineReversT7.Color := clRed;
   LineForwardT7.Color := clRed;
   ImageT7.Color := clRed;
   StatusT7.Value := 4;
   StartTimeT7.Value := 0;
   end;
end;
end
else
StatusT7.Value := 10;

if StatusAlarmT7.AsBool = False then
begin
if RelayInForwardT7.AsBool = True then
if RelayInReversT7.AsBool = True then
begin
 if RelayOutReversT7.AsBool = True then
     if RelayInReversT7.AsBool = True then
   begin
   LineForwardT7.Color := clRed;
   LineReversT7.Color := clGreen;
   ImageT7.Color := clGreen;
   StatusT7.Value := 11;
   StartTimeT7.Value := 0;
end;
end;
if RelayInForwardT7.AsBool = False then
begin
 if RelayOutReversT7.AsBool = False then
     if RelayInReversT7.AsBool = True then
   begin
   LineForwardT7.Color := clRed;
   LineReversT7.Color := clYellow;
   ImageT7.Color := clYellow;
   StatusT7.Value := 12;
   StartTimeT7.Value := 0;
   end;
 if RelayOutReversT7.AsBool = True then
     if RelayInReversT7.AsBool = False then
   begin
   LineForwardT7.Color := clRed;
   LineReversT7.Color := clRed;
   ImageT7.Color := clRed;
   StartTimeT7.Value := StartTimeT7.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT7.Value := False;
   StartTimeT7.Value := 0;
   StatusStartForwardT7.Value := 6;
   StatusT7.Value := 3;
   end;
   end;
 if RelayOutReversT7.AsBool = False then
     if RelayInReversT7.AsBool = False then
   begin
   LineForwardT7.Color := clRed;
   LineReversT7.Color := clRed;
   ImageT7.Color := clRed;
   StatusT7.Value := 4;
   StartTimeT7.Value := 0;
   end;
end;
end
else
StatusT7.Value := 10;
//Транспортер номер 7 конец
//Транспортер номер 8 начало
if StatusAlarmT8.AsBool = False then
begin
if RelayInReversT8.AsBool = False then
begin
 if RelayOutForwardT8.AsBool = True then
     if RelayInForwardT8.AsBool = True then
   begin
   LineReversT8.Color := clRed;
   LineForwardT8.Color := clGreen;
   ImageT8_1.Color := clGreen;
   ImageT8_2.Color := clGreen;
   StatusT8.Value := 1;
   StartTimeT8.Value := 0;
   end;
 if RelayOutForwardT8.AsBool = False then
     if RelayInForwardT8.AsBool = True then
   begin
   LineReversT8.Color := clRed;
   LineForwardT8.Color := clYellow;
   ImageT8_1.Color := clYellow;
   ImageT8_2.Color := clYellow;
   StatusT8.Value := 2;
   StartTimeT8.Value := 0;
   end;
 if RelayOutForwardT8.AsBool = True then
     if RelayInForwardT8.AsBool = False then
   begin
   LineReversT8.Color := clRed;
   LineForwardT8.Color := clRed;
   ImageT8_1.Color := clRed;
   ImageT8_2.Color := clRed;
   StartTimeT8.Value := StartTimeT8.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT8.Value := False;
   StartTimeT8.Value := 0;
   StatusStartForwardT8.Value := 6;
   StatusT8.Value := 3;
   end;
   end;
 if RelayOutForwardT8.AsBool = False then
     if RelayInForwardT8.AsBool = False then
   begin
   LineReversT8.Color := clRed;
   LineForwardT8.Color := clRed;
   ImageT8_1.Color := clRed;
   ImageT8_2.Color := clRed;
   StatusT8.Value := 4;
   StartTimeT8.Value := 0;
   end;
end;
end
else
StatusT8.Value := 10;

if StatusAlarmT8.AsBool = False then
begin
if RelayInForwardT8.AsBool = False then
begin
 if RelayOutReversT8.AsBool = True then
     if RelayInReversT8.AsBool = True then
   begin
   LineForwardT8.Color := clRed;
   LineReversT8.Color := clGreen;
   ImageT8_1.Color := clGreen;
   ImageT8_2.Color := clGreen;
   StatusT8.Value := 11;
   StartTimeT8.Value := 0;
   end;
 if RelayOutReversT8.AsBool = False then
     if RelayInReversT8.AsBool = True then
   begin
   LineForwardT8.Color := clRed;
   LineReversT8.Color := clYellow;
   ImageT8_1.Color := clYellow;
   ImageT8_2.Color := clYellow;
   StatusT8.Value := 12;
   StartTimeT8.Value := 0;
   end;
 if RelayOutReversT8.AsBool = True then
     if RelayInReversT8.AsBool = False then
   begin
   LineForwardT8.Color := clRed;
   LineReversT8.Color := clRed;
   ImageT8_1.Color := clRed;
   ImageT8_2.Color := clRed;
   StartTimeT8.Value := StartTimeT8.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT8.Value := False;
   StartTimeT8.Value := 0;
   StatusStartForwardT8.Value := 6;
   StatusT8.Value := 3;
   end;
   end;
 if RelayOutReversT8.AsBool = False then
     if RelayInReversT8.AsBool = False then
   begin
   LineForwardT8.Color := clRed;
   LineReversT8.Color := clRed;
   ImageT8_1.Color := clRed;
   ImageT8_2.Color := clRed;
   StatusT8.Value := 4;
   StartTimeT8.Value := 0;
   end;
end;
end
else
StatusT8.Value := 10;
//Транспортер номер 8 конец
//Транспортер номер 9 начало
if StatusAlarmT9.AsBool = False then
begin
if RelayInReversT9.AsBool = False then
begin
 if RelayOutForwardT9.AsBool = True then
     if RelayInForwardT9.AsBool = True then
   begin
   LineReversT9.Color := clRed;
   LineForwardT9.Color := clGreen;
   ImageT9_1.Color := clGreen;
   ImageT9_2.Color := clGreen;
   StatusT9.Value := 1;
   StartTimeT9.Value := 0;
   end;
 if RelayOutForwardT9.AsBool = False then
     if RelayInForwardT9.AsBool = True then
   begin
   LineReversT9.Color := clRed;
   LineForwardT9.Color := clYellow;
   ImageT9_1.Color := clYellow;
   ImageT9_2.Color := clYellow;
   StatusT9.Value := 2;
   StartTimeT9.Value := 0;
   end;
 if RelayOutForwardT9.AsBool = True then
     if RelayInForwardT9.AsBool = False then
   begin
   LineReversT9.Color := clRed;
   LineForwardT9.Color := clRed;
   ImageT9_1.Color := clRed;
   ImageT9_2.Color := clRed;
   StartTimeT9.Value := StartTimeT9.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT9.Value := False;
   StartTimeT9.Value := 0;
   StatusStartForwardT9.Value := 6;
   StatusT9.Value := 3;
   end;
   end;
 if RelayOutForwardT9.AsBool = False then
     if RelayInForwardT9.AsBool = False then
   begin
   LineReversT9.Color := clRed;
   LineForwardT9.Color := clRed;
   ImageT9_1.Color := clRed;
   ImageT9_2.Color := clRed;
   StatusT9.Value := 4;
   StartTimeT9.Value := 0;
   end;
end;
end
else
StatusT9.Value := 10;

if StatusAlarmT9.AsBool = False then
begin
if RelayInForwardT9.AsBool = False then
begin
 if RelayOutReversT9.AsBool = True then
     if RelayInReversT9.AsBool = True then
   begin
   LineForwardT9.Color := clRed;
   LineReversT9.Color := clGreen;
   ImageT9_1.Color := clGreen;
   ImageT9_2.Color := clGreen;
   StatusT9.Value := 11;
   StartTimeT9.Value := 0;
   end;
 if RelayOutReversT9.AsBool = False then
     if RelayInReversT9.AsBool = True then
   begin
   LineForwardT9.Color := clRed;
   LineReversT9.Color := clYellow;
   ImageT9_1.Color := clYellow;
   ImageT9_2.Color := clYellow;
   StatusT9.Value := 12;
   StartTimeT9.Value := 0;
   end;
 if RelayOutReversT9.AsBool = True then
     if RelayInReversT9.AsBool = False then
   begin
   LineForwardT9.Color := clRed;
   LineReversT9.Color := clRed;
   ImageT9_1.Color := clRed;
   ImageT9_2.Color := clRed;
   StartTimeT9.Value := StartTimeT9.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT9.Value := False;
   StartTimeT9.Value := 0;
   StatusStartForwardT9.Value := 6;
   StatusT9.Value := 3;
   end;
   end;
 if RelayOutReversT9.AsBool = False then
     if RelayInReversT9.AsBool = False then
   begin
   LineForwardT9.Color := clRed;
   LineReversT9.Color := clRed;
   ImageT9_1.Color := clRed;
   ImageT9_2.Color := clRed;
   StatusT9.Value := 4;
   StartTimeT9.Value := 0;
   end;
end;
end
else
StatusT9.Value := 10;
//Транспортер номер 9 конец
//Транспортер номер 10 начало
if StatusAlarmT10.AsBool = False then
begin
if RelayInReversT10.AsBool = False then
begin
 if RelayOutForwardT10.AsBool = True then
     if RelayInForwardT10.AsBool = True then
   begin
   LineReversT10.Color := clRed;
   LineForwardT10.Color := clGreen;
   ImageT10.Color := clGreen;
   StatusT10.Value := 1;
   StartTimeT10.Value := 0;
   end;
 if RelayOutForwardT10.AsBool = False then
     if RelayInForwardT10.AsBool = True then
   begin
   LineReversT10.Color := clRed;
   LineForwardT10.Color := clYellow;
   ImageT10.Color := clYellow;
   StatusT10.Value := 2;
   StartTimeT10.Value := 0;
   end;
 if RelayOutForwardT10.AsBool = True then
     if RelayInForwardT10.AsBool = False then
   begin
   LineReversT10.Color := clRed;
   LineForwardT10.Color := clRed;
   ImageT10.Color := clRed;
   StartTimeT10.Value := StartTimeT10.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT10.Value := False;
   StartTimeT10.Value := 0;
   StatusStartForwardT10.Value := 6;
   StatusT10.Value := 3;
   end;
   end;
 if RelayOutForwardT10.AsBool = False then
     if RelayInForwardT10.AsBool = False then
   begin
   LineReversT10.Color := clRed;
   LineForwardT10.Color := clRed;
   ImageT10.Color := clRed;
   StatusT10.Value := 4;
   StartTimeT10.Value := 0;
   end;
end;
end
else
StatusT10.Value := 10;

if StatusAlarmT10.AsBool = False then
begin
if RelayInForwardT10.AsBool = False then
begin
 if RelayOutReversT10.AsBool = True then
     if RelayInReversT10.AsBool = True then
   begin
   LineForwardT10.Color := clRed;
   LineReversT10.Color := clGreen;
   ImageT10.Color := clGreen;
   StatusT10.Value := 11;
   StartTimeT10.Value := 0;
   end;
 if RelayOutReversT10.AsBool = False then
     if RelayInReversT10.AsBool = True then
   begin
   LineForwardT10.Color := clRed;
   LineReversT10.Color := clYellow;
   ImageT10.Color := clYellow;
   StatusT10.Value := 12;
   StartTimeT10.Value := 0;
   end;
 if RelayOutReversT10.AsBool = True then
     if RelayInReversT10.AsBool = False then
   begin
   LineForwardT10.Color := clRed;
   LineReversT10.Color := clRed;
   ImageT10.Color := clRed;
   StartTimeT10.Value := StartTimeT10.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT10.Value := False;
   StartTimeT10.Value := 0;
   StatusStartForwardT10.Value := 6;
   StatusT10.Value := 3;
   end;
   end;
 if RelayOutReversT10.AsBool = False then
     if RelayInReversT10.AsBool = False then
   begin
   LineForwardT10.Color := clRed;
   LineReversT10.Color := clRed;
   ImageT10.Color := clRed;
   StatusT10.Value := 4;
   StartTimeT10.Value := 0;
   end;
end;
end
else
StatusT10.Value := 10;
//Транспортер номер 10 конец
//Транспортер номер 11 начало
if StatusAlarmT11.AsBool = False then
begin
if RelayInReversT11.AsBool = False then
begin
 if RelayOutForwardT11.AsBool = True then
     if RelayInForwardT11.AsBool = True then
   begin
   LineReversT11.Color := clRed;
   LineForwardT11.Color := clGreen;
   ImageT11.Color := clGreen;
   StatusT11.Value := 1;
   StartTimeT11.Value := 0;
   end;
 if RelayOutForwardT11.AsBool = False then
     if RelayInForwardT11.AsBool = True then
   begin
   LineReversT11.Color := clRed;
   LineForwardT11.Color := clYellow;
   ImageT11.Color := clYellow;
   StatusT11.Value := 2;
   StartTimeT11.Value := 0;
   end;
 if RelayOutForwardT11.AsBool = True then
     if RelayInForwardT11.AsBool = False then
   begin
   LineReversT11.Color := clRed;
   LineForwardT11.Color := clRed;
   ImageT11.Color := clRed;
   StartTimeT11.Value := StartTimeT11.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT11.Value := False;
   StartTimeT11.Value := 0;
   StatusStartForwardT11.Value := 6;
   StatusT11.Value := 3;
   end;
   end;
 if RelayOutForwardT11.AsBool = False then
     if RelayInForwardT11.AsBool = False then
   begin
   LineReversT11.Color := clRed;
   LineForwardT11.Color := clRed;
   ImageT11.Color := clRed;
   StatusT11.Value := 4;
   StartTimeT11.Value := 0;
   end;
end;
end
else
StatusT11.Value := 10;

if StatusAlarmT11.AsBool = False then
begin
if RelayInForwardT11.AsBool = False then
begin
 if RelayOutReversT11.AsBool = True then
     if RelayInReversT11.AsBool = True then
   begin
   LineForwardT11.Color := clRed;
   LineReversT11.Color := clGreen;
   ImageT11.Color := clGreen;
   StatusT11.Value := 11;
   StartTimeT11.Value := 0;
   end;
 if RelayOutReversT11.AsBool = False then
     if RelayInReversT11.AsBool = True then
   begin
   LineForwardT11.Color := clRed;
   LineReversT11.Color := clYellow;
   ImageT11.Color := clYellow;
   StatusT11.Value := 12;
   StartTimeT11.Value := 0;
   end;
 if RelayOutReversT11.AsBool = True then
     if RelayInReversT11.AsBool = False then
   begin
   LineForwardT11.Color := clRed;
   LineReversT11.Color := clRed;
   ImageT11.Color := clRed;
   StartTimeT11.Value := StartTimeT11.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT11.Value := False;
   StartTimeT11.Value := 0;
   StatusStartForwardT11.Value := 6;
   StatusT11.Value := 3;
   end;
   end;
 if RelayOutReversT11.AsBool = False then
     if RelayInReversT11.AsBool = False then
   begin
   LineForwardT11.Color := clRed;
   LineReversT11.Color := clRed;
   ImageT11.Color := clRed;
   StatusT11.Value := 4;
   StartTimeT11.Value := 0;
   end;
end;
end
else
StatusT11.Value := 10;
//Транспортер номер 11 конец
//Транспортер номер 12 начало
if StatusAlarmT12.AsBool = False then
begin
if RelayInReversT12.AsBool = False then
begin
 if RelayOutForwardT12.AsBool = True then
     if RelayInForwardT12.AsBool = True then
   begin
   T8aOutLine.Color := clGreen;
   ImageT12.Color := clGreen;
   StatusT12.Value := 1;
   StartTimeT12.Value := 0;
   end;
 if RelayOutForwardT12.AsBool = False then
     if RelayInForwardT12.AsBool = True then
   begin
   T8aOutLine.Color := clYellow;
   ImageT12.Color := clYellow;
   StatusT12.Value := 2;
   StartTimeT12.Value := 0;
   end;
 if RelayOutForwardT12.AsBool = True then
     if RelayInForwardT12.AsBool = False then
   begin
   T8aOutLine.Color := clRed;
   ImageT12.Color := clRed;
   StartTimeT12.Value := StartTimeT12.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT12.Value := False;
   StartTimeT12.Value := 0;
   StatusStartForwardT12.Value := 6;
   StatusT12.Value := 3;
   end;
   end;
 if RelayOutForwardT12.AsBool = False then
     if RelayInForwardT12.AsBool = False then
   begin
   T8aOutLine.Color := clRed;
   ImageT12.Color := clRed;
   StatusT12.Value := 4;
   StartTimeT12.Value := 0;
   end;
end;
end
else
StatusT12.Value := 10;

if StatusAlarmT12.AsBool = False then
begin
if RelayInForwardT12.AsBool = False then
begin
 if RelayOutReversT12.AsBool = True then
     if RelayInReversT12.AsBool = True then
   begin
   T8aOutLine.Color := clGreen;
   ImageT12.Color := clGreen;
   StatusT12.Value := 11;
   StartTimeT12.Value := 0;
   end;
 if RelayOutReversT12.AsBool = False then
     if RelayInReversT12.AsBool = True then
   begin
   T8aOutLine.Color := clYellow;
   ImageT12.Color := clYellow;
   StatusT12.Value := 12;
   StartTimeT12.Value := 0;
   end;
 if RelayOutReversT12.AsBool = True then
     if RelayInReversT12.AsBool = False then
   begin
   T8aOutLine.Color := clRed;
   ImageT12.Color := clRed;
   StartTimeT12.Value := StartTimeT12.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT12.Value := False;
   StartTimeT12.Value := 0;
   StatusStartForwardT12.Value := 6;
   StatusT12.Value := 3;
   end;
   end;
 if RelayOutReversT12.AsBool = False then
     if RelayInReversT12.AsBool = False then
   begin
   T8aOutLine.Color := clRed;
   ImageT12.Color := clRed;
   StatusT12.Value := 4;
   StartTimeT12.Value := 0;
   end;
end;
end
else
StatusT12.Value := 10;
//Транспортер номер 12 конец
//Транспортер номер 13 начало
if StatusAlarmT13.AsBool = False then
begin
if RelayInReversT13.AsBool = False then
begin
 if RelayOutForwardT13.AsBool = True then
     if RelayInForwardT13.AsBool = True then
   begin
   T17OutLine.Color := clGreen;
   ImageT13.Color := clGreen;
   StatusT13.Value := 1;
   StartTimeT13.Value := 0;
   end;
 if RelayOutForwardT13.AsBool = False then
     if RelayInForwardT13.AsBool = True then
   begin
   T17OutLine.Color := clYellow;
   ImageT13.Color := clYellow;
   StatusT13.Value := 2;
   StartTimeT13.Value := 0;
   end;
 if RelayOutForwardT13.AsBool = True then
     if RelayInForwardT13.AsBool = False then
   begin
   T17OutLine.Color := clRed;
   ImageT13.Color := clRed;
   StartTimeT13.Value := StartTimeT13.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT13.Value := False;
   StartTimeT13.Value := 0;
   StatusStartForwardT13.Value := 6;
   StatusT13.Value := 3;
   end;
   end;
 if RelayOutForwardT13.AsBool = False then
     if RelayInForwardT13.AsBool = False then
   begin
   T17OutLine.Color := clRed;
   ImageT13.Color := clRed;
   StatusT13.Value := 4;
   StartTimeT13.Value := 0;
   end;
end;
end
else
StatusT13.Value := 10;

if StatusAlarmT13.AsBool = False then
begin
if RelayInForwardT13.AsBool = False then
begin
 if RelayOutReversT13.AsBool = True then
     if RelayInReversT13.AsBool = True then
   begin
   T17OutLine.Color := clGreen;
   ImageT13.Color := clGreen;
   StatusT13.Value := 11;
   StartTimeT13.Value := 0;
   end;
 if RelayOutReversT13.AsBool = False then
     if RelayInReversT13.AsBool = True then
   begin
   T17OutLine.Color := clYellow;
   ImageT13.Color := clYellow;
   StatusT13.Value := 12;
   StartTimeT13.Value := 0;
   end;
 if RelayOutReversT13.AsBool = True then
     if RelayInReversT13.AsBool = False then
   begin
   T17OutLine.Color := clRed;
   ImageT13.Color := clRed;
   StartTimeT13.Value := StartTimeT13.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT13.Value := False;
   StartTimeT13.Value := 0;
   StatusStartForwardT13.Value := 6;
   StatusT13.Value := 3;
   end;
   end;
 if RelayOutReversT13.AsBool = False then
     if RelayInReversT13.AsBool = False then
   begin
   T17OutLine.Color := clRed;
   ImageT13.Color := clRed;
   StatusT13.Value := 4;
   StartTimeT13.Value := 0;
   end;
end;
end
else
StatusT13.Value := 10;
//Транспортер номер 13 конец
//Транспортер номер 14 начало
if StatusAlarmT14.AsBool = False then
begin
if RelayInReversT14.AsBool = False then
begin
 if RelayOutForwardT14.AsBool = True then
     if RelayInForwardT14.AsBool = True then
   begin
   T9aOutLine.Color := clGreen;
   ImageT14.Color := clGreen;
   StatusT14.Value := 1;
   StartTimeT14.Value := 0;
   end;
 if RelayOutForwardT14.AsBool = False then
     if RelayInForwardT14.AsBool = True then
   begin
   T9aOutLine.Color := clYellow;
   ImageT14.Color := clYellow;
   StatusT14.Value := 2;
   StartTimeT14.Value := 0;
   end;
 if RelayOutForwardT14.AsBool = True then
     if RelayInForwardT14.AsBool = False then
   begin
   T9aOutLine.Color := clRed;
   ImageT14.Color := clRed;
   StartTimeT14.Value := StartTimeT14.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT14.Value := False;
   StartTimeT14.Value := 0;
   StatusStartForwardT14.Value := 6;
   StatusT14.Value := 3;
   end;
   end;
 if RelayOutForwardT14.AsBool = False then
     if RelayInForwardT14.AsBool = False then
   begin
   T9aOutLine.Color := clRed;
   ImageT14.Color := clRed;
   StatusT14.Value := 4;
   StartTimeT14.Value := 0;
   end;
end;
end
else
StatusT14.Value := 10;

if StatusAlarmT14.AsBool = False then
begin
if RelayInForwardT14.AsBool = False then
begin
 if RelayOutReversT14.AsBool = True then
     if RelayInReversT14.AsBool = True then
   begin
   T9aOutLine.Color := clGreen;
   ImageT14.Color := clGreen;
   StatusT14.Value := 11;
   StartTimeT14.Value := 0;
   end;
 if RelayOutReversT14.AsBool = False then
     if RelayInReversT14.AsBool = True then
   begin
   T9aOutLine.Color := clYellow;
   ImageT14.Color := clYellow;
   StatusT14.Value := 12;
   StartTimeT14.Value := 0;
   end;
 if RelayOutReversT14.AsBool = True then
     if RelayInReversT14.AsBool = False then
   begin
   T9aOutLine.Color := clRed;
   ImageT14.Color := clRed;
   StartTimeT14.Value := StartTimeT14.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT14.Value := False;
   StartTimeT14.Value := 0;
   StatusStartForwardT14.Value := 6;
   StatusT14.Value := 3;
   end;
   end;
 if RelayOutReversT14.AsBool = False then
     if RelayInReversT14.AsBool = False then
   begin
   T9aOutLine.Color := clRed;
   ImageT14.Color := clRed;
   StatusT14.Value := 4;
   StartTimeT14.Value := 0;
   end;
end;
end
else
StatusT14.Value := 10;
//Транспортер номер 14 конец
//Транспортер номер 15 начало
if StatusAlarmT15.AsBool = False then
begin
if RelayInReversT15.AsBool = False then
begin
 if RelayOutForwardT15.AsBool = True then
     if RelayInForwardT15.AsBool = True then
   begin
   T17aOutLine.Color := clGreen;
   ImageT15.Color := clGreen;
   StatusT15.Value := 1;
   StartTimeT15.Value := 0;
   end;
 if RelayOutForwardT15.AsBool = False then
     if RelayInForwardT15.AsBool = True then
   begin
   T17aOutLine.Color := clYellow;
   ImageT15.Color := clYellow;
   StatusT15.Value := 2;
   StartTimeT15.Value := 0;
   end;
 if RelayOutForwardT15.AsBool = True then
     if RelayInForwardT15.AsBool = False then
   begin
   T17aOutLine.Color := clRed;
   ImageT15.Color := clRed;
   StartTimeT15.Value := StartTimeT15.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT15.Value := False;
   StartTimeT15.Value := 0;
   StatusStartForwardT15.Value := 6;
   StatusT15.Value := 3;
   end;
   end;
 if RelayOutForwardT15.AsBool = False then
     if RelayInForwardT15.AsBool = False then
   begin
   T17aOutLine.Color := clRed;
   ImageT15.Color := clRed;
   StatusT15.Value := 4;
   StartTimeT15.Value := 0;
   end;
end;
end
else
StatusT15.Value := 10;

if StatusAlarmT15.AsBool = False then
begin
if RelayInForwardT15.AsBool = False then
begin
 if RelayOutReversT15.AsBool = True then
     if RelayInReversT15.AsBool = True then
   begin
   T17aOutLine.Color := clGreen;
   ImageT15.Color := clGreen;
   StatusT15.Value := 11;
   StartTimeT15.Value := 0;
   end;
 if RelayOutReversT15.AsBool = False then
     if RelayInReversT15.AsBool = True then
   begin
   T17aOutLine.Color := clYellow;
   ImageT15.Color := clYellow;
   StatusT15.Value := 12;
   StartTimeT15.Value := 0;
   end;
 if RelayOutReversT15.AsBool = True then
     if RelayInReversT15.AsBool = False then
   begin
   T17aOutLine.Color := clRed;
   ImageT15.Color := clRed;
   StartTimeT15.Value := StartTimeT15.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT15.Value := False;
   StartTimeT15.Value := 0;
   StatusStartForwardT15.Value := 6;
   StatusT15.Value := 3;
   end;
   end;
 if RelayOutReversT15.AsBool = False then
     if RelayInReversT15.AsBool = False then
   begin
   T17aOutLine.Color := clRed;
   ImageT15.Color := clRed;
   StatusT15.Value := 4;
   StartTimeT15.Value := 0;
   end;
end;
end
else
StatusT15.Value := 10;
//Транспортер номер 15 конец
//Транспортер номер 16 начало
if StatusAlarmT16.AsBool = False then
begin
if RelayInReversT16.AsBool = False then
begin
 if RelayOutForwardT16.AsBool = True then
     if RelayInForwardT16.AsBool = True then
   begin
   T25OutLine.Color := clGreen;
   ImageT16.Color := clGreen;
   StatusT16.Value := 1;
   StartTimeT16.Value := 0;
   end;
 if RelayOutForwardT16.AsBool = False then
     if RelayInForwardT16.AsBool = True then
   begin
   T25OutLine.Color := clYellow;
   ImageT16.Color := clYellow;
   StatusT16.Value := 2;
   StartTimeT16.Value := 0;
   end;
 if RelayOutForwardT16.AsBool = True then
     if RelayInForwardT16.AsBool = False then
   begin
   T25OutLine.Color := clRed;
   ImageT16.Color := clRed;
   StartTimeT16.Value := StartTimeT16.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT16.Value := False;
   StartTimeT16.Value := 0;
   StatusStartForwardT16.Value := 6;
   StatusT16.Value := 3;
   end;
   end;
 if RelayOutForwardT16.AsBool = False then
     if RelayInForwardT16.AsBool = False then
   begin
   T25OutLine.Color := clRed;
   ImageT16.Color := clRed;
   StatusT16.Value := 4;
   StartTimeT16.Value := 0;
   end;
end;
end
else
StatusT16.Value := 10;

if StatusAlarmT16.AsBool = False then
begin
if RelayInForwardT16.AsBool = False then
begin
 if RelayOutReversT16.AsBool = True then
     if RelayInReversT16.AsBool = True then
   begin
   T25OutLine.Color := clGreen;
   ImageT16.Color := clGreen;
   StatusT16.Value := 11;
   StartTimeT16.Value := 0;
   end;
 if RelayOutReversT16.AsBool = False then
     if RelayInReversT16.AsBool = True then
   begin
   T25OutLine.Color := clYellow;
   ImageT16.Color := clYellow;
   StatusT16.Value := 12;
   StartTimeT16.Value := 0;
   end;
 if RelayOutReversT16.AsBool = True then
     if RelayInReversT16.AsBool = False then
   begin
   T25OutLine.Color := clRed;
   ImageT16.Color := clRed;
   StartTimeT16.Value := StartTimeT16.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT16.Value := False;
   StartTimeT16.Value := 0;
   StatusStartForwardT16.Value := 6;
   StatusT16.Value := 3;
   end;
   end;
 if RelayOutReversT16.AsBool = False then
     if RelayInReversT16.AsBool = False then
   begin
   T25OutLine.Color := clRed;
   ImageT16.Color := clRed;
   StatusT16.Value := 4;
   StartTimeT16.Value := 0;
   end;
end;
end
else
StatusT16.Value := 10;
//Транспортер номер 16 конец
//Транспортер номер 17 начало
if StatusAlarmT17.AsBool = False then
begin
if RelayInReversT17.AsBool = False then
begin
 if RelayOutForwardT17.AsBool = True then
     if RelayInForwardT17.AsBool = True then
   begin
   T24OutLine.Color := clGreen;
   ImageT17.Color := clGreen;
   StatusT17.Value := 1;
   StartTimeT17.Value := 0;
   end;
 if RelayOutForwardT17.AsBool = False then
     if RelayInForwardT17.AsBool = True then
   begin
   T24OutLine.Color := clYellow;
   ImageT17.Color := clYellow;
   StatusT17.Value := 2;
   StartTimeT17.Value := 0;
   end;
 if RelayOutForwardT17.AsBool = True then
     if RelayInForwardT17.AsBool = False then
   begin
   T24OutLine.Color := clRed;
   ImageT17.Color := clRed;
   StartTimeT17.Value := StartTimeT17.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT17.Value := False;
   StartTimeT17.Value := 0;
   StatusStartForwardT17.Value := 6;
   StatusT17.Value := 3;
   end;
   end;
 if RelayOutForwardT17.AsBool = False then
     if RelayInForwardT17.AsBool = False then
   begin
   T24OutLine.Color := clRed;
   ImageT17.Color := clRed;
   StatusT17.Value := 4;
   StartTimeT17.Value := 0;
   end;
end;
end
else
StatusT17.Value := 10;

if StatusAlarmT17.AsBool = False then
begin
if RelayInForwardT17.AsBool = False then
begin
 if RelayOutReversT17.AsBool = True then
     if RelayInReversT17.AsBool = True then
   begin
   T24OutLine.Color := clGreen;
   ImageT17.Color := clGreen;
   StatusT17.Value := 11;
   StartTimeT17.Value := 0;
   end;
 if RelayOutReversT17.AsBool = False then
     if RelayInReversT17.AsBool = True then
   begin
   T24OutLine.Color := clYellow;
   ImageT17.Color := clYellow;
   StatusT17.Value := 12;
   StartTimeT17.Value := 0;
   end;
 if RelayOutReversT17.AsBool = True then
     if RelayInReversT17.AsBool = False then
   begin
   T24OutLine.Color := clRed;
   ImageT17.Color := clRed;
   StartTimeT17.Value := StartTimeT17.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT17.Value := False;
   StartTimeT17.Value := 0;
   StatusStartForwardT17.Value := 6;
   StatusT17.Value := 3;
   end;
   end;
 if RelayOutReversT17.AsBool = False then
     if RelayInReversT17.AsBool = False then
   begin
   T24OutLine.Color := clRed;
   ImageT17.Color := clRed;
   StatusT17.Value := 4;
   StartTimeT17.Value := 0;
   end;
end;
end
else
StatusT17.Value := 10;
//Транспортер номер 17 конец
//Транспортер номер 18 начало
if StatusAlarmT18.AsBool = False then
begin
if RelayInReversT18.AsBool = False then
begin
 if RelayOutForwardT18.AsBool = True then
     if RelayInForwardT18.AsBool = True then
   begin
   T22OutLine.Color := clGreen;
   ImageT18.Color := clGreen;
   StatusT18.Value := 1;
   StartTimeT18.Value := 0;
   end;
 if RelayOutForwardT18.AsBool = False then
     if RelayInForwardT18.AsBool = True then
   begin
   T22OutLine.Color := clYellow;
   ImageT18.Color := clYellow;
   StatusT18.Value := 2;
   StartTimeT18.Value := 0;
   end;
 if RelayOutForwardT18.AsBool = True then
     if RelayInForwardT18.AsBool = False then
   begin
   T22OutLine.Color := clRed;
   ImageT18.Color := clRed;
   StartTimeT18.Value := StartTimeT18.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutForwardT18.Value := False;
   StartTimeT18.Value := 0;
   StatusStartForwardT18.Value := 6;
   StatusT18.Value := 3;
   end;
   end;
 if RelayOutForwardT18.AsBool = False then
     if RelayInForwardT18.AsBool = False then
   begin
   T22OutLine.Color := clRed;
   ImageT18.Color := clRed;
   StatusT18.Value := 4;
   StartTimeT18.Value := 0;
   end;
end;
end
else
StatusT18.Value := 10;

if StatusAlarmT18.AsBool = False then
begin
if RelayInForwardT18.AsBool = False then
begin
 if RelayOutReversT18.AsBool = True then
     if RelayInReversT18.AsBool = True then
   begin
   T22OutLine.Color := clGreen;
   ImageT18.Color := clGreen;
   StatusT18.Value := 11;
   StartTimeT18.Value := 0;
   end;
 if RelayOutReversT18.AsBool = False then
     if RelayInReversT18.AsBool = True then
   begin
   T22OutLine.Color := clYellow;
   ImageT18.Color := clYellow;
   StatusT18.Value := 12;
   StartTimeT18.Value := 0;
   end;
 if RelayOutReversT18.AsBool = True then
     if RelayInReversT18.AsBool = False then
   begin
   T22OutLine.Color := clRed;
   ImageT18.Color := clRed;
   StartTimeT18.Value := StartTimeT18.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutReversT18.Value := False;
   StartTimeT18.Value := 0;
   StatusStartForwardT18.Value := 6;
   StatusT18.Value := 3;
   end;
   end;
 if RelayOutReversT18.AsBool = False then
     if RelayInReversT18.AsBool = False then
   begin
   T22OutLine.Color := clRed;
   ImageT18.Color := clRed;
   StatusT18.Value := 4;
   StartTimeT18.Value := 0;
   end;
end;
end
else
StatusT18.Value := 10;
//Транспортер номер 18 конец
end;
//Мембранные датчики транспортеров начало

if MembSensorAT1.AsBool = True then
begin
MembSensAT1Image.Color := clRed;
end;
if MembSensorAT1.AsBool = False then
begin
MembSensAT1Image.Color := clGreen;
end;

if MembSensorAT2.AsBool = True then
begin
MembSensAT2Image.Color := clRed;
end;
if MembSensorAT2.AsBool = False then
begin
MembSensAT2Image.Color := clGreen;
end;

if MembSensorAT3.AsBool = True then
begin
MembSensAT3Image.Color := clRed;
end;
if MembSensorAT3.AsBool = False then
begin
MembSensAT3Image.Color := clGreen;
end;

if MembSensorAT4.AsBool = True then
begin
MembSensAT4Image.Color := clGreen;
end;
if MembSensorAT4.AsBool = False then
begin
MembSensAT4Image.Color := clRed;
end;
if MembSensorBT4.AsBool = True then
begin
MembSensBT4Image.Color := clGreen;
end;
if MembSensorBT4.AsBool = False then
begin
MembSensBT4Image.Color := clRed;
end;

if MembSensorAT5.AsBool = True then
begin
MembSensAT5Image.Color := clGreen;
end;
if MembSensorAT5.AsBool = False then
begin
MembSensAT5Image.Color := clRed;
end;
if MembSensorBT5.AsBool = True then
begin
MembSensBT5Image.Color := clGreen;
end;
if MembSensorBT5.AsBool = False then
begin
MembSensBT5Image.Color := clRed;
end;

if MembSensorAT6.AsBool = True then
begin
MembSensAT6Image.Color := clGreen;
end;
if MembSensorAT6.AsBool = False then
begin
MembSensAT6Image.Color := clRed;
end;
if MembSensorBT6.AsBool = True then
begin
MembSensBT6Image.Color := clGreen;
end;
if MembSensorBT6.AsBool = False then
begin
MembSensBT6Image.Color := clRed;
end;

if MembSensorAT7.AsBool = True then
begin
MembSensAT7Image.Color := clGreen;
end;
if MembSensorAT7.AsBool = False then
begin
MembSensAT7Image.Color := clRed;
end;
if MembSensorBT7.AsBool = True then
begin
MembSensBT7Image.Color := clGreen;
end;
if MembSensorBT7.AsBool = False then
begin
MembSensBT7Image.Color := clRed;
end;
//Мембранные датчики транспортеров конец
/////////////////////////////////////////////////////ТРАНСПОРТЕРЫ конец///////////////////////////////////////////////
end.
