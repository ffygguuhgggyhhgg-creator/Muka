begin
if StatusT10.Asint = 1 then
   begin
   TextStatusT10.Color := clGreen;
   TextStatusT10.Text := 'В работе(А) прямой';
   end;
if StatusT10.Asint = 2 then
   begin
   TextStatusT10.Color := clYellow;
   TextStatusT10.Text := 'В работе(М) прямой';
   end;
if StatusT10.Asint = 11 then
   begin
   TextStatusT10.Color := clGreen;
   TextStatusT10.Text := 'В работе(А) реверс';
   end;
if StatusT10.Asint = 12 then
   begin
   TextStatusT10.Color := clYellow;
   TextStatusT10.Text := 'В работе(М) реверс';
   end;
if StatusT10.Asint = 3 then
   begin
   TextStatusT10.Color := clRed;
   TextStatusT10.Text := 'Стоп (М)';
   end;
if StatusT10.Asint = 4 then
   begin
   TextStatusT10.Color := clRed;
   TextStatusT10.Text := 'Стоп (А)';
   end;
if StatusT10.Asint = 10 then
   begin
   TextStatusT10.Color := clRed;
   TextStatusT10.Text := 'Авария';
   end;
end.
