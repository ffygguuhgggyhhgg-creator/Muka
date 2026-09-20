begin
if T4ClapCalStatus2.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4ClapCalTimer2.Value := T4ClapCalTimer2.Value + 1; //Запускаем счетчик выполнения алгоритма

if T4ClapCalTimer2.Value > 2 then  // Условие пуска звукового оповещения
if T4ClapCalTimer2.Value < 4 then  // Условие пуска звукового оповещения
 begin
 if T4ClapLatchStatusByte2.Value = 3 then
 begin
 T4ClapLatchCalOpenTime2.Value := 0;
 T4ClapLatchCalCloseTime2.Value := 0;
 T4ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4ClapLatchStatusByte2.Value := 4; // Устанавливаем статус задвижки в "Калибровка"
 T4ClapLatchSelect2.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;
 if T4ClapLatchStatusByte2.Value = 2 then
 begin
T4ClapCloseStatus2.Value := True; // Запускаем алгоритм закрытия задвижки
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 не в позиции Силос 12! Повторите команду калибровки после автоматического закрытия задвижки!', True, True);
T4ClapCalStatus2.Value := False; // Останавливаем алгоритм калибровки
T4ClapCalTimer2.Value := 0; //Останавливаем счетчик выполнения алгоритма
 end;
 end;

if T4ClapCalTimer2.Value > 5 then // Условие пуска исполнительного механизма
if T4ClapCalTimer2.Value < 7 then
begin
T4ClapLatchRunOpen.Value := True; // Дискретный выход управления задвижкой
T4ClapLatchCalOpenTime2.Value := T4ClapLatchCalOpenTime2.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T4ClapCalTimer2.Value > 5 then // Условие счета времени открытия
if T4ClapLatchRunOpen.AsBool = True then
begin
T4ClapLatchCalOpenTime2.Value := T4ClapLatchCalOpenTime2.Value + 1; // Начинаем счет времени открытия задвижки
end;

if T4ClapCalTimer2.Value > 5 then
if T4ClapLatchOpen2.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4ClapLatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
end;

if T4ClapCalTimer2.Value > 5 + T4ClapLatchCalOpenTime2.Value then // Условие пуска исполнительного механизма
if T4ClapCalTimer2.Value < 7 + T4ClapLatchCalOpenTime2.Value then
begin
if T4ClapLatchRunOpen.AsBool = False then
begin
T4ClapLatchRunClose.Value := True;     // Дискретный выход управления задвижкой
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 2 успешно переброшен при калибровке! Переход к расчету времени закрытия', True, True);
end;
end;

if T4ClapCalTimer2.Value > 5 + T4ClapLatchCalOpenTime2.Value then // Условие счета времени открытия
if T4ClapLatchRunClose.AsBool = True then
begin
T4ClapLatchCalCloseTime2.Value := T4ClapLatchCalCloseTime2.Value + 1; // Начинаем счет времени закрытия задвижки
end;

if T4ClapCalTimer2.Value > 5 + T4ClapLatchCalOpenTime2.Value then
if T4ClapLatchClose2.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4ClapLatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte2.Value := 3;      // Устанавливаем статус задвижки в "Закрыта"
T4ClapCalStatus2.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect2.Value := False; // Снимаем выбор задвижки
T4ClapCalTimer2.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 12 успешно переброшен при калибровке! Калибровка выполнена!', True, True);
end;


end;
end.
