─
begin
if StatusT15.Asint = 1 then
   begin
   TextStatusT15.Color := clGreen;
   TextStatusT15.Text := 'В работе(А) прямой';
   end;
if StatusT15.Asint = 2 then
   begin
   TextStatusT15.Color := clYellow;
   TextStatusT15.Text := 'В работе(М) прямой';
   end;
if StatusT15.Asint = 11 then
   begin
   TextStatusT15.Color := clGreen;
   TextStatusT15.Text := 'В работе(А) реверс';
   end;
if StatusT15.Asint = 12 then
   begin
   TextStatusT15.Color := clYellow;
   TextStatusT15.Text := 'В работе(М) реверс';
   end;
if StatusT15.Asint = 3 then
   begin
   TextStatusT15.Color := clRed;
   TextStatusT15.Text := 'Стоп (М)';
   end;
if StatusT15.Asint = 4 then
   begin
   TextStatusT15.Color := clRed;
   TextStatusT15.Text := 'Стоп (А)';
   end;
if StatusT15.Asint = 10 then
   begin
   TextStatusT15.Color := clRed;
   TextStatusT15.Text := 'Авария';
   end;
end.
