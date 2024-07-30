unit view.CadastrarCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    qrtemp: TFDQuery;
    procedure Button2Click(Sender: TObject);
    procedure btSalvarCarroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetFirstPart(const S: string; const Delimiter: Char): string;
    { Private declarations }
  public
    { Public declarations }
    var
      id : Integer;
      tipo : string;
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
      if tipo = 'insert' then
        moduloConn.qrtemp.SQL.Add('INSERT INTO CARRO (PLACA, MODELO, COMBUSTIVEL, ID_SECRETARIA, MOTORISTA, OBS, TIPO) VALUES (:placa, :modelo, :combustivel, :secretaria, :motorista, :obs, :tipo)')
      else begin
        moduloConn.qrtemp.SQL.Add('UPDATE CARRO SET PLACA = :placa, MODELO = :modelo, COMBUSTIVEL = :combustivel, ID_SECRETARIA = :secretaria, MOTORISTA = :motorista, OBS = :obs, TIPO = :tipo where id = :id');
        moduloConn.qrtemp.Params.ParamByName('id').Value := id;
      end;
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
var
  i : Integer;
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

  if tipo = 'update' then
  begin
      qrtemp.Close;
      qrtemp.SQL.Clear;
      qrtemp.SQL.Add('select c.*, s.id as secId, s.nome as secNome from carro c inner join secretaria s on c.id_secretaria = s.id where c.id = :id');
      qrtemp.Params.ParamByName('id').Value := id;
      qrtemp.Open;

     edtPlaca.Text := qrtemp.FieldByName('placa').AsString;
     edtModelo.Text := qrtemp.FieldByName('modelo').AsString;
     cbbCombustivel.Text := qrtemp.FieldByName('combustivel').AsString;

      for i := 0 to cbbCombustivel.Items.Count - 1 do
      begin
        if Pos(qrtemp.FieldByName('combustivel').AsString, cbbCombustivel.Items[i]) > 0 then
        begin
          cbbCombustivel.ItemIndex := i;
          Break;
        end;
      end;


      for i := 0 to cbbSecretaria.Items.Count - 1 do
      begin
        if Pos(qrtemp.FieldByName('secId').AsString +' | '+qrtemp.FieldByName('secNome').AsString, cbbSecretaria.Items[i]) > 0 then
        begin
          cbbSecretaria.ItemIndex := i;
          Break;
        end;
      end;
     edtMotorista.Text := qrtemp.FieldByName('motorista').AsString;
     memoObs.Text := qrtemp.FieldByName('obs').AsString;

     for i := 0 to cbbTipo.Items.Count - 1 do
      begin
        if Pos(qrtemp.FieldByName('tipo').AsString, cbbTipo.Items[i]) > 0 then
        begin
          cbbTipo.ItemIndex := i;
          Break;
        end;
      end;
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
    Result := S;  // Se o delimitador n�o for encontrado, retorna a string inteira
end;

end.
