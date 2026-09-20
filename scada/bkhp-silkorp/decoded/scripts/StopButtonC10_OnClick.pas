begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 10)!', True, True);
// команда на выключение механизма
if RelayOutC10.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC10.Value := 1;
   RelayOutC10.Value := False // деактивация выхода контроллера
   end;
   if StatusStartC10.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC10.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
