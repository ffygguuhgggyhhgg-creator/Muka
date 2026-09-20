begin
if StatusC1.Asint = 1 then
   begin
   TextStatusC1.Color := clGreen;
   TextStatusC1.Text := 'В работе(А)';
   end;
if StatusC1.Asint = 2 then
   begin
   TextStatusC1.Color := clYellow;
   TextStatusC1.Text := 'В работе(М)';
   end;
if StatusC1.Asint = 3 then
   begin
   TextStatusC1.Color := clRed;
   TextStatusC1.Text := 'Стоп (М)';
   end;
if StatusC1.Asint = 4 then
   begin
   TextStatusC1.Color := clRed;
   TextStatusC1.Text := 'Стоп (А)';
   end;
end.
