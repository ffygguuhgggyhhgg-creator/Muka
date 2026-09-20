begin

if T4ClapLatchRunOpen.AsBool = True then
begin

if T4ClapLatchSelect1.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect2.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect3.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect4.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect5.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGreen;
T4ClapLightOpen_2.Color := ClGray;
end;
if T4ClapLatchSelect6.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect7.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect8.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect9.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
if T4ClapLatchSelect10.AsBool = True then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGreen;
end;
end;

if T4ClapLatchRunOpen.AsBool = False then
begin
T4ClapLightOpen_1.Color := ClGray;
T4ClapLightOpen_2.Color := ClGray;
end;

if T4ClapLatchRunClose.AsBool = True then
begin

if T4ClapLatchSelect1.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect2.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect3.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect4.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect5.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGreen;
T4ClapLightClose_2.Color := ClGray;
end;
if T4ClapLatchSelect6.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect7.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect8.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect9.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
if T4ClapLatchSelect10.AsBool = True then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGreen;
end;
end;

if T4ClapLatchRunClose.AsBool = False then
begin
T4ClapLightClose_1.Color := ClGray;
T4ClapLightClose_2.Color := ClGray;
end;

end.
