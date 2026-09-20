begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 8а)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT12.AsBool = True then
   begin
   StatusStartForwardT12.Value := 1;
   RelayOutForwardT12.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT12.AsBool = True then
   begin
   StatusStartReversT12.Value := 1;
   RelayOutReversT12.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT12.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT12.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT12.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT12.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
