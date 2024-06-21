unit view.CadastrarSecretaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmNovaSecretaria = class(TForm)
    edtNome: TEdit;
    Label1: TLabel;
    btSalvarSecretaria: TButton;
    procedure btSalvarSecretariaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNovaSecretaria: TfrmNovaSecretaria;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmNovaSecretaria.btSalvarSecretariaClick(Sender: TObject);
begin
  try

    try
      moduloConn.qrtemp.Close;
      moduloConn.qrtemp.SQL.Clear;
      moduloConn.qrtemp.SQL.Add('insert into secretaria(nome) values (:nome)');
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
