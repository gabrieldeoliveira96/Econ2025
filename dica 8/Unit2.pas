unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Skia, FMX.Controls.Presentation, FMX.Edit, FMX.Effects, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    SkLabel1: TSkLabel;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    SkLabel2: TSkLabel;
    ShadowEffect2: TShadowEffect;
    SkLabel3: TSkLabel;
    Edit2: TEdit;
    SkLabel4: TSkLabel;
    Edit3: TEdit;
    SkLabel5: TSkLabel;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowMessage('salvar');
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage('salvar11');

end;

end.
