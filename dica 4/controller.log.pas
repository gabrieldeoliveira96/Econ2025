unit controller.log;

interface

uses
  System.SysUtils
 {$IFDEF ANDROID}
  , Androidapi.Log
  {$ENDIF};

type
  TTipo = (Info, Erro, Aviso);

  TGosLog = class
    private
    public
      function Log(AStr: string; ATipo: TTipo = Info):string;
  end;

implementation

function TGosLog.Log(AStr: string; ATipo: TTipo = Info):string;
 {$IFDEF ANDROID}
var
  LMsg: string;
  LMarshaller: TMarshaller;
  {$ENDIF}
begin
  try
    {$IFDEF ANDROID}
    LMsg := 'Econ2025_: '+AStr;
    case ATipo of
      Info: LOGI(LMarshaller.AsUtf8(LMsg).ToPointer);
      Erro: LOGE(LMarshaller.AsUtf8(LMsg).ToPointer);
      Aviso: LOGW(LMarshaller.AsUtf8(LMsg).ToPointer);
    end;
    {$ENDIF}
    {$IFDEF IOS}
    NSLog(PNSStr('Econ2025_'+AStr));
    {$ENDIF}
  except
  end;

end;


end.
