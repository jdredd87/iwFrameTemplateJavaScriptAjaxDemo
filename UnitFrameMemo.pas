unit UnitFrameMemo;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWCompButton, Vcl.Forms, IWCompMemo, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML;

type

  TIWFrame1Memo = class(TFrame)
    IWRegionFrame1: TIWRegion;
    IWMemo1: TIWMemo;
    IWLabel1: TIWLabel;
  private
  public
    procedure DoMyAjaxFunc(EventParams: TStringList);
    function init(page:TIWAppForm;web:TIWApplication):string; // return name of function
  end;

implementation

{$R *.dfm}

function TIWFrame1Memo.init(page:TIWAppForm;web:TIWApplication):string;
const
  jsTag = '<script language="javascript" type="text/javascript">%s</script>';
var
  AjaxFunc1: string; // used for frame1
begin
 // javascript call to create a variable called "myData" with a comma delimited string to
 // be passed to the DoMyAjaxFunc call that will be registed.
  AjaxFunc1 := 'function myAjaxFunc() {' + #13 + 'var myData = "Item 1,Item 2,Item 3,Item 4";' + #13 +
    'executeAjaxEvent("&data="+myData, null,"' + UpperCase(Self.Name) + '.DoMyAjaxFunc", false, null, false);' + #13 +
    'return true;}';
  page.PageContext.ExtraHeader.Add(Format(jsTag, [AjaxFunc1])); // add the formatted javascript call to page header
  web.RegisterCallBack(UpperCase(Self.Name) + '.DoMyAjaxFunc', DoMyAjaxFunc); // register the AJAX call back as DoMyAjaxFunc, and associate it with our frame 1 object, IWFrame21.DoMyAjaxFunc
  result := 'myAjaxFunc();'; // return this for javascript usage
end;

procedure TIWFrame1Memo.DoMyAjaxFunc(EventParams: TStringList);
var
  sl: TStrings;
  s: string;
begin
  // javascript from Unit1 is passing parameters to show here
  // the TStringList will split them up
  // and show them in the Memo Control

  sl := TStringList.Create;
  try
    sl.StrictDelimiter := True;
    sl.CommaText := EventParams.Values['data'];
    s := sl.CommaText;
  finally
    sl.Free;
  end;
  IWMemo1.Lines.Add(datetimetostr(now) + ' : ' + s);
end;

end.
