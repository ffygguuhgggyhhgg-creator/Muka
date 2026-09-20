begin
  LocalCounterTimer.Value := LocalCounterTimer.Value + 1 ;
  If LocalCounterTimer.Value < 2 then
  begin
  CalculateCount.Value := L1_D1_C_E.Value;
  end;
  //If LocalCounterTimer.Value > 0 then
  //begin
  if L1_D1_C_E.Value >  CalculateCount.Value then
  begin
  LocalCounter.Value := LocalCounter.Value + (L1_D1_C_E.Value - CalculateCount.Value);
  LocalCounterTimer.Value := 0 ;
  //end;
  end;
end.                       
ClearLocalCounterButton_OnClick
begin
 if ClearLocalCounter.AsBool = True then
 begin
 LocalCounter.Value := 0;
 end;
end.
