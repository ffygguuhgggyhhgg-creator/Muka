begin
if StatusT11.Asint = 1 then
   begin
   TextStatusT11.Color := clGreen;
   TextStatusT11.Text := 'В работе(А) прямой';
   end;
if StatusT11.Asint = 2 then
   begin
   TextStatusT11.Color := clYellow;
   TextStatusT11.Text := 'В работе(М) прямой';
   end;
if StatusT11.Asint = 11 then
   begin
   TextStatusT11.Color := clGreen;
   TextStatusT11.Text := 'В работе(А) реверс';
   end;
if StatusT11.Asint = 12 then
   begin
   TextStatusT11.Color := clYellow;
   TextStatusT11.Text := 'В работе(М) реверс';
   end;
if StatusT11.Asint = 3 then
   begin
   TextStatusT11.Color := clRed;
   TextStatusT11.Text := 'Стоп (М)';
   end;
if StatusT11.Asint = 4 then
   begin
   TextStatusT11.Color := clRed;
   TextStatusT11.Text := 'Стоп (А)';
   end;
if StatusT11.Asint = 10 then
   begin
   TextStatusT11.Color := clRed;
   TextStatusT11.Text := 'Авария';
   end;
end.
