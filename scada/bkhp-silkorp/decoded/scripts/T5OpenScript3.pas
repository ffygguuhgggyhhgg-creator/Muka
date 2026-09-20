begin
if T5OpenStatus3.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5OpenTimer3.Value := T5OpenTimer3.Value + 1; //Запускаем счетчик выполнения алгоритма

if T5OpenTimer3.Value > 2 then  // Условие пуска звукового оповещения
if T5OpenTimer3.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T5BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5LatchStatusByte3.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T5LatchSelect3.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5AlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T5OpenTimer3.Value > 5 then // Условие пуска исполнительного механизма
if T5OpenTimer3.Value < 7 then
begin
T5LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T5LatchOpen3.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte3.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T5OpenStatus3.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect3.Value := False; // Снимаем выбор задвижки
T5OpenTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 25-35 успешно открыта!', True, True);
end;

if T5OpenTimer3.Value > 9 + T5LatchCalOpenTime3.Value then // Условие остановки выполнения алгоритма по времени
begin
T5LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte3.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T5OpenStatus3.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect3.Value := False; // Снимаем выбор задвижки
T5OpenTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 5 Силос 25-35, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
