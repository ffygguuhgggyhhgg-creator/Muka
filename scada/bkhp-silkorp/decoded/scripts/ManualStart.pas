begin
if ManualStartStatus.AsBool = True then //Если активирован алгоритм пуска механизмов
begin
  ManualTimer.Value := ManualTimer.Value + 1; //Накапливаем секунды с начала алгоритма для ограничения его выполнения по времени
  ManualTimerAlarm.Value := ManualTimerAlarm.Value + 1;  // Накапливаем секунды для отсчета звукового оповещения
  ManualTimerDelay.Value := ManualTimerDelay.Value + 1;  // Накапливаем секунды для отсчета начала включения механизмов

  //Пуск оповещения Начало
  if ManualTimerAlarm.Value <= 10 then
  begin
  Alarm16Level.Value := True;
  Alarm1Level.Value := True;
  AlarmBox.Color := ClRed;
  AlarmBox.Alpha := 100;
  end;
  //Пуск оповещения Конец
  //Стоп оповещения Начало
  if ManualTimerAlarm.Value > 10 then
  begin
  Alarm16Level.Value := False;
  Alarm1Level.Value := False;
  AlarmBox.Color := ClGray;
  AlarmBox.Alpha := 0;
  end;
  //Стоп оповещения Конец

  //Пуск механизмов Начало
  if ManualTimerDelay.Value >= 20 then
  begin
  ///////////////////////////////////////////////////НОРИИ НАЧАЛО///////////////////////////////////////////////////////
  if StatusStartN1.Value = 5 then
  begin
  RelayOutN1.Value := True;
  StatusStartN1.Value := 0
  end;

  if StatusStartN2.Value = 5 then
  begin
  RelayOutN2.Value := True;
  StatusStartN2.Value := 0
  end;

  if StatusStartN3.Value = 5 then
  begin
  RelayOutN3.Value := True;
  StatusStartN3.Value := 0
  end;

  if StatusStartN4.Value = 5 then
  begin
  RelayOutN4.Value := True;
  StatusStartN4.Value := 0
  end;

  if StatusStartN5.Value = 5 then
  begin
  RelayOutN5.Value := True;
  StatusStartN5.Value := 0
  end;

  if StatusStartN6.Value = 5 then
  begin
  RelayOutN6.Value := True;
  StatusStartN6.Value := 0
  end;

  if StatusStartN7.Value = 5 then
  begin
  RelayOutN7.Value := True;
  StatusStartN7.Value := 0
  end;

  if StatusStartN8.Value = 5 then
  begin
  RelayOutN8.Value := True;
  StatusStartN8.Value := 0
  end;

  if StatusStartN9.Value = 5 then
  begin
  RelayOutN9.Value := True;
  StatusStartN9.Value := 0
  end;
   ///////////////////////////////////////////////////НОРИИ КОНЕЦ///////////////////////////////////////////////////////
   ///////////////////////////////////////////////////АСПИРАЦИЯ НАЧАЛО//////////////////////////////////////////////////
  if StatusStartC1.Value = 5 then
  begin
  RelayOutC1.Value := True;
  StatusStartC1.Value := 0
  end;

  if StatusStartC2.Value = 5 then
  begin
  RelayOutC2.Value := True;
  StatusStartC2.Value := 0
  end;

  if StatusStartC3.Value = 5 then
  begin
  RelayOutC3.Value := True;
  StatusStartC3.Value := 0
  end;

  if StatusStartC4.Value = 5 then
  begin
  RelayOutC4.Value := True;
  StatusStartC4.Value := 0
  end;

  if StatusStartC5.Value = 5 then
  begin
  RelayOutC5.Value := True;
  StatusStartC5.Value := 0
  end;

  if StatusStartC6.Value = 5 then
  begin
  RelayOutC6.Value := True;
  StatusStartC6.Value := 0
  end;

  if StatusStartC7.Value = 5 then
  begin
  RelayOutC7.Value := True;
  StatusStartC7.Value := 0
  end;

  if StatusStartC8.Value = 5 then
  begin
  RelayOutC8.Value := True;
  StatusStartC8.Value := 0
  end;

  if StatusStartC9.Value = 5 then
  begin
  RelayOutC9.Value := True;
  StatusStartC9.Value := 0
  end;

  if StatusStartC10.Value = 5 then
  begin
  RelayOutC10.Value := True;
  StatusStartC10.Value := 0
  end;

  if StatusStartC11.Value = 5 then
  begin
  RelayOutC11.Value := True;
  StatusStartC11.Value := 0
  end;

  if StatusStartC12.Value = 5 then
  begin
  RelayOutC12.Value := True;
  StatusStartC12.Value := 0
  end;
   ///////////////////////////////////////////////////АСПИРАЦИЯ КОНЕЦ///////////////////////////////////////////////////
   ///////////////////////////////////////////////////ТРАНСПОРТЕРЫ НАЧАЛО///////////////////////////////////////////////
   if StatusStartForwardT1.Value = 5 then
  begin
  RelayOutForwardT1.Value := True;
  StatusStartForwardT1.Value := 0
  end;

  if StatusStartReversT1.Value = 5 then
  begin
  RelayOutReversT1.Value := True;
  StatusStartReversT1.Value := 0
  end;

  if StatusStartForwardT2.Value = 5 then
  begin
  RelayOutForwardT2.Value := True;
  StatusStartForwardT2.Value := 0
  end;

  if StatusStartReversT2.Value = 5 then
  begin
  RelayOutReversT2.Value := True;
  StatusStartReversT2.Value := 0
  end;

  if StatusStartForwardT3.Value = 5 then
  begin
  RelayOutForwardT3.Value := True;
  StatusStartForwardT3.Value := 0
  end;

  if StatusStartReversT3.Value = 5 then
  begin
  RelayOutReversT3.Value := True;
  StatusStartReversT3.Value := 0
  end;

  if StatusStartForwardT4.Value = 5 then
  begin
  RelayOutForwardT4.Value := True;
  StatusStartForwardT4.Value := 0
  end;

  if StatusStartReversT4.Value = 5 then
  begin
  RelayOutReversT4.Value := True;
  StatusStartReversT4.Value := 0
  end;

  if StatusStartForwardT5.Value = 5 then
  begin
  RelayOutForwardT5.Value := True;
  StatusStartForwardT5.Value := 0
  end;

  if StatusStartReversT5.Value = 5 then
  begin
  RelayOutReversT5.Value := True;
  StatusStartReversT5.Value := 0
  end;

  if StatusStartForwardT6.Value = 5 then
  begin
  RelayOutForwardT6.Value := True;
  StatusStartForwardT6.Value := 0
  end;

  if StatusStartReversT6.Value = 5 then
  begin
  RelayOutReversT6.Value := True;
  StatusStartReversT6.Value := 0
  end;

  if StatusStartForwardT7.Value = 5 then
  begin
  RelayOutForwardT7.Value := True;
  StatusStartForwardT7.Value := 0
  end;

  if StatusStartReversT7.Value = 5 then
  begin
  RelayOutReversT7.Value := True;
  StatusStartReversT7.Value := 0
  end;

  if StatusStartForwardT8.Value = 5 then
  begin
  RelayOutForwardT8.Value := True;
  StatusStartForwardT8.Value := 0
  end;

  if StatusStartReversT8.Value = 5 then
  begin
  RelayOutReversT8.Value := True;
  StatusStartReversT8.Value := 0
  end;

  if StatusStartForwardT9.Value = 5 then
  begin
  RelayOutForwardT9.Value := True;
  StatusStartForwardT9.Value := 0
  end;

  if StatusStartReversT9.Value = 5 then
  begin
  RelayOutReversT9.Value := True;
  StatusStartReversT9.Value := 0
  end;

  if StatusStartForwardT10.Value = 5 then
  begin
  RelayOutForwardT10.Value := True;
  StatusStartForwardT10.Value := 0
  end;

  if StatusStartReversT10.Value = 5 then
  begin
  RelayOutReversT10.Value := True;
  StatusStartReversT10.Value := 0
  end;

  if StatusStartForwardT11.Value = 5 then
  begin
  RelayOutForwardT11.Value := True;
  StatusStartForwardT11.Value := 0
  end;

  if StatusStartReversT11.Value = 5 then
  begin
  RelayOutReversT11.Value := True;
  StatusStartReversT11.Value := 0
  end;

  if StatusStartForwardT12.Value = 5 then
  begin
  RelayOutForwardT12.Value := True;
  StatusStartForwardT12.Value := 0
  end;

  if StatusStartReversT12.Value = 5 then
  begin
  RelayOutReversT12.Value := True;
  StatusStartReversT12.Value := 0
  end;

  if StatusStartForwardT13.Value = 5 then
  begin
  RelayOutForwardT13.Value := True;
  StatusStartForwardT13.Value := 0
  end;

  if StatusStartReversT13.Value = 5 then
  begin
  RelayOutReversT13.Value := True;
  StatusStartReversT13.Value := 0
  end;

  if StatusStartForwardT14.Value = 5 then
  begin
  RelayOutForwardT14.Value := True;
  StatusStartForwardT14.Value := 0
  end;

  if StatusStartReversT14.Value = 5 then
  begin
  RelayOutReversT14.Value := True;
  StatusStartReversT14.Value := 0
  end;

  if StatusStartForwardT15.Value = 5 then
  begin
  RelayOutForwardT15.Value := True;
  StatusStartForwardT15.Value := 0
  end;

  if StatusStartReversT15.Value = 5 then
  begin
  RelayOutReversT15.Value := True;
  StatusStartReversT15.Value := 0
  end;

  if StatusStartForwardT16.Value = 5 then
  begin
  RelayOutForwardT16.Value := True;
  StatusStartForwardT16.Value := 0
  end;

  if StatusStartReversT16.Value = 5 then
  begin
  RelayOutReversT16.Value := True;
  StatusStartReversT16.Value := 0
  end;

  if StatusStartForwardT17.Value = 5 then
  begin
  RelayOutForwardT17.Value := True;
  StatusStartForwardT17.Value := 0
  end;

  if StatusStartReversT17.Value = 5 then
  begin
  RelayOutReversT17.Value := True;
  StatusStartReversT17.Value := 0
  end;

  if StatusStartForwardT18.Value = 5 then
  begin
  RelayOutForwardT18.Value := True;
  StatusStartForwardT18.Value := 0
  end;

  if StatusStartReversT18.Value = 5 then
  begin
  RelayOutReversT18.Value := True;
  StatusStartReversT18.Value := 0
  end;
   ///////////////////////////////////////////////////ТРАНСПОРТЕРЫ КОНЕЦ////////////////////////////////////////////////
end;
  //Пуск механизмов Конец

  //Стоп таймера и обнуление счетчиков Начало
  if ManualTimer.Value >= 120 then
  begin
  AddMessage(Now, mkWarning, 'Сброс таймера оповещения о пуске механизмов', TRUE, FALSE);
  ManualStartStatus.Value := False;
  ManualTimer.Value := 0;
  ManualTimerDelay.Value := 0;
  ManualTimerAlarm.Value := 0;
  end;
  //Стоп таймера и обнуление счетчиков Конец
end;
end.
