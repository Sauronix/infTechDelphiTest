object fmClients: TfmClients
  Left = 421
  Top = 240
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 517
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 606
    Height = 31
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = fmMain.ImageListNormal
    TabOrder = 0
    ExplicitWidth = 902
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acAddClient
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 62
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
    object ToolButton4: TToolButton
      Left = 93
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 101
      Top = 0
      Action = acRefresh
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 476
    Width = 606
    Height = 41
    Align = alBottom
    TabOrder = 1
    Visible = False
    ExplicitLeft = 224
    ExplicitTop = 400
    ExplicitWidth = 185
    DesignSize = (
      606
      41)
    object btnOk: TButton
      Left = 435
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      TabOrder = 0
      ExplicitLeft = 583
    end
    object btnCancel: TButton
      Left = 516
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      ExplicitLeft = 664
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 31
    Width = 606
    Height = 445
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object qClients: TIBDataSet
    Database = fmMain.IBDatabase
    Transaction = fmMain.IBTransaction
    DeleteSQL.Strings = (
      'delete from T_CLIENTS'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into T_CLIENTS'
      '  (CLIENT_BALANCE, CLIENT_INN, CLIENT_NAME, ID)'
      'values'
      '  (:CLIENT_BALANCE, :CLIENT_INN, :CLIENT_NAME, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  CLIENT_INN,'
      '  ID,'
      '  CLIENT_NAME,'
      '  CLIENT_BALANCE'
      'from T_CLIENTS '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from T_CLIENTS')
    ModifySQL.Strings = (
      'update T_CLIENTS'
      'set'
      '  CLIENT_BALANCE = :CLIENT_BALANCE,'
      '  CLIENT_INN = :CLIENT_INN,'
      '  CLIENT_NAME = :CLIENT_NAME,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GE_CLIENTS'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 32
    Top = 104
    object qClientsCLIENT_INN: TFloatField
      FieldName = 'CLIENT_INN'
      Origin = 'T_CLIENTS.CLIENT_INN'
      Required = True
    end
    object qClientsID: TIntegerField
      FieldName = 'ID'
      Origin = 'T_CLIENTS.ID'
      Required = True
      Visible = False
    end
    object qClientsCLIENT_NAME: TIBStringField
      FieldName = 'CLIENT_NAME'
      Origin = 'T_CLIENTS.CLIENT_NAME'
      Size = 250
    end
    object qClientsCLIENT_BALANCE: TFloatField
      FieldName = 'CLIENT_BALANCE'
      Origin = 'T_CLIENTS.CLIENT_BALANCE'
    end
  end
  object DsClients: TDataSource
    DataSet = qClients
    Left = 96
    Top = 104
  end
  object ActionList: TActionList
    Images = fmMain.ImageListHot
    Left = 96
    Top = 176
    object acAddClient: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
    end
    object acEditClient: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
    end
    object acDeleteClient: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      ImageIndex = 11
      OnExecute = acRefreshExecute
    end
  end
end
