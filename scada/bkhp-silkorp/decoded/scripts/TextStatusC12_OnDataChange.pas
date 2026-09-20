begin
if StatusC12.Asint = 1 then
   begin
   TextStatusC12.Color := clGreen;
   TextStatusC12.Text := 'В работе(А)';
   end;
if StatusC12.Asint = 2 then
   begin
   TextStatusC12.Color := clYellow;
   TextStatusC12.Text := 'В работе(М)';
   end;
if StatusC12.Asint = 3 then
   begin
   TextStatusC12.Color := clRed;
   TextStatusC12.Text := 'Стоп (М)';
   end;
if StatusC12.Asint = 4 then
   begin
   TextStatusC12.Color := clRed;
   TextStatusC12.Text := 'Стоп (А)';
   end;
end.
