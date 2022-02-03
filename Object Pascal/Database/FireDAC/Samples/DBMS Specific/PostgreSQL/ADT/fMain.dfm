object Form64: TForm64
  Left = 0
  Top = 0
  Caption = 'Form64'
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  DesignSize = (
    624
    442)
  TextHeight = 15
  object btnOpen: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 608
    Height = 193
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 8
    Top = 239
    Width = 608
    Height = 195
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object btnEdit: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnWrite: TButton
    Left = 170
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Write'
    TabOrder = 4
    OnClick = btnWriteClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=fd'
      'Password=f'
      'ConnectionDef=PG_Demo')
    LoginPrompt = False
    Left = 40
    Top = 96
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from FDEmployees')
    Left = 32
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 32
    Top = 208
  end
end
