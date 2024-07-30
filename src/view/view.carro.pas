unit view.carro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Menus;

type
  TfrmCarro = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dsCarro: TDataSource;
    btNovo: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    lblNreg: TLabel;
    pm1: TPopupMenu;
    E1: TMenuItem;
    procedure btNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure E1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarro: TfrmCarro;

implementation

{$R *.dfm}

uses modulo, view.CadastrarCarro;

procedure TfrmCarro.btNovoClick(Sender: TObject);
begin
  frmNewCarro := TfrmNewCarro.Create(self);
  frmNewCarro.tipo := 'insert';
  frmNewCarro.Show;

  FormShow(self);
end;

procedure TfrmCarro.DBGrid1DblClick(Sender: TObject);
var
  id: string;
begin
  if not (DBGrid1.DataSource.DataSet.Bof and DBGrid1.DataSource.DataSet.Eof) then
  begin
    id := DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;

    if MessageDlg('Deseja mesmo apagar a Carro?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    begin
      moduloConn.qrTemp.Close;
      moduloConn.qrTemp.SQL.Clear;
      moduloConn.qrTemp.SQL.Add('delete from carro where id = '+id);
      moduloConn.qrtemp.ExecSQL;

      moduloConn.conexao.commit;

      FormShow(self);
    end;
  end;
end;

procedure TfrmCarro.E1Click(Sender: TObject);
var
  id: string;
begin
  if not (DBGrid1.DataSource.DataSet.Bof and DBGrid1.DataSource.DataSet.Eof) then
  begin
    id := DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;

    frmNewCarro := TfrmNewCarro.Create(self);
    frmNewCarro.tipo := 'update';
    frmNewCarro.id := StrToInt(id);
    frmNewCarro.Show;

    FormShow(self);

  end;
end;

procedure TfrmCarro.FormShow(Sender: TObject);
begin
  moduloConn.qrCarro.close;
  moduloConn.qrCarro.Sql.clear;
  moduloConn.qrCarro.SQL.Add('select c.*, s.nome as secretaria from carro c inner join secretaria s on c.ID_SECRETARIA = s.ID');
  moduloConn.qrCarro.Open;

  lblNreg.Caption := intToStr(moduloConn.qrCarro.RecordCount);
end;

end.
