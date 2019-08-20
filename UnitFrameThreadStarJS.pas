unit UnitFrameThreadStarJS;

interface

uses
  Windows, Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWCompButton, Vcl.Forms, IWCompMemo, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWCompProgressBar, IWCompText;

type
  TIWFrameThreadStarsJS = class(TFrame)
    IWMonitor1: TIWMonitor;
    IWRegionFrame4: TIWRegion;
    IWProgressBar1: TIWProgressBar;
    IWText1: TIWText;
    IWButton1: TIWButton;
    IWLabel1: TIWLabel;
    procedure IWMonitor1AsyncEvent(Sender: TObject; EventParams: TStringList);
  private
    sessionweb: TIWApplication;
    csCriticalSection: TRTLCriticalSection;
    procedure DoMyAjaxFunc3(EventParams: TStringList);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function init(page: TIWAppForm; web: TIWApplication): string; // return name of function
  end;

implementation

{$R *.dfm}


// the javascript for stars came from somewhere on google, that i found long ago and not 100% sure
// who created it.  But it wasn't me.

constructor TIWFrameThreadStarsJS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InitializeCriticalSection(csCriticalSection);
end;

destructor TIWFrameThreadStarsJS.Destroy;
begin
  // cleanup stuff
  DeleteCriticalSection(csCriticalSection);
  inherited Destroy;
end;

function TIWFrameThreadStarsJS.init(page: TIWAppForm; web: TIWApplication): string;
const
  jsTag = '<script language="javascript" type="text/javascript">%s</script>';
var
  AjaxFunc3: string; // used for frame1
begin

  sessionweb := web;

  // this is copy paste of previous call so some extra "myData junk in here that is not being used
  // but could pass some info here if wanted

  AjaxFunc3 := 'function myAjaxFunc3() {' + #13 + 'var myData = "Item 1,Item 2,Item 3,Item 4";' + #13 +
    'executeAjaxEvent("", null,"' + UpperCase(Name) + '.DoMyAjaxFunc3", false, null, false);' + #13 + 'return true;}';
  page.PageContext.ExtraHeader.Add(Format(jsTag, [AjaxFunc3])); // add the formatted javascript call to page header
  web.RegisterCallBack(UpperCase(Name) + '.DoMyAjaxFunc3', DoMyAjaxFunc3);
  result := 'myAjaxFunc3();'; // return this for javascript usage


  // hook the result from this function, to the button in this frame.
  // probably not best way to do things but it works

  IWButton1.ScriptEvents.HookEvent('onClick', result);

  // defer loading of the stars.js script to run

  page.PageContext.ExtraHeader.Add('<script defer src="stars.js"></script>');

end;

procedure TIWFrameThreadStarsJS.DoMyAjaxFunc3(EventParams: TStringList);
begin
  IWMonitor1.Enabled := true; // this was an AJAX function hooked to run via buttons onClick javascript method
  IWMonitor1.Active := true;
  IWButton1.Enabled := false;
  IWProgressBar1.Percent := 0; // reset!

  // IWMonitor does not have a timeout event... been requested.
  // IWMonitor does not do super great when you have 2 or more on a form / frame
  // as you could be in state where both of them set the webapplication.Status.Value
  // so you may need to make it so one monitor handles all threads.
  // or a way to insure status.value is set.... intercepted by iwmonitor... work done
  // and then the next guy to set webapplication.status.value can set its value
  // and have its own iwmonitor pick it up... ect...
  // with maybe some kind of failover if it didnt get picked up by the iwmonitor which is just a ajax fancy timer

  tthread.CreateAnonymousThread( // do some busy work in a thread, background work
    procedure
    var
      x: integer;
    begin
      for x := 1 to 11 do
      begin
        sleep(1000);
        EnterCriticalSection(csCriticalSection);
        sessionweb.Status.Value := 100; // value for webapplicaiton status for iwMonitor to pickup on
        // i dont think really need critical sections, at least not in this demo
        // but its good to have once you start doing complex stuff
        // so just leaving them here cause why not
        LeaveCriticalSection(csCriticalSection);
      end;
    end).Start;
end;

procedure TIWFrameThreadStarsJS.IWMonitor1AsyncEvent(Sender: TObject; EventParams: TStringList);
begin
  if IWProgressBar1.Percent >= 100 then
  begin
    IWMonitor1.Active := false; // we are done, so stop
    IWMonitor1.Enabled := false;
    IWButton1.Enabled := true;
  end
  else
  begin
    IWProgressBar1.Percent := IWProgressBar1.Percent + 10;
    IWMonitor1.Active := true; // if not done, turn the monitor again to keep going
    IWMonitor1.Enabled := true;
  end;
  sessionweb.Status.Value := 0; // reset status back to 0
end;

end.
