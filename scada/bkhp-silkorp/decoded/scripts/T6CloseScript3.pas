begin
if T6CloseStatus3.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T6CloseTimer3.Value := T6CloseTimer3.Value + 1; //Запускаем счетчик выполнения алгоритма
if T6CloseTimer3.Value > 2 then  // Условие пуска звукового оповещения
if T6CloseTimer3.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T6BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T6LatchStatusByte3.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T6LatchSelect3.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T6AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T6CloseTimer3.Value > 5 then // Условие пуска исполнительного механизма
if T6CloseTimer3.Value < 7 then
begin
T6LatchRunClose.Value := True // Дискретный выход управления задвижкой
end;
if T6LatchClose3.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte3.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T6CloseStatus3.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect3.Value := False; // Снимаем выбор задвижки
T6CloseTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 43 успешно закрыта!', True, True);
end;                                                                                 
                            
if T6CloseTimer3.Value > 9 + T6LatchCalCloseTime3.Value then // Условие остановки выполнения алгоритма по времени
begin
T6LatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte3.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T6CloseStatus3.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect3.Value := False; // Снимаем выбор задвижки
T6CloseTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 6 Силос 43, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
