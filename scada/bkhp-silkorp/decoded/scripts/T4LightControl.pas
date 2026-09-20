begin

if T4LatchRunOpen.AsBool = True then
begin

if T4LatchSelect1.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect2.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect3.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect4.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect5.AsBool = True then
begin
T4LightOpen_1.Color := ClGreen;
T4LightOpen_2.Color := ClGray;
end;
if T4LatchSelect6.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect7.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect8.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect9.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
if T4LatchSelect10.AsBool = True then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGreen;
end;
end;

if T4LatchRunOpen.AsBool = False then
begin
T4LightOpen_1.Color := ClGray;
T4LightOpen_2.Color := ClGray;
end;

if T4LatchRunClose.AsBool = True then
begin

if T4LatchSelect1.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect2.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect3.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect4.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect5.AsBool = True then
begin
T4LightClose_1.Color := ClGreen;
T4LightClose_2.Color := ClGray;
end;
if T4LatchSelect6.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect7.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect8.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect9.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
if T4LatchSelect10.AsBool = True then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGreen;
end;
end;

if T4LatchRunClose.AsBool = False then
begin
T4LightClose_1.Color := ClGray;
T4LightClose_2.Color := ClGray;
end;

end.
