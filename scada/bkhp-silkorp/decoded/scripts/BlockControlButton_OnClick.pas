begin
if BlockControl.AsBool = False then
begin
BlockControl.Value := True;
AddMessage(Now, mkWarning , 'Включена защитная блокировка связей механизмов!', True, True);
end;
if BlockControl.AsBool = True then
begin
BlockControl.Value := False;
AddMessage(Now, mkAlarm , 'Отключена защитная блокировка связей механизмов!', True, True);
end;
end.
