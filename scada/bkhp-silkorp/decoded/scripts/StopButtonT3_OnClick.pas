begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 3)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT3.AsBool = True then
   begin
   StatusStartForwardT3.Value := 1;
   RelayOutForwardT3.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT3.AsBool = True then
   begin
   StatusStartReversT3.Value := 1;
   RelayOutReversT3.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT3.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT3.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT3.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT3.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
