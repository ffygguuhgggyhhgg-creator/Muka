begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 8)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT8.AsBool = True then
   begin
   StatusStartForwardT8.Value := 1;
   RelayOutForwardT8.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT8.AsBool = True then
   begin
   StatusStartReversT8.Value := 1;
   RelayOutReversT8.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT8.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT8.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT8.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT8.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
