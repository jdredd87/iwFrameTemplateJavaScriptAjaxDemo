unit UnitFrameAsyncTimerGrid;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, IWHTMLContainer, IWHTML40Container, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel, IWBaseComponent, IWBaseHTMLComponent, IWBaseHTML40Component,
  IWCompExtCtrls, IWCompGrids;

type
  TIWFrameAsyncTimerGrid = class(TFrame)
    IWTimer1: TIWTimer;
    IWRegionFrame3: TIWRegion;
    IWGrid1: TIWGrid;
    IWLabel1: TIWLabel;
    procedure IWTimer1AsyncTimer(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TIWFrameAsyncTimerGrid.IWTimer1AsyncTimer(Sender: TObject; EventParams: TStringList);
var x,y : integer;
begin

  // async timer to randomize, clear, and populate grid with random dummy data without refreshing page.

  randomize;

  IWGrid1.Clear;

  for x := 0 to IWGrid1.RowCount - 1 do
    for y := 0 to IWGrid1.ColumnCount - 1 do
      IWGrid1.Cell[x, y].Text := random(9999).tostring;

end;

end.