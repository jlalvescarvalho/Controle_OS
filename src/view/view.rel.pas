unit view.rel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, Vcl.ExtCtrls,
  AdvSmoothButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, modulo;

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
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

procedure TfrmRel.AdvSmoothButton1Click(Sender: TObject);
var
  grupo, periodo : string;
begin

  if cbbRel.Text = 'RELATÓRIO SINTÉTICO' then
  begin

    if cbbGrupo.Text = 'TODOS' then
    begin
       grupo := '';
    end
    else
    begin
      grupo := 'group by '+ cbbGrupo.Text;
    end;
    frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName) + 'rel\rel001.fr3');

    qrRel.Close;
    qrRel.SQL.Clear;
    qrRel.SQL.Add('select os.*, c.*, e.nome as empresa, s.nome as secretaria from os ');
    qrRel.SQL.Add('inner join carro c on os.id_carro = c.id ');
    qrRel.SQL.Add('inner join secretaria s on c.id_secretaria = s.id ');
    qrRel.SQL.Add('inner join empresa e on os.id_empresa = e.id ');
    qrRel.Open;

    frxrprt1.ShowReport;

  end;

end;

procedure TfrmRel.FormShow(Sender: TObject);
begin
  dt1.Date := Date;
  dt2.Date := Date;
end;

end.
