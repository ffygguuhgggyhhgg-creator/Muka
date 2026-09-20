begin

if T6LatchRunOpen.AsBool = True then
begin

if T6LatchSelect1.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect2.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect3.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect4.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect5.AsBool = True then
begin
T6LightOpen_1.Color := ClGreen;
T6LightOpen_2.Color := ClGray;
end;
if T6LatchSelect6.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect7.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect8.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect9.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
if T6LatchSelect10.AsBool = True then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGreen;
end;
end;

if T6LatchRunOpen.AsBool = False then
begin
T6LightOpen_1.Color := ClGray;
T6LightOpen_2.Color := ClGray;
end;

if T6LatchRunClose.AsBool = True then
begin

if T6LatchSelect1.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect2.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect3.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect4.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect5.AsBool = True then
begin
T6LightClose_1.Color := ClGreen;
T6LightClose_2.Color := ClGray;
end;
if T6LatchSelect6.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect7.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect8.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect9.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
if T6LatchSelect10.AsBool = True then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGreen;
end;
end;

if T6LatchRunClose.AsBool = False then
begin
T6LightClose_1.Color := ClGray;
T6LightClose_2.Color := ClGray;
end;

end.
