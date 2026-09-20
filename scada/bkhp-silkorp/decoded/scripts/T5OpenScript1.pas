begin
if T5OpenStatus1.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5OpenTimer1.Value := T5OpenTimer1.Value + 1; //Запускаем счетчик выполнения алгоритма

if T5OpenTimer1.Value > 2 then  // Условие пуска звукового оповещения
if T5OpenTimer1.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T5BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5LatchStatusByte1.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T5LatchSelect1.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5AlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T5OpenTimer1.Value > 5 then // Условие пуска исполнительного механизма
if T5OpenTimer1.Value < 7 then
begin
T5LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T5LatchOpen1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte1.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T5OpenStatus1.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect1.Value := False; // Снимаем выбор задвижки
T5OpenTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 23-33 успешно открыта!', True, True);
end;

if T5OpenTimer1.Value > 9 + T5LatchCalOpenTime1.Value then // Условие остановки выполнения алгоритма по времени
begin
T5LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte1.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T5OpenStatus1.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect1.Value := False; // Снимаем выбор задвижки
T5OpenTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 5 Силос 23-33, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
