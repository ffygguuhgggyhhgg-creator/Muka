var
  aReport: TM_Report;
begin
  aReport := ReportBuild('VesReport');
  aReport.View(GetClientName);
end.
