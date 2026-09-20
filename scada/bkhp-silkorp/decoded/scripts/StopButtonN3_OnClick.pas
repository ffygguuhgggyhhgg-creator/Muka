begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 3)!', True, True);
// команда на выключение механизма
if RelayOutN3.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN3.Value := 1;
   RelayOutN3.Value := False // деактивация выхода контроллера
   end;
   if StatusStartN3.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN3.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
