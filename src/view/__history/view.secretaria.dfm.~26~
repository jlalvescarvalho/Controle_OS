object frmSecretaria: TfrmSecretaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Secretarias'
  ClientHeight = 442
  ClientWidth = 300
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
  object btNovaSecretaria: TButton
    Left = 0
    Top = 0
    Width = 300
    Height = 41
    Align = alTop
    Caption = 'Nova secretaria'
    TabOrder = 0
    OnClick = btNovaSecretariaClick
  end
  object gridSecretaria: TDBGrid
    Left = 0
    Top = 41
    Width = 300
    Height = 359
    Align = alClient
    BorderStyle = bsNone
    Color = clGradientActiveCaption
    DataSource = dsSecretaria
    Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridSecretariaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 230
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 300
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
      Width = 189
      Height = 42
      Align = alClient
      Alignment = taCenter
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 15
    end
    object Label2: TLabel
      Left = 176
      Top = 8
      Width = 34
      Height = 15
      Caption = 'Label2'
    end
  end
  object dsSecretaria: TDataSource
    DataSet = moduloConn.qrSecretaria
    Left = 128
    Top = 184
  end
end
