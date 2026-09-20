begin
if StatusT18.Asint = 1 then
   begin
   TextStatusT18.Color := clGreen;
   TextStatusT18.Text := 'В работе(А) прямой';
   end;
if StatusT18.Asint = 2 then
   begin
   TextStatusT18.Color := clYellow;
   TextStatusT18.Text := 'В работе(М) прямой';
   end;
if StatusT18.Asint = 11 then
   begin
   TextStatusT18.Color := clGreen;
   TextStatusT18.Text := 'В работе(А) реверс';
   end;
if StatusT18.Asint = 12 then
   begin
   TextStatusT18.Color := clYellow;
   TextStatusT18.Text := 'В работе(М) реверс';
   end;
if StatusT18.Asint = 3 then
   begin
   TextStatusT18.Color := clRed;
   TextStatusT18.Text := 'Стоп (М)';
   end;
if StatusT18.Asint = 4 then
   begin
   TextStatusT18.Color := clRed;
   TextStatusT18.Text := 'Стоп (А)';
   end;
if StatusT18.Asint = 10 then
   begin
   TextStatusT18.Color := clRed;
   TextStatusT18.Text := 'Авария';
   end;
end.
