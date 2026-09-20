begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска реверс (Б) (Транспортер 7)!', True, True);
// команда на включение механизма
if RelayOutForwardT7.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT7.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutReversT7.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT7.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartForwardT7.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartReversT7.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True;  // запуск подготовки включения
ManualTimer.Value := 0;           // перезапуск окна алгоритма
ManualTimerDelay.Value := 0;      // заново отсчитать 20 с до пуска
ManualTimerAlarm.Value := 0       // заново дать предпусковую сигнализацию
end;
end;
end;
end.
