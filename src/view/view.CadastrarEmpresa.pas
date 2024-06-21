unit view.CadastrarEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmCadastrarEmpresa = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    btCadastrarEmpresa: TButton;
    procedure btCadastrarEmpresaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarEmpresa: TfrmCadastrarEmpresa;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmCadastrarEmpresa.btCadastrarEmpresaClick(Sender: TObject);
begin
  try
    try

      moduloConn.qrtemp.Close;
      moduloConn.qrtemp.SQL.Clear;
      moduloConn.qrtemp.SQL.Add('insert into empresa(nome) values (:nome)');
      moduloConn.qrtemp.Params.ParamByName('nome').Value := edtNome.Text;
      moduloConn.qrtemp.ExecSQL;


      ShowMessage('Salvo com sucesso !');
    except
      on E: Exception do
        ShowMessage('erro' + E.Message );
    end;

  finally
    moduloConn.conexao.Commit;
    moduloConn.qrTemp.Close;
    close;
  end;
end;

end.
