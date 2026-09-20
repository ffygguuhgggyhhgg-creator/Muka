begin
   L1_D1_Cmd.Value := 4;   
end.
VesRepValueButton_OnClick
var
  aReport: TM_Report;
begin
  aReport := ReportBuild('VesReport');
  aReport.View(GetClientName);            
end.
VesRepIntervalButton_OnClick
var
  aReport: TM_Report;
begin
  aReport := ReportBuild('VesReportInterval');
  aReport.View(GetClientName);
end.
