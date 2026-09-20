begin
if StatusC10.Asint = 1 then
   begin
   TextStatusC10.Color := clGreen;
   TextStatusC10.Text := 'В работе(А)';
   end;
if StatusC10.Asint = 2 then
   begin
   TextStatusC10.Color := clYellow;
   TextStatusC10.Text := 'В работе(М)';
   end;
if StatusC10.Asint = 3 then
   begin
   TextStatusC10.Color := clRed;
   TextStatusC10.Text := 'Стоп (М)';
   end;
if StatusC10.Asint = 4 then
   begin
   TextStatusC10.Color := clRed;
   TextStatusC10.Text := 'Стоп (А)';
   end;
end.
