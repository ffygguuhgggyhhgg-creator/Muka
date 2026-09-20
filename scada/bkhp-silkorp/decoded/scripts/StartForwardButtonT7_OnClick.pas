begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска прямой (А) (Транспортер 7)!', True, True);
// команда на включение механизма
if RelayOutReversT7.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT7.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutForwardT7.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT7.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartReversT7.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartForwardT7.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end;
end.
