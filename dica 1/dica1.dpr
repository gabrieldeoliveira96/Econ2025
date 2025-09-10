program dica1;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  Login1 in 'Login1.pas' {frmLogin1},
  Login2 in 'Login2.pas' {frmLogin2};

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
//  Application.CreateForm(TfrmLogin1, frmLogin1);
  Application.CreateForm(TfrmLogin2, frmLogin2);
  Application.Run;
end.
