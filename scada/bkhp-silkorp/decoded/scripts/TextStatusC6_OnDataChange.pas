begin
if StatusC6.Asint = 1 then
   begin
   TextStatusC6.Color := clGreen;
   TextStatusC6.Text := 'В работе(А)';
   end;
if StatusC6.Asint = 2 then
   begin
   TextStatusC6.Color := clYellow;
   TextStatusC6.Text := 'В работе(М)';
   end;
if StatusC6.Asint = 3 then
   begin
   TextStatusC6.Color := clRed;
   TextStatusC6.Text := 'Стоп (М)';
   end;
if StatusC6.Asint = 4 then
   begin
   TextStatusC6.Color := clRed;
   TextStatusC6.Text := 'Стоп (А)';
   end;
end.
