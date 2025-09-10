unit model.con;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, controller.atualizaDB, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.IOUtils;

type
  TdmConn = class(TDataModule)
    conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetVersao:string;
  end;

var
  dmConn: TdmConn;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TdmConn.DataModuleCreate(Sender: TObject);
var b:Boolean;
begin
  with Conn do
  begin
    Params.Values['DriverID'] := 'SQLite';

{$IFDEF IOS}
    Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,'banco.db');
{$ENDIF}
{$IFDEF ANDROID}
    b := FileExists(TPath.Combine(TPath.GetDocumentsPath,'banco.db'));
    Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath,'banco.db');
{$ENDIF}
{$IFDEF MSWINDOWS}
    b := FileExists('..\..\db\banco.db');
    Params.Values['Database'] := '..\..\db\banco.db';
{$ENDIF}
  end;

end;


function TdmConn.GetVersao: string;
var
 LqTable:TFDQuery;
begin
  LqTable:= TFDQuery.Create(nil);
  try
    LqTable.Connection := dmConn.conn;
    LqTable.Close;
    LqTable.SQL.Add('select versao from configuracao');
    LqTable.open;
    Result:= LqTable.FieldByName('versao').AsString;

  finally
    FreeAndNil(LqTable);
  end;

end;

end.
