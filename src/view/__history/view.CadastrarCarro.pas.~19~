unit view.CadastrarCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmNewCarro = class(TForm)
    edtModelo: TEdit;
    cbbCombustivel: TComboBox;
    cbbSecretaria: TComboBox;
    edtMotorista: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    memoObs: TMemo;
    btSalvarCarro: TButton;
    Button2: TButton;
    edtPlaca: TMaskEdit;
    cbbTipo: TComboBox;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure btSalvarCarroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetFirstPart(const S: string; const Delimiter: Char): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewCarro: TfrmNewCarro;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmNewCarro.btSalvarCarroClick(Sender: TObject);
begin
  try
    try
      moduloConn.qrtemp.Close;
      moduloConn.qrtemp.SQL.Clear;
      moduloConn.qrtemp.SQL.Add('INSERT INTO CARRO (PLACA, MODELO, COBUSTIVEL, ID_SECRETARIA, MOTORISTA, OBS, TIPO) VALUES (:placa, :modelo, :combustivel, :secretaria, :motorista, :obs, :tipo)');
      moduloConn.qrtemp.Params.ParamByName('placa').Value := edtPlaca.Text;
      moduloConn.qrtemp.Params.ParamByName('modelo').Value := edtModelo.Text;
      moduloConn.qrtemp.Params.ParamByName('combustivel').Value := cbbCombustivel.Text;
      moduloConn.qrtemp.Params.ParamByName('secretaria').Value := StrToInt(Trim(GetFirstPart(cbbSecretaria.Text, '|')));
      moduloConn.qrtemp.Params.ParamByName('motorista').Value := edtMotorista.Text;
      moduloConn.qrtemp.Params.ParamByName('obs').Value := memoObs.Text;
      moduloConn.qrtemp.Params.ParamByName('tipo').Value := cbbTipo.Text;
      moduloConn.qrtemp.ExecSQL;

      ShowMessage('Salvo com sucesso !');
    Except
    on E: Exception do
      ShowMessage('erro' + E.Message );
    end;
  finally
     moduloConn.conexao.Commit;
     moduloConn.qrTemp.Close;
     close;
  end;
end;

procedure TfrmNewCarro.Button2Click(Sender: TObject);
begin
  close;
end;




procedure TfrmNewCarro.FormShow(Sender: TObject);
begin
  moduloConn.qrSecretaria.Close;
  moduloConn.qrSecretaria.SQL.Clear;
  moduloConn.qrSecretaria.SQL.Add('select * from secretaria'); 
  moduloConn.qrSecretaria.Open;

  while not moduloConn.qrSecretaria.Eof do
  begin
    cbbSecretaria.Items.Add(moduloConn.qrSecretaria.FieldByName('id').AsString +' | '+moduloConn.qrSecretaria.FieldByName('Nome').AsString);
    moduloConn.qrSecretaria.Next;
  end;

end;

function TfrmNewCarro.GetFirstPart(const S: string; const Delimiter: Char): string;
var
  DelimiterPos: Integer;
begin
  DelimiterPos := Pos(Delimiter, S);
  if DelimiterPos > 0 then
    Result := Copy(S, 1, DelimiterPos - 1)
  else
    Result := S;  // Se o delimitador não for encontrado, retorna a string inteira
end;

end.
