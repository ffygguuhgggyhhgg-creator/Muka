begin
if StatusN5.Asint = 1 then
   begin
   TextStatusN5.Color := clGreen;
   TextStatusN5.Text := 'В работе(А)';
   end;
if StatusN5.Asint = 2 then
   begin
   TextStatusN5.Color := clYellow;
   TextStatusN5.Text := 'В работе(М)';
   end;
if StatusN5.Asint = 3 then
   begin
   TextStatusN5.Color := clRed;
   TextStatusN5.Text := 'Стоп (М)';
   end;
if StatusN5.Asint = 4 then
   begin
   TextStatusN5.Color := clRed;
   TextStatusN5.Text := 'Стоп (А)';
   end;
if StatusN5.Asint = 10 then
   begin
   TextStatusN5.Color := clRed;
   TextStatusN5.Text := 'Авария';
   end;
end.
