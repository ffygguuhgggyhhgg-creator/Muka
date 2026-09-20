begin
if T6CalStatus10.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T6CalTimer10.Value := T6CalTimer10.Value + 1; //Запускаем счетчик выполнения алгоритма

if T6CalTimer10.Value > 2 then  // Условие пуска звукового оповещения
if T6CalTimer10.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T6LatchStatusByte10.Value = 3 then
 begin
 T6LatchCalOpenTime10.Value := 0;
 T6LatchCalCloseTime10.Value := 0;
 T6BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T6LatchStatusByte10.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T6LatchSelect10.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T6AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T6LatchStatusByte10.Value = 2 then
 begin
T6CloseStatus10.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 50 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T6CalStatus10.Value := False; // Останавливаем алгоритм калибровки
T6CalTimer10.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T6CalTimer10.Value > 5 then // Условие пуска исполнительного механизма
if T6CalTimer10.Value < 7 then
begin
T6LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T6CalTimer10.Value > 5 then // Условие счета времени открытия
if T6LatchRunOpen.AsBool = True then
begin
T6LatchCalOpenTime10.Value := T6LatchCalOpenTime10.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T6CalTimer10.Value > 5 then
if T6LatchOpen10.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T6CalTimer10.Value > 5 + T6LatchCalOpenTime10.Value then // Условие пуска исполнительного механизма
if T6CalTimer10.Value < 7 + T6LatchCalOpenTime10.Value then
begin
if T6LatchRunOpen.AsBool = False then
begin
T6LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 50 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T6CalTimer10.Value > 5 + T6LatchCalOpenTime10.Value then // Условие счета времени открытия
if T6LatchRunClose.AsBool = True then
begin
T6LatchCalCloseTime10.Value := T6LatchCalCloseTime10.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T6CalTimer10.Value > 5 + T6LatchCalOpenTime10.Value then
if T6LatchClose10.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T6LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T6BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T6LatchStatusByte10.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T6CalStatus10.Value := False; // Останавливаем выполнение скрипта
T6LatchSelect10.Value := False; // Снимаем выбор задвижки
T6CalTimer10.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 6 Силос 50 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
