unit model.crud;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.FMXUI.Wait;

type
  TDataModule1 = class(TDataModule)
    DB: TFDConnection;
    qConsultaSync: TFDQuery;
    qConsultaSyncID: TFDAutoIncField;
    qConsultaSyncNOME: TWideStringField;
    qConsultaSyncSYNC: TWideStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qAtualizaRegistro: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificaSync:Boolean;
    procedure AtualizaRegistroSync(ASync:string);
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  System.IOUtils;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.AtualizaRegistroSync(ASync: string);
begin

  qAtualizaRegistro.ParamByName('sync').AsString:= ASync;
  qAtualizaRegistro.Prepare;
  qAtualizaRegistro.ExecSQL;

end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
 b:Boolean;
begin
   with DB do
  begin
    Params.Values['DriverID'] := 'SQLite';

{$IFDEF IOS}
    Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,'db');
{$ENDIF}
{$IFDEF ANDROID}
    b := FileExists(TPath.Combine(TPath.GetDocumentsPath,'db'));
    Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,'db');
{$ENDIF}
{$IFDEF MSWINDOWS}
    Params.Values['Database'] := 'C:\Desenvolvimento\Sincronizacao OffLine\app\src\db\db';
{$ENDIF}
  end;
end;

function TDataModule1.VerificaSync: Boolean;
begin
  qConsultaSync.Open;
  Result:= qConsultaSync.RecordCount > 0;
  qConsultaSync.Close;
end;

end.
