unit Unit6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  ksTabControl, ksVirtualListView, mode.conn, ksTypes,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm6 = class(TForm)
    ksVirtualListView1: TksVirtualListView;
    Button1: TButton;
    procedure ksVirtualListView1ItemSwipe(Sender: TObject; ARow: TksVListItem;
      ASwipeDirection: TksVListSwipeDirection; AButtons: TksVListActionButtons);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

uses System.UIConsts;

procedure TForm6.Button1Click(Sender: TObject);
var
  LItem:TksVListItem;
begin
  DataModule3.FDQuery1.Open;
  DataModule3.FDQuery1.First;
  while not DataModule3.FDQuery1.Eof do
  begin
    LItem:= ksVirtualListView1.Items.Add;
    LItem.Title.Text:= DataModule3.FDQuery1NOME.AsString;
    LItem.Accessory.AccessoryType:= TksAccessoryType.atMore;
    LItem.Height:= 80;

    DataModule3.FDQuery1.Next;
  end;

end;

procedure TForm6.ksVirtualListView1ItemSwipe(Sender: TObject;
  ARow: TksVListItem; ASwipeDirection: TksVListSwipeDirection;
  AButtons: TksVListActionButtons);
begin
  if ASwipeDirection = ksSwipeFromLeft then
  begin
    AButtons.AddButton('Editar', claDodgerblue, claWhite, atDetails);
  end
  else
  begin
      AButtons.AddButton('Excluir', claSilver, claWhite, atTrash);
      AButtons.AddButton('Mais', claOrange, claWhite, atMore);
  end;

end;

end.
