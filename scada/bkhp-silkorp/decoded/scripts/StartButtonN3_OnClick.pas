begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска (Нория 3)!', True, True);
// команда на включение механизма
if RelayOutN3.AsBool = False then // проверка неактивности выхода контроллера
    if StatusN3.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartN3.AsInt = 5 then // проверка наличия комманды на включение механизма
StatusStartN3.Value := 6  // если комманда на включение активна, то производится отмена запуска
else
begin
StatusStartN3.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end.
