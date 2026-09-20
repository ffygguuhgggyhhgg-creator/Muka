begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 11)!', True, True);
// команда на выключение механизма
if RelayOutN9.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN9.Value := 1;
   RelayOutN9.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN9.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN9.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
