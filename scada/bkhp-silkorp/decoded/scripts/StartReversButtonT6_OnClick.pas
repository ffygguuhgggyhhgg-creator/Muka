begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска реверс (Б) (Транспортер 6)!', True, True);
// команда на включение механизма
if RelayOutForwardT6.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT6.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutReversT6.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT6.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartForwardT6.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartReversT6.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end;
end.
