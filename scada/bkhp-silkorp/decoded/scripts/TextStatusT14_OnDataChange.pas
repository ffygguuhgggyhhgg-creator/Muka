begin
if StatusT14.Asint = 1 then
   begin
   TextStatusT14.Color := clGreen;
   TextStatusT14.Text := 'В работе(А) прямой';
   end;
if StatusT14.Asint = 2 then
   begin
   TextStatusT14.Color := clYellow;
   TextStatusT14.Text := 'В работе(М) прямой';
   end;
if StatusT14.Asint = 11 then
   begin
   TextStatusT14.Color := clGreen;
   TextStatusT14.Text := 'В работе(А) реверс';
   end;
if StatusT14.Asint = 12 then
   begin
   TextStatusT14.Color := clYellow;
   TextStatusT14.Text := 'В работе(М) реверс';
   end;
if StatusT14.Asint = 3 then
   begin
   TextStatusT14.Color := clRed;
   TextStatusT14.Text := 'Стоп (М)';
   end;
if StatusT14.Asint = 4 then
   begin
   TextStatusT14.Color := clRed;
   TextStatusT14.Text := 'Стоп (А)';
   end;
if StatusT14.Asint = 10 then
   begin
   TextStatusT14.Color := clRed;
   TextStatusT14.Text := 'Авария';
   end;
end.
