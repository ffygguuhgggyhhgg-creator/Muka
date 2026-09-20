begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 4)!', True, True);
// команда на выключение механизма
if RelayOutC4.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC4.Value := 1;
   RelayOutC4.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC4.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC4.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
