unit Login1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Skia, FMX.Objects, FMX.Effects;

type
  TfrmLogin1 = class(TForm)
    Circle1: TCircle;
    Circle2: TCircle;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    SkLabel1: TSkLabel;
    Rectangle2: TRectangle;
    SkLabel2: TSkLabel;
    ShadowEffect2: TShadowEffect;
    procedure Rectangle2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin1: TfrmLogin1;

implementation

{$R *.fmx}

procedure TfrmLogin1.Rectangle2Click(Sender: TObject);
begin
  Circle1.AnimateFloat('Position.Y',-400,1);
  Circle2.AnimateFloat('Position.Y',300,1);
end;

end.
