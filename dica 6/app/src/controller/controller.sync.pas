unit controller.sync;

interface

uses System.Classes, System.SysUtils, System.JSON, Network.State, uConnection;

procedure Sync;

implementation

uses view.principal, model.crud;

procedure Sync;
var
  LThread:TThread;
  LNetWork:TNetworkState;
begin

  LThread:= TThread.CreateAnonymousThread(
  procedure
  var
    LNetWork:TNetworkState;
    LCon:TConnection;
    LResult:string;
  begin
    LNetWork:= TNetworkState.Create;
    LCon:= TConnection.Create;
    try

      var i:integer:= 0;
      while True do
      begin
        if not Form1.FSync then
         exit;

        if not LNetWork.IsConnected then
          continue;

        if not DataModule1.VerificaSync then
          continue;

        var LJson:= TJSONObject.Create;
        try

          DataModule1.qConsultaSync.Open;
          while not DataModule1.qConsultaSync.Eof do
          begin
            LJson.AddPair('NOME',DataModule1.qConsultaSyncNOME.AsString);
            DataModule1.qConsultaSync.Next;
          end;
          DataModule1.qConsultaSync.close;

          if LCon.Post('http://192.168.244.215:9000/ping',[],LJson,LResult) then
            DataModule1.AtualizaRegistroSync('N');

        finally
          LJson.Free;
        end;


        TThread.Synchronize(nil,
        procedure
        begin
          sleep(1000);
          inc(i);
          Form1.Memo1.Lines.Add(i.ToString);
        end);

      end;

    finally
      LNetWork.Free;
      LCon.Free;
    end;

  end);

  LThread.Start;
  LThread.FreeOnTerminate:= true;


end;

end.
