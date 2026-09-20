begin
  // База пересчитывается на КАЖДОМ такте, иначе приращение за такт
  // перебазирования терялось (недоучёт отпуска).
  if L1_D1_C_E.Value > CalculateCount.Value then
  begin
    LocalCounter.Value := LocalCounter.Value + (L1_D1_C_E.Value - CalculateCount.Value);
  end;
  CalculateCount.Value := L1_D1_C_E.Value;
end.
