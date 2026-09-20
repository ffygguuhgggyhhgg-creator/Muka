begin
  { прерываем выполнение если пинг не связан с объектом }
  if PingData.Sender = nil then Exit;

 with PingData.Sender as TM_CheckBox do
    if PingData.Result then   // если пинг прошел удачно
    begin
      PingPLC16Flor.Value := True;
      Color := clGreen;        // меняем цвет фигуры на зеленый
      FontColor := clGreen
    end
    else                      // если пинг не удался
    begin
      Color := clRed;
      FontColor := clRed;         // меняем цвет фигуры на красный
      PingPLC16Flor.Value := False
      //AddMessage(Now, mkAlarm, 'Потеряна связь с контроллером (Обойка)!', TRUE, FALSE);
    end
end.
