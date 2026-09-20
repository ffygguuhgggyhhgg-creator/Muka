begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 2а)!', True, True);
// команда на выключение механизма
if RelayOutC6.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC6.Value := 1;
   RelayOutC6.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC6.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC6.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
