begin
if T1OpenStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T1OpenTimer6.Value := T1OpenTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма
if T1OpenTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T1OpenTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T1BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T1LatchStatusByte6.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T1LatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T1AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T1OpenTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T1OpenTimer6.Value < 7 then
begin
T1LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T1LatchOpen6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte6.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T1OpenStatus6.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect6.Value := False; // Снимаем выбор задвижки
T1OpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 2 маршрут Т2-Т5 успешно открыта!', True, True);
end;                                                                                 
                            
if T1OpenTimer6.Value > 9 + T1LatchCalOpenTime6.Value then // Условие остановки выполнения алгоритма по времени
begin
T1LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte6.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T1OpenStatus6.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect6.Value := False; // Снимаем выбор задвижки
T1OpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 2 маршрут Т2-Т5, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
