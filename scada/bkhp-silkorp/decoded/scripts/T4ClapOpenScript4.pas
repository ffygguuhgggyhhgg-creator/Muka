begin
if T4ClapOpenStatus4.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4ClapOpenTimer4.Value := T4ClapOpenTimer4.Value + 1; //Запускаем счетчик выполнения алгоритма
if T4ClapOpenTimer4.Value > 2 then  // Условие пуска звукового оповещения
if T4ClapOpenTimer4.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T4ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4ClapLatchStatusByte4.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T4ClapLatchSelect4.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T4ClapOpenTimer4.Value > 5 then // Условие пуска исполнительного механизма
if T4ClapOpenTimer4.Value < 7 then  
begin
T4ClapLatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T4ClapLatchOpen4.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4ClapLatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte4.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T4ClapOpenStatus4.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect4.Value := False; // Снимаем выбор задвижки
T4ClapOpenTimer4.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 4 успешно переброшен!', True, True);
end;                                                                                 
                            
if T4ClapOpenTimer4.Value > 9 + T4ClapLatchCalOpenTime4.Value then // Условие остановки выполнения алгоритма по времени
begin
T4ClapLatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte4.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T4ClapOpenStatus4.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect4.Value := False; // Снимаем выбор задвижки
T4ClapOpenTimer4.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария клапана Транспортера 4 Силос 4-14, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
