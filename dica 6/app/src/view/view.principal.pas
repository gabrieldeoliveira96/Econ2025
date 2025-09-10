unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, UI.Standard,
  UI.Base, UI.Edit, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, model.crud, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, controller.sync,
  FMX.Memo.Types, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TForm1 = class(TForm)
    ButtonView1: TButtonView;
    ListView1: TListView;
    FDQuery1: TFDQuery;
    FDQuery1ID: TFDAutoIncField;
    FDQuery1NOME: TWideStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    FDQuery1SYNC: TWideStringField;
    Memo1: TMemo;
    ButtonView2: TButtonView;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ButtonView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonView2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FSync:Boolean;

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonView1Click(Sender: TObject);
begin
  controller.sync.Sync;
end;

procedure TForm1.ButtonView2Click(Sender: TObject);
begin
  FDQuery1.Append;
  FDQuery1NOME.AsString:= Edit1.Text;
  FDQuery1SYNC.AsString:= 'S';
  FDQuery1.Post;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FSync:= true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FDQuery1.Open;
end;

end.
