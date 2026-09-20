begin
if StatusC2.Asint = 1 then
   begin
   TextStatusC2.Color := clGreen;
   TextStatusC2.Text := 'В работе(А)';
   end;
if StatusC2.Asint = 2 then
   begin
   TextStatusC2.Color := clYellow;
   TextStatusC2.Text := 'В работе(М)';
   end;
if StatusC2.Asint = 3 then
   begin
   TextStatusC2.Color := clRed;
   TextStatusC2.Text := 'Стоп (М)';
   end;
if StatusC2.Asint = 4 then
   begin
   TextStatusC2.Color := clRed;
   TextStatusC2.Text := 'Стоп (А)';
   end;
end.
