begin
if T5CalStatus5.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5CalTimer5.Value := T5CalTimer5.Value + 1; //Запускаем счетчик выполнения алгоритма

if T5CalTimer5.Value > 2 then  // Условие пуска звукового оповещения
if T5CalTimer5.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T5LatchStatusByte5.Value = 3 then
 begin
 T5LatchCalOpenTime5.Value := 0;
 T5LatchCalCloseTime5.Value := 0;
 T5BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5LatchStatusByte5.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T5LatchSelect5.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T5LatchStatusByte5.Value = 2 then
 begin
T5CloseStatus5.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 27-37 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T5CalStatus5.Value := False; // Останавливаем алгоритм калибровки
T5CalTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T5CalTimer5.Value > 5 then // Условие пуска исполнительного механизма
if T5CalTimer5.Value < 7 then
begin
T5LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T5CalTimer5.Value > 5 then // Условие счета времени открытия
if T5LatchRunOpen.AsBool = True then
begin
T5LatchCalOpenTime5.Value := T5LatchCalOpenTime5.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T5CalTimer5.Value > 5 then
if T5LatchOpen5.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T5CalTimer5.Value > 5 + T5LatchCalOpenTime5.Value then // Условие пуска исполнительного механизма
if T5CalTimer5.Value < 7 + T5LatchCalOpenTime5.Value then
begin
if T5LatchRunOpen.AsBool = False then
begin
T5LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 27-37 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T5CalTimer5.Value > 5 + T5LatchCalOpenTime5.Value then // Условие счета времени открытия
if T5LatchRunClose.AsBool = True then
begin
T5LatchCalCloseTime5.Value := T5LatchCalCloseTime5.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T5CalTimer5.Value > 5 + T5LatchCalOpenTime5.Value then
if T5LatchClose5.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T5BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5LatchStatusByte5.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T5CalStatus5.Value := False; // Останавливаем выполнение скрипта
T5LatchSelect5.Value := False; // Снимаем выбор задвижки
T5CalTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 5 Силос 27-37 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;



if T5CalTimer5.Value > 600 then // предельное время калибровки, 10 мин
begin
T5LatchRunOpen.Value := False;
T5LatchRunClose.Value := False;
T5BlockSelectStatus.Value := False;
T5LatchStatusByte5.Value := 5;
T5CalStatus5.Value := False;
T5LatchSelect5.Value := False;
T5CalTimer5.Value := 0;
AddMessage(Now, mkAlarm , 'Калибровка задвижки прервана по предельному времени! Проверьте концевые выключатели.', True, True);
end;

end;
end.
