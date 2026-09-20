begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 3)!', True, True);
// команда на выключение механизма
if RelayOutC3.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC3.Value := 1;
   RelayOutC3.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC3.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC3.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
