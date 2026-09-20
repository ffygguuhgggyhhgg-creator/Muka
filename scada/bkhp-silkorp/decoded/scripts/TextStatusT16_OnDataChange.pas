begin
if StatusT16.Asint = 1 then
   begin
   TextStatusT16.Color := clGreen;
   TextStatusT16.Text := 'В работе(А) прямой';
   end;
if StatusT16.Asint = 2 then
   begin
   TextStatusT16.Color := clYellow;
   TextStatusT16.Text := 'В работе(М) прямой';
   end;
if StatusT16.Asint = 11 then
   begin
   TextStatusT16.Color := clGreen;
   TextStatusT16.Text := 'В работе(А) реверс';
   end;
if StatusT16.Asint = 12 then
   begin
   TextStatusT16.Color := clYellow;
   TextStatusT16.Text := 'В работе(М) реверс';
   end;
if StatusT16.Asint = 3 then
   begin
   TextStatusT16.Color := clRed;
   TextStatusT16.Text := 'Стоп (М)';
   end;
if StatusT16.Asint = 4 then
   begin
   TextStatusT16.Color := clRed;
   TextStatusT16.Text := 'Стоп (А)';
   end;
if StatusT16.Asint = 10 then
   begin
   TextStatusT16.Color := clRed;
   TextStatusT16.Text := 'Авария';
   end;
end.
