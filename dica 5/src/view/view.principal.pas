unit view.principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uLoading;

type
  TfrmPrincipal = class(TForm)
  private
    procedure AtualizaContadorCliente;
    procedure AtualizaContadorProduto;
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaTela;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

{ TfrmPrincipal }

procedure TfrmPrincipal.CarregaTela;
begin

  TThread.Synchronize(nil,
  procedure
  begin
    TLoading.ChangeText('Atualizando Produto');
  end);

  AtualizaContadorProduto;

  TThread.Synchronize(nil,
  procedure
  begin
    TLoading.ChangeText('Atualizando Cliente');
  end);

  AtualizaContadorCliente;

end;

procedure TfrmPrincipal.AtualizaContadorProduto;
begin
  sleep(2000);
end;

procedure TfrmPrincipal.AtualizaContadorCliente;
begin
  sleep(2000);

end;

end.
