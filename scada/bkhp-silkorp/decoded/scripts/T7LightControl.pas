begin

if T7LatchRunOpen.AsBool = True then
begin

if T7LatchSelect1.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect2.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect3.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect4.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect5.AsBool = True then
begin
T7LightOpen_1.Color := ClGreen;
T7LightOpen_2.Color := ClGray;
end;
if T7LatchSelect6.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect7.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect8.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect9.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
if T7LatchSelect10.AsBool = True then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGreen;
end;
end;

if T7LatchRunOpen.AsBool = False then
begin
T7LightOpen_1.Color := ClGray;
T7LightOpen_2.Color := ClGray;
end;

if T7LatchRunClose.AsBool = True then
begin

if T7LatchSelect1.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect2.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect3.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect4.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect5.AsBool = True then
begin
T7LightClose_1.Color := ClGreen;
T7LightClose_2.Color := ClGray;
end;
if T7LatchSelect6.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect7.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect8.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect9.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
if T7LatchSelect10.AsBool = True then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGreen;
end;
end;

if T7LatchRunClose.AsBool = False then
begin
T7LightClose_1.Color := ClGray;
T7LightClose_2.Color := ClGray;
end;

end.
