object frmNovaSecretaria: TfrmNovaSecretaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastrar Secretaria'
  ClientHeight = 122
  ClientWidth = 270
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
    Width = 270
    Height = 26
    Align = alTop
    Alignment = taCenter
    Caption = 'Secretaria'
    Layout = tlBottom
  end
  object edtNome: TEdit
    Left = 0
    Top = 32
    Width = 270
    Height = 41
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object btSalvarSecretaria: TButton
    Left = 85
    Top = 79
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
    OnClick = btSalvarSecretariaClick
  end
end
