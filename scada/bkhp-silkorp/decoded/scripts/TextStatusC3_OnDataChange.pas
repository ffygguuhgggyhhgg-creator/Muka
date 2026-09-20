begin
if StatusC3.Asint = 1 then
   begin
   TextStatusC3.Color := clGreen;
   TextStatusC3.Text := 'В работе(А)';
   end;
if StatusC3.Asint = 2 then
   begin
   TextStatusC3.Color := clYellow;
   TextStatusC3.Text := 'В работе(М)';
   end;
if StatusC3.Asint = 3 then
   begin
   TextStatusC3.Color := clRed;
   TextStatusC3.Text := 'Стоп (М)';
   end;
if StatusC3.Asint = 4 then
   begin
   TextStatusC3.Color := clRed;
   TextStatusC3.Text := 'Стоп (А)';
   end;
end.
