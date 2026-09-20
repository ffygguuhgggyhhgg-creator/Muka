begin
if StatusT17.Asint = 1 then
   begin
   TextStatusT17.Color := clGreen;
   TextStatusT17.Text := 'В работе(А) прямой';
   end;
if StatusT17.Asint = 2 then
   begin
   TextStatusT17.Color := clYellow;
   TextStatusT17.Text := 'В работе(М) прямой';
   end;
if StatusT17.Asint = 11 then
   begin
   TextStatusT17.Color := clGreen;
   TextStatusT17.Text := 'В работе(А) реверс';
   end;
if StatusT17.Asint = 12 then
   begin
   TextStatusT17.Color := clYellow;
   TextStatusT17.Text := 'В работе(М) реверс';
   end;
if StatusT17.Asint = 3 then
   begin
   TextStatusT17.Color := clRed;
   TextStatusT17.Text := 'Стоп (М)';
   end;
if StatusT17.Asint = 4 then
   begin
   TextStatusT17.Color := clRed;
   TextStatusT17.Text := 'Стоп (А)';
   end;
if StatusT17.Asint = 10 then
   begin
   TextStatusT17.Color := clRed;
   TextStatusT17.Text := 'Авария';
   end;
end.
