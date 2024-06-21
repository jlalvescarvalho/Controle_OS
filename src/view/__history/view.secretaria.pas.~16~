unit view.secretaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmSecretaria = class(TForm)
    btNovaSecretaria: TButton;
    gridSecretaria: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    lblNreg: TLabel;
    dsSecretaria: TDataSource;
    Label2: TLabel;
    procedure btNovaSecretariaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSecretaria: TfrmSecretaria;

implementation

{$R *.dfm}

uses view.CadastrarSecretaria, modulo;

procedure TfrmSecretaria.btNovaSecretariaClick(Sender: TObject);
begin
  frmNovaSecretaria := TfrmNovaSecretaria.Create(self);
  frmNovaSecretaria.ShowModal;

  FormShow(self)
end;

procedure TfrmSecretaria.FormShow(Sender: TObject);
begin
  moduloConn.qrSecretaria.close;
  moduloConn.qrSecretaria.Sql.clear;
  moduloConn.qrSecretaria.SQL.Add('select * from secretaria');
  moduloConn.qrSecretaria.Open;

  lblNreg.Caption := intToStr(moduloConn.qrSecretaria.RecordCount);

end;

end.
