begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 12)!', True, True);
// команда на выключение механизма
if RelayOutC12.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC12.Value := 1;
   RelayOutC12.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC12.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC12.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
