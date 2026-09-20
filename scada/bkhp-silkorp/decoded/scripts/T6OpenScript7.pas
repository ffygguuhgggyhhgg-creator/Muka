begin
if T6OpenStatus7.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T6OpenTimer7.Value := T6OpenTimer7.Value + 1; //Запускаем счетчик выполнения алгоритма
if T6OpenTimer7.Value > 2 then  // Условие пуска звукового оповещения
if T6OpenTimer7.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T6BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T6LatchStatusByte7.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T6LatchSelect7.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T6AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T6OpenTimer7.Value > 5 then // Условие пуска исполнительного механизма
if T6OpenTimer7.Value < 7 then
begin
T6LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T6LatchOpen7.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte7.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T6OpenStatus7.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect7.Value := False; // Снимаем выбор задвижки
T6OpenTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 47 успешно открыта!', True, True);
end;                                                                                 
if T6OpenTimer7.Value > 9 + T6LatchCalOpenTime7.Value then // Условие остановки выполнения алгоритма по времени
begin
T6LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte7.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T6OpenStatus7.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect7.Value := False; // Снимаем выбор задвижки
T6OpenTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 6 Силос 47, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
