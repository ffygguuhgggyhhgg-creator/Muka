begin
if T6CalStatus4.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T6CalTimer4.Value := T6CalTimer4.Value + 1; //Запускаем счетчик выполнения алгоритма

if T6CalTimer4.Value > 2 then  // Условие пуска звукового оповещения
if T6CalTimer4.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T6LatchStatusByte4.Value = 3 then
 begin
 T6LatchCalOpenTime4.Value := 0;
 T6LatchCalCloseTime4.Value := 0;
 T6BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T6LatchStatusByte4.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T6LatchSelect4.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T6AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T6LatchStatusByte4.Value = 2 then
 begin
T6CloseStatus4.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 44 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T6CalStatus4.Value := False; // Останавливаем алгоритм калибровки
T6CalTimer4.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T6CalTimer4.Value > 5 then // Условие пуска исполнительного механизма
if T6CalTimer4.Value < 7 then
begin
T6LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T6CalTimer4.Value > 5 then // Условие счета времени открытия
if T6LatchRunOpen.AsBool = True then
begin
T6LatchCalOpenTime4.Value := T6LatchCalOpenTime4.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T6CalTimer4.Value > 5 then
if T6LatchOpen4.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T6CalTimer4.Value > 5 + T6LatchCalOpenTime4.Value then // Условие пуска исполнительного механизма
if T6CalTimer4.Value < 7 + T6LatchCalOpenTime4.Value then
begin
if T6LatchRunOpen.AsBool = False then
begin
T6LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 44 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T6CalTimer4.Value > 5 + T6LatchCalOpenTime4.Value then // Условие счета времени открытия
if T6LatchRunClose.AsBool = True then
begin
T6LatchCalCloseTime4.Value := T6LatchCalCloseTime4.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T6CalTimer4.Value > 5 + T6LatchCalOpenTime4.Value then
if T6LatchClose4.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte4.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T6CalStatus4.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect4.Value := False; // Снимаем выбор задвижки
T6CalTimer4.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 44 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;



if T6CalTimer4.Value > 600 then // предельное время калибровки, 10 мин
begin
T6LatchRunOpen.Value := False;
T6LatchRunClose.Value := False;
T6BlockSelectStatus.Value := False;
T6LatchStatusByte4.Value := 5;
T6CalStatus4.Value := False;
T6LatchSelect4.Value := False;
T6CalTimer4.Value := 0;
AddMessage(Now, mkAlarm , 'Калибровка задвижки прервана по предельному времени! Проверьте концевые выключатели.', True, True);
end;

end;
end.
