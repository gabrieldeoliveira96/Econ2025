unit Login2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, System.Skia, FMX.Skia;

type
  TfrmLogin2 = class(TForm)
    Circle1: TCircle;
    Rectangle2: TRectangle;
    ShadowEffect2: TShadowEffect;
    Rectangle1: TRectangle;
    SkLabel1: TSkLabel;
    ShadowEffect1: TShadowEffect;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin2: TfrmLogin2;

implementation

{$R *.fmx}

procedure TfrmLogin2.Rectangle1Click(Sender: TObject);
begin
  Circle1.AnimateFloat('Position.Y',-500,1);
end;

end.
