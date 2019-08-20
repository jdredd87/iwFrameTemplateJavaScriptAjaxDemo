unit UnitFrameAsyncGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWCompButton, Vcl.Forms, IWCompMemo, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWCompGrids;


type
  TIWFrameAsyncUpdateGrid  = class(TFrame)
    IWRegionFrame2: TIWRegion;
    IWGrid1: TIWGrid;
    IWLabel1: TIWLabel;
  private
    { Private declarations }
  public
    function init(page:TIWAppForm;web:TIWApplication):string;
    procedure DoMyAjaxFunc2(EventParams: TStringList);
  end;

implementation

{$R *.dfm}

function TIWFrameAsyncUpdateGrid.init(page:TIWAppForm;web:TIWApplication):string;
const
  jsTag = '<script language="javascript" type="text/javascript">%s</script>';
var
  AjaxFunc2: string; // used for frame1
begin
 // javascript call to create a variable called "myData" with a comma delimited string to
 // be passed to the DoMyAjaxFunc call that will be registed.
  AjaxFunc2 := 'function myAjaxFunc2() {' + #13 +
    'executeAjaxEvent("", null,"' + UpperCase(Self.Name) + '.DoMyAjaxFunc2", false, null, false);' + #13 +
    'return true;}';
  page.PageContext.ExtraHeader.Add(Format(jsTag, [AjaxFunc2])); // add the formatted javascript call to page header
  web.RegisterCallBack(UpperCase(Self.Name) + '.DoMyAjaxFunc2', DoMyAjaxFunc2);  // register the AJAX call back as DoMyAjaxFunc, and associate it with our frame 1 object, IWFrame21.DoMyAjaxFunc
  result := 'myAjaxFunc2();'; // return this for javascript usage
end;


procedure TIWFrameAsyncUpdateGrid.DoMyAjaxFunc2(EventParams: TStringList);
var
  x, y: integer;
begin
  // randomize , clear our grid, and fill it with random dummy data
  randomize;
  IWGrid1.Clear;
  for x := 0 to IWGrid1.RowCount - 1 do
    for y := 0 to IWGrid1.ColumnCount - 1 do
      IWGrid1.Cell[x, y].Text := random(9999).tostring;
end;

end.
