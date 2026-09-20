begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска (Нория 2а)!', True, True);
// команда на включение механизма
if RelayOutN8.AsBool = False then // проверка неактивности выхода контроллера
    if StatusN8.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartN8.AsInt = 5 then // проверка наличия комманды на включение механизма
StatusStartN8.Value := 6  // если комманда на включение активна, то производится отмена запуска
else
begin
StatusStartN8.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;               
end;
end.
