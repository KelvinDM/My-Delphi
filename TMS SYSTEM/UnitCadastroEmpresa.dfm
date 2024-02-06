object FormCadastroEmpresa: TFormCadastroEmpresa
  Left = 0
  Top = 0
  Caption = 'Empresa'
  ClientHeight = 441
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object LabelEmpresa: TLabel
    Left = 8
    Top = 65
    Width = 85
    Height = 28
    Caption = 'EMPRESA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelCelularEmpresa: TLabel
    Left = 28
    Top = 129
    Width = 65
    Height = 21
    Caption = 'CELULAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 127
    Height = 23
    Caption = 'N'#250'mero interno:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object LabelNumInterno: TLabel
    Left = 141
    Top = 19
    Width = 108
    Height = 28
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EditNomeEmpresa: TEdit
    Left = 99
    Top = 67
    Width = 390
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 0
  end
  object EditCelularEmpresa: TEdit
    Left = 102
    Top = 129
    Width = 125
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Gravar: TButton
    Left = 208
    Top = 200
    Width = 169
    Height = 57
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = GravarClick
  end
  object QueryEmpresa: TADOQuery
    Connection = DmEmpresa.Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 560
    Top = 40
    object QueryEmpresaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QueryEmpresaNOME_EMPRESA: TStringField
      FieldName = 'NOME_EMPRESA'
      Size = 200
    end
    object QueryEmpresaNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 50
    end
    object QueryEmpresaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
    end
  end
end
