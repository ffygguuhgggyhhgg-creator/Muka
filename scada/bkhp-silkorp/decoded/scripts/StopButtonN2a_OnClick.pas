begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 2а)!', True, True);
// команда на выключение механизма
if RelayOutN8.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN8.Value := 1;
   RelayOutN8.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN8.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN8.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
