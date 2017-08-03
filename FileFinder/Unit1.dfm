object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 377
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ResultGrid: TStringGrid
    Left = 0
    Top = 44
    Width = 505
    Height = 326
    ColCount = 1
    Ctl3D = True
    DefaultColWidth = 10000
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ParentCtl3D = False
    TabOrder = 0
    OnDblClick = ResultGridDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    TabOrder = 1
    object FilenameLabel: TLabel
      Left = 24
      Top = 14
      Width = 54
      Height = 13
      Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
    end
    object FindEdit: TEdit
      Left = 104
      Top = 11
      Width = 281
      Height = 21
      TabOrder = 0
      Text = 'cmd.exe'
      OnKeyPress = FindEditKeyPress
    end
    object FindButton: TButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 1
      OnClick = FindButtonClick
    end
  end
  object Panel2: TPanel
    Left = 508
    Top = 0
    Width = 185
    Height = 370
    Caption = 'Panel2'
    TabOrder = 2
    object Memo1: TMemo
      Left = 3
      Top = 40
      Width = 177
      Height = 321
      TabOrder = 0
    end
    object RefreshButton: TButton
      Left = 46
      Top = 9
      Width = 99
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1076#1077#1082#1089
      TabOrder = 1
      OnClick = RefreshButtonClick
    end
  end
end
