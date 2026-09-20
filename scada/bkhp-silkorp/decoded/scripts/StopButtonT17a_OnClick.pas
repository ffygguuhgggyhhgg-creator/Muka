begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 17а)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT15.AsBool = True then
   begin
   StatusStartForwardT15.Value := 1;
   RelayOutForwardT15.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT15.AsBool = True then
   begin
   StatusStartReversT15.Value := 1;
   RelayOutReversT15.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT15.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT15.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT15.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT15.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
