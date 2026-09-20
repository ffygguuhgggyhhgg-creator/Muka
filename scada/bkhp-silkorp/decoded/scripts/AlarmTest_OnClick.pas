begin
 if Alarm16Level.AsBool = True then    // Если выход модуля для включения сигнализации активен
 if Alarm1Level.AsBool = True then    // Если выход модуля для включения сигнализации активен
 begin
     Alarm16Level.Value := False;  // Деактивация выхода модуля для сигнализации
     Alarm1Level.Value := False;  // Деактивация выхода модуля для сигнализации
 end
   else
   Alarm16Level.Value := True;
  Alarm1Level.Value := True;
end.
