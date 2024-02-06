object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 667
  ClientWidth = 1157
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ScreenSnap = True
  OnClose = FormClose
  TextHeight = 15
  object PanelTopCadastros: TPanel
    Left = 0
    Top = 0
    Width = 1157
    Height = 83
    Align = alTop
    BevelOuter = bvNone
    Color = 1644825
    ParentBackground = False
    TabOrder = 0
    object PanelBotaoClientes: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 83
      Align = alLeft
      BevelOuter = bvNone
      Color = 1644825
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object LabelClientes: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 25
        Width = 179
        Height = 55
        Margins.Top = 25
        Align = alClient
        Alignment = taCenter
        Caption = 'Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 74
        ExplicitHeight = 31
      end
    end
    object PanelBotaoFechar: TPanel
      Left = 1072
      Top = 0
      Width = 85
      Height = 83
      Cursor = crHandPoint
      Align = alRight
      BevelOuter = bvNone
      Caption = 'X'
      Color = 1644825
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = PanelBotaoFecharClick
      OnMouseEnter = PanelBotaoFecharMouseEnter
      OnMouseLeave = PanelBotaoFecharMouseLeave
    end
  end
  object PanelCenterVendas: TPanel
    Left = 0
    Top = 83
    Width = 1157
    Height = 584
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 856
      Height = 582
      Align = alLeft
      TabOrder = 0
      object Cliente: TLabel
        Left = 6
        Top = 36
        Width = 83
        Height = 37
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 3
        Top = 113
        Width = 96
        Height = 37
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 639
        Top = 454
        Width = 123
        Height = 37
        Caption = 'Valor total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 193
        Width = 140
        Height = 37
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 639
        Top = 299
        Width = 112
        Height = 37
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Panel2: TPanel
        Left = 479
        Top = 441
        Width = 154
        Height = 101
        Cursor = crHandPoint
        Caption = 'Finalizar Venda'
        TabOrder = 0
      end
      object EditValorTotal: TEdit
        Left = 639
        Top = 497
        Width = 210
        Height = 45
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EditQuantidade: TEdit
        Left = 149
        Top = 197
        Width = 60
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 639
        Top = 365
        Width = 193
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object PanelInserirItemVenda: TPanel
        Left = 39
        Top = 263
        Width = 170
        Height = 46
        Cursor = crHandPoint
        Caption = 'Inserir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = PanelInserirItemVendaClick
      end
      object RadioButton1: TRadioButton
        Left = 639
        Top = 342
        Width = 113
        Height = 17
        Caption = 'Porcentagem'
        TabOrder = 5
      end
      object RadioButton2: TRadioButton
        Left = 753
        Top = 342
        Width = 79
        Height = 17
        Caption = 'Valor'
        TabOrder = 6
      end
      object PanelExcluitItem: TPanel
        Left = 253
        Top = 263
        Width = 170
        Height = 46
        Cursor = crHandPoint
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = PanelExcluitItemClick
      end
      object EditNomeClienteVenda: TEdit
        Left = 147
        Top = 40
        Width = 202
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ButtonBuscaCliente: TButton
        Left = 348
        Top = 40
        Width = 75
        Height = 36
        Caption = 'Buscar'
        TabOrder = 9
        OnClick = ButtonBuscaClienteClick
      end
      object EditCodCliente: TEdit
        Left = 99
        Top = 40
        Width = 48
        Height = 36
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DBGridItemVenda: TDBGrid
        Left = 1
        Top = 315
        Width = 472
        Height = 233
        DataSource = FormConexao.DataSourceItensVenda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 11
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENDA_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUTO_ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_UNITARIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCONTO'
            Visible = True
          end>
      end
    end
  end
  object ButtonBuscaProduto: TButton
    Left = 353
    Top = 201
    Width = 75
    Height = 36
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = ButtonBuscaProdutoClick
  end
  object EditNomeProduto: TEdit
    Left = 150
    Top = 201
    Width = 202
    Height = 36
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object EditCodProduto: TEdit
    Left = 101
    Top = 201
    Width = 48
    Height = 36
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
