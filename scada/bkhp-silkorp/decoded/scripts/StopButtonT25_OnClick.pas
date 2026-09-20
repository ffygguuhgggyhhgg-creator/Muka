begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 25)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT16.AsBool = True then
   begin
   StatusStartForwardT16.Value := 1;
   RelayOutForwardT16.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT16.AsBool = True then
   begin
   StatusStartReversT16.Value := 1;
   RelayOutReversT16.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT16.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT16.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT16.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT16.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
