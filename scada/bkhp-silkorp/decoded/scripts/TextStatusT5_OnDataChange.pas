begin
if StatusT5.Asint = 1 then
   begin
   TextStatusT5.Color := clGreen;
   TextStatusT5.Text := 'В работе(А) прямой';
   end;
if StatusT5.Asint = 2 then
   begin
   TextStatusT5.Color := clYellow;
   TextStatusT5.Text := 'В работе(М) прямой';
   end;
if StatusT5.Asint = 11 then
   begin
   TextStatusT5.Color := clGreen;
   TextStatusT5.Text := 'В работе(А) реверс';
   end;
if StatusT5.Asint = 12 then
   begin
   TextStatusT5.Color := clYellow;
   TextStatusT5.Text := 'В работе(М) реверс';
   end;
if StatusT5.Asint = 3 then
   begin
   TextStatusT5.Color := clRed;
   TextStatusT5.Text := 'Стоп (М)';
   end;
if StatusT5.Asint = 4 then
   begin
   TextStatusT5.Color := clRed;
   TextStatusT5.Text := 'Стоп (А)';
   end;
if StatusT5.Asint = 10 then
   begin
   TextStatusT5.Color := clRed;
   TextStatusT5.Text := 'Авария';
   end;
end.
