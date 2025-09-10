unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.JSON, uConnection,
  frame.usuario, uLoading, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Diagnostics, mode.conn;

type
  TForm5 = class(TForm)
    btnTesteLento: TButton;
    VertScrollBox1: TVertScrollBox;
    btnInsert: TButton;
    btnTesteRapido: TButton;
    procedure btnTesteLentoClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnTesteRapidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.btnInsertClick(Sender: TObject);
var
  LTime:TStopwatch;
begin
  LTime:= TStopwatch.StartNew;

  DataModule3.FDQuery1.Close;
  DataModule3.FDQuery1.Open;
  for var i  := 0 to 500 do
    begin
      DataModule3.FDQuery1.Append;
      DataModule3.FDQuery1NOME.AsString:= 'Nome teste '+i.ToString;
      DataModule3.FDQuery1.Post;
    end;
   ShowMessage(LTime.ElapsedMilliseconds.ToString);
end;

procedure TForm5.btnTesteLentoClick(Sender: TObject);
var
  LTime:TStopwatch;
begin
  LTime:= TStopwatch.StartNew;
  TLoading.Show(self,'Aguarde, Carregando dados');

  TThread.CreateAnonymousThread(
  procedure
  begin

    try

      TThread.Synchronize(nil,
      procedure
      var i:integer;
      begin
        i:= 0;
        DataModule3.FDQuery1.Open;
        DataModule3.FDQuery1.First;
        while not DataModule3.FDQuery1.Eof do
        begin
          var LFrame:= TFrame1.Create(self);
          inc(i);
          LFrame.Name:= 'FrameUser'+ i.ToString;
          LFrame.lblNome.Text:= DataModule3.FDQuery1NOME.asstring;

          VertScrollBox1.AddObject(LFrame);

          DataModule3.FDQuery1.Next;
        end;
      end);

    finally

      TThread.Synchronize(nil,
      procedure
      begin
        TLoading.Hide;
        ShowMessage(LTime.ElapsedMilliseconds.ToString);
      end);

    end;

  end).Start;
end;

procedure TForm5.btnTesteRapidoClick(Sender: TObject);
var
  LTime:TStopwatch;
begin
  TLoading.Show(self,'Aguarde, Carregando dados');
  LTime:= TStopwatch.StartNew;

  TThread.CreateAnonymousThread(
  procedure
  begin

    try

      TThread.Synchronize(nil,
      procedure
      begin
        VertScrollBox1.BeginUpdate;
      end);

      var i:integer;
      i:= 0;
      DataModule3.FDQuery1.Open;
      DataModule3.FDQuery1.First;
      while not DataModule3.FDQuery1.Eof do
      begin
        var LFrame:= TFrame1.Create(self);
        inc(i);
        LFrame.Name:= 'FrameUser'+ i.ToString;
        LFrame.lblNome.Text:= DataModule3.FDQuery1NOME.asstring;

        VertScrollBox1.AddObject(LFrame);

        DataModule3.FDQuery1.Next;
      end;

      TThread.Synchronize(nil,
      procedure
      begin
        VertScrollBox1.EndUpdate;
      end);

    finally

      TThread.Synchronize(nil,
      procedure
      begin
        TLoading.Hide;
        ShowMessage(LTime.ElapsedMilliseconds.ToString);
      end);


    end;

  end).Start;

end;

end.
