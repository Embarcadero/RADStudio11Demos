object DemoPlugInCaptionFrame: TDemoPlugInCaptionFrame
  Left = 0
  Top = 0
  Width = 223
  Height = 38
  AutoSize = True
  TabOrder = 0
  PixelsPerInch = 96
  object btn1: TSpeedButton
    AlignWithMargins = True
    Left = 147
    Top = 8
    Width = 38
    Height = 22
    Hint = 'Open...'
    Margins.Left = 0
    Margins.Top = 8
    Margins.Right = 0
    Margins.Bottom = 8
    Align = alRight
    BiDiMode = bdLeftToRight
    ImageIndex = 0
    ImageName = 'UpdateOrange'
    Images = ilTitleFrame
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = 18
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ParentShowHint = False
    ParentBiDiMode = False
    ShowHint = True
    OnClick = btn1Click
    ExplicitLeft = 116
    ExplicitTop = 0
    ExplicitHeight = 38
  end
  object lbCaption: TLabel
    Left = 0
    Top = 0
    Width = 47
    Height = 38
    Align = alLeft
    Caption = 'Plugins'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    ExplicitHeight = 20
  end
  object btn2: TSpeedButton
    AlignWithMargins = True
    Left = 185
    Top = 8
    Width = 38
    Height = 22
    Hint = 'Open From Version Control'
    Margins.Left = 0
    Margins.Top = 8
    Margins.Right = 0
    Margins.Bottom = 8
    Align = alRight
    BiDiMode = bdLeftToRight
    ImageIndex = 1
    ImageName = 'UpdateGreen'
    Images = ilTitleFrame
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = 18
    Font.Name = 'Segoe UI'
    Font.Style = [fsItalic]
    ParentFont = False
    ParentShowHint = False
    ParentBiDiMode = False
    ShowHint = True
    OnClick = btn2Click
    ExplicitLeft = 154
    ExplicitTop = 0
    ExplicitHeight = 38
  end
  object ilTitleFrame: TVirtualImageList
    Images = <
      item
        CollectionIndex = 4
        CollectionName = 'UpdateOrange'
        Name = 'UpdateOrange'
      end
      item
        CollectionIndex = 5
        CollectionName = 'UpdateGreen'
        Name = 'UpdateGreen'
      end>
    ImageCollection = DemoPlugInResources.ImageCollection1
    Left = 102
    Top = 3
  end
end
