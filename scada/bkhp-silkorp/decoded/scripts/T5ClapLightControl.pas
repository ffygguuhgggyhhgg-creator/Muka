begin

if T5ClapLatchRunOpen.AsBool = True then
begin

if T5ClapLatchSelect1.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect2.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect3.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect4.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect5.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGreen;
T5ClapLightOpen_2.Color := ClGray;
end;
if T5ClapLatchSelect6.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;
end;
if T5ClapLatchSelect7.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;
end;
if T5ClapLatchSelect8.AsBool = True then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGreen;
end;
end;

if T5ClapLatchRunOpen.AsBool = False then
begin
T5ClapLightOpen_1.Color := ClGray;
T5ClapLightOpen_2.Color := ClGray;
end;

if T5ClapLatchRunClose.AsBool = True then
begin

if T5ClapLatchSelect1.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect2.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect3.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect4.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect5.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGreen;
T5ClapLightClose_2.Color := ClGray;
end;
if T5ClapLatchSelect6.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
if T5ClapLatchSelect7.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
if T5ClapLatchSelect8.AsBool = True then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGreen;
end;
end;

if T5ClapLatchRunClose.AsBool = False then
begin
T5ClapLightClose_1.Color := ClGray;
T5ClapLightClose_2.Color := ClGray;
end;

end.
