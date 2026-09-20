begin
if StatusT6.Asint = 1 then
   begin
   TextStatusT6.Color := clGreen;
   TextStatusT6.Text := 'В работе(А) прямой';
   end;
if StatusT6.Asint = 2 then
   begin
   TextStatusT6.Color := clYellow;
   TextStatusT6.Text := 'В работе(М) прямой';
   end;
if StatusT6.Asint = 11 then
   begin
   TextStatusT6.Color := clGreen;
   TextStatusT6.Text := 'В работе(А) реверс';
   end;
if StatusT6.Asint = 12 then
   begin
   TextStatusT6.Color := clYellow;
   TextStatusT6.Text := 'В работе(М) реверс';
   end;
if StatusT6.Asint = 3 then
   begin
   TextStatusT6.Color := clRed;
   TextStatusT6.Text := 'Стоп (М)';
   end;
if StatusT6.Asint = 4 then
   begin
   TextStatusT6.Color := clRed;
   TextStatusT6.Text := 'Стоп (А)';
   end;
if StatusT6.Asint = 10 then
   begin
   TextStatusT6.Color := clRed;
   TextStatusT6.Text := 'Авария';
   end;
end.
