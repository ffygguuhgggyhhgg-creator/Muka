begin
if StatusC5.Asint = 1 then
   begin
   TextStatusC5.Color := clGreen;
   TextStatusC5.Text := 'В работе(А)';
   end;
if StatusC5.Asint = 2 then
   begin
   TextStatusC5.Color := clYellow;
   TextStatusC5.Text := 'В работе(М)';
   end;
if StatusC5.Asint = 3 then
   begin
   TextStatusC5.Color := clRed;
   TextStatusC5.Text := 'Стоп (М)';
   end;
if StatusC5.Asint = 4 then
   begin
   TextStatusC5.Color := clRed;
   TextStatusC5.Text := 'Стоп (А)';
   end;
end.
