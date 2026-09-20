begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска реверс (Б) (Транспортер 9а)!', True, True);
// команда на включение механизма
if RelayOutForwardT14.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT14.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutReversT14.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT14.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartForwardT14.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartReversT14.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True;  // запуск подготовки включения
ManualTimer.Value := 0;           // перезапуск окна алгоритма
ManualTimerDelay.Value := 0;      // заново отсчитать 20 с до пуска
ManualTimerAlarm.Value := 0       // заново дать предпусковую сигнализацию
end;
end;
end;
end.
