begin
if T4ClapOpenStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T4ClapOpenTimer6.Value := T4ClapOpenTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма

if T4ClapOpenTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T4ClapOpenTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T4ClapBlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T4ClapLatchStatusByte6.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T4ClapLatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T4ClapAlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T4ClapOpenTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T4ClapOpenTimer6.Value < 7 then
begin
T4ClapLatchRunOpen.Value := True // Дискретный выход управления задвижкой
end;

if T4ClapLatchOpen6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T4ClapLatchRunOpen.Value := False;     // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte6.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T4ClapOpenStatus6.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect6.Value := False; // Снимаем выбор задвижки
T4ClapOpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Клапан Транспортера 4 в Силос 6 успешно переброшен!', True, True);
end;

if T4ClapOpenTimer6.Value > 9 + T4ClapLatchCalOpenTime6.Value then // Условие остановки выполнения алгоритма по времени
begin
T4ClapLatchRunOpen.Value := False;   // Дискретный выход управления задвижкой
T4ClapBlockSelectStatus.Value := False;  // Снимаем блокировку управления
T4ClapLatchStatusByte6.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T4ClapOpenStatus6.Value := False; // Останавливаем выполнение скрипта
T4ClapLatchSelect6.Value := False; // Снимаем выбор задвижки
T4ClapOpenTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария клапана Транспортера 4 Силос 6-16, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
