unit LogCat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, controller.log, System.Skia, FMX.Skia,
  System.Generics.Collections, System.JSON;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    SkLabel1: TSkLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FLog:TGosLog;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FLog.Log(Edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

  FLog.Log('iniciando Thread');
  TThread.CreateAnonymousThread(
  procedure
  var
    Ljson:TJSONObject;
  begin

    try
      sleep(1000);

      Ljson.AddPair('teste','erro');

    except
      on E:Exception do
        FLog.Log('Erro: '+ e.Message +' - '+ e.StackTrace + ' - '+ e.ClassName, TTipo.Erro);
    end;

  end).Start;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FLog:= TGosLog.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FLog);
end;

end.
