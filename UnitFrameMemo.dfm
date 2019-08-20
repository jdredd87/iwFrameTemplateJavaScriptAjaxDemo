object IWFrame1Memo: TIWFrame1Memo
  Left = 0
  Top = 0
  Width = 343
  Height = 169
  TabOrder = 0
  object IWRegionFrame1: TIWRegion
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
    object IWMemo1: TIWMemo
      Left = 1
      Top = 17
      Width = 341
      Height = 151
      Align = alClient
      BGColor = clNone
      Editable = False
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      InvisibleBorder = False
      HorizScrollBar = False
      VertScrollBar = True
      Required = False
      TabOrder = 0
      SubmitOnAsyncEvent = True
      FriendlyName = 'IWMemo1'
      ExplicitLeft = 0
      ExplicitTop = 23
    end
    object IWLabel1: TIWLabel
      Left = 1
      Top = 1
      Width = 341
      Height = 16
      Align = alTop
      BGColor = clWebAQUA
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      HasTabOrder = False
      FriendlyName = 'IWLabel1'
      Caption = 'Frame 1 - Pass JavaScript parameters to load in Memo'
      ExplicitLeft = 112
      ExplicitTop = 72
      ExplicitWidth = 58
    end
  end
end
