begin
if StatusC11.Asint = 1 then
   begin
   TextStatusC11.Color := clGreen;
   TextStatusC11.Text := 'В работе(А)';
   end;
if StatusC11.Asint = 2 then
   begin
   TextStatusC11.Color := clYellow;
   TextStatusC11.Text := 'В работе(М)';
   end;
if StatusC11.Asint = 3 then
   begin
   TextStatusC11.Color := clRed;
   TextStatusC11.Text := 'Стоп (М)';
   end;
if StatusC11.Asint = 4 then
   begin
   TextStatusC11.Color := clRed;
   TextStatusC11.Text := 'Стоп (А)';
   end;
end.
