unit mode.conn;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.IOUtils;

type
  TDataModule3 = class(TDataModule)
    Conn: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1NOME: TWideMemoField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDataModule3.DataModuleCreate(Sender: TObject);
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
    b := FileExists('..\..\src\db\banco.db');
    Params.Values['Database'] := '..\..\src\db\banco.db';
{$ENDIF}
  end;
end;

end.
