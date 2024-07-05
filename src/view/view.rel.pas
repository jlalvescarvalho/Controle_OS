unit view.rel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.ExtCtrls,
  AdvSmoothButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, modulo, view.locVeiculo;

type
  TfrmRel = class(TForm)
    cbbRel: TComboBox;
    lbl1: TLabel;
    Label1: TLabel;
    cbbGrupo: TComboBox;
    pnl1: TPanel;
    grp1: TGroupBox;
    dt1: TJvDatePickerEdit;
    dt2: TJvDatePickerEdit;
    lbl2: TLabel;
    AdvSmoothButton1: TAdvSmoothButton;
    frxrprt1: TfrxReport;
    frxSintetico: TfrxDBDataset;
    qrRel: TFDQuery;
    cbbCarro: TComboBox;
    lbl3: TLabel;
    cbbTipo: TComboBox;
    lbl4: TLabel;
    lbl5: TLabel;
    cbbEmpresa: TComboBox;
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbCarroSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      placa : string;
      idCarro : integer;
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

procedure TfrmRel.AdvSmoothButton1Click(Sender: TObject);
var
  grupo, periodo, placa, tipo, empresa : string;
begin

  if cbbRel.Text = 'RELATÓRIO SINTÉTICO' then
  begin

    if cbbGrupo.Text = 'TODOS' then
    begin
       grupo := '';
    end
    else
    begin
      grupo := ' and s.nome ='+ QuotedStr(cbbGrupo.Text);
    end;

    if cbbCarro.Text <> 'TODOS' then
      placa := ' and c.placa = '+QuotedStr(cbbCarro.Text)
    else
      placa := '';

    if cbbTipo.Text = 'TODOS' then
       tipo := ''
    else
      tipo :=  ' and c.tipo = '+QuotedStr(cbbTipo.Text);

    if cbbEmpresa.Text = 'TODOS' then
       empresa := ''
    else
      empresa :=  ' and e.nome = '+QuotedStr(cbbEmpresa.Text);

    periodo := ' where os.data between :dt1 and :dt2';

    frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'rel\rel001.fr3');

    qrRel.Close;
    qrRel.SQL.Clear;
    qrRel.SQL.Add('select os.*, c.*, e.nome as empresa, s.nome as secretaria from os ');
    qrRel.SQL.Add('inner join carro c on os.id_carro = c.id ');
    qrRel.SQL.Add('inner join secretaria s on c.id_secretaria = s.id ');
    qrRel.SQL.Add('inner join empresa e on os.id_empresa = e.id '+periodo+placa+tipo+empresa+grupo);
    qrRel.Params.ParamByName('dt1').AsDateTime := dt1.Date;
    qrRel.Params.ParamByName('dt2').AsDateTime := dt2.Date;
    qrRel.Open;

    frxrprt1.ShowReport;

  end
  else if cbbRel.Text = 'RELATÓRIO ANALÍTICO' then
  begin


    if cbbGrupo.Text = 'TODOS' then
    begin
       grupo := '';
    end
    else
    begin
      grupo := ' and s.nome ='+ QuotedStr(cbbGrupo.Text);
    end;

    if cbbCarro.Text <> 'TODOS' then
      placa := ' and c.placa = '+QuotedStr(cbbCarro.Text)
    else
      placa := '';

    if cbbTipo.Text = 'TODOS' then
       tipo := ''
    else
      tipo :=  ' and c.tipo = '+QuotedStr(cbbTipo.Text);

    if cbbEmpresa.Text = 'TODOS' then
       empresa := ''
    else
      empresa :=  ' and e.nome = '+QuotedStr(cbbEmpresa.Text);

    periodo := ' where os.data between :dt1 and :dt2';

    frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'rel\rel002.fr3');

    qrRel.Close;
    qrRel.SQL.Clear;
    qrRel.SQL.Add('select os.*, c.*, e.nome as empresa, s.nome as secretaria from os ');
    qrRel.SQL.Add('inner join carro c on os.id_carro = c.id ');
    qrRel.SQL.Add('inner join secretaria s on c.id_secretaria = s.id ');
    qrRel.SQL.Add('inner join empresa e on os.id_empresa = e.id '+periodo+placa+tipo+empresa+grupo);
    qrRel.Params.ParamByName('dt1').AsDateTime := dt1.Date;
    qrRel.Params.ParamByName('dt2').AsDateTime := dt2.Date;
    qrRel.Open;

    frxrprt1.ShowReport;
  end;


end;

procedure TfrmRel.cbbCarroSelect(Sender: TObject);
begin
  if cbbCarro.Text = 'SELECIONAR' then
  begin
    placa := '';
    idCarro := 0;
    frmLocVeic := TfrmLocVeic.Create(self);
    try
      if frmLocVeic.ShowModal = mrOk then
      begin
        placa := frmLocVeic.Placa;
        idCarro := frmLocVeic.IdCarro;
        cbbCarro.Items.Add(placa);
        cbbCarro.ItemIndex := cbbCarro.Items.IndexOf(placa);
      end;
    finally
      frmLocVeic.Free;
    end;

  end;
end;

procedure TfrmRel.FormShow(Sender: TObject);
begin
  dt1.Date := Date;
  dt2.Date := Date;

  moduloConn.qrSecretaria.Close;
  moduloConn.qrSecretaria.SQL.Clear;
  moduloConn.qrSecretaria.SQL.Add('select * from secretaria');
  moduloConn.qrSecretaria.Open;

  while not moduloConn.qrSecretaria.Eof do
  begin
    cbbGrupo.Items.Add(moduloConn.qrSecretaria.FieldByName('Nome').AsString);
    moduloConn.qrSecretaria.Next;
  end;

  moduloConn.qrTemp.Close;
  moduloConn.qrTemp.SQL.Clear;
  moduloConn.qrTemp.SQL.Add('select tipo, count(*) from carro group by tipo');
  moduloConn.qrTemp.Open;

  while not moduloConn.qrTemp.Eof do
  begin
    cbbTipo.Items.Add(moduloConn.qrTemp.FieldByName('tipo').AsString);
    moduloConn.qrTemp.Next;
  end;

  moduloConn.qrTemp.Close;
  moduloConn.qrTemp.SQL.Clear;
  moduloConn.qrTemp.SQL.Add('select * from empresa');
  moduloConn.qrTemp.Open;

  while not moduloConn.qrTemp.Eof do
  begin
    cbbEmpresa.Items.Add(moduloConn.qrTemp.FieldByName('nome').AsString);
    moduloConn.qrTemp.Next;
  end;
end;

end.
