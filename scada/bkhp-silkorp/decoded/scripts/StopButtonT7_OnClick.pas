begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 7)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT7.AsBool = True then
   begin
   StatusStartForwardT7.Value := 1;
   RelayOutForwardT7.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT7.AsBool = True then
   begin
   StatusStartReversT7.Value := 1;
   RelayOutReversT7.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT7.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT7.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT7.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT7.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
