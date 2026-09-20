begin
if T4OpenStatus3.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4OpenTimer3.Value := T4OpenTimer3.Value + 1; //Запускаем счетчик выполнения алгоритма

if T4OpenTimer3.Value > 2 then  // Условие пуска звукового оповещения
if T4OpenTimer3.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T4BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4LatchStatusByte3.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T4LatchSelect3.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4AlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T4OpenTimer3.Value > 5 then // Условие пуска исполнительного механизма
if T4OpenTimer3.Value < 7 then
begin
T4LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T4LatchOpen3.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte3.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T4OpenStatus3.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect3.Value := False; // Снимаем выбор задвижки
T4OpenTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 3-13 успешно открыта!', True, True);
end;

if T4OpenTimer3.Value > 9 + T4LatchCalOpenTime3.Value then // Условие остановки выполнения алгоритма по времени
begin
T4LatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte3.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T4OpenStatus3.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect3.Value := False; // Снимаем выбор задвижки
T4OpenTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 4 Силос 3-13, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
