begin
if StatusC4.Asint = 1 then
   begin
   TextStatusC4.Color := clGreen;
   TextStatusC4.Text := 'В работе(А)';
   end;
if StatusC4.Asint = 2 then
   begin
   TextStatusC4.Color := clYellow;
   TextStatusC4.Text := 'В работе(М)';
   end;
if StatusC4.Asint = 3 then
   begin
   TextStatusC4.Color := clRed;
   TextStatusC4.Text := 'Стоп (М)';
   end;
if StatusC4.Asint = 4 then
   begin
   TextStatusC4.Color := clRed;
   TextStatusC4.Text := 'Стоп (А)';
   end;
end.
