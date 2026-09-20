begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 5)!', True, True);
// команда на выключение механизма
if RelayOutN5.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN5.Value := 1;
   RelayOutN5.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN5.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN5.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
