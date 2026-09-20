begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 9а)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT14.AsBool = True then
   begin
   StatusStartForwardT14.Value := 1;
   RelayOutForwardT14.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT14.AsBool = True then
   begin
   StatusStartReversT14.Value := 1;
   RelayOutReversT14.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT14.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT14.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT14.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT14.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
