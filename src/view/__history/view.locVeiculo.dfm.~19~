object frmLocVeic: TfrmLocVeic
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar Ve'#237'culo'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 624
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 46
      Height = 15
      Caption = 'F3 - Tipo'
    end
    object Label2: TLabel
      Left = 127
      Top = 5
      Width = 31
      Height = 15
      Caption = 'Busca'
    end
    object cbbFiltro: TComboBox
      Left = 8
      Top = 26
      Width = 113
      Height = 23
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'PLACA'
      Items.Strings = (
        'PLACA'
        'MODELO'
        'SECRETARIA'
        'TIPO'
        'COMBUSTIVEL'
        'MOTORISTA')
    end
    object edtVeiculo: TEdit
      Left = 127
      Top = 26
      Width = 501
      Height = 23
      TabOrder = 1
      OnChange = edtVeiculoChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 628
    Height = 385
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsVeiculo
    Options = [dgTitles, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODELO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COBUSTIVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTORISTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_SECRETARIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECRETARIA'
        Visible = True
      end>
  end
  object dsVeiculo: TDataSource
    DataSet = moduloConn.qrCarro
    Left = 160
    Top = 184
  end
  object ActionList1: TActionList
    Left = 360
    Top = 192
    object mudarTipo: TAction
      Caption = 'mudar tipo'
      Checked = True
      ShortCut = 114
      OnExecute = mudarTipoExecute
    end
  end
end
