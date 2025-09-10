program dica5;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.login in 'src\view\view.login.pas' {Form3},
  uLoading in 'src\features\uLoading.pas',
  view.principal in 'src\view\view.principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
