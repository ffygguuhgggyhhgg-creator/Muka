begin
if BlockControl.AsBool = False then
begin
BlockControlBox.Color := ClGray;
BlockControlBox.Alpha := 0;
end;
if BlockControl.AsBool = True then
begin
BlockControlBox.Color := ClGreen;
BlockControlBox.Alpha := 100;
end;
end.
