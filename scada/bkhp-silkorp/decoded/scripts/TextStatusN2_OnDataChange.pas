begin
if StatusN2.Asint = 1 then
   begin
   TextStatusN2.Color := clGreen;
   TextStatusN2.Text := 'В работе(А)';
   end;
if StatusN2.Asint = 2 then
   begin
   TextStatusN2.Color := clYellow;
   TextStatusN2.Text := 'В работе(М)';
   end;
if StatusN2.Asint = 3 then
   begin
   TextStatusN2.Color := clRed;
   TextStatusN2.Text := 'Стоп (М)';
   end;
if StatusN2.Asint = 4 then
   begin
   TextStatusN2.Color := clRed;
   TextStatusN2.Text := 'Стоп (А)';
   end;
if StatusN2.Asint = 10 then
   begin
   TextStatusN2.Color := clRed;
   TextStatusN2.Text := 'Авария';
   end;
end.
