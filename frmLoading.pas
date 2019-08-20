unit frmLoading;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, frmMain ;

type
  TIWLoadingForm = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWTimer1: TIWTimer;
    procedure IWTimer1AsyncTimer(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

// we use a CSS file and some HTML trickery for fancy loading page
// found it somewhere online a while back but forget where.

// this kind of css/html magic was not by me.

// then we use a template

//// Self.StyleSheet.URL = TIWLoadingForm.css    - in wwwroot
//// self.IWTemplateProcessorHTML1.Templates.Default = TIWLoadingForm.html    - in templates folder

procedure TIWLoadingForm.IWAppFormCreate(Sender: TObject);
begin
 iwtimer1.Interval := 10000; // 10 seconds to wait... i have no idea how to insure the animation got "finished" before moving on
 iwtimer1.Enabled := true;
end;

procedure TIWLoadingForm.IWTimer1AsyncTimer(Sender: TObject; EventParams: TStringList);
begin
 iwtimer1.Enabled := false;
 TIWMainForm.Create(webapplication).Show;
 release;
end;

initialization

TIWLoadingForm.SetAsMainForm;


end.
