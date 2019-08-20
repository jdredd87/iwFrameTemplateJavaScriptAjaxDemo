object IWLoadingForm: TIWLoadingForm
  Left = 0
  Top = 0
  Width = 555
  Height = 400
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
  StyleSheet.URL = 'TIWLoadingForm.css'
  ShowHint = True
  XPTheme = True
  DesignLeft = 8
  DesignTop = 8
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Templates.Default = 'TIWLoadingForm.html'
    Left = 264
    Top = 184
  end
  object IWTimer1: TIWTimer
    Enabled = False
    Interval = 10000
    ShowAsyncLock = False
    OnAsyncTimer = IWTimer1AsyncTimer
    Left = 264
    Top = 96
  end
end
