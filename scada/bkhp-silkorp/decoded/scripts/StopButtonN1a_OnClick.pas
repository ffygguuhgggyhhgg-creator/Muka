begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 1а)!', True, True);
// команда на выключение механизма
if RelayOutN7.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN7.Value := 1;
   RelayOutN7.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN7.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN7.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
