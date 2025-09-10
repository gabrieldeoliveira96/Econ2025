program dica4;

uses
  System.StartUpCopy,
  FMX.Forms,
  LogCat in 'LogCat.pas' {Form1},
  controller.log in 'controller.log.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
