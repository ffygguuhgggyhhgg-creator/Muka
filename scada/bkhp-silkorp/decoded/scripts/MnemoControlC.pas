begin
if PingPLC16Flor.AsBool = True then //Если установлена связь с контроллером
begin
/////////////////////////////////////////////////////АСПИРАЦИЯ начало///////////////////////////////////////////////////
//Аспирация номер 1 начало
 if RelayOutC1.AsBool = True then
     if RelayInC1.AsBool = True then
   begin
   ImageC1.Color := clGreen;
   StatusC1.Value := 1;
   StartTimeC1.Value := 0;
   end;
 if RelayOutC1.AsBool = False then
     if RelayInC1.AsBool = True then
   begin
   ImageC1.Color := clYellow;
   StatusC1.Value := 2;
   StartTimeC1.Value := 0;
   end;
 if RelayOutC1.AsBool = True then
     if RelayInC1.AsBool = False then
   begin
   ImageC1.Color := clRed;
   StartTimeC1.Value := StartTimeC1.Value + 1;
   if StartTimeC1.Value > 3 then
   begin
   RelayOutC1.Value := False;
   StartTimeC1.Value := 0;
   StatusStartC1.Value := 6;
   StatusC1.Value := 3;
   end;
   end;
 if RelayOutC1.AsBool = False then
     if RelayInC1.AsBool = False then
   begin
   ImageC1.Color := clRed;
   StatusC1.Value := 4;
   StartTimeC1.Value := 0;
   end;
//Аспирация номер 1 конец
//Аспирация номер 2 начало
 if RelayOutC2.AsBool = True then
     if RelayInC2.AsBool = True then
   begin
   ImageC2.Color := clGreen;
   StatusC2.Value := 1;
   StartTimeC2.Value := 0;
   end;
 if RelayOutC2.AsBool = False then
     if RelayInC2.AsBool = True then
   begin
   ImageC2.Color := clYellow;
   StatusC2.Value := 2;
   StartTimeC2.Value := 0;
   end;
 if RelayOutC2.AsBool = True then
     if RelayInC2.AsBool = False then
   begin
   ImageC2.Color := clRed;
   StartTimeC2.Value := StartTimeC2.Value + 1;
   if StartTimeC2.Value > 3 then
   begin
   RelayOutC2.Value := False;
   StartTimeC2.Value := 0;
   StatusStartC2.Value := 6;
   StatusC2.Value := 3;
   end;
   end;
 if RelayOutC2.AsBool = False then
     if RelayInC2.AsBool = False then
   begin
   ImageC2.Color := clRed;
   StatusC2.Value := 4;
   StartTimeC2.Value := 0;
   end;
//Аспирация номер 2 конец
//Аспирация номер 3 начало
 if RelayOutC3.AsBool = True then
     if RelayInC3.AsBool = True then
   begin
   ImageC3.Color := clGreen;
   StatusC3.Value := 1;
   StartTimeC3.Value := 0;
   end;
 if RelayOutC3.AsBool = False then
     if RelayInC3.AsBool = True then
   begin
   ImageC3.Color := clYellow;
   StatusC3.Value := 2;
   StartTimeC3.Value := 0;
   end;
 if RelayOutC3.AsBool = True then
     if RelayInC3.AsBool = False then
   begin
   ImageC3.Color := clRed;
   StartTimeC3.Value := StartTimeC3.Value + 1;
   if StartTimeC3.Value > 3 then
   begin
   RelayOutC3.Value := False;
   StartTimeC3.Value := 0;
   StatusStartC3.Value := 6;
   StatusC3.Value := 3;
   end;
   end;
 if RelayOutC3.AsBool = False then
     if RelayInC3.AsBool = False then
   begin
   ImageC3.Color := clRed;
   StatusC3.Value := 4;
   StartTimeC3.Value := 0;
   end;
//Аспирация номер 3 конец
//Аспирация номер 4 начало
 if RelayOutC4.AsBool = True then
     if RelayInC4.AsBool = True then
   begin
   ImageC4.Color := clGreen;
   StatusC4.Value := 1;
   StartTimeC4.Value := 0;
   end;
 if RelayOutC4.AsBool = False then
     if RelayInC4.AsBool = True then
   begin
   ImageC4.Color := clYellow;
   StatusC4.Value := 2;
   StartTimeC4.Value := 0;
   end;
 if RelayOutC4.AsBool = True then
     if RelayInC4.AsBool = False then
   begin
   ImageC4.Color := clRed;
   StartTimeC4.Value := StartTimeC4.Value + 1;
   if StartTimeC4.Value > 3 then
   begin
   RelayOutC4.Value := False;
   StartTimeC4.Value := 0;
   StatusStartC4.Value := 6;
   StatusC4.Value := 3;
   end;
   end;
 if RelayOutC4.AsBool = False then
     if RelayInC4.AsBool = False then
   begin
   ImageC4.Color := clRed;
   StatusC4.Value := 4;
   StartTimeC4.Value := 0;
   end;
