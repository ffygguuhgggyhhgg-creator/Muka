begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 17)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT13.AsBool = True then
   begin
   StatusStartForwardT13.Value := 1;
   RelayOutForwardT13.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT13.AsBool = True then
   begin
   StatusStartReversT13.Value := 1;
   RelayOutReversT13.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT13.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT13.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT13.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT13.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
