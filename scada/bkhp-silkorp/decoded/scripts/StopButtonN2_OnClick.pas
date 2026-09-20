begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 2)!', True, True);
// команда на выключение механизма
if RelayOutN2.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN2.Value := 1;
   RelayOutN2.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN2.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
