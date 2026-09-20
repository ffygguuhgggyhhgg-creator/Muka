begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Нория 1)!', True, True);
// команда на выключение механизма
if RelayOutN1.AsBool = True then // проверка механизм включен через компьютер управления
   begin
   StatusStartN1.Value := 1;
   RelayOutN1.Value := False // деактивация выхода контроллера
   end;
if StatusStartN1.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartN1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.
