begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 9)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT9.AsBool = True then
   begin
   StatusStartForwardT9.Value := 1;
   RelayOutForwardT9.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT9.AsBool = True then
   begin
   StatusStartReversT9.Value := 1;
   RelayOutReversT9.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT9.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT9.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT9.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT9.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
