program dica10;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  mode.conn in 'src\model\mode.conn.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
