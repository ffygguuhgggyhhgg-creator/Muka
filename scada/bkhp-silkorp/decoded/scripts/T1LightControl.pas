begin

if T1LatchRunOpen.AsBool = True then
begin

if T1LatchSelect1.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect2.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect3.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect4.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect5.AsBool = True then
begin
T1LightOpen_1.Color := ClGreen;
T1LightOpen_2.Color := ClGray;
end;
if T1LatchSelect6.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
if T1LatchSelect7.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
if T1LatchSelect8.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
if T1LatchSelect9.AsBool = True then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGreen;
end;
end;

if T1LatchRunOpen.AsBool = False then
begin
T1LightOpen_1.Color := ClGray;
T1LightOpen_2.Color := ClGray;
end;

if T1LatchRunClose.AsBool = True then
begin

if T1LatchSelect1.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect2.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect3.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect4.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect5.AsBool = True then
begin
T1LightClose_1.Color := ClGreen;
T1LightClose_2.Color := ClGray;
end;
if T1LatchSelect6.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
if T1LatchSelect7.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
if T1LatchSelect8.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
if T1LatchSelect9.AsBool = True then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGreen;
end;
end;

if T1LatchRunClose.AsBool = False then
begin
T1LightClose_1.Color := ClGray;
T1LightClose_2.Color := ClGray;
end;

end.
