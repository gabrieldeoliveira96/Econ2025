unit Login1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Skia, FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.Edit,
  FMX.Layouts, SharedPreference;

type
  TfrmLogin = class(TForm)
    Circle1: TCircle;
    Circle2: TCircle;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    SkLabel1: TSkLabel;
    Rectangle2: TRectangle;
    SkLabel2: TSkLabel;
    ShadowEffect2: TShadowEffect;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    SkLabel3: TSkLabel;
    edtEmail: TEdit;
    SkLabel4: TSkLabel;
    edtSenha: TEdit;
    procedure Rectangle2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtEmail.Text:= GetPropertiesDispositivo('email');
  edtSenha.Text:= GetPropertiesDispositivo('senha');
end;

procedure TfrmLogin.Rectangle2Click(Sender: TObject);
begin
  Circle1.AnimateFloat('Position.Y',-400,1);
  Circle2.AnimateFloat('Position.Y',300,1);

  SetPropertiesDispositivo('email',edtEmail.Text);
  SetPropertiesDispositivo('senha',edtSenha.Text);

end;

end.
