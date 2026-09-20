begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 24)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT17.AsBool = True then
   begin
   StatusStartForwardT17.Value := 1;
   RelayOutForwardT17.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT17.AsBool = True then
   begin
   StatusStartReversT17.Value := 1;
   RelayOutReversT17.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT17.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT17.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT17.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT17.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
