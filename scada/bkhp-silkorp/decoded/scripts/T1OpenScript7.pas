begin
if T1OpenStatus7.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T1OpenTimer7.Value := T1OpenTimer7.Value + 1; //Запускаем счетчик выполнения алгоритма
if T1OpenTimer7.Value > 2 then  // Условие пуска звукового оповещения
if T1OpenTimer7.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T1BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T1LatchStatusByte7.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T1LatchSelect7.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T1AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T1OpenTimer7.Value > 5 then // Условие пуска исполнительного механизма
if T1OpenTimer7.Value < 7 then
begin
T1LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T1LatchOpen7.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte7.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T1OpenStatus7.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect7.Value := False; // Снимаем выбор задвижки
T1OpenTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 3 маршрут Т3-Т6 успешно открыта!', True, True);
end;                                                                                 
if T1OpenTimer7.Value > 9 + T1LatchCalOpenTime7.Value then // Условие остановки выполнения алгоритма по времени
begin
T1LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte7.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T1OpenStatus7.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect7.Value := False; // Снимаем выбор задвижки
T1OpenTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 3 маршрут Т3-Т6, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
