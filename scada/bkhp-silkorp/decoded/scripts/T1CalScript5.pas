begin
if T1CalStatus5.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T1CalTimer5.Value := T1CalTimer5.Value + 1; //Запускаем счетчик выполнения алгоритма

if T1CalTimer5.Value > 2 then  // Условие пуска звукового оповещения
if T1CalTimer5.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T1LatchStatusByte5.Value = 3 then
 begin
 T1LatchCalOpenTime5.Value := 0;
 T1LatchCalCloseTime5.Value := 0;
 T1BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T1LatchStatusByte5.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T1LatchSelect5.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T1AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T1LatchStatusByte5.Value = 2 then
 begin
T1CloseStatus5.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 2 маршрут Т2-Т4 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T1CalStatus5.Value := False; // Останавливаем алгоритм калибровки
T1CalTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T1CalTimer5.Value > 5 then // Условие пуска исполнительного механизма
if T1CalTimer5.Value < 7 then
begin
T1LatchRunOpen.Value := True; // Дискретный выход управления задвижкой
T1LatchCalOpenTime5.Value := T1LatchCalOpenTime5.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T1CalTimer5.Value > 5 then // Условие счета времени открытия
if T1LatchRunOpen.AsBool = True then
begin
T1LatchCalOpenTime5.Value := T1LatchCalOpenTime5.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T1CalTimer5.Value > 5 then
if T1LatchOpen5.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T1CalTimer5.Value > 5 + T1LatchCalOpenTime5.Value then // Условие пуска исполнительного механизма
if T1CalTimer5.Value < 7 + T1LatchCalOpenTime5.Value then
begin
if T1LatchRunOpen.AsBool = False then
begin
T1LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 2 маршрут Т2-Т4 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T1CalTimer5.Value > 5 + T1LatchCalOpenTime5.Value then // Условие счета времени открытия
if T1LatchRunClose.AsBool = True then
begin
T1LatchCalCloseTime5.Value := T1LatchCalCloseTime5.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T1CalTimer5.Value > 5 + T1LatchCalOpenTime5.Value then
if T1LatchClose5.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte5.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T1CalStatus5.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect5.Value := False; // Снимаем выбор задвижки
T1CalTimer5.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 2 маршрут Т2-Т4 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
