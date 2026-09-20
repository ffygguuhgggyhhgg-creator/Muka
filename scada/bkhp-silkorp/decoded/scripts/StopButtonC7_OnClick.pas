begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 7)!', True, True);
// команда на выключение механизма
if RelayOutC7.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC7.Value := 1;
   RelayOutC7.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC7.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC7.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