//Аспирация номер 4 конец
//Аспирация номер 5 начало
 if RelayOutC5.AsBool = True then
     if RelayInC5.AsBool = True then
   begin
   ImageC5.Color := clGreen;
   StatusC5.Value := 1;
   StartTimeC5.Value := 0;
   end;
 if RelayOutC5.AsBool = False then
     if RelayInC5.AsBool = True then
   begin
   ImageC5.Color := clYellow;
   StatusC5.Value := 2;
   StartTimeC5.Value := 0;
   end;
 if RelayOutC5.AsBool = True then
     if RelayInC5.AsBool = False then
   begin
   ImageC5.Color := clRed;
   StartTimeC5.Value := StartTimeC5.Value + 1;
   if StartTimeC5.Value > 3 then
   begin
   RelayOutC5.Value := False;
   StartTimeC5.Value := 0;
   StatusStartC5.Value := 6;
   StatusC5.Value := 3;
   end;
   end;
 if RelayOutC5.AsBool = False then
     if RelayInC5.AsBool = False then
   begin
   ImageC5.Color := clRed;
   StatusC5.Value := 4;
   StartTimeC5.Value := 0;
   end;
//Аспирация номер 5 конец
//Аспирация номер 6 начало
 if RelayOutC6.AsBool = True then
     if RelayInC6.AsBool = True then
   begin
   ImageC6.Color := clGreen;
   StatusC6.Value := 1;
   StartTimeC6.Value := 0;
   end;
 if RelayOutC6.AsBool = False then
     if RelayInC6.AsBool = True then
   begin
   ImageC6.Color := clYellow;
   StatusC6.Value := 2;
   StartTimeC6.Value := 0;
   end;
 if RelayOutC6.AsBool = True then
     if RelayInC6.AsBool = False then
   begin
   ImageC6.Color := clRed;
   StartTimeC6.Value := StartTimeC6.Value + 1;
   if StartTimeC6.Value > 3 then
   begin
   RelayOutC6.Value := False;
   StartTimeC6.Value := 0;
   StatusStartC6.Value := 6;
   StatusC6.Value := 3;
   end;
   end;
 if RelayOutC6.AsBool = False then
     if RelayInC6.AsBool = False then
   begin
   ImageC6.Color := clRed;
   StatusC6.Value := 4;
   StartTimeC6.Value := 0;
   end;
//Аспирация номер 6 конец
//Аспирация номер 7 начало
 if RelayOutC7.AsBool = True then
     if RelayInC7.AsBool = True then
   begin
   ImageC7.Color := clGreen;
   StatusC7.Value := 1;
   StartTimeC7.Value := 0;
   end;
 if RelayOutC7.AsBool = False then
     if RelayInC7.AsBool = True then
   begin
   ImageC7.Color := clYellow;
   StatusC7.Value := 2;
   StartTimeC7.Value := 0;
   end;
 if RelayOutC7.AsBool = True then
     if RelayInC7.AsBool = False then
   begin
   ImageC7.Color := clRed;
   StartTimeC7.Value := StartTimeC7.Value + 1;
   if StartTimeC7.Value > 3 then
   begin
   RelayOutC7.Value := False;
   StartTimeC7.Value := 0;
   StatusStartC7.Value := 6;
   StatusC7.Value := 3;
   end;
   end;
 if RelayOutC7.AsBool = False then
     if RelayInC7.AsBool = False then
   begin
   ImageC7.Color := clRed;
   StatusC7.Value := 4;
   StartTimeC7.Value := 0;
   end;
//Аспирация номер 7 конец
//Аспирация номер 8 начало
 if RelayOutC8.AsBool = True then
     if RelayInC8.AsBool = True then
   begin
   ImageC8.Color := clGreen;
   StatusC8.Value := 1;
   StartTimeC8.Value := 0;
   end;
 if RelayOutC8.AsBool = False then
     if RelayInC8.AsBool = True then
   begin
   ImageC8.Color := clYellow;
   StatusC8.Value := 2;
   StartTimeC8.Value := 0;
   end;
 if RelayOutC8.AsBool = True then
     if RelayInC8.AsBool = False then
   begin
   ImageC8.Color := clRed;
   StartTimeC8.Value := StartTimeC8.Value + 1;
   if StartTimeC8.Value > 3 then
   begin
   RelayOutC8.Value := False;
   StartTimeC8.Value := 0;
   StatusStartC8.Value := 6;
   StatusC8.Value := 3;
   end;
   end;
 if RelayOutC8.AsBool = False then
     if RelayInC8.AsBool = False then
   begin
   ImageC8.Color := clRed;
   StatusC8.Value := 4;
   StartTimeC8.Value := 0;
   end;
