begin
if StatusT3.Asint = 1 then
   begin
   TextStatusT3.Color := clGreen;
   TextStatusT3.Text := 'В работе(А) прямой';
   end;
if StatusT3.Asint = 2 then
   begin
   TextStatusT3.Color := clYellow;
   TextStatusT3.Text := 'В работе(М) прямой';
   end;
if StatusT3.Asint = 11 then
   begin
   TextStatusT3.Color := clGreen;
   TextStatusT3.Text := 'В работе(А) реверс';
   end;
if StatusT3.Asint = 12 then
   begin
   TextStatusT3.Color := clYellow;
   TextStatusT3.Text := 'В работе(М) реверс';
   end;
if StatusT3.Asint = 3 then
   begin
   TextStatusT3.Color := clRed;
   TextStatusT3.Text := 'Стоп (М)';
   end;
if StatusT3.Asint = 4 then
   begin
   TextStatusT3.Color := clRed;
   TextStatusT3.Text := 'Стоп (А)';
   end;
if StatusT3.Asint = 10 then
   begin
   TextStatusT3.Color := clRed;
   TextStatusT3.Text := 'Авария';
   end;
end.
