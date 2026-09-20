begin
if StatusN7.Asint = 1 then
   begin
   TextStatusN7.Color := clGreen;
   TextStatusN7.Text := 'В работе(А)';
   end;
if StatusN7.Asint = 2 then
   begin
   TextStatusN7.Color := clYellow;
   TextStatusN7.Text := 'В работе(М)';
   end;
if StatusN7.Asint = 3 then
   begin
   TextStatusN7.Color := clRed;
   TextStatusN7.Text := 'Стоп (М)';
   end;
if StatusN7.Asint = 4 then
   begin
   TextStatusN7.Color := clRed;
   TextStatusN7.Text := 'Стоп (А)';
   end;
if StatusN7.Asint = 10 then
   begin
   TextStatusN7.Color := clRed;
   TextStatusN7.Text := 'Авария';
   end;
end.
