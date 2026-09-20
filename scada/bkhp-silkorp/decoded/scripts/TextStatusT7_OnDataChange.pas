begin
if StatusT7.Asint = 1 then
   begin
   TextStatusT7.Color := clGreen;
   TextStatusT7.Text := 'В работе(А) прямой';
   end;
if StatusT7.Asint = 2 then
   begin
   TextStatusT7.Color := clYellow;
   TextStatusT7.Text := 'В работе(М) прямой';
   end;
if StatusT7.Asint = 11 then
   begin
   TextStatusT7.Color := clGreen;
   TextStatusT7.Text := 'В работе(А) реверс';
   end;
if StatusT7.Asint = 12 then
   begin
   TextStatusT7.Color := clYellow;
   TextStatusT7.Text := 'В работе(М) реверс';
   end;
if StatusT7.Asint = 3 then
   begin
   TextStatusT7.Color := clRed;
   TextStatusT7.Text := 'Стоп (М)';
   end;
if StatusT7.Asint = 4 then
   begin
   TextStatusT7.Color := clRed;
   TextStatusT7.Text := 'Стоп (А)';
   end;
if StatusT7.Asint = 10 then
   begin
   TextStatusT7.Color := clRed;
   TextStatusT7.Text := 'Авария';
   end;
end.
