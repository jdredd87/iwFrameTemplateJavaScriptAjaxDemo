object IWMainForm: TIWMainForm
  Left = 0
  Top = 0
  Width = 1083
  Height = 793
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = IWTemplateProcessorHTML1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object btn_DoFrame1Work: TIWButton
    Left = 21
    Top = 226
    Width = 75
    Height = 25
    Caption = 'Do Work'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'btn_DoFrame1Work'
    TabOrder = 0
  end
  object btn_DoFrame2Work: TIWButton
    Left = 419
    Top = 351
    Width = 75
    Height = 25
    Caption = 'Do Work'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    TabOrder = 1
  end
  inline frame1: TIWFrame1Memo
    Left = 0
    Top = 0
    Width = 412
    Height = 169
    TabOrder = 0
    ExplicitWidth = 412
    inherited IWRegionFrame1: TIWRegion
      Left = 0
      Top = 0
      Width = 412
      Height = 169
      RenderInvisibleControls = True
      TabOrder = 2
      Align = alClient
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clNone
      ExtraTagParams.Strings = ()
      ExplicitWidth = 412
      inherited IWMemo1: TIWMemo
        Left = 1
        Top = 17
        Width = 410
        Height = 151
        ExtraTagParams.Strings = ()
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
        Lines.Strings = ()
        ExplicitWidth = 410
      end
      inherited IWLabel1: TIWLabel
        Left = 1
        Top = 1
        Width = 410
        Height = 16
        ExtraTagParams.Strings = ()
        Align = alTop
        BGColor = clWebAQUA
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        HasTabOrder = False
        FriendlyName = 'IWLabel1'
        Caption = 'Frame 1 - Pass JavaScript parameters to load in Memo'
        ExplicitLeft = 41
        ExplicitTop = 17
        ExplicitWidth = 341
      end
    end
  end
  inline frame2: TIWFrameAsyncUpdateGrid
    Left = 418
    Top = 88
    Width = 519
    Height = 225
    TabOrder = 1
    ExplicitLeft = 418
    ExplicitTop = 88
    ExplicitWidth = 519
    ExplicitHeight = 225
    inherited IWRegionFrame2: TIWRegion
      Width = 519
      Height = 225
      TabOrder = 3
      Color = clWebWHEAT
      ExplicitWidth = 519
      ExplicitHeight = 225
      inherited IWGrid1: TIWGrid
        Width = 517
        Height = 207
        ExplicitWidth = 517
        ExplicitHeight = 231
      end
      inherited IWLabel1: TIWLabel
        Width = 517
        ExplicitWidth = 517
      end
    end
  end
  inline frame3: TIWFrameAsyncTimerGrid
    Left = 40
    Top = 392
    Width = 454
    Height = 209
    TabOrder = 2
    ExplicitLeft = 40
    ExplicitTop = 392
    ExplicitWidth = 454
    ExplicitHeight = 209
    inherited IWRegionFrame3: TIWRegion
      Width = 454
      Height = 209
      TabOrder = 4
      Color = clWebOLDLACE
      ExplicitWidth = 454
      ExplicitHeight = 209
      inherited IWGrid1: TIWGrid
        Width = 452
        Height = 191
        ExplicitWidth = 452
        ExplicitHeight = 255
      end
      inherited IWLabel1: TIWLabel
        Width = 452
        ExplicitWidth = 452
      end
    end
  end
  inline frame4: TIWFrameThreadStarsJS
    Left = 520
    Top = 352
    Width = 545
    Height = 337
    TabOrder = 3
    ExplicitLeft = 520
    ExplicitTop = 352
    ExplicitWidth = 545
    ExplicitHeight = 337
    inherited IWRegionFrame4: TIWRegion
      Width = 545
      Height = 337
      TabOrder = 5
      ExplicitWidth = 545
      ExplicitHeight = 337
      inherited IWProgressBar1: TIWProgressBar
        Top = 297
        Width = 523
        ExplicitTop = 297
        ExplicitWidth = 523
      end
      inherited IWText1: TIWText
        Width = 537
        Height = 219
        Lines.Strings = (
          '<canvas id="myCanvas" width="537" height="219"></canvas>')
        ExplicitWidth = 537
        ExplicitHeight = 219
      end
      inherited IWButton1: TIWButton
        Width = 523
        ExplicitWidth = 523
      end
      inherited IWLabel1: TIWLabel
        Width = 543
        ExplicitWidth = 543
      end
    end
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'TIWMainForm.html'
    Left = 208
    Top = 248
  end
end
