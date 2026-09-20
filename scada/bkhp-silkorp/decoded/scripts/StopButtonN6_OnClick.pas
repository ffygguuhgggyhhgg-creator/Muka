begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 6)!', True, True);
// команда на выключение механизма
if RelayOutN6.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN6.Value := 1;
   RelayOutN6.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN6.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN6.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
