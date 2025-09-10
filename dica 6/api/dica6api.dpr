program dica6api;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse;

begin
  THorse.Post('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('pong').Status(200);
      WriteLn('req = '+ req.Body);

    end);

  WriteLn('Porta: 9000');
  THorse.Listen(9000);

end.

