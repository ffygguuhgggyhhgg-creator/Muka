begin

if T5LatchRunOpen.AsBool = True then
begin

if T5LatchSelect1.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect2.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect3.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect4.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect5.AsBool = True then
begin
T5LightOpen_1.Color := ClGreen;
T5LightOpen_2.Color := ClGray;
end;
if T5LatchSelect6.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;
if T5LatchSelect7.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;
if T5LatchSelect8.AsBool = True then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGreen;
end;
end;

if T5LatchRunOpen.AsBool = False then
begin
T5LightOpen_1.Color := ClGray;
T5LightOpen_2.Color := ClGray;
end;

if T5LatchRunClose.AsBool = True then
begin

if T5LatchSelect1.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect2.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect3.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect4.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect5.AsBool = True then
begin
T5LightClose_1.Color := ClGreen;
T5LightClose_2.Color := ClGray;
end;
if T5LatchSelect6.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;
if T5LatchSelect7.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;
if T5LatchSelect8.AsBool = True then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGreen;
end;
end;

if T5LatchRunClose.AsBool = False then
begin
T5LightClose_1.Color := ClGray;
T5LightClose_2.Color := ClGray;
end;

end.
