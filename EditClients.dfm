object fmEditClients: TfmEditClients
  Left = 624
  Top = 325
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1080#1077'/'#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 154
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    366
    154)
  PixelsPerInch = 96
  TextHeight = 13
  object lblInn: TLabel
    Left = 20
    Top = 9
    Width = 80
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    Caption = #1048#1053#1053':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 31
  end
  object lblName: TLabel
    Left = 20
    Top = 62
    Width = 151
    Height = 16
    Anchors = [akLeft, akTop, akRight]
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 102
  end
  object btnOk: TButton
    Left = 185
    Top = 119
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1050
    ModalResult = 1
    TabOrder = 2
    ExplicitLeft = 137
    ExplicitTop = 126
  end
  object btnCancel: TButton
    Left = 266
    Top = 119
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
    ExplicitLeft = 218
    ExplicitTop = 126
  end
  object dbeINN: TDBEdit
    Left = 20
    Top = 32
    Width = 322
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CLIENT_INN'
    DataSource = fmClients.DsClients
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 273
  end
  object dbeName: TDBEdit
    Left = 20
    Top = 83
    Width = 322
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CLIENT_NAME'
    DataSource = fmClients.DsClients
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 273
  end
end
