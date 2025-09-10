object DataModule3: TDataModule3
  OnCreate = DataModuleCreate
  Height = 353
  Width = 466
  PixelsPerInch = 120
  object Conn: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 128
    Top = 112
  end
  object FDQuery1: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'select * from usuario')
    Left = 280
    Top = 144
    object FDQuery1NOME: TWideMemoField
      FieldName = 'NOME'
      Origin = 'NOME'
      BlobType = ftWideMemo
    end
  end
end
