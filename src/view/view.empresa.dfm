object frmEmpresa: TfrmEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Empresas'
  ClientHeight = 442
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object btNovaEmpresa: TButton
    Left = 0
    Top = 0
    Width = 288
    Height = 41
    Align = alTop
    Caption = 'Nova Empresa'
    TabOrder = 0
    OnClick = btNovaEmpresaClick
  end
  object gridEmpresa: TDBGrid
    Left = 0
    Top = 41
    Width = 288
    Height = 359
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsEmpresa
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridEmpresaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 255
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 288
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 111
      Height = 42
      Align = alLeft
      Caption = 'N'#250'mero de registros:'
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object lblNreg: TLabel
      Left = 111
      Top = 0
      Width = 177
      Height = 42
      Align = alClient
      Alignment = taCenter
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 15
    end
  end
  object dsEmpresa: TDataSource
    DataSet = moduloConn.qrEmpresa
    Left = 120
    Top = 144
  end
end
