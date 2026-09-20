begin
if StatusC7.Asint = 1 then
   begin
   TextStatusC7.Color := clGreen;
   TextStatusC7.Text := 'В работе(А)';
   end;
if StatusC7.Asint = 2 then
   begin
   TextStatusC7.Color := clYellow;
   TextStatusC7.Text := 'В работе(М)';
   end;
if StatusC7.Asint = 3 then
   begin
   TextStatusC7.Color := clRed;
   TextStatusC7.Text := 'Стоп (М)';
   end;
if StatusC7.Asint = 4 then
   begin
   TextStatusC7.Color := clRed;
   TextStatusC7.Text := 'Стоп (А)';
   end;
end.
