begin
if StatusT4.Asint = 1 then
   begin
   TextStatusT4.Color := clGreen;
   TextStatusT4.Text := 'В работе(А) прямой';
   end;
if StatusT4.Asint = 2 then
   begin
   TextStatusT4.Color := clYellow;
   TextStatusT4.Text := 'В работе(М) прямой';
   end;
if StatusT4.Asint = 11 then
   begin
   TextStatusT4.Color := clGreen;
   TextStatusT4.Text := 'В работе(А) реверс';
   end;
if StatusT4.Asint = 12 then
   begin
   TextStatusT4.Color := clYellow;
   TextStatusT4.Text := 'В работе(М) реверс';
   end;
if StatusT4.Asint = 3 then
   begin
   TextStatusT4.Color := clRed;
   TextStatusT4.Text := 'Стоп (М)';
   end;
if StatusT4.Asint = 4 then
   begin
   TextStatusT4.Color := clRed;
   TextStatusT4.Text := 'Стоп (А)';
   end;
if StatusT4.Asint = 10 then
   begin
   TextStatusT4.Color := clRed;
   TextStatusT4.Text := 'Авария';
   end;
end.
