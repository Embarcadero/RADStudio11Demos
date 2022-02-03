object MainFrame: TMainFrame
  Left = 0
  Top = 0
  Width = 276
  Height = 257
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  PixelsPerInch = 96
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 276
    Height = 257
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    TabOrder = 0
    StyleElements = [seFont, seBorder]
    DesignSize = (
      276
      257)
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 102
      Height = 21
      Caption = 'Device Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 7
      Top = 51
      Width = 73
      Height = 21
      Caption = 'Processor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 106
      Width = 65
      Height = 21
      Caption = 'Memory'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 165
      Width = 82
      Height = 21
      Caption = 'OS Version'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDeviceName: TLabel
      Left = 8
      Top = 21
      Width = 257
      Height = 15
      AutoSize = False
      Caption = 'lbDeviceName'
      EllipsisPosition = epEndEllipsis
    end
    object lbProcesor: TLabel
      Left = 8
      Top = 72
      Width = 257
      Height = 15
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lbProcesor'
      EllipsisPosition = epEndEllipsis
    end
    object lbOSVersion: TLabel
      Left = 7
      Top = 192
      Width = 257
      Height = 41
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Caption = 'lbOSVersion'
      EllipsisPosition = epEndEllipsis
      WordWrap = True
    end
    object lbMemory: TLabel
      Left = 8
      Top = 133
      Width = 257
      Height = 15
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'lbMemory'
      EllipsisPosition = epEndEllipsis
    end
  end
end
