object IWFrameAsyncTimerGrid: TIWFrameAsyncTimerGrid
  Left = 0
  Top = 0
  Width = 343
  Height = 169
  TabOrder = 0
  object IWRegionFrame3: TIWRegion
    Left = 0
    Top = 0
    Width = 343
    Height = 169
    RenderInvisibleControls = True
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    object IWGrid1: TIWGrid
      Left = 1
      Top = 17
      Width = 341
      Height = 151
      Align = alClient
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clNone
      BorderSize = 1
      BorderStyle = tfDefault
      Caption = 'IWGrid1'
      CellPadding = 0
      CellSpacing = 0
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = False
      UseSize = True
      FriendlyName = 'IWGrid1'
      ColumnCount = 4
      RowCount = 8
      ShowEmptyCells = True
      ShowInvisibleRows = True
      ScrollToCurrentRow = False
      ExplicitLeft = 24
      ExplicitTop = 8
      ExplicitWidth = 300
      ExplicitHeight = 150
    end
    object IWLabel1: TIWLabel
      Left = 1
      Top = 1
      Width = 341
      Height = 16
      Align = alTop
      BGColor = clWebLIGHTGREEN
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Frame 3 - Async TimerLive Grid Update'
      ExplicitLeft = 112
      ExplicitTop = 72
      ExplicitWidth = 58
    end
  end
  object IWTimer1: TIWTimer
    Enabled = True
    Interval = 1000
    ShowAsyncLock = False
    OnAsyncTimer = IWTimer1AsyncTimer
    Left = 160
    Top = 72
  end
end
