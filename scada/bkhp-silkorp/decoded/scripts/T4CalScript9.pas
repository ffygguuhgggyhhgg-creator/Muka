begin
if T4CalStatus9.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4CalTimer9.Value := T4CalTimer9.Value + 1; //Запускаем счетчик выполнения алгоритма

if T4CalTimer9.Value > 2 then  // Условие пуска звукового оповещения
if T4CalTimer9.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T4LatchStatusByte9.Value = 3 then
 begin
 T4LatchCalOpenTime9.Value := 0;
 T4LatchCalCloseTime9.Value := 0;
 T4BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4LatchStatusByte9.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T4LatchSelect9.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T4LatchStatusByte9.Value = 2 then
 begin
T4CloseStatus9.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 9-19 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T4CalStatus9.Value := False; // Останавливаем алгоритм калибровки
T4CalTimer9.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T4CalTimer9.Value > 5 then // Условие пуска исполнительного механизма
if T4CalTimer9.Value < 7 then
begin
T4LatchRunOpen.Value := True; // Дискретный выход управления задвижкой
T4LatchCalOpenTime9.Value := T4LatchCalOpenTime9.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T4CalTimer9.Value > 5 then // Условие счета времени открытия
if T4LatchRunOpen.AsBool = True then
begin
T4LatchCalOpenTime9.Value := T4LatchCalOpenTime9.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T4CalTimer9.Value > 5 then
if T4LatchOpen9.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T4CalTimer9.Value > 5 + T4LatchCalOpenTime9.Value then // Условие пуска исполнительного механизма
if T4CalTimer9.Value < 7 + T4LatchCalOpenTime9.Value then
begin
if T4LatchRunOpen.AsBool = False then
begin
T4LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 9-19 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T4CalTimer9.Value > 5 + T4LatchCalOpenTime9.Value then // Условие счета времени открытия
if T4LatchRunClose.AsBool = True then
begin
T4LatchCalCloseTime9.Value := T4LatchCalCloseTime9.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T4CalTimer9.Value > 5 + T4LatchCalOpenTime9.Value then
if T4LatchClose9.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte9.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T4CalStatus9.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect9.Value := False; // Снимаем выбор задвижки
T4CalTimer9.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 9-19 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
