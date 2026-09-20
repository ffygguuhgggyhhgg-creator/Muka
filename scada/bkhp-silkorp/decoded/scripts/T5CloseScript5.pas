begin
if T5CloseStatus5.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5CloseTimer5.Value := T5CloseTimer5.Value + 1; //Запускаем счетчик выполнения алгоритма
if T5CloseTimer5.Value > 2 then  // Условие пуска звукового оповещения
if T5CloseTimer5.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T5BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5LatchStatusByte5.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T5LatchSelect5.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T5CloseTimer5.Value > 5 then // Условие пуска исполнительного механизма
if T5CloseTimer5.Value < 7 then
begin
T5LatchRunClose.Value := True // Дискретный выход управления задвижкой
end;
if T5LatchClose5.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte5.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T5CloseStatus5.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect5.Value := False; // Снимаем выбор задвижки
T5CloseTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 27-37 успешно закрыта!', True, True);
end;
                            
if T5CloseTimer5.Value > 9 + T5LatchCalCloseTime5.Value then // Условие остановки выполнения алгоритма по времени
begin
T5LatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte5.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T5CloseStatus5.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect5.Value := False; // Снимаем выбор задвижки
T5CloseTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 5 Силос 27-37, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
