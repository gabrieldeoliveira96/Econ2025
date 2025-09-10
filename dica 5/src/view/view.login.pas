unit view.login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Skia, FMX.Objects, FMX.Effects, uLoading, view.principal;

type
  TForm3 = class(TForm)
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
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Rectangle2Click(Sender: TObject);
begin
  Circle1.AnimateFloat('Position.Y',-400,1);
  Circle2.AnimateFloat('Position.Y',300,1);


{$REGION '+'}
  TLoading.Show(self,'Aguarde carregando tela');

  TThread.CreateAnonymousThread(
  procedure
  begin
    try
      TThread.Synchronize(nil,
      procedure
      begin
        if not Assigned(frmPrincipal) then
          Application.CreateForm(TfrmPrincipal, frmPrincipal);
      end);

      sleep(2000);
      frmPrincipal.CarregaTela();

      TThread.Synchronize(nil,
      procedure
      begin
        frmPrincipal.Show;
      end);

    finally
      TThread.Synchronize(nil,
      procedure
      begin
        TLoading.Hide;
      end);
    end;

  end).Start;

{$ENDREGION}

end;

end.
