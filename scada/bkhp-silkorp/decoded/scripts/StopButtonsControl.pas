begin
if PingPLC16Flor.AsBool = True then //Если установлена связь с контроллером
begin
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////НОРИИ начало///////////////////////////////////////////////////////
//Нория 1 начало
if StatusN1.Value = 1 then
begin
 if RelayStopInN1.AsBool = False then
   begin
   RelayOutN1.Value := False;
   StatusStartN1.Value := 16;
   end;
end;
//Нория 1 конец
//Нория 2 начало
if StatusN2.Value = 1 then
begin
 if RelayStopInN2.AsBool = False then
   begin
   RelayOutN2.Value := False;
   StatusStartN2.Value := 16;
   end;
end;
//Нория 2 конец
//Нория 3 начало
if StatusN3.Value = 1 then
begin
 if RelayStopInN3.AsBool = False then
   begin
   RelayOutN3.Value := False;
   StatusStartN3.Value := 16;
   end;
end;
//Нория 3 конец
//Нория 4 начало
if StatusN4.Value = 1 then
begin
 if RelayStopInN4.AsBool = False then
   begin
   RelayOutN4.Value := False;
   StatusStartN4.Value := 16;
   end;
end;
//Нория 4 конец
//Нория 5 начало
if StatusN5.Value = 1 then
begin
 if RelayStopInN5.AsBool = False then
   begin
   RelayOutN5.Value := False;
   StatusStartN5.Value := 16;
   end;
end;
//Нория 5 конец
//Нория 6 начало
if StatusN6.Value = 1 then
begin
 if RelayStopInN6.AsBool = False then
   begin
   RelayOutN6.Value := False;
   StatusStartN6.Value := 16;
   end;
end;
//Нория 6 конец
//Нория 7 начало
if StatusN7.Value = 1 then
begin
 if RelayStopInN7.AsBool = False then
   begin
   RelayOutN7.Value := False;
   StatusStartN7.Value := 16;
   end;
end;
//Нория 7 конец
//Нория 8 начало
if StatusN8.Value = 1 then
begin
 if RelayStopInN8.AsBool = False then
   begin
   RelayOutN8.Value := False;
   StatusStartN8.Value := 16;
   end;
end;
//Нория 8 конец
//Нория 9 начало
if StatusN9.Value = 1 then
begin
 if RelayStopInN9.AsBool = False then
   begin
   RelayOutN9.Value := False;
   StatusStartN9.Value := 16;
   end;
end;
//Нория 9 конец
//////////////////////////////////////////////////////////НОРИИ конец///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////АСПИРАЦИЯ начало//////////////////////////////////////////////////
//Аспирация 1 начало
if StatusC1.Value = 1 then
begin
 if RelayStopInC1.AsBool = False then
   begin
   RelayOutC1.Value := False;
   StatusStartC1.Value := 16;
   end;
end;
//Аспирация 1 конец
//Аспирация 2 начало
if StatusC2.Value = 1 then
begin
 if RelayStopInC2.AsBool = False then
   begin
   RelayOutC2.Value := False;
   StatusStartC2.Value := 16;
   end;
end;
//Аспирация 2 конец
//Аспирация 3 начало
if StatusC3.Value = 1 then
begin
 if RelayStopInC3.AsBool = False then
   begin
   RelayOutC3.Value := False;
   StatusStartC3.Value := 16;
   end;
end;
//Аспирация 3 конец
//Аспирация 4 начало
if StatusC4.Value = 1 then
begin
 if RelayStopInC4.AsBool = False then
   begin
   RelayOutC4.Value := False;
   StatusStartC4.Value := 16;
   end;
end;
//Аспирация 4 конец
//Аспирация 5 начало
if StatusC5.Value = 1 then
begin
 if RelayStopInC5.AsBool = False then
   begin
   RelayOutC5.Value := False;
   StatusStartC5.Value := 16;
   end;
