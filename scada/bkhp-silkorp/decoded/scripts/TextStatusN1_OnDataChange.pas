begin
if StatusN1.Asint = 1 then
   begin
   TextStatusN1.Color := clGreen;
   TextStatusN1.Text := 'В работе(А)';
   end;
if StatusN1.Asint = 2 then
   begin
   TextStatusN1.Color := clYellow;
   TextStatusN1.Text := 'В работе(М)';
   end;
if StatusN1.Asint = 3 then
   begin
   TextStatusN1.Color := clRed;
   TextStatusN1.Text := 'Стоп (М)';
   end;
if StatusN1.Asint = 4 then
   begin
   TextStatusN1.Color := clRed;
   TextStatusN1.Text := 'Стоп (А)';
   end;
if StatusN1.Asint = 10 then
   begin
   TextStatusN1.Color := clRed;
   TextStatusN1.Text := 'Авария';
   end;
end.
