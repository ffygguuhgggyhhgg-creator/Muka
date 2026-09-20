begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска реверс (Б) (Транспортер 10)!', True, True);
// команда на включение механизма
if RelayOutForwardT10.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT10.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutReversT10.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT10.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartForwardT10.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartReversT10.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end;
end.
