var
  aReport: TM_Report;
begin
  aReport := ReportBuild('VesReportInterval');
  aReport.View(GetClientName);
end.
