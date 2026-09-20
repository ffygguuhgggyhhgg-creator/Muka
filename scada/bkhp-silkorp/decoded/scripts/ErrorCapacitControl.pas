begin
 if Capacity.Value > 34 then
 if Capacity.Value < 100 then
 begin
 ErrorCapacityImage.Color := clRed;
 AddMessage(Now, mkAlarm, 'Слишком высокая подача на бункерные весы. Убавьте подачу!', True, True);
 end;
 if Capacity.Value < 34 then
 begin
 ErrorCapacityImage.Color := clGray;
 end;
end.
