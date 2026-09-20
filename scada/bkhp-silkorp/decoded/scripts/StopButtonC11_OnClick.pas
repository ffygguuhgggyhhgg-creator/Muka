begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 11)!', True, True);
// команда на выключение механизма
if RelayOutC11.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC11.Value := 1;
   RelayOutC11.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC11.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC11.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
