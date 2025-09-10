program dica3;

uses
  System.StartUpCopy,
  FMX.Forms,
  model.con in 'model.con.pas' {dmConn: TDataModule},
  controller.atualizaDB in 'controller.atualizaDB.pas',
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConn, dmConn);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
