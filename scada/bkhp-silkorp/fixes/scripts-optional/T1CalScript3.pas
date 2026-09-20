begin
if T1CalStatus3.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T1CalTimer3.Value := T1CalTimer3.Value + 1; //Запускаем счетчик выполнения алгоритма

if T1CalTimer3.Value > 2 then  // Условие пуска звукового оповещения
if T1CalTimer3.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T1LatchStatusByte3.Value = 3 then
 begin
 T1LatchCalOpenTime3.Value := 0;
 T1LatchCalCloseTime3.Value := 0;
 T1BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T1LatchStatusByte3.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T1LatchSelect3.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T1AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T1LatchStatusByte3.Value = 2 then
 begin
T1CloseStatus3.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 1 маршрут Т1-Т6 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T1CalStatus3.Value := False; // Останавливаем алгоритм калибровки
T1CalTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T1CalTimer3.Value > 5 then // Условие пуска исполнительного механизма
if T1CalTimer3.Value < 7 then
begin
T1LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T1CalTimer3.Value > 5 then // Условие счета времени открытия
if T1LatchRunOpen.AsBool = True then
begin
T1LatchCalOpenTime3.Value := T1LatchCalOpenTime3.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T1CalTimer3.Value > 5 then
if T1LatchOpen3.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T1CalTimer3.Value > 5 + T1LatchCalOpenTime3.Value then // Условие пуска исполнительного механизма
if T1CalTimer3.Value < 7 + T1LatchCalOpenTime3.Value then
begin
if T1LatchRunOpen.AsBool = False then
begin
T1LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 1 маршрут Т1-Т6 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T1CalTimer3.Value > 5 + T1LatchCalOpenTime3.Value then // Условие счета времени открытия
if T1LatchRunClose.AsBool = True then
begin
T1LatchCalCloseTime3.Value := T1LatchCalCloseTime3.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T1CalTimer3.Value > 5 + T1LatchCalOpenTime3.Value then
if T1LatchClose3.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte3.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T1CalStatus3.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect3.Value := False; // Снимаем выбор задвижки
T1CalTimer3.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 1 маршрут Т1-Т6 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;



if T1CalTimer3.Value > 600 then // предельное время калибровки, 10 мин
begin
T1LatchRunOpen.Value := False;
T1LatchRunClose.Value := False;
T1BlockSelectStatus.Value := False;
T1LatchStatusByte3.Value := 5;
T1CalStatus3.Value := False;
T1LatchSelect3.Value := False;
T1CalTimer3.Value := 0;
AddMessage(Now, mkAlarm , 'Калибровка задвижки прервана по предельному времени! Проверьте концевые выключатели.', True, True);
end;

end;
end.
