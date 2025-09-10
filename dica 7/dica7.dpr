program dica7;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login1 in 'Login1.pas' {frmLogin},
  SharedPreference in 'SharedPreference.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
