begin
if T7CloseStatus6.AsBool = True then //Если выполнен скрипт по нажатии на кнопку управления
begin
T7CloseTimer6.Value := T7CloseTimer6.Value + 1; //Запускаем счетчик выполнения алгоритма

if T7CloseTimer6.Value > 2 then  // Условие пуска звукового оповещения
if T7CloseTimer6.Value < 4 then  // Условие пуска звукового оповещения
 begin
 T7BlockSelectStatus.Value := True; // Блокируем управление задвижкой
 T7LatchStatusByte6.Value := 1; // Устанавливаем статус задвижки в "В работе"
 T7LatchSelect6.Value := True;  // Дискретный выход выбора задвижки для управления контроллером
 //T7AlarmStatus.Value := True; // Пуск звукового оповещения
 end;

if T7CloseTimer6.Value > 5 then // Условие пуска исполнительного механизма
if T7CloseTimer6.Value < 7 then
begin
T7LatchRunClose.Value := True // Дискретный выход управления задвижкой
end;

if T7LatchClose6.AsBool = True then // Условие остановки выполнения алгоритма по концевику
begin
T7LatchRunClose.Value := False;     // Дискретный выход управления задвижкой
T7BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T7LatchStatusByte6.Value := 2;   // Устанавливаем статус задвижки в "Открыта"
T7CloseStatus6.Value := False; // Останавливаем выполнение скрипта
T7LatchSelect6.Value := False; // Снимаем выбор задвижки
T7CloseTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkWarning , 'Задвижка Транспортера 7 Силос 56 успешно закрыта!', True, True);
end;

if T7CloseTimer6.Value > 9 + T7LatchCalCloseTime6.Value then // Условие остановки выполнения алгоритма по времени
begin
T7LatchRunClose.Value := False;   // Дискретный выход управления задвижкой
T7BlockSelectStatus.Value := False;  // Снимаем блокировку управления
T7LatchStatusByte6.Value := 5;      // Устанавливаем статус задвижки в "Авария"
T7CloseStatus6.Value := False; // Останавливаем выполнение скрипта
T7LatchSelect6.Value := False; // Снимаем выбор задвижки
T7CloseTimer6.Value := 0; //Останавливаем счетчик выполнения алгоритма
AddMessage(Now, mkAlarm , 'Авария задвижки Транспортера 7 Силос 56, проверьте работу концевого выключателя и произведите калибровку!', True, True);
end;

end;
end.
