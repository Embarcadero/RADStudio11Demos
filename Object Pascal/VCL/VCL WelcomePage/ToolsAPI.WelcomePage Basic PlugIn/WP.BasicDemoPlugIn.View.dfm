object MainFrame: TMainFrame
  Left = 0
  Top = 0
  Width = 276
  Height = 183
  ParentBackground = False
  TabOrder = 0
  PixelsPerInch = 96
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 276
    Height = 183
    Align = alClient
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    StyleElements = [seFont, seBorder]
    ExplicitWidth = 281
    ExplicitHeight = 216
    DesignSize = (
      276
      183)
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 233
      Height = 95
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
        'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut e' +
        'nim ad minim veniam, quis nostrud exercitation ullamco laboris n' +
        'isi ut aliquip ex ea commodo consequat'
      EllipsisPosition = epEndEllipsis
      WordWrap = True
    end
  end
end
