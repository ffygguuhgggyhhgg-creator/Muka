begin
if StatusN8.Asint = 1 then
   begin
   TextStatusN8.Color := clGreen;
   TextStatusN8.Text := 'В работе(А)';
   end;
if StatusN8.Asint = 2 then
   begin
   TextStatusN8.Color := clYellow;
   TextStatusN8.Text := 'В работе(М)';
   end;
if StatusN8.Asint = 3 then
   begin
   TextStatusN8.Color := clRed;
   TextStatusN8.Text := 'Стоп (М)';
   end;
if StatusN8.Asint = 4 then
   begin
   TextStatusN8.Color := clRed;
   TextStatusN8.Text := 'Стоп (А)';
   end;
if StatusN8.Asint = 10 then
   begin
   TextStatusN8.Color := clRed;
   TextStatusN8.Text := 'Авария';
   end;
end.
