unit view.novaOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtDlgs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JPEG;

type
  TfrmNovaOS = class(TForm)
    edtVeiculo: TEdit;
    Image1: TImage;
    Label1: TLabel;
    dt1: TDateTimePicker;
    cbbEmpresa: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtResponsavel: TEdit;
    Label4: TLabel;
    memoServico: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    btSalvarOS: TButton;
    btCancelar: TButton;
    GroupBox1: TGroupBox;
    img1: TImage;
    btCarrega1: TButton;
    img2: TImage;
    btCarrega2: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    qrOS_Temp: TFDQuery;
    OpenPictureDialog2: TOpenPictureDialog;
    edtTotal: TEdit;
    procedure Image1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCarrega1Click(Sender: TObject);
    procedure btCarrega2Click(Sender: TObject);
    procedure edtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvarOSClick(Sender: TObject);
    procedure edtTotalChange(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
  private
    function GetFirstPart(const S: string; const Delimiter: Char): string;
    { Private declarations }
  public
    { Public declarations }
    var
      placa : string;
      idCarro : integer;
  end;

var
  frmNovaOS: TfrmNovaOS;

implementation

{$R *.dfm}

uses view.locVeiculo, modulo, uFormat;

procedure TfrmNovaOS.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNovaOS.btCarrega1Click(Sender: TObject);
var
 ext : string;
begin
  if OpenPictureDialog1.Execute then
  begin
    ext := UpperCase(ExtractFileExt(OpenPictureDialog1.FileName));
    if (ext <> '.BMP') and (ext <> '.JPG') and (ext <> '.JPEG') then begin
      raise EAccessViolation.Create('Formato de imagem n�o suportado! Formato suportado: Jpeg ou Bitmap');
      Abort;
    end;
    img1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;

end;

procedure TfrmNovaOS.btCarrega2Click(Sender: TObject);
var
 ext : string;
begin
  if OpenPictureDialog2.Execute then
  begin
    ext := UpperCase(ExtractFileExt(OpenPictureDialog2.FileName));
    if (ext <> '.BMP') and (ext <> '.JPG') and (ext <> '.JPEG') then begin
      raise EAccessViolation.Create('Formato de imagem n�o suportado! Formato suportado: Jpeg ou Bitmap');
      Abort;
    end;
    img2.Picture.LoadFromFile(OpenPictureDialog2.FileName);
  end;
end;

procedure TfrmNovaOS.btSalvarOSClick(Sender: TObject);
var
  MemoryStream, MemoryStream1: TMemoryStream;
  Jpg, Jpg1: TJPEGImage;
  ext, ext1: string;
  Bitmap: TBitmap;
  valor: Double;
  idEmpresa: Integer;
  valorTexto: string;
begin
  MemoryStream := TMemoryStream.Create;
  MemoryStream1 := TMemoryStream.Create;
  Bitmap := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  Jpg1 := TJPEGImage.Create;

  try
    // Verificar se a imagem foi selecionada e carregar imagens
    if OpenPictureDialog1.FileName <> '' then
    begin
      ext := UpperCase(ExtractFileExt(OpenPictureDialog1.FileName));
      if ext = '.BMP' then
      begin
        Bitmap.LoadFromFile(OpenPictureDialog1.FileName);
        Jpg.Assign(Bitmap);
        Jpg.Compress;
      end
      else
      begin
        Jpg.LoadFromFile(OpenPictureDialog1.FileName);
      end;
      Jpg.SaveToStream(MemoryStream);
      MemoryStream.Position := 0;
    end;

    if OpenPictureDialog2.FileName <> '' then
    begin
      ext1 := UpperCase(ExtractFileExt(OpenPictureDialog2.FileName));
      if ext1 = '.BMP' then
      begin
        Bitmap.LoadFromFile(OpenPictureDialog2.FileName);
        Jpg1.Assign(Bitmap);
        Jpg1.Compress;
      end
      else
      begin
        Jpg1.LoadFromFile(OpenPictureDialog2.FileName);
      end;
      Jpg1.SaveToStream(MemoryStream1);
      MemoryStream1.Position := 0;
    end;

    // Remover pontos de separa��o de milhares e converter o texto do valor para Double
    valorTexto := StringReplace(edtTotal.Text, '.', '', [rfReplaceAll]);
    if not TryStrToFloat(valorTexto, valor) then
      raise Exception.Create('Valor inv�lido!');

    // Extrair e converter idEmpresa de cbbEmpresa.Text
    idEmpresa := StrToInt(Trim(GetFirstPart(cbbEmpresa.Text, '|')));

    qrOS_Temp.Close;
    qrOS_Temp.SQL.Clear;
    qrOS_Temp.SQL.Add('INSERT INTO OS (DATA, ID_CARRO, ID_EMPRESA, SERVICO, RESPONSAVEL, VALOR, IMG1, FOTO2) ' +
                      'VALUES (:data, :idCarro, :idEmpresa, :servico, :responsavel, :valor, :img1, :foto2)');
    qrOS_Temp.Params.ParamByName('data').AsDate := dt1.Date;
    qrOS_Temp.Params.ParamByName('idCarro').AsInteger := idCarro;
    qrOS_Temp.Params.ParamByName('idEmpresa').AsInteger := idEmpresa;
    qrOS_Temp.Params.ParamByName('servico').Value := memoServico.Text;
    qrOS_Temp.Params.ParamByName('responsavel').Value := edtResponsavel.Text;
    qrOS_Temp.Params.ParamByName('valor').AsFloat := valor;

    if MemoryStream.Size > 0 then
      qrOS_Temp.Params.ParamByName('img1').LoadFromStream(MemoryStream, ftBlob)
    else
      qrOS_Temp.Params.ParamByName('img1').Clear; // Definir o par�metro como NULL

    if MemoryStream1.Size > 0 then
      qrOS_Temp.Params.ParamByName('foto2').LoadFromStream(MemoryStream1, ftBlob)
    else
      qrOS_Temp.Params.ParamByName('foto2').Clear; // Definir o par�metro como NULL

    qrOS_Temp.ExecSQL;
    ShowMessage('Salvo com sucesso!');
    Close;

  except
    on E: EConvertError do
      ShowMessage('Erro de convers�o: ' + E.Message);
    on E: EDatabaseError do
      ShowMessage('Erro no banco de dados: ' + E.Message);
    on E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

  // Liberar os objetos no bloco finally
  Jpg.Free;
  Jpg1.Free;
  Bitmap.Free;
  MemoryStream.Free;
  MemoryStream1.Free;
end;



procedure TfrmNovaOS.edtTotalChange(Sender: TObject);
begin
  Formatar(edtTotal, TFormato.Valor);
end;

procedure TfrmNovaOS.edtTotalExit(Sender: TObject);
begin
  edtTotal.Text := FormatFloat('###,###,##0.00', StrToFloat(edtTotal.Text));
end;

procedure TfrmNovaOS.edtVeiculoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    frmLocVeic := TfrmLocVeic.Create(self);
    frmLocVeic.edtVeiculo.Text := edtVeiculo.Text;
    frmLocVeic.ShowModal;
  end;
end;

procedure TfrmNovaOS.FormShow(Sender: TObject);
begin

  OpenPictureDialog1.Filter := 'JPEG Image|*.jpg;*.jpeg';
  OpenPictureDialog1.DefaultExt := 'jpg';
  OpenPictureDialog2.Filter := 'JPEG Image|*.jpg;*.jpeg';
  OpenPictureDialog2.DefaultExt := 'jpg';

  moduloConn.qrEmpresa.Close;
  moduloConn.qrEmpresa.SQL.Clear;
  moduloConn.qrEmpresa.SQL.Add('select * from empresa');
  moduloConn.qrEmpresa.Open;

  while not moduloConn.qrEmpresa.Eof do
  begin
    cbbEmpresa.Items.Add(moduloConn.qrEmpresa.FieldByName('id').AsString +' | '+moduloConn.qrEmpresa.FieldByName('Nome').AsString);
    moduloConn.qrEmpresa.Next;
  end;

  edtTotal.Text := '0,00';
  dt1.Date := Date;
end;

procedure TfrmNovaOS.Image1Click(Sender: TObject);
begin
  placa := '';
  idCarro := 0;
  frmLocVeic := TfrmLocVeic.Create(self);
  try
    if frmLocVeic.ShowModal = mrOk then
    begin
      placa := frmLocVeic.Placa;
      idCarro := frmLocVeic.IdCarro;
    end;
  finally
    frmLocVeic.Free;
  end;
  edtVeiculo.Text := placa;


end;

function TfrmNovaOS.GetFirstPart(const S: string; const Delimiter: Char): string;
var
  DelimiterPos: Integer;
begin
  DelimiterPos := Pos(Delimiter, S);
  if DelimiterPos > 0 then
    Result := Copy(S, 1, DelimiterPos - 1)
  else
    Result := S;
end;


end.
