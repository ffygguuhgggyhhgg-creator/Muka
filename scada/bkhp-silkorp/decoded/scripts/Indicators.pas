begin
      if L1_D1_S_Start.Value = 1 then
      begin
      StartImage.Color := ClGreen;
      end;
      if L1_D1_S_Start.Value = 0 then
      begin
      StartImage.Color := ClGray;
      end;
      if L1_D1_S_Stop.Value = 1 then
      begin
      StopImage.Color := ClRed;
      end;
      if L1_D1_S_Stop.Value = 0 then
      begin
      StopImage.Color := ClGray;
      end;
      if L1_D1_S_Pause.Value = 1 then
      begin
      PauseImage.Color := ClYellow;
      end;
      if L1_D1_S_Pause.Value = 0 then
      begin
      PauseImage.Color := ClGray;
      end;
      if L1_D1_S_Error.Value = 1 then
      begin
      ErrorImage.Color := ClRed;
      end;
      if L1_D1_S_Error.Value = 0 then
      begin
      ErrorImage.Color := ClGray;
      end;
      if LatchHighStatus.AsBool = True then
      begin
      LatchHighImage.Color := ClRed;
      LatchHighText.Text := "Закрыта";
      end;
      if LatchHighStatus.AsBool = False then
      begin
      LatchHighImage.Color := ClGreen;                       
      LatchHighText.Text := "Открыта";                            
      end;
      if LatchBottomStatus.AsBool = True then
      begin
      LatchBottomImage.Color := ClRed;             
      LatchBottomText.Text := "Закрыта";
      end;
      if LatchBottomStatus.AsBool = False then
      begin
      LatchBottomImage.Color := ClGreen;
      LatchBottomText.Text := "Открыта";
      end;
end.
