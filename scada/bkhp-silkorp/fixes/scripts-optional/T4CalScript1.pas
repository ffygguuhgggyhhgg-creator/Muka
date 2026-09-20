begin
if T4CalStatus1.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4CalTimer1.Value := T4CalTimer1.Value + 1; //Запускаем счетчик выполнения алгоритма

if T4CalTimer1.Value > 2 then  // Условие пуска звукового оповещения
if T4CalTimer1.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T4LatchStatusByte1.Value = 3 then
 begin
 T4LatchCalOpenTime1.Value := 0;
 T4LatchCalCloseTime1.Value := 0;
 T4BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4LatchStatusByte1.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T4LatchSelect1.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4AlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T4LatchStatusByte1.Value = 2 then
 begin
T4CloseStatus1.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 1-11 не закрыта! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T4CalStatus1.Value := False; // Останавливаем алгоритм калибровки
T4CalTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T4CalTimer1.Value > 5 then // Условие пуска исполнительного механизма
if T4CalTimer1.Value < 7 then
begin
T4LatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T4CalTimer1.Value > 5 then // Условие счета времени открытия
if T4LatchRunOpen.AsBool = True then
begin
T4LatchCalOpenTime1.Value := T4LatchCalOpenTime1.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T4CalTimer1.Value > 5 then
if T4LatchOpen1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T4CalTimer1.Value > 5 + T4LatchCalOpenTime1.Value then // Условие пуска исполнительного механизма
if T4CalTimer1.Value < 7 + T4LatchCalOpenTime1.Value then
begin
if T4LatchRunOpen.AsBool = False then
begin
T4LatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 1-11 успешно открыта при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T4CalTimer1.Value > 5 + T4LatchCalOpenTime1.Value then // Условие счета времени открытия
if T4LatchRunClose.AsBool = True then
begin
T4LatchCalCloseTime1.Value := T4LatchCalCloseTime1.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T4CalTimer1.Value > 5 + T4LatchCalOpenTime1.Value then
if T4LatchClose1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T4BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4LatchStatusByte1.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T4CalStatus1.Value := False; // Останавливаем выполнение скрипта
T4LatchSelect1.Value := False; // Снимаем выбор задвижки
T4CalTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 4 Силос 1-11 успешно закрыта при калибровке! Калибровка выполнена!', True, True);
end;



if T4CalTimer1.Value > 600 then // предельное время калибровки, 10 мин
begin
T4LatchRunOpen.Value := False;
T4LatchRunClose.Value := False;
T4BlockSelectStatus.Value := False;
T4LatchStatusByte1.Value := 5;
T4CalStatus1.Value := False;
T4LatchSelect1.Value := False;
T4CalTimer1.Value := 0;
AddMessage(Now, mkAlarm , 'Калибровка задвижки прервана по предельному времени! Проверьте концевые выключатели.', True, True);
end;

end;
end.
