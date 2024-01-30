object fmClients: TfmClients
  Left = 531
  Top = 250
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1083#1080#1077#1085#1090#1086#1074
  ClientHeight = 517
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 826
    Height = 31
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar1'
    Images = fmMain.ImageListNormal
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acAddClient
    end
    object ToolButton2: TToolButton
      Left = 31
      Top = 0
      Action = acEditClient
    end
    object ToolButton3: TToolButton
      Left = 62
      Top = 0
      Action = acDeleteClient
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
    object ToolButton6: TToolButton
      Left = 132
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 140
      Top = 0
      Action = acBalance
    end
  end
  object pnButtons: TPanel
    Left = 0
    Top = 476
    Width = 826
    Height = 41
    Align = alBottom
    TabOrder = 1
    Visible = False
    DesignSize = (
      826
      41)
    object btnOk: TButton
      Left = 655
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 736
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 31
    Width = 826
    Height = 445
    Align = alClient
    DataSource = DsClients
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
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
      DisplayLabel = #1048#1053#1053
      DisplayWidth = 25
      FieldName = 'CLIENT_INN'
      Origin = 'T_CLIENTS.CLIENT_INN'
      Required = True
    end
    object qClientsID: TIntegerField
      FieldName = 'ID'
      Origin = 'T_CLIENTS.ID'
      Visible = False
    end
    object qClientsCLIENT_NAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 70
      FieldName = 'CLIENT_NAME'
      Origin = 'T_CLIENTS.CLIENT_NAME'
      Size = 250
    end
    object qClientsCLIENT_BALANCE: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1081' '#1073#1072#1083#1072#1085#1089
      DisplayWidth = 30
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
      OnExecute = acAddClientExecute
    end
    object acEditClient: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = acEditClientExecute
    end
    object acDeleteClient: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnExecute = acDeleteClientExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      ImageIndex = 11
      OnExecute = acRefreshExecute
    end
    object acBalance: TAction
      Caption = #1041#1072#1083#1072#1085#1089' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1091
      ImageIndex = 8
      OnExecute = acBalanceExecute
    end
  end
  object pmClients: TPopupMenu
    Left = 32
    Top = 176
  end
end
