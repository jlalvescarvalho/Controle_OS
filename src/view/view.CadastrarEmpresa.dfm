object frmCadastrarEmpresa: TfrmCadastrarEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastrar Empresa'
  ClientHeight = 123
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 305
    Height = 15
    Align = alTop
    Alignment = taCenter
    Caption = 'Empresa'
    Layout = tlBottom
    ExplicitWidth = 45
  end
  object edtNome: TEdit
    Left = 8
    Top = 32
    Width = 301
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btCadastrarEmpresa: TButton
    Left = 109
    Top = 83
    Width = 105
    Height = 33
    Caption = 'Salvar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btCadastrarEmpresaClick
  end
end
