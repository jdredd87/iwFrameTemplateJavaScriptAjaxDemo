unit frmMain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWCompButton,  Vcl.Forms,  IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML, UnitFrameMemo, UnitFrameAsyncGrid,
  UnitFrameAsyncTimerGrid, UnitFrameThreadStarJS;

type
  TIWMainForm = class(TIWAppForm)
    btn_DoFrame1Work: TIWButton;
    btn_DoFrame2Work: TIWButton;
    frame1: TIWFrame1Memo;
    frame2: TIWFrameAsyncUpdateGrid;
    frame3: TIWFrameAsyncTimerGrid;
    frame4: TIWFrameThreadStarsJS;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

// we are using a template here
// TIWMainForm.html

// these are the strings intraweb looks for to shoe horn objects into the templates.
// as can see for frames to objects its framename+Object name... so frame1IWRegionFrame1 is
// frame1 name we specified here + IWRegionFrame1 inside frame1 ...
// the two buttons here reference the buttons on this form.

// {%frame1IWRegionFrame1%}
// {%btn_DoFrame1Work%}
// {%frame2IWRegionFrame2%}
// {%btn_DoFrame2Work%}
// {%frame3IWRegionFrame3%}
// {%frame4IWRegionFrame4%}

procedure TIWMainForm.IWAppFormCreate(Sender: TObject);
var
  AjaxFunc1: string;
  AjaxFunc2: string;
begin


  // custom init function. To pass "self" and "webapplication" of this instance to the frame object.
  // as the frames don't know apparently this information

  AjaxFunc1 := frame1.init(self,webapplication); // my init function returns some javascript
  btn_DoFrame1Work.ScriptEvents.HookEvent('onClick', AjaxFunc1); // hook button to event, using javascript from before

  // could bypass having the variables ajaxfunc1 and ajaxfunc2, and pass the frame1.init at thend of the hook call
  // but makes it bit easier to look over the return response and get better idea whats going on during debugging.

  AjaxFunc2 := frame2.init(self,webapplication); // same as above
  btn_DoFrame2Work.ScriptEvents.HookEvent('onClick', AjaxFunc2);


  // frame 3 don't need to do anything here... doesn't call back to this self/form or webapplication
  // does not even have an init call added to it

  frame4.init(self,webapplication); // just need to pass self/webapplicaiton... no button on main form to hook

end;

end.
