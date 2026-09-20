begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска прямой (А) (Транспортер 4)!', True, True);
// команда на включение механизма
if RelayOutReversT4.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT4.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if RelayOutForwardT4.AsBool = False then // проверка неактивности выхода контроллера
    if StatusT4.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartReversT4.AsInt = 5 then // проверка наличия комманды на включение механизма
AddMessage(Now, mkAlarm, 'Активна команда "Пуск" для реверсного включения транспортера. Отмените команду пуск реверса и повторите команду!', True, True)
else
begin
StatusStartForwardT4.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end;
end.
