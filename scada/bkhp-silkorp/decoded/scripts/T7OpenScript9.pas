begin
if T7OpenStatus9.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T7OpenTimer9.Value := T7OpenTimer9.Value + 1; //Запускаем счетчик выполнения алгоритма
if T7OpenTimer9.Value > 2 then  // Условие пуска звукового оповещения
if T7OpenTimer9.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T7BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T7LatchStatusByte9.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T7LatchSelect9.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T7AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T7OpenTimer9.Value > 5 then // Условие пуска исполнительного механизма
if T7OpenTimer9.Value < 7 then
begin
T7LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T7LatchOpen9.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T7LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T7BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T7LatchStatusByte9.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T7OpenStatus9.Value := False; // Останавливаем выполнение скрипта
T7LatchSelect9.Value := False; // Снимаем выбор задвижки
T7OpenTimer9.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 7 Силос 59 успешно открыта!', True, True);
end;                                                                                 
                            
if T7OpenTimer9.Value > 9 + T7LatchCalOpenTime9.Value then // Условие остановки выполнения алгоритма по времени
begin
T7LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T7BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T7LatchStatusByte9.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T7OpenStatus9.Value := False; // Останавливаем выполнение скрипта
T7LatchSelect9.Value := False; // Снимаем выбор задвижки
T7OpenTimer9.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 7 Силос 59, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
