begin
if StatusC9.Asint = 1 then
   begin
   TextStatusC9.Color := clGreen;
   TextStatusC9.Text := 'В работе(А)';
   end;
if StatusC9.Asint = 2 then
   begin
   TextStatusC9.Color := clYellow;
   TextStatusC9.Text := 'В работе(М)';
   end;
if StatusC9.Asint = 3 then
   begin
   TextStatusC9.Color := clRed;
   TextStatusC9.Text := 'Стоп (М)';
   end;
if StatusC9.Asint = 4 then
   begin
   TextStatusC9.Color := clRed;
   TextStatusC9.Text := 'Стоп (А)';
   end;
end.
