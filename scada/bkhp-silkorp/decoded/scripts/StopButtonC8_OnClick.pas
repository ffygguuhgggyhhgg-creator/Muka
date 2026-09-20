begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 8)!', True, True);
// команда на выключение механизма
if RelayOutC8.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC8.Value := 1;
   RelayOutC8.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC8.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC8.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
