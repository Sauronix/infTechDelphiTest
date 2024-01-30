object fmBalance: TfmBalance
  Left = 627
  Top = 276
  Caption = #1041#1072#1083#1072#1085#1089
  ClientHeight = 540
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 762
    object lblClient: TLabel
      Left = 13
      Top = 4
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
    object lblClent: TLabel
      Left = 437
      Top = 4
      Width = 38
      Height = 16
      Caption = #1044#1072#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eClient: TEdit
      Left = 13
      Top = 19
      Width = 385
      Height = 24
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnChooseClient: TButton
      Left = 397
      Top = 19
      Width = 24
      Height = 24
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnChooseClientClick
    end
    object dtOper: TDateTimePicker
      Left = 437
      Top = 19
      Width = 196
      Height = 24
      Date = 45321.517268587970000000
      Time = 45321.517268587970000000
      TabOrder = 2
    end
    object btnBalance: TButton
      Left = 639
      Top = 19
      Width = 106
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = btnBalanceClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 754
    Height = 491
    Align = alClient
    DataSource = dsBalance
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_OPER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIHOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RASHOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE'
        Visible = True
      end>
  end
  object qBalance: TIBDataSet
    Database = fmMain.IBDatabase
    Transaction = fmMain.IBTransaction
    SelectSQL.Strings = (
      ''
      '   select '#39#39' as DESCR, DATE_OPER'
      '   ,SUM(CASE WHEN SUM_OPER>0 then SUM_OPER ELSE 0 END) as PRIHOD'
      '   ,SUM(CASE WHEN SUM_OPER<0 then SUM_OPER ELSE 0 END) as RASHOD'
      '   ,SUM(SUM_OPER) as BALANCE'
      '  from T_OPERATIONS'
      '    where  DATE_OPER<=:DT_OPER and ID_CLIENT = :ID_CLIENT'
      '     group by  DATE_OPER'
      ''
      ' union all'
      ''
      '  select '#39#1048#1090#1086#1075#1086' '#1085#1072':'#39' as DESCR, max(DATE_OPER) as DATE_OPER'
      '   ,SUM(CASE WHEN SUM_OPER>0 then SUM_OPER ELSE 0 END) as PRIHOD'
      '   ,SUM(CASE WHEN SUM_OPER<0 then SUM_OPER ELSE 0 END) as RASHOD'
      '   ,SUM(SUM_OPER) as BALANCE'
      '  from T_OPERATIONS'
      '    where  DATE_OPER<=:DT_OPER and ID_CLIENT = :ID_CLIENT')
    Left = 32
    Top = 120
    object qBalanceDESCR: TIBStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'DESCR'
      ProviderFlags = []
      FixedChar = True
      Size = 9
    end
    object qBalanceDATE_OPER: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_OPER'
      Origin = 'T_OPERATIONS.DATE_OPER'
    end
    object qBalancePRIHOD: TFloatField
      DisplayLabel = #1055#1088#1080#1093#1086#1076
      FieldName = 'PRIHOD'
      ProviderFlags = []
    end
    object qBalanceRASHOD: TFloatField
      DisplayLabel = #1056#1072#1089#1093#1086#1076
      FieldName = 'RASHOD'
      ProviderFlags = []
    end
    object qBalanceBALANCE: TFloatField
      DisplayLabel = #1041#1072#1083#1072#1085#1089
      FieldName = 'BALANCE'
      ProviderFlags = []
    end
  end
  object dsBalance: TDataSource
    DataSet = qBalance
    Left = 104
    Top = 120
  end
end
