unit view.empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmEmpresa = class(TForm)
    btNovaEmpresa: TButton;
    gridEmpresa: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    lblNreg: TLabel;
    dsEmpresa: TDataSource;
    procedure btNovaEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridEmpresaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses view.CadastrarEmpresa, modulo;

procedure TfrmEmpresa.btNovaEmpresaClick(Sender: TObject);
begin
  frmCadastrarEmpresa := TfrmCadastrarEmpresa.Create(self);
  frmCadastrarEmpresa.ShowModal;

  FormShow(self)
end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
   moduloConn.qrEmpresa.close;
  moduloConn.qrEmpresa.Sql.clear;
  moduloConn.qrEmpresa.SQL.Add('select * from empresa');
  moduloConn.qrEmpresa.Open;

  lblNreg.Caption := intToStr(moduloConn.qrEmpresa.RecordCount);
end;

procedure TfrmEmpresa.gridEmpresaDblClick(Sender: TObject);
var
  id: string;
begin
  if not (gridEmpresa.DataSource.DataSet.Bof and gridEmpresa.DataSource.DataSet.Eof) then
  begin
    id := gridEmpresa.DataSource.DataSet.FieldByName('ID').AsString;

    if MessageDlg('Deseja mesmo apagar a empresa?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    begin
      moduloConn.qrTemp.Close;
      moduloConn.qrTemp.SQL.Clear;
      moduloConn.qrTemp.SQL.Add('delete from empresa where id = '+id);
      moduloConn.qrtemp.ExecSQL;

      moduloConn.conexao.commit;

      FormShow(self);
    end;
  end;
end;

end.
