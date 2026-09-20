begin
if AlarmStatus.AsBool = True then
begin
  AlarmStartTimer.Value := AlarmStartTimer.Value + 1; // накапливаем секунды в obstartalarmTimerAlarm
  if AlarmStartTimer.Value = 1 then
  begin
  Alarm16Level.Value := True;
  Alarm1Level.Value := True;
  AlarmBox.Color := ClRed;
  AlarmBox.Alpha := 100;
  end;
  if AlarmStartTimer.Value = 2 then
  begin
  Alarm16Level.Value := False;
  Alarm1Level.Value := False;
  AlarmBox.Color := ClGray;
  AlarmBox.Alpha := 0;
  end;
  if AlarmStartTimer.Value = 4 then
  begin
  Alarm16Level.Value := True;
  Alarm1Level.Value := True;
  AlarmBox.Color := ClRed;
  AlarmBox.Alpha := 100;
  end;                                           
  if AlarmStartTimer.Value = 6 then
  begin                                          
  Alarm16Level.Value := False;
  Alarm1Level.Value := False;
  AlarmBox.Color := ClGray;
  AlarmBox.Alpha := 0;
  end;
  if AlarmStartTimer.Value = 8 then
  begin
  Alarm16Level.Value := True;
  Alarm1Level.Value := True;
  AlarmBox.Color := ClRed;
  AlarmBox.Alpha := 100;
  end;
  if AlarmStartTimer.Value = 10 then
  begin
  Alarm16Level.Value := False;
  Alarm1Level.Value := False;
  AlarmStartTimer.Value := 0;
  AlarmStatus.Value := False;
  AlarmBox.Color := ClGray;
  AlarmBox.Alpha := 0;
  end;
end;
end.
