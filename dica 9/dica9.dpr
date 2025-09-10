program dica9;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'src\view\view.principal.pas' {Form5},
  uConnection in 'src\feature\uConnection.pas',
  uLoading in 'src\feature\uLoading.pas',
  frame.usuario in 'src\view\frame\frame.usuario.pas' {Frame1: TFrame},
  mode.conn in 'src\model\mode.conn.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