//Аспирация номер 8 конец
//Аспирация номер 9 начало
 if RelayOutC9.AsBool = True then
     if RelayInC9.AsBool = True then
   begin
   ImageC9.Color := clGreen;
   StatusC9.Value := 1;
   StartTimeC9.Value := 0;
   end;
 if RelayOutC9.AsBool = False then
     if RelayInC9.AsBool = True then
   begin
   ImageC9.Color := clYellow;
   StatusC9.Value := 2;
   StartTimeC9.Value := 0;
   end;
 if RelayOutC9.AsBool = True then
     if RelayInC9.AsBool = False then
   begin
   ImageC9.Color := clRed;
   StartTimeC9.Value := StartTimeC9.Value + 1;
   if StartTimeC9.Value > 3 then
   begin
   RelayOutC9.Value := False;
   StartTimeC9.Value := 0;
   StatusStartC9.Value := 6;
   StatusC9.Value := 3;
   end;
   end;
 if RelayOutC9.AsBool = False then
     if RelayInC9.AsBool = False then
   begin
   ImageC9.Color := clRed;
   StatusC9.Value := 4;
   StartTimeC9.Value := 0;
   end;
//Аспирация номер 9 конец
//Аспирация номер 10 начало
 if RelayOutC10.AsBool = True then
     if RelayInC10.AsBool = True then
   begin
   ImageC10.Color := clGreen;
   StatusC10.Value := 1;
   StartTimeC10.Value := 0;
   end;
 if RelayOutC10.AsBool = False then
     if RelayInC10.AsBool = True then
   begin
   ImageC10.Color := clYellow;
   StatusC10.Value := 2;
   StartTimeC10.Value := 0;
   end;
 if RelayOutC10.AsBool = True then
     if RelayInC10.AsBool = False then
   begin
   ImageC10.Color := clRed;
   StartTimeC10.Value := StartTimeC10.Value + 1;
   if StartTimeC10.Value > 3 then
   begin
   RelayOutC10.Value := False;
   StartTimeC10.Value := 0;
   StatusStartC10.Value := 6;
   StatusC10.Value := 3;
   end;
   end;
 if RelayOutC10.AsBool = False then
     if RelayInC10.AsBool = False then
   begin
   ImageC10.Color := clRed;
   StatusC10.Value := 4;
   StartTimeC10.Value := 0;
   end;
//Аспирация номер 10 конец
//Аспирация номер 11 начало
 if RelayOutC11.AsBool = True then
     if RelayInC11.AsBool = True then
   begin
   ImageC11.Color := clGreen;
   StatusC11.Value := 1;
   StartTimeC11.Value := 0;
   end;
 if RelayOutC11.AsBool = False then
     if RelayInC11.AsBool = True then
   begin
   ImageC11.Color := clYellow;
   StatusC11.Value := 2;
   StartTimeC11.Value := 0;
   end;
 if RelayOutC11.AsBool = True then
     if RelayInC11.AsBool = False then
   begin
   ImageC11.Color := clRed;
   StartTimeC11.Value := StartTimeC11.Value + 1;
   if StartTimeC11.Value > 3 then
   begin
   RelayOutC11.Value := False;
   StartTimeC11.Value := 0;
   StatusStartC11.Value := 6;
   StatusC11.Value := 3;
   end;
   end;
 if RelayOutC11.AsBool = False then
     if RelayInC11.AsBool = False then
   begin
   ImageC11.Color := clRed;
   StatusC11.Value := 4;
   StartTimeC11.Value := 0;
   end;
//Аспирация номер 11 конец
//Аспирация номер 12 начало
 if RelayOutC12.AsBool = True then
     if RelayInC12.AsBool = True then
   begin
   ImageC12.Color := clGreen;
   StatusC12.Value := 1;
   StartTimeC12.Value := 0;
   end;
 if RelayOutC12.AsBool = False then
     if RelayInC12.AsBool = True then
   begin
   ImageC12.Color := clYellow;
   StatusC12.Value := 2;
   StartTimeC12.Value := 0;
   end;
 if RelayOutC12.AsBool = True then
     if RelayInC12.AsBool = False then
   begin
   ImageC12.Color := clRed;
   StartTimeC12.Value := StartTimeC12.Value + 1;
   if StartTimeC12.Value > 3 then
   begin
   RelayOutC12.Value := False;
   StartTimeC12.Value := 0;
   StatusStartC12.Value := 6;
   StatusC12.Value := 3;
   end;
   end;
 if RelayOutC12.AsBool = False then
     if RelayInC12.AsBool = False then
   begin
   ImageC12.Color := clRed;
   StatusC12.Value := 4;
   StartTimeC12.Value := 0;
   end;
//Аспирация номер 12 конец
/////////////////////////////////////////////////////АСПИРАЦИЯ конец///////////////////////////////////////////////
end;
end.
