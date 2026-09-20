begin
if StatusN6.Asint = 1 then
   begin
   TextStatusN6.Color := clGreen;
   TextStatusN6.Text := 'В работе(А)';
   end;
if StatusN6.Asint = 2 then
   begin
   TextStatusN6.Color := clYellow;
   TextStatusN6.Text := 'В работе(М)';
   end;
if StatusN6.Asint = 3 then
   begin
   TextStatusN6.Color := clRed;
   TextStatusN6.Text := 'Стоп (М)';
   end;
if StatusN6.Asint = 4 then
   begin
   TextStatusN6.Color := clRed;
   TextStatusN6.Text := 'Стоп (А)';
   end;
if StatusN6.Asint = 10 then
   begin
   TextStatusN6.Color := clRed;
   TextStatusN6.Text := 'Авария';
   end;
end.
