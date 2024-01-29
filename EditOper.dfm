object fmEditOper: TfmEditOper
  Left = 476
  Top = 278
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077'/'#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1054#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 224
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    440
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object lblClient: TLabel
    Left = 19
    Top = 10
    Width = 52
    Height = 16
    Caption = #1050#1083#1080#1077#1085#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 19
    Top = 62
    Width = 194
    Height = 16
    Caption = #1057#1091#1084#1084#1072' (+'#1055#1088#1080#1093#1086#1076' / -'#1056#1072#1089#1093#1086#1076'):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 19
    Top = 117
    Width = 105
    Height = 16
    Caption = #1044#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOk: TButton
    Left = 271
    Top = 190
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 0
    ExplicitLeft = 309
    ExplicitTop = 372
  end
  object btnCancel: TButton
    Left = 352
    Top = 190
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    ExplicitLeft = 390
    ExplicitTop = 372
  end
  object dtDateOper: TDateTimePicker
    Left = 24
    Top = 139
    Width = 408
    Height = 24
    Date = 45320.646323298610000000
    Time = 45320.646323298610000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = dtDateOperChange
  end
  object dbeSUMM: TDBEdit
    Left = 24
    Top = 87
    Width = 408
    Height = 24
    DataField = 'SUM_OPER'
    DataSource = fmMain.dsOpers
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object eClient: TEdit
    Left = 19
    Top = 32
    Width = 385
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object btnChooseClient: TButton
    Left = 403
    Top = 32
    Width = 24
    Height = 24
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnChooseClientClick
  end
end
