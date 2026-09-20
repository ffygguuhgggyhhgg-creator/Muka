begin
if StatusN3.Asint = 1 then
   begin
   TextStatusN3.Color := clGreen;
   TextStatusN3.Text := 'В работе(А)';
   end;
if StatusN3.Asint = 2 then
   begin
   TextStatusN3.Color := clYellow;
   TextStatusN3.Text := 'В работе(М)';
   end;
if StatusN3.Asint = 3 then
   begin
   TextStatusN3.Color := clRed;
   TextStatusN3.Text := 'Стоп (М)';
   end;
if StatusN3.Asint = 4 then
   begin
   TextStatusN3.Color := clRed;
   TextStatusN3.Text := 'Стоп (А)';
   end;
if StatusN3.Asint = 10 then
   begin
   TextStatusN3.Color := clRed;
   TextStatusN3.Text := 'Авария';
   end;
end.
