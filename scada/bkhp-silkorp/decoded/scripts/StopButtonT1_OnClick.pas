begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 1)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT1.AsBool = True then
   begin
   StatusStartForwardT1.Value := 1;
   RelayOutForwardT1.Value := False; // деактивация выхода контроллера
   end;
   if RelayOutReversT1.AsBool = True then
   begin
   StatusStartReversT1.Value := 1;
   RelayOutReversT1.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT1.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT1.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
