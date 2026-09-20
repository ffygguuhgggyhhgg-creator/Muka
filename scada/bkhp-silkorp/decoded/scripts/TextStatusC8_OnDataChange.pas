begin
if StatusC8.Asint = 1 then
   begin
   TextStatusC8.Color := clGreen;
   TextStatusC8.Text := 'В работе(А)';
   end;
if StatusC8.Asint = 2 then
   begin
   TextStatusC8.Color := clYellow;
   TextStatusC8.Text := 'В работе(М)';
   end;
if StatusC8.Asint = 3 then
   begin
   TextStatusC8.Color := clRed;
   TextStatusC8.Text := 'Стоп (М)';
   end;
if StatusC8.Asint = 4 then
   begin
   TextStatusC8.Color := clRed;
   TextStatusC8.Text := 'Стоп (А)';
   end;
end.
