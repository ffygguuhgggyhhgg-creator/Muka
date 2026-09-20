begin
      if L1_D1_S_Start.AsBool = True then
      begin
      StartImage.Color := ClGreen;
      end;
      if L1_D1_S_Start.AsBool = False then
      begin
      StartImage.Color := ClGray;
      end;

      if L1_D1_S_Stop.AsBool = True then
      begin
      StopImage.Color := ClRed;
      end;
      if L1_D1_S_Stop.AsBool = False then
      begin
      StopImage.Color := ClGray;
      end;

      if L1_D1_S_Pause.AsBool = True then
      begin
      PauseImage.Color := ClYellow;
      end;
      if L1_D1_S_Pause.AsBool = False then
      begin
      PauseImage.Color := ClGray;
      end;

      if L1_D1_S_Error.AsBool = True then
      begin
      ErrorImage.Color := ClRed;
      end;
      if L1_D1_S_Error.AsBool = False then
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
      Capacity.Value := 0;
end.
