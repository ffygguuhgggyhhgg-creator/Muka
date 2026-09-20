begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска (Нория 11)!', True, True);
// команда на включение механизма
if RelayOutN9.AsBool = False then // проверка неактивности выхода контроллера
    if StatusN9.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartN9.AsInt = 5 then // проверка наличия комманды на включение механизма
StatusStartN9.Value := 6  // если комманда на включение активна, то производится отмена запуска
else
begin
StatusStartN9.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end.
