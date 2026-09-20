begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 1а)!', True, True);
// команда на выключение механизма
if RelayOutC5.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC5.Value := 1;
   RelayOutC5.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC5.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC5.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
