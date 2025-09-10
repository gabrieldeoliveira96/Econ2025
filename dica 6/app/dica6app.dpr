program dica6app;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'src\view\view.principal.pas' {Form1},
  model.crud in 'src\model\model.crud.pas' {DataModule1: TDataModule},
  controller.sync in 'src\controller\controller.sync.pas',
  NetWork.State in 'src\feature\ConnectInfo\NetWork.State.pas',
  uConnection in 'src\feature\uConnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
