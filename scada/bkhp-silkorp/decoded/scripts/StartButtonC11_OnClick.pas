begin
AddMessage(Now, mkAlarm, 'Нажата кнопка пуска (Аспирация 11)!', True, True);
// команда на включение механизма
if RelayOutC11.AsBool = False then // проверка неактивности выхода контроллера
    if StatusC11.AsInt = 4 then // проверка отсутствия местного включения механизма
begin
if StatusStartC11.AsInt = 5 then // проверка наличия комманды на включение механизма
StatusStartC11.Value := 6  // если комманда на включение активна, то производится отмена запуска
else
begin
StatusStartC11.Value := 5; // комманда на включение механизма
ManualStartStatus.Value := True // запуск таймера и сигнализации для подготовки включения
end;
end;
end.
