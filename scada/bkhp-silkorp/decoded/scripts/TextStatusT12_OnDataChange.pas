begin
if StatusT12.Asint = 1 then
   begin
   TextStatusT12.Color := clGreen;
   TextStatusT12.Text := 'В работе(А) прямой';
   end;
if StatusT12.Asint = 2 then
   begin
   TextStatusT12.Color := clYellow;
   TextStatusT12.Text := 'В работе(М) прямой';
   end;
if StatusT12.Asint = 11 then
   begin
   TextStatusT12.Color := clGreen;
   TextStatusT12.Text := 'В работе(А) реверс';
   end;
if StatusT12.Asint = 12 then
   begin
   TextStatusT12.Color := clYellow;
   TextStatusT12.Text := 'В работе(М) реверс';
   end;
if StatusT12.Asint = 3 then
   begin
   TextStatusT12.Color := clRed;
   TextStatusT12.Text := 'Стоп (М)';
   end;
if StatusT12.Asint = 4 then
   begin
   TextStatusT12.Color := clRed;
   TextStatusT12.Text := 'Стоп (А)';
   end;
if StatusT12.Asint = 10 then
   begin
   TextStatusT12.Color := clRed;
   TextStatusT12.Text := 'Авария';
   end;
end.
