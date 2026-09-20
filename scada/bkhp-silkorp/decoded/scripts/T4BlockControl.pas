begin
//if BlockControl.AsBool = True then
//begin
// if LineReversT1.Color = clGreen then
// begin
// if LineT1Latch1.Color = clGreen then
// begin
// if ImageT4_1.Color = clRed then
// begin
// AddMessage(Now, mkAlarm, 'T4 отключен в маршруте Т1-Т4. Т1 будет отключен. Проверьте конфигурацию маршрута!', True, True);
// команда на выключение механизма
//   if RelayOutForwardT1.AsBool = True then
//   begin
////   StatusStartForwardT1.Value := 1;
//   RelayOutForwardT1.Value := False; // деактивация выхода контроллера
//   end;
//   if RelayOutReversT1.AsBool = True then
//   begin
//   StatusStartReversT1.Value := 1;
//   RelayOutReversT1.Value := False; // деактивация выхода контроллера
//   end;

//if StatusStartForwardT1.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartForwardT1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;
//if StatusStartReversT1.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartReversT1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;

//AddMessage(Now, mkAlarm, 'T4 отключен в маршруте Т1-Т4. Нория 1 будет отключена. Проверьте конфигурацию маршрута!!', True, True);
// команда на выключение механизма
//if RelayOutN1.AsBool = True then // проверка механизм включен через компьютер управления
//   begin
//   StatusStartN1.Value := 1;
//   RelayOutN1.Value := False // деактивация выхода контроллера
//   end;
//if StatusStartN1.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartN1.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;


// end;
// end;
// end;


// if LineForwardT1.Color = clGreen then
// begin
// if LineT1Latch5.Color = clGreen then
// begin
// if ImageT4_1.Color = clRed then
// begin
// AddMessage(Now, mkAlarm, 'T4 отключен в маршруте Т2-Т4. Т2 будет отключен. Проверьте конфигурацию маршрута!', True, True);
// команда на выключение механизма
//   if RelayOutForwardT2.AsBool = True then
//   begin
//   StatusStartForwardT2.Value := 1;
//   RelayOutForwardT2.Value := False; // деактивация выхода контроллера
//   end;
//   if RelayOutReversT2.AsBool = True then
//   begin
//   StatusStartReversT2.Value := 1;
//   RelayOutReversT2.Value := False; // деактивация выхода контроллера
//   end;

//if StatusStartForwardT2.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartForwardT2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;
//if StatusStartReversT2.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartReversT2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;
//
//AddMessage(Now, mkAlarm, 'T4 отключен в маршруте Т2-Т4. Нория 2 будет отключена. Проверьте конфигурацию маршрута!!', True, True);
// команда на выключение механизма
//if RelayOutN2.AsBool = True then // проверка механизм включен через компьютер управления
//   begin
//   StatusStartN2.Value := 1;
//   RelayOutN2.Value := False // деактивация выхода контроллера
//   end;
//   if StatusStartN2.AsInt = 5 then // проверка наличия комманды на включение механизма
//begin
//StatusStartN2.Value := 6;  // если комманда на включение активна, то производится отмена запуска
//end;
// end;
// end;
// end;
//
//end;
end.
