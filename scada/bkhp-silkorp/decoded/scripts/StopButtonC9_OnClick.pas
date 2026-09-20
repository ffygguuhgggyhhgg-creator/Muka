begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 9)!', True, True);
// команда на выключение механизма
if RelayOutC9.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC9.Value := 1;
   RelayOutC9.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC9.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC9.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
