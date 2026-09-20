begin
if StatusN9.Asint = 1 then
   begin
   TextStatusN9.Color := clGreen;
   TextStatusN9.Text := 'В работе(А)';
   end;
if StatusN9.Asint = 2 then
   begin
   TextStatusN9.Color := clYellow;
   TextStatusN9.Text := 'В работе(М)';
   end;
if StatusN9.Asint = 3 then
   begin
   TextStatusN9.Color := clRed;
   TextStatusN9.Text := 'Стоп (М)';
   end;
if StatusN9.Asint = 4 then
   begin
   TextStatusN9.Color := clRed;
   TextStatusN9.Text := 'Стоп (А)';
   end;
if StatusN9.Asint = 10 then
   begin
   TextStatusN9.Color := clRed;
   TextStatusN9.Text := 'Авария';
   end;
end.
