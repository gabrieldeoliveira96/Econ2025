unit controller.atualizaDB;

interface

uses FireDAC.Comp.Client, FireDAC.DApt,FireDAC.Phys.SQLiteDef ,System.Classes, System.SysUtils;

procedure VerificaDB;

const VersaoBanco = '4'; // ultima alteracao XX/XX/XXXX
var
  slSQL : TStringList;
  FqConsulta,
  FqExec : TFDQuery;

implementation

uses model.con;

function TabelaExiste(ATabela:string):boolean;
var
 LqTable:TFDQuery;
begin
  LqTable:= TFDQuery.Create(nil);
  try
    LqTable.Connection := dmConn.conn;
    LqTable.Close;
    LqTable.SQL.Clear;
    LqTable.SQL.Add('SELECT count(*) as TOT FROM sqlite_master WHERE type = :type AND name = :nome');
    LqTable.ParamByName('type').AsString:= 'table';
    LqTable.ParamByName('nome').AsString:= ATabela;
    LqTable.Open;
    Result:= LqTable.FieldByName('tot').AsInteger > 0;
  finally
    FreeAndNil(LqTable);
  end;
end;

procedure Verifica_E_CriaTabela(ATabela, AFirstField:string);
var
 LqTable:TFDQuery;
begin
  LqTable:= TFDQuery.Create(nil);
  try
    LqTable.Connection := dmConn.conn;
    if not TabelaExiste(ATabela) then
    begin
      LqTable.Close;
      LqTable.SQL.Clear;
      LqTable.SQL.Add('CREATE TABLE '+ATabela+' ('+AFirstField+' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL);');
      LqTable.ExecSQL;
    end;

  finally
    FreeAndNil(LqTable);
  end;
end;

procedure VerificaDB;
begin
  slSQL := TStringList.Create;
  FqConsulta := TFDQuery.Create(nil);
  FqConsulta.Connection := dmConn.conn;
  FqExec := TFDQuery.Create(nil);
  FqExec.Connection := dmConn.conn;

  try
    {$REGION 'CONFIGURACAO'}
    Verifica_E_CriaTabela('CONFIGURACAO', 'ID');

    FqConsulta.Close;
    FqConsulta.SQL.Clear;
    FqConsulta.SQL.Add('PRAGMA TABLE_INFO(CONFIGURACAO);');
    FqConsulta.Open;
    FqConsulta.IndexFieldNames := 'NAME';

    {$REGION 'CAMPOS DA TABELA'}
    FqConsulta.First;

    if not FqConsulta.FindKey(['ID']) then
      FqExec.ExecSQL('ALTER TABLE CONFIGURACAO ADD ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL;');

    if not FqConsulta.FindKey(['VERSAO']) then
      FqExec.ExecSQL('ALTER TABLE CONFIGURACAO ADD VERSAO INTEGER;');

    {$REGION 'Limpar dados antigos'}
    var LQuery:= TFDQuery.Create(nil);
    try
      LQuery.Connection := dmConn.conn;
      LQuery.Close;
      LQuery.SQL.Clear;
      LQuery.SQL.Add('select * from CONFIGURACAO');
      LQuery.Open;

      if LQuery.FieldByName('VERSAO').AsString = '' then
      begin
        if TabelaExiste('USUARIO') then
          FqExec.ExecSQL('DROP TABLE USUARIO;');
        if TabelaExiste('CLIENTE') then
          FqExec.ExecSQL('DROP TABLE CLIENTE;');
        if TabelaExiste('ENTREGADOR') then
          FqExec.ExecSQL('DROP TABLE ENTREGADOR;');
        if TabelaExiste('BANCOCLIENTE') then
          FqExec.ExecSQL('DROP TABLE BANCOCLIENTE;');
        if TabelaExiste('REMESSAS') then
          FqExec.ExecSQL('DROP TABLE REMESSAS;');

        FqExec.ExecSQL('INSERT INTO CONFIGURACAO (VERSAO) VALUES ('+VersaoBanco+');');
      end;

      if StrToInt(VersaoBanco) > LQuery.FieldByName('VERSAO').AsInteger then
        FqExec.ExecSQL('UPDATE CONFIGURACAO SET VERSAO = '+VersaoBanco+';');

      if StrToInt(VersaoBanco) = LQuery.FieldByName('VERSAO').AsInteger then
        exit;
    finally
      FreeAndNil(LQuery);
    end;
    {$ENDREGION}

    {$ENDREGION}


    {$ENDREGION}

    {$REGION 'USUARIO'}

    Verifica_E_CriaTabela('USUARIO','ID');

    FqConsulta.Close;
    FqConsulta.SQL.Clear;
    FqConsulta.SQL.Add('PRAGMA TABLE_INFO(USUARIO);');
    FqConsulta.Open;
    FqConsulta.IndexFieldNames := 'NAME';

    {$REGION 'CAMPOS DA TABELA'}
    FqConsulta.First;

    if not FqConsulta.FindKey(['ID']) then
      FqExec.ExecSQL('ALTER TABLE USUARIO ADD ID INTEGER PRIMARY KEY AUTOINCREMENT;');

    if not FqConsulta.FindKey(['LOGIN']) then
      FqExec.ExecSQL('ALTER TABLE USUARIO ADD LOGIN VARCHAR (90);');

    if not FqConsulta.FindKey(['SENHA']) then
      FqExec.ExecSQL('ALTER TABLE USUARIO ADD SENHA VARCHAR (50);');

    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'CLIENTE'}

    Verifica_E_CriaTabela('CLIENTE', 'ID');

    FqConsulta.Close;
    FqConsulta.SQL.Clear;
    FqConsulta.SQL.Add('PRAGMA TABLE_INFO(CLIENTE);');
    FqConsulta.Open;
    FqConsulta.IndexFieldNames := 'NAME';

    {$REGION 'CAMPOS DA TABELA'}
    FqConsulta.First;

    if not FqConsulta.FindKey(['ID']) then
      FqExec.ExecSQL('ALTER TABLE CLIENTE ADD ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL;');

    if not FqConsulta.FindKey(['ID_USUARIO']) then
      FqExec.ExecSQL('ALTER TABLE CLIENTE ADD ID_USUARIO INTEGER;');

    if not FqConsulta.FindKey(['NOME']) then
      FqExec.ExecSQL('ALTER TABLE CLIENTE ADD NOME VARCHAR (255);');

//    if not FqConsulta.FindKey(['CPF']) then
//      FqExec.ExecSQL('ALTER TABLE CLIENTE ADD CPF VARCHAR (15);');

    {$ENDREGION}

    {$ENDREGION}

  finally
    FqConsulta.DisposeOf;
    FqExec.DisposeOf;
    slSQL.DisposeOf;
  end;


end;





end.
