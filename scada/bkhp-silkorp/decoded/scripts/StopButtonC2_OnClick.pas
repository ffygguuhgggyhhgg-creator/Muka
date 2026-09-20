begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Аспирация 2)!', True, True);
// команда на выключение механизма
if RelayOutC2.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartC2.Value := 1;
   RelayOutC2.Value := False // деактивация выхода контроллера
   end;
if StatusStartC2.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartC2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
