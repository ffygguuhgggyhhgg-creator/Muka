begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 11)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT11.AsBool = True then
   begin
   StatusStartForwardT11.Value := 1;
   RelayOutForwardT11.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT11.AsBool = True then
   begin
   StatusStartReversT11.Value := 1;
   RelayOutReversT11.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT11.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT11.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT11.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT11.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
