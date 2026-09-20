begin
if T4ClapCalStatus10.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4ClapCalTimer10.Value := T4ClapCalTimer10.Value + 1; //Запускаем счетчик выполнения алгоритма
if T4ClapCalTimer10.Value > 2 then  // Условие пуска звукового оповещения
if T4ClapCalTimer10.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T4ClapLatchStatusByte10.Value = 3 then
 begin                                        
 T4ClapLatchCalOpenTime10.Value := 0;
 T4ClapLatchCalCloseTime10.Value := 0;
 T4ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4ClapLatchStatusByte10.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T4ClapLatchSelect10.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T4ClapLatchStatusByte10.Value = 2 then
 begin
T4ClapCloseStatus10.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 не в позиции Силос 20! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T4ClapCalStatus10.Value := False; // Останавливаем алгоритм калибровки
T4ClapCalTimer10.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;
if T4ClapCalTimer10.Value > 5 then // Условие пуска исполнительного механизма
if T4ClapCalTimer10.Value < 7 then
begin
T4ClapLatchRunOpen.Value := True; // Дискретный выход управления задвижкой
T4ClapLatchCalOpenTime10.Value := T4ClapLatchCalOpenTime10.Value + 1; // Начинаем счет времени открытия задвижки
end;
                                       
if T4ClapCalTimer10.Value > 5 then // Условие счета времени открытия
if T4ClapLatchRunOpen.AsBool = True then
begin
T4ClapLatchCalOpenTime10.Value := T4ClapLatchCalOpenTime10.Value + 1; // Начинаем счет времени открытия задвижки
end;
if T4ClapCalTimer10.Value > 5 then
if T4ClapLatchOpen10.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4ClapLatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;                    
if T4ClapCalTimer10.Value > 5 + T4ClapLatchCalOpenTime10.Value then // Условие пуска исполнительного механизма
if T4ClapCalTimer10.Value < 7 + T4ClapLatchCalOpenTime10.Value then
begin
if T4ClapLatchRunOpen.AsBool = False then
begin
T4ClapLatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 10 успешно переброшен при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;
if T4ClapCalTimer10.Value > 5 + T4ClapLatchCalOpenTime10.Value then // Условие счета времени открытия
if T4ClapLatchRunClose.AsBool = True then
begin
T4ClapLatchCalCloseTime10.Value := T4ClapLatchCalCloseTime10.Value + 1; // Начинаем счет времени закрытия задвижки
end;
if T4ClapCalTimer10.Value > 5 + T4ClapLatchCalOpenTime10.Value then
if T4ClapLatchClose10.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin                                                                  
T4ClapLatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte10.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T4ClapCalStatus10.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect10.Value := False; // Снимаем выбор задвижки
T4ClapCalTimer10.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 20 успешно переброшен при калибровке! Калибровка выполнена!', True, True);
end;
end;
end.
