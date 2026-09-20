begin
if T1CloseStatus1.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T1CloseTimer1.Value := T1CloseTimer1.Value + 1; //Запускаем счетчик выполнения алгоритма

if T1CloseTimer1.Value > 2 then  // Условие пуска звукового оповещения
if T1CloseTimer1.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T1BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T1LatchStatusByte1.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T1LatchSelect1.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T1AlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T1CloseTimer1.Value > 5 then // Условие пуска исполнительного механизма
if T1CloseTimer1.Value < 7 then
begin
T1LatchRunClose.Value := True // Дискретный выход управления задвижкой
end;

if T1LatchClose1.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T1LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte1.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T1CloseStatus1.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect1.Value := False; // Снимаем выбор задвижки
T1CloseTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 1 маршрут Т1-Т4 успешно закрыта!', True, True);
end;

if T1CloseTimer1.Value > 9 + T1LatchCalCloseTime1.Value then // Условие остановки выполнения алгоритма по времени
begin
T1LatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T1BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T1LatchStatusByte1.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T1CloseStatus1.Value := False; // Останавливаем выполнение скрипта
T1LatchSelect1.Value := False; // Снимаем выбор задвижки
T1CloseTimer1.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 1 маршрут Т1-Т4, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