end;
//Аспирация 5 конец
//Аспирация 6 начало
if StatusC6.Value = 1 then
begin
 if RelayStopInC6.AsBool = False then
   begin
   RelayOutC6.Value := False;
   StatusStartC6.Value := 16;
   end;
end;
//Аспирация 6 конец
//Аспирация 7 начало
if StatusC7.Value = 1 then
begin
 if RelayStopInC7.AsBool = False then
   begin
   RelayOutC7.Value := False;
   StatusStartC7.Value := 16;
   end;
end;
//Аспирация 7 конец
//Аспирация 8 начало
if StatusC8.Value = 1 then
begin
 if RelayStopInC8.AsBool = False then
   begin
   RelayOutC8.Value := False;
   StatusStartC8.Value := 16;
   end;
end;
//Аспирация 8 конец
//Аспирация 9 начало
if StatusC9.Value = 1 then
begin
 if RelayStopInC9.AsBool = False then
   begin
   RelayOutC9.Value := False;
   StatusStartC9.Value := 16;
   end;
end;
//Аспирация 9 конец
//Аспирация 10 начало
if StatusC10.Value = 1 then
begin
 if RelayStopInC10.AsBool = False then
   begin
   RelayOutC10.Value := False;
   StatusStartC10.Value := 16;
   end;
end;
//Аспирация 10 конец
//Аспирация 11 начало
if StatusC11.Value = 1 then
begin
 if RelayStopInC11.AsBool = False then
   begin
   RelayOutC11.Value := False;
   StatusStartC11.Value := 16;
   end;                                  
end;
//Аспирация 11 конец
//Аспирация 12 начало
if StatusC12.Value = 1 then
begin
 if RelayStopInC12.AsBool = False then
   begin
   RelayOutC12.Value := False;
   StatusStartC12.Value := 16;
   end;
end;
//Аспирация 12 конец
//////////////////////////////////////////////////////////АСПИРАЦИЯ конец//////////////////////////////////////////////////
//////////////////////////////////////////////////////////ТРАНСПОРТЕРЫ начало///////////////////////////////////////////////
//////////////////////////////////////////////////////////ТРАНСПОРТЕРЫ конец///////////////////////////////////////////////
//Транспортер 1 начало
begin
 if RelayStopInT1.AsBool = False then
   begin
   RelayOutForwardT1.Value := False;
   RelayOutReversT1.Value := False;
   StatusStartForwardT1.Value := 16;
   StatusStartReversT1.Value := 16;
   end;
end;
//Транспортер 1 конец
//Транспортер 2 начало
begin
 if RelayStopInT2.AsBool = False then
   begin
   RelayOutForwardT2.Value := False;
   RelayOutReversT2.Value := False;
   StatusStartForwardT2.Value := 16;
   StatusStartReversT2.Value := 16;
   end;
end;
//Транспортер 2 конец
//Транспортер 3 начало
begin
 if RelayStopInT3.AsBool = False then
   begin
   RelayOutForwardT3.Value := False;
   RelayOutReversT3.Value := False;
   StatusStartForwardT3.Value := 16;
   StatusStartReversT3.Value := 16;
   end;
end;
//Транспортер 3 конец
//Транспортер 4 начало
begin
 if RelayStopInT4.AsBool = False then
   begin
   RelayOutForwardT4.Value := False;
   RelayOutReversT4.Value := False;
   StatusStartForwardT4.Value := 16;
   StatusStartReversT4.Value := 16;
   end;
end;
//Транспортер 4 конец
//Транспортер 5 начало
begin
 if RelayStopInT5.AsBool = False then
   begin
   RelayOutForwardT5.Value := False;
   RelayOutReversT5.Value := False;
   StatusStartForwardT5.Value := 16;
   StatusStartReversT5.Value := 16;
   end;
end;
//Транспортер 5 конец
//Транспортер 6 начало
begin
 if RelayStopInT6.AsBool = False then
   begin
   RelayOutForwardT6.Value := False;
   RelayOutReversT6.Value := False;
   StatusStartForwardT6.Value := 16;
   StatusStartReversT6.Value := 16;
   end;
