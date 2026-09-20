begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 6)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT6.AsBool = True then
   begin
   StatusStartForwardT6.Value := 1;
   RelayOutForwardT6.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT6.AsBool = True then
   begin
   StatusStartReversT6.Value := 1;
   RelayOutReversT6.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT6.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT6.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT6.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT6.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
