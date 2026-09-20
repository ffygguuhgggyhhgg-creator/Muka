begin
if StatusT2.Asint = 1 then
   begin
   TextStatusT2.Color := clGreen;
   TextStatusT2.Text := 'В работе(А) прямой';
   end;
if StatusT2.Asint = 2 then
   begin
   TextStatusT2.Color := clYellow;
   TextStatusT2.Text := 'В работе(М) прямой';
   end;
if StatusT2.Asint = 11 then
   begin
   TextStatusT2.Color := clGreen;
   TextStatusT2.Text := 'В работе(А) реверс';
   end;
if StatusT2.Asint = 12 then
   begin
   TextStatusT2.Color := clYellow;
   TextStatusT2.Text := 'В работе(М) реверс';
   end;
if StatusT2.Asint = 3 then
   begin
   TextStatusT2.Color := clRed;
   TextStatusT2.Text := 'Стоп (М)';
   end;
if StatusT2.Asint = 4 then
   begin
   TextStatusT2.Color := clRed;
   TextStatusT2.Text := 'Стоп (А)';
   end;
if StatusT2.Asint = 10 then
   begin
   TextStatusT2.Color := clRed;
   TextStatusT2.Text := 'Авария';
   end;
end.
