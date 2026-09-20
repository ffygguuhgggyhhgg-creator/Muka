begin
if T5ClapCloseStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5ClapCloseTimer6.Value := T5ClapCloseTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма
if T5ClapCloseTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T5ClapCloseTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T5ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5ClapLatchStatusByte6.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T5ClapLatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T5ClapCloseTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T5ClapCloseTimer6.Value < 7 then
begin
T5ClapLatchRunClose.Value := True // Дискретный выход управления задвижкой
end;
if T5ClapLatchClose6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin                        
T5ClapLatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T5ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5ClapLatchStatusByte6.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T5ClapCloseStatus6.Value := False; // Останавливаем выполнение скрипта
T5ClapLatchSelect6.Value := False; // Снимаем выбор задвижки
T5ClapCloseTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 5 в Силос 38 успешно переброшен!', True, True);
end;
if T5ClapCloseTimer6.Value > 9 + T5ClapLatchCalCloseTime6.Value then // Условие остановки выполнения алгоритма по времени
begin
T5ClapLatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T5ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5ClapLatchStatusByte6.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T5ClapCloseStatus6.Value := False; // Останавливаем выполнение скрипта
T5ClapLatchSelect6.Value := False; // Снимаем выбор задвижки
T5ClapCloseTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария клапана Транспортера 5 Силос 28-38, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
