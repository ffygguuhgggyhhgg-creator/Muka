begin
if StatusN4.Asint = 1 then
   begin
   TextStatusN4.Color := clGreen;
   TextStatusN4.Text := 'В работе(А)';
   end;
if StatusN4.Asint = 2 then
   begin
   TextStatusN4.Color := clYellow;
   TextStatusN4.Text := 'В работе(М)';
   end;
if StatusN4.Asint = 3 then
   begin
   TextStatusN4.Color := clRed;
   TextStatusN4.Text := 'Стоп (М)';
   end;
if StatusN4.Asint = 4 then
   begin
   TextStatusN4.Color := clRed;
   TextStatusN4.Text := 'Стоп (А)';
   end;
if StatusN4.Asint = 10 then
   begin
   TextStatusN4.Color := clRed;
   TextStatusN4.Text := 'Авария';
   end;
end.
