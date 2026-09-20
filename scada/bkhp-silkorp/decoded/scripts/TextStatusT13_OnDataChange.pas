begin
if StatusT13.Asint = 1 then
   begin
   TextStatusT13.Color := clGreen;
   TextStatusT13.Text := 'В работе(А) прямой';
   end;
if StatusT13.Asint = 2 then
   begin
   TextStatusT13.Color := clYellow;
   TextStatusT13.Text := 'В работе(М) прямой';
   end;
if StatusT13.Asint = 11 then
   begin
   TextStatusT13.Color := clGreen;
   TextStatusT13.Text := 'В работе(А) реверс';
   end;
if StatusT13.Asint = 12 then
   begin
   TextStatusT13.Color := clYellow;
   TextStatusT13.Text := 'В работе(М) реверс';
   end;
if StatusT13.Asint = 3 then
   begin
   TextStatusT13.Color := clRed;
   TextStatusT13.Text := 'Стоп (М)';
   end;
if StatusT13.Asint = 4 then
   begin
   TextStatusT13.Color := clRed;
   TextStatusT13.Text := 'Стоп (А)';
   end;
if StatusT13.Asint = 10 then
   begin
   TextStatusT13.Color := clRed;
   TextStatusT13.Text := 'Авария';
   end;
end.
