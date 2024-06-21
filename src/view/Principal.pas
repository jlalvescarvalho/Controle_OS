unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.StdCtrls, view.rel;

type
  TfrmPrincipal = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses view.empresa, view.secretaria, modulo, view.carro, view.novaOS,
  view.todasOS;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  frmNovaOS := TfrmNovaOS.Create(self);
  frmNovaOS.Show;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  frmTodasOS := TfrmTodasOS.Create(self);
  frmTodasOS.Show;
end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  frmSecretaria := TfrmSecretaria.Create(self);
  frmSecretaria.Show;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  frmRel := TfrmRel.Create(self);
  frmRel.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  frmCarro := TfrmCarro.Create(self);
  frmCarro.Show;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  frmEmpresa := TfrmEmpresa.create(self);
  frmEmpresa.Show;
end;

end.
