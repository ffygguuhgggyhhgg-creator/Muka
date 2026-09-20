begin
if StatusT9.Asint = 1 then
   begin
   TextStatusT9.Color := clGreen;
   TextStatusT9.Text := 'В работе(А) прямой';
   end;
if StatusT9.Asint = 2 then
   begin
   TextStatusT9.Color := clYellow;
   TextStatusT9.Text := 'В работе(М) прямой';
   end;
if StatusT9.Asint = 11 then
   begin
   TextStatusT9.Color := clGreen;
   TextStatusT9.Text := 'В работе(А) реверс';
   end;
if StatusT9.Asint = 12 then
   begin
   TextStatusT9.Color := clYellow;
   TextStatusT9.Text := 'В работе(М) реверс';
   end;
if StatusT9.Asint = 3 then
   begin
   TextStatusT9.Color := clRed;
   TextStatusT9.Text := 'Стоп (М)';
   end;
if StatusT9.Asint = 4 then
   begin
   TextStatusT9.Color := clRed;
   TextStatusT9.Text := 'Стоп (А)';
   end;
if StatusT9.Asint = 10 then
   begin
   TextStatusT9.Color := clRed;
   TextStatusT9.Text := 'Авария';
   end;
end.
