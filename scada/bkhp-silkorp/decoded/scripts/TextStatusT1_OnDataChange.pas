begin
if StatusT1.Asint = 1 then
   begin
   TextStatusT1.Color := clGreen;
   TextStatusT1.Text := 'В работе(А) прямой';
   end;
if StatusT1.Asint = 2 then
   begin
   TextStatusT1.Color := clYellow;
   TextStatusT1.Text := 'В работе(М) прямой';
   end;
if StatusT1.Asint = 11 then
   begin
   TextStatusT1.Color := clGreen;
   TextStatusT1.Text := 'В работе(А) реверс';
   end;
if StatusT1.Asint = 12 then
   begin
   TextStatusT1.Color := clYellow;
   TextStatusT1.Text := 'В работе(М) реверс';
   end;
if StatusT1.Asint = 3 then
   begin
   TextStatusT1.Color := clRed;
   TextStatusT1.Text := 'Стоп (М)';
   end;
if StatusT1.Asint = 4 then
   begin
   TextStatusT1.Color := clRed;
   TextStatusT1.Text := 'Стоп (А)';
   end;                                                     
if StatusT1.Asint = 10 then
   begin
   TextStatusT1.Color := clRed;
   TextStatusT1.Text := 'Авария';
   end;
end.
