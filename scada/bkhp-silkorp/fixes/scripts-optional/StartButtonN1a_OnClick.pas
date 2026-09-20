begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска (Нория 1а)!', True, True);
// команда на включение механизма
if RelayOutN7.AsBool = False then // проверка неактивности выхода контроллера
    if StatusN7.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartN7.AsInt = 5 then // проверка наличия комманды на включение механизма
StatusStartN7.Value := 6  // если комманда на включение активна, то производится отмена запуска
else
begin
StatusStartN7.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True;  // запуск подготовки включения
ManualTimer.Value := 0;           // перезапуск окна алгоритма
ManualTimerDelay.Value := 0;      // заново отсчитать 20 с до пуска
ManualTimerAlarm.Value := 0       // заново дать предпусковую сигнализацию
end;
end;
end.
