begin
AddMessage(Now, mkAlarm, 'Нажата кнопка остановки (Транспортер 22)!', True, True);
// команда на выключение механизма
   if RelayOutForwardT18.AsBool = True then
   begin
   StatusStartForwardT18.Value := 1;
   RelayOutForwardT18.Value := False; // деактивация выхода контроллера
   end;                                                          
   if RelayOutReversT18.AsBool = True then
   begin
   StatusStartReversT18.Value := 1;
   RelayOutReversT18.Value := False; // деактивация выхода контроллера
   end;
if StatusStartForwardT18.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartForwardT18.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
if StatusStartReversT18.AsInt = 5 then // проверка наличия комманды на включение механизма
begin
StatusStartReversT18.Value := 6;  // если комманда на включение активна, то производится отмена запуска
end;
end.                          
Другие кнопки
AlarmTest_OnClick
begin
 if Alarm16Level.AsBool = True then    // Если выход модуля для включения сигнализации активен
 if Alarm1Level.AsBool = True then    // Если выход модуля для включения сигнализации активен
 begin
     Alarm16Level.Value := False;  // Деактивация выхода модуля для сигнализации
     Alarm1Level.Value := False;  // Деактивация выхода модуля для сигнализации
 end
   else
   Alarm16Level.Value := True;
  Alarm1Level.Value := True;
end.
