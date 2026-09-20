begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 10)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT10.AsBool = True then
   begin
   StatusStartForwardT10.Value := 1;
   RelayOutForwardT10.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT10.AsBool = True then
   begin
   StatusStartReversT10.Value := 1;
   RelayOutReversT10.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT10.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT10.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT10.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT10.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
