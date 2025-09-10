object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 387
  Width = 524
  PixelsPerInch = 120
  object DB: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 144
    Top = 112
  end
  object qConsultaSync: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from cliente '
      'where SYNC = '#39'S'#39)
    Left = 240
    Top = 176
    object qConsultaSyncID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qConsultaSyncNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qConsultaSyncSYNC: TWideStringField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Size = 1
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 352
    Top = 256
  end
  object qAtualizaRegistro: TFDQuery
    Connection = DB
    SQL.Strings = (
      'update cliente set sync = :sync')
    Left = 368
    Top = 96
    ParamData = <
      item
        Name = 'SYNC'
        ParamType = ptInput
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object WideStringField1: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object WideStringField2: TWideStringField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Size = 1
    end
  end
end
