begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 5)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT5.AsBool = True then
   begin
   StatusStartForwardT5.Value := 1;
   RelayOutForwardT5.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT5.AsBool = True then
   begin
   StatusStartReversT5.Value := 1;
   RelayOutReversT5.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT5.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT5.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT5.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT5.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
