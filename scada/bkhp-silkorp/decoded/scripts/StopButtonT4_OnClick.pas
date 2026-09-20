begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 4)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT4.AsBool = True then
   begin
   StatusStartForwardT4.Value := 1;
   RelayOutForwardT4.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT4.AsBool = True then
   begin
   StatusStartReversT4.Value := 1;
   RelayOutReversT4.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT4.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT4.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT4.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT4.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
