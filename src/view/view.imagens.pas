unit view.imagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, JPEG;

type
  TfrmImagens = class(TForm)
    img1: TImage;
    img2: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      id : string;
  end;

var
  frmImagens: TfrmImagens;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmImagens.FormShow(Sender: TObject);
var
  Stm: TStream;
  Jpg: TJPEGImage;
begin
  moduloConn.qrTemp.Close;
  moduloConn.qrTemp.SQL.Clear;
  moduloConn.qrTemp.SQL.Add('select * from OS where id = '+id);
  moduloConn.qrtemp.Open;

  with moduloConn.qrtemp do
  begin
    if TBlobField(FieldByName('img1')).BlobSize > 0 then
    begin
      Stm := TMemoryStream.Create;
      Jpg := TJpegImage.Create;
    try
      TBlobField(FieldByName('img1')).SaveToStream(Stm);
      Stm.Position := 0;
      Jpg.LoadFromStream(Stm);
      try
        img1.Picture.Assign(Jpg);
      except
        img1.Picture.Assign(nil);
      end;
    finally
      Stm.Free;
      Jpg.Free;
    end;
    end
    else
      img1.Picture.Assign(nil);


//IMAGEM 2
    if TBlobField(FieldByName('foto2')).BlobSize > 0 then
    begin
      Stm := TMemoryStream.Create;
      Jpg := TJpegImage.Create;
    try
      TBlobField(FieldByName('foto2')).SaveToStream(Stm);
      Stm.Position := 0;
      Jpg.LoadFromStream(Stm);
      try
        img2.Picture.Assign(Jpg);
      except
        img2.Picture.Assign(nil);
      end;
    finally
      Stm.Free;
      Jpg.Free;
    end;
    end
    else
      img2.Picture.Assign(nil);
  end;

end;

//melhorar fun��o para duas imagens e garantir q aceite apenas JPG
end.
