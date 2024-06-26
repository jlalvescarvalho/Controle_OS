object frmCarro: TfrmCarro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Carros'
  ClientHeight = 627
  ClientWidth = 1095
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 1095
    Height = 544
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsCarro
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Width = 263
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMBUSTIVEL'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTORISTA'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1095
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btNovo: TButton
      Left = 984
      Top = 0
      Width = 111
      Height = 41
      Align = alRight
      Caption = '+ Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btNovoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 585
    Width = 1095
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
      Width = 984
      Height = 42
      Align = alClient
      Layout = tlCenter
      ExplicitWidth = 3
      ExplicitHeight = 15
    end
  end
  object dsCarro: TDataSource
    DataSet = moduloConn.qrCarro
    Left = 616
    Top = 256
  end
end
