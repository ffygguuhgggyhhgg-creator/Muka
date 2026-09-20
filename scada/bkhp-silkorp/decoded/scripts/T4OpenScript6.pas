begin
if T4OpenStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4OpenTimer6.Value := T4OpenTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма
if T4OpenTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T4OpenTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T4BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4LatchStatusByte6.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T4LatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T4OpenTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T4OpenTimer6.Value < 7 then
begin
T4LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;
if T4LatchOpen6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte6.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T4OpenStatus6.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect6.Value := False; // Снимаем выбор задвижки
T4OpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 6-16 успешно открыта!', True, True);
end;                                                                                 
                            
if T4OpenTimer6.Value > 9 + T4LatchCalOpenTime6.Value then // Условие остановки выполнения алгоритма по времени
begin
T4LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte6.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T4OpenStatus6.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect6.Value := False; // Снимаем выбор задвижки
T4OpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 4 Силос 6-16, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
