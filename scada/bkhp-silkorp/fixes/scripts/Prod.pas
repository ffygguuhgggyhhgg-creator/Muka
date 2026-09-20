begin
  Timer.Value := Timer.Value + 1;
  if L1_D1_C_C.Value > Count.Value then
  begin
    // Timer = число тактов интервала; деления на нуль больше нет
    if Timer.Value > 0 then
    begin
      Capacity.Value := ((L1_D1_C_C.Value - Count.Value) * (3600 / Timer.Value)) / 1000;
    end;
    Count.Value := L1_D1_C_C.Value;
    Timer.Value := 0;
  end;
  // Подача прекратилась — производительность обнуляется, а не «залипает»
  if Timer.Value > 120 then
  begin
    Capacity.Value := 0;
    Count.Value := L1_D1_C_C.Value;
    Timer.Value := 0;
  end;
end.
