begin
if StatusT8.Asint = 1 then
   begin
   TextStatusT8.Color := clGreen;
   TextStatusT8.Text := 'В работе(А) прямой';
   end;
if StatusT8.Asint = 2 then
   begin
   TextStatusT8.Color := clYellow;
   TextStatusT8.Text := 'В работе(М) прямой';
   end;
if StatusT8.Asint = 11 then
   begin
   TextStatusT8.Color := clGreen;
   TextStatusT8.Text := 'В работе(А) реверс';
   end;
if StatusT8.Asint = 12 then
   begin
   TextStatusT8.Color := clYellow;
   TextStatusT8.Text := 'В работе(М) реверс';
   end;
if StatusT8.Asint = 3 then
   begin
   TextStatusT8.Color := clRed;
   TextStatusT8.Text := 'Стоп (М)';
   end;
if StatusT8.Asint = 4 then
   begin
   TextStatusT8.Color := clRed;
   TextStatusT8.Text := 'Стоп (А)';
   end;
if StatusT8.Asint = 10 then
   begin
   TextStatusT8.Color := clRed;
   TextStatusT8.Text := 'Авария';
   end;
end.
