begin
if T5ClapCalStatus1.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T5ClapCalTimer1.Value := T5ClapCalTimer1.Value + 1; //Запускаем счетчик выполнения алгоритма

if T5ClapCalTimer1.Value > 2 then  // Условие пуска звукового оповещения
if T5ClapCalTimer1.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T5ClapLatchStatusByte1.Value = 3 then
 begin
 T5ClapLatchCalOpenTime1.Value := 0;
 T5ClapLatchCalCloseTime1.Value := 0;
 T5ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T5ClapLatchStatusByte1.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T5ClapLatchSelect1.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T5ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T5ClapLatchStatusByte1.Value = 2 then
 begin
T5ClapCloseStatus1.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Клапан Транспортера 5 не в позиции Силос 33! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T5ClapCalStatus1.Value := False; // Останавливаем алгоритм калибровки
T5ClapCalTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T5ClapCalTimer1.Value > 5 then // Условие пуска исполнительного механизма
if T5ClapCalTimer1.Value < 7 then
begin
T5ClapLatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T5ClapCalTimer1.Value > 5 then // Условие счета времени открытия
if T5ClapLatchRunOpen.AsBool = True then
begin
T5ClapLatchCalOpenTime1.Value := T5ClapLatchCalOpenTime1.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T5ClapCalTimer1.Value > 5 then
if T5ClapLatchOpen1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5ClapLatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T5ClapCalTimer1.Value > 5 + T5ClapLatchCalOpenTime1.Value then // Условие пуска исполнительного механизма
if T5ClapCalTimer1.Value < 7 + T5ClapLatchCalOpenTime1.Value then
begin
if T5ClapLatchRunOpen.AsBool = False then
begin
T5ClapLatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Клапан Транспортера 5 в Силос 23 успешно переброшен при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T5ClapCalTimer1.Value > 5 + T5ClapLatchCalOpenTime1.Value then // Условие счета времени открытия
if T5ClapLatchRunClose.AsBool = True then
begin
T5ClapLatchCalCloseTime1.Value := T5ClapLatchCalCloseTime1.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T5ClapCalTimer1.Value > 5 + T5ClapLatchCalOpenTime1.Value then
if T5ClapLatchClose1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T5ClapLatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T5ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T5ClapLatchStatusByte1.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T5ClapCalStatus1.Value := False; // Останавливаем выполнение скрипта
T5ClapLatchSelect1.Value := False; // Снимаем выбор задвижки
T5ClapCalTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 5 в Силос 33 успешно переброшен при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
