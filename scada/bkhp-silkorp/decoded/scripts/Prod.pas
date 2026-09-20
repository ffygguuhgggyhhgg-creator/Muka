begin
  Timer.Value := TImer.Value + 1 ;
  If Timer.Value < 2 then
  begin
  Count.Value := L1_D1_C_C.Value;
  end;
  if L1_D1_C_C.Value >  Count.Value then
  begin
  Capacity.Value := ( ( L1_D1_C_C.Value - Count.Value) * (3600 / (Timer.Value - 1) )) / 1000 ;
  Timer.Value := 0 ;
  End ;
end.
