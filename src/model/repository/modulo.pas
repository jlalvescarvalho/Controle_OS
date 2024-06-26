unit modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.IBWrapper;

type
  TmoduloConn = class(TDataModule)
    conexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qrCarro: TFDQuery;
    qrEmpresa: TFDQuery;
    qrSecretaria: TFDQuery;
    qrCarroID: TIntegerField;
    qrCarroPLACA: TStringField;
    qrCarroMODELO: TStringField;
    qrCarroTIPO: TStringField;
    qrCarroMOTORISTA: TStringField;
    qrCarroITEM: TIntegerField;
    qrCarroOBS: TStringField;
    qrSecretariaID: TIntegerField;
    qrSecretariaNOME: TStringField;
    qrTemp: TFDQuery;
    qrEmpresaID: TIntegerField;
    qrEmpresaNOME: TStringField;
    qrCarroID_SECRETARIA: TIntegerField;
    qrCarroSECRETARIA: TStringField;
    qrOS: TFDQuery;
    qrOSID: TIntegerField;
    qrOSDATA: TDateField;
    qrOSID_CARRO: TIntegerField;
    qrOSID_EMPRESA: TIntegerField;
    qrOSSERVICO: TStringField;
    qrOSRESPONSAVEL: TWideStringField;
    qrOSVALOR: TFMTBCDField;
    qrOSEMPRESA: TStringField;
    qrOSSECRETARIA: TStringField;
    qrCarroCOMBUSTIVEL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  moduloConn: TmoduloConn;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
