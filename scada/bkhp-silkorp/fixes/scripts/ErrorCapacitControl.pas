begin
 // Верхняя граница 100 убрана: при подаче >= 100 т/ч аларма не было вовсе,
 // а значение 34 ровно не обрабатывалось ни одной ветвью.
 if Capacity.Value > 34 then
 begin
   ErrorCapacityImage.Color := clRed;
   AddMessage(Now, mkAlarm, 'Слишком высокая подача на бункерные весы. Убавьте подачу!', True, True);
 end
 else
 begin
   ErrorCapacityImage.Color := clGray;
 end;
end.
