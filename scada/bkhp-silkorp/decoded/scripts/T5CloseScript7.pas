begin
if T5CloseStatus7.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5CloseTimer7.Value := T5CloseTimer7.Value + 1; //Запускаем счетчик выполнения алгоритма
if T5CloseTimer7.Value > 2 then  // Условие пуска звукового оповещения
if T5CloseTimer7.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T5BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5LatchStatusByte7.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T5LatchSelect7.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
if T5CloseTimer7.Value > 5 then // Условие пуска исполнительного механизма
if T5CloseTimer7.Value < 7 then
begin
T5LatchRunClose.Value := True // Дискретный выход управления задвижкой
end;
if T5LatchClose7.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte7.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T5CloseStatus7.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect7.Value := False; // Снимаем выбор задвижки
T5CloseTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 29-39 успешно закрыта!', True, True);
end;                                                                                 
if T5CloseTimer7.Value > 9 + T5LatchCalCloseTime7.Value then // Условие остановки выполнения алгоритма по времени
begin
T5LatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte7.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T5CloseStatus7.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect7.Value := False; // Снимаем выбор задвижки
T5CloseTimer7.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 5 Силос 29-39, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;
end;
end.
