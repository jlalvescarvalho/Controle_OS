unit view.todasOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, view.imagens, Vcl.Menus;

type
  TfrmTodasOS = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    edtPlacaF: TEdit;
    edtModeloF: TEdit;
    cbbSecretariaF: TComboBox;
    btBuscar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    lblNreg: TLabel;
    ds1: TDataSource;
    qrOS: TFDQuery;
    qrOSID: TIntegerField;
    qrOSDATA: TDateField;
    qrOSSERVICO: TStringField;
    qrOSRESPONSAVEL: TWideStringField;
    qrOSIMG1: TBlobField;
    qrOSFOTO2: TBlobField;
    qrOSPLACA: TStringField;
    qrOSMODELO: TStringField;
    qrOSTIPO: TStringField;
    qrOSMOTORISTA: TStringField;
    qrOSITEM: TIntegerField;
    qrOSOBS: TStringField;
    qrOSEMPRESA: TStringField;
    qrOSSECRETARIA: TStringField;
    btLimpar: TButton;
    dt1: TJvDatePickerEdit;
    dt2: TJvDatePickerEdit;
    qrOSVALOR: TBCDField;
    qrOSCOMBUSTIVEL: TStringField;
    popUp: TPopupMenu;
    procedure edtPlacaFChange(Sender: TObject);
    procedure edtModeloFChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbSecretariaFSelect(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTodasOS: TfrmTodasOS;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmTodasOS.btBuscarClick(Sender: TObject);
begin
  qrOS.Close;
  qrOS.Params.ParamByName('dt1').value := dt1.Date;
  qrOS.Params.ParamByName('dt2').Value := dt2.Date;
  qrOS.Open;
end;

procedure TfrmTodasOS.btLimparClick(Sender: TObject);
begin
   qrOS.Filtered := False;
   Edit1.Text := '';
   edtModeloF.Text := '';
   edtPlacaF.Text := '';
   cbbSecretariaF.ItemIndex := -1;

   qrOS.Close;
   qrOS.Params.ParamByName('dt1').value := '01/01/2000';
   qrOS.Params.ParamByName('dt2').Value := '01/01/2099';
   qrOS.Open;
end;

procedure TfrmTodasOS.cbbSecretariaFSelect(Sender: TObject);
begin
  qrOS.Filtered := False;
  qrOs.filter := 'secretaria like '+QuotedStr('%'+cbbSecretariaF.Text+'%');
  qrOS.Filtered := True;
end;

procedure TfrmTodasOS.DBGrid1DblClick(Sender: TObject);
var
  id: string;
begin
  if not (DBGrid1.DataSource.DataSet.Bof and DBGrid1.DataSource.DataSet.Eof) then
  begin
    id := DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;

    frmImagens := TfrmImagens.Create(self);
    frmImagens.id := id;
    frmImagens.ShowModal;

  end;
end;

procedure TfrmTodasOS.Edit1Change(Sender: TObject);
begin
  qrOS.Filtered := False;
  qrOs.filter := 'responsavel like '+QuotedStr('%'+Edit1.Text+'%');
  qrOS.Filtered := True;
end;

procedure TfrmTodasOS.edtModeloFChange(Sender: TObject);
begin
  qrOS.Filtered := False;
  qrOs.filter := 'modelo like '+QuotedStr('%'+edtModeloF.Text+'%');
  qrOS.Filtered := True;
end;

procedure TfrmTodasOS.edtPlacaFChange(Sender: TObject);
begin
  qrOS.Filtered := False;
  qrOs.filter := 'placa like '+QuotedStr('%'+edtPlacaF.Text+'%');
  qrOS.Filtered := True;
end;

procedure TfrmTodasOS.FormShow(Sender: TObject);
begin

  frmTodasOS.Width := Screen.Width;
  frmTodasOS.Height := Screen.Height;

  qrOS.Close;
  qrOS.Params.ParamByName('dt1').value := StrToDate('01/01/2000');
  qrOS.Params.ParamByName('dt2').Value := StrToDate('01/01/2099');
  qrOS.Open;

  moduloConn.qrSecretaria.Close;
  moduloConn.qrSecretaria.SQL.Clear;
  moduloConn.qrSecretaria.SQL.Add('select * from secretaria');
  moduloConn.qrSecretaria.Open;

  while not moduloConn.qrSecretaria.Eof do
  begin
    cbbSecretariaF.Items.Add(moduloConn.qrSecretaria.FieldByName('Nome').AsString);
    moduloConn.qrSecretaria.Next;
  end;

end;

end.
