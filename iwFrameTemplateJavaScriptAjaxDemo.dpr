program iwFrameTemplateJavaScriptAjaxDemo;

{$R *.dres}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  Forms,
  IWStart,
  frmMain in 'frmMain.pas' {IWMainForm: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  UnitFrameMemo in 'UnitFrameMemo.pas' {IWFrame1Memo: TFrame},
  UnitFrameAsyncGrid in 'UnitFrameAsyncGrid.pas' {IWFrameAsyncUpdateGrid: TFrame},
  UnitFrameAsyncTimerGrid in 'UnitFrameAsyncTimerGrid.pas' {IWFrameAsyncTimerGrid: TFrame},
  UnitFrameThreadStarJS in 'UnitFrameThreadStarJS.pas' {IWFrameThreadStarsJS: TFrame},
  frmLoading in 'frmLoading.pas' {IWLoadingForm: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
