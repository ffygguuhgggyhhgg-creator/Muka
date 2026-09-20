begin
 if (Alarm16Level.AsBool = True) and (Alarm1Level.AsBool = True) then
 begin
     Alarm16Level.Value := False;  // Деактивация выхода модуля для сигнализации
     Alarm1Level.Value := False;   // Деактивация выхода модуля для сигнализации
 end
 else
 begin
     Alarm16Level.Value := True;
     Alarm1Level.Value := True;
 end;
end.