end;
//Транспортер 6 конец
//Транспортер 7 начало
begin
 if RelayStopInT7.AsBool = False then
   begin
   RelayOutForwardT7.Value := False;
   RelayOutReversT7.Value := False;
   StatusStartForwardT7.Value := 16;
   StatusStartReversT7.Value := 16;
   end;
end;
//Транспортер 7 конец
//Транспортер 8 начало
begin
 if RelayStopInT8.AsBool = False then
   begin
   RelayOutForwardT8.Value := False;
   RelayOutReversT8.Value := False;
   StatusStartForwardT8.Value := 16;
   StatusStartReversT8.Value := 16;
   end;
end;
//Транспортер 8 конец
//Транспортер 9 начало
begin
 if RelayStopInT9.AsBool = False then
   begin
   RelayOutForwardT9.Value := False;
   RelayOutReversT9.Value := False;
   StatusStartForwardT9.Value := 16;
   StatusStartReversT9.Value := 16;
   end;
end;
//Транспортер 9 конец
//Транспортер 10 начало
begin
 if RelayStopInT10.AsBool = False then
   begin
   RelayOutForwardT10.Value := False;
   RelayOutReversT10.Value := False;
   StatusStartForwardT10.Value := 16;
   StatusStartReversT10.Value := 16;
   end;
end;
//Транспортер 10 конец
//Транспортер 11 начало
begin
 if RelayStopInT11.AsBool = False then
   begin
   RelayOutForwardT11.Value := False;
   RelayOutReversT11.Value := False;
   StatusStartForwardT11.Value := 16;
   StatusStartReversT11.Value := 16;
   end;
end;
//Транспортер 11 конец
//Транспортер 12 начало
begin
 if RelayStopInT12.AsBool = False then
   begin
   RelayOutForwardT12.Value := False;
   RelayOutReversT12.Value := False;
   StatusStartForwardT12.Value := 16;
   StatusStartReversT12.Value := 16;
   end;
end;
//Транспортер 12 конец
//Транспортер 13 начало
begin
 if RelayStopInT13.AsBool = False then
   begin
   RelayOutForwardT13.Value := False;
   RelayOutReversT13.Value := False;
   StatusStartForwardT13.Value := 16;
   StatusStartReversT13.Value := 16;
   end;
end;
//Транспортер 13 конец
//Транспортер 14 начало
begin
 if RelayStopInT14.AsBool = False then
   begin
   RelayOutForwardT14.Value := False;
   RelayOutReversT14.Value := False;
   StatusStartForwardT14.Value := 16;
   StatusStartReversT14.Value := 16;
   end;
end;
//Транспортер 14 конец
//Транспортер 15 начало
begin
 if RelayStopInT15.AsBool = False then
   begin
   RelayOutForwardT15.Value := False;
   RelayOutReversT15.Value := False;
   StatusStartForwardT15.Value := 16;
   StatusStartReversT15.Value := 16;
   end;
end;
//Транспортер 15 конец
//Транспортер 16 начало
begin
 if RelayStopInT16.AsBool = False then
   begin
   RelayOutForwardT16.Value := False;
   RelayOutReversT16.Value := False;
   StatusStartForwardT16.Value := 16;
   StatusStartReversT16.Value := 16;
   end;
end;
//Транспортер 16 конец
//Транспортер 17 начало
begin                                                           
 if RelayStopInT17.AsBool = False then
   begin
   RelayOutForwardT17.Value := False;
   RelayOutReversT17.Value := False;
   StatusStartForwardT17.Value := 16;
   StatusStartReversT17.Value := 16;
   end;
end;
//Транспортер 17 конец
//Транспортер 18 начало
begin
 if RelayStopInT18.AsBool = False then
   begin
   RelayOutForwardT18.Value := False;
   RelayOutReversT18.Value := False;
   StatusStartForwardT18.Value := 16;
   StatusStartReversT18.Value := 16;
   end;
end;
//Транспортер 18 конец
end;
end.
