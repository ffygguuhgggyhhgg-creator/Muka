begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 2)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT2.AsBool = True then
   begin
   StatusStartForwardT2.Value := 1;
   RelayOutForwardT2.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT2.AsBool = True then
   begin
   StatusStartReversT2.Value := 1;
   RelayOutReversT2.Value := False; // деактивация выхода контроллера
   end;

if StatusStartForwardT2.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT2.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
