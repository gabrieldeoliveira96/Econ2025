object dmConn: TdmConn
  OnCreate = DataModuleCreate
  Height = 359
  Width = 390
  PixelsPerInch = 120
  object conn: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 176
    Top = 160
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 272
    Top = 56
  end
end
