begin
if T7CalStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T7CalTimer6.Value := T7CalTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма

if T7CalTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T7CalTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T7LatchStatusByte6.Value = 3 then
 begin
 T7LatchCalOpenTime6.Value := 0;
 T7LatchCalCloseTime6.Value := 0;
 T7BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T7LatchStatusByte6.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T7LatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T7AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T7LatchStatusByte6.Value = 2 then
 begin
T7CloseStatus6.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 7 Силос 56 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T7CalStatus6.Value := False; // Останавливаем алгоритм калибровки
T7CalTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T7CalTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T7CalTimer6.Value < 7 then
begin
T7LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T7CalTimer6.Value > 5 then // Условие счета времени открытия
if T7LatchRunOpen.AsBool = True then
begin
T7LatchCalOpenTime6.Value := T7LatchCalOpenTime6.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T7CalTimer6.Value > 5 then
if T7LatchOpen6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T7LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T7CalTimer6.Value > 5 + T7LatchCalOpenTime6.Value then // Условие пуска исполнительного механизма
if T7CalTimer6.Value < 7 + T7LatchCalOpenTime6.Value then
begin
if T7LatchRunOpen.AsBool = False then
begin
T7LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 7 Силос 56 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T7CalTimer6.Value > 5 + T7LatchCalOpenTime6.Value then // Условие счета времени открытия
if T7LatchRunClose.AsBool = True then
begin
T7LatchCalCloseTime6.Value := T7LatchCalCloseTime6.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T7CalTimer6.Value > 5 + T7LatchCalOpenTime6.Value then
if T7LatchClose6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T7LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T7BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T7LatchStatusByte6.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T7CalStatus6.Value := False; // Останавливаем выполнение скрипта
T7LatchSelect6.Value := False; // Снимаем выбор задвижки
T7CalTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 7 Силос 56 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
