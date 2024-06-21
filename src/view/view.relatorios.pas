unit view.relatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  frCoreClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmRel = class(TForm)
    qrSintetica: TFDQuery;
    cbbRelatorio: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cbbGrupo: TComboBox;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    btVisualizar: TButton;
    qrSinteticaID: TIntegerField;
    qrSinteticaDATA: TDateField;
    qrSinteticaID_CARRO: TIntegerField;
    qrSinteticaID_EMPRESA: TIntegerField;
    qrSinteticaSERVICO: TStringField;
    qrSinteticaRESPONSAVEL: TWideStringField;
    qrSinteticaVALOR: TFMTBCDField;
    qrSinteticaIMG1: TBlobField;
    qrSinteticaFOTO2: TBlobField;
    qrSinteticaID_1: TIntegerField;
    qrSinteticaPLACA: TStringField;
    qrSinteticaMODELO: TStringField;
    qrSinteticaCOBUSTIVEL: TStringField;
    qrSinteticaID_SECRETARIA: TIntegerField;
    qrSinteticaTIPO: TStringField;
    qrSinteticaMOTORISTA: TStringField;
    qrSinteticaITEM: TIntegerField;
    qrSinteticaOBS: TStringField;
    qrSinteticaEMPRESA: TStringField;
    qrSinteticaSECRETARIA: TStringField;
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRel: TfrmRel;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmRel.btVisualizarClick(Sender: TObject);
var
  grupo, periodo : string;
begin

  if cbbRelatorio.Text = 'RELATÓRIO SINTÉTICO' then
  begin

    if cbbGrupo.Text = 'TODOS' then
    begin
       grupo := '';
    end
    else
    begin
      grupo := 'group by '+ cbbGrupo.Text;
    end;


    qrSintetica.Close;
    qrSintetica.SQL.Clear;
    qrSintetica.SQL.Add('select os.*, c.*, e.nome as empresa, s.nome as secretaria from os ');
    qrSintetica.SQL.Add('inner join carro c on os.id_carro = c.id ');
    qrSintetica.SQL.Add('inner join secretaria s on c.id_secretaria = s.id ');
    qrSintetica.SQL.Add('inner join empresa e on os.id_empresa = e.id ');
    qrSintetica.Open;

    

  end;
end;

end.
