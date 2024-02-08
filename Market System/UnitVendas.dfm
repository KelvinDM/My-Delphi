object FormVendas: TFormVendas
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 875
  ClientWidth = 1157
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ScreenSnap = True
  OnClose = FormClose
  OnCreate = FormCreate
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
    Height = 792
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 856
      Height = 790
      Align = alLeft
      TabOrder = 0
      ExplicitTop = 3
      object Cliente: TLabel
        Left = 6
        Top = 81
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
        Left = -2
        Top = 147
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
        Left = 510
        Top = 508
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
        Top = 230
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
        Left = 523
        Top = 462
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
      object LabelCodigo: TLabel
        Left = 6
        Top = 20
        Width = 88
        Height = 37
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object PanelBotaoFinalizarVenda: TPanel
        Left = 584
        Top = 77
        Width = 250
        Height = 66
        Cursor = crHandPoint
        Caption = 'Finalizar Venda'
        Color = 8454016
        ParentBackground = False
        TabOrder = 0
        OnClick = PanelBotaoFinalizarVendaClick
      end
      object EditValorTotal: TEdit
        Left = 639
        Top = 505
        Width = 210
        Height = 45
        Alignment = taCenter
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EditQuantidade: TEdit
        Left = 147
        Top = 234
        Width = 202
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnKeyPress = EditQuantidadeKeyPress
      end
      object EditDescontoTotal: TEdit
        Left = 641
        Top = 466
        Width = 193
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnExit = EditDescontoTotalExit
        OnKeyPress = EditDescontoTotalKeyPress
      end
      object PanelInserirItemVenda: TPanel
        Left = 37
        Top = 324
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
      object PanelExcluitItem: TPanel
        Left = 245
        Top = 324
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
        TabOrder = 5
        OnClick = PanelExcluitItemClick
      end
      object EditNomeClienteVenda: TEdit
        Left = 147
        Top = 85
        Width = 202
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object ButtonBuscaCliente: TButton
        Left = 348
        Top = 85
        Width = 75
        Height = 36
        Caption = 'Buscar'
        TabOrder = 7
        OnClick = ButtonBuscaClienteClick
      end
      object EditCodCliente: TEdit
        Left = 100
        Top = 85
        Width = 48
        Height = 36
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object PanelMetodoDeDesconto: TPanel
        Left = 639
        Top = 422
        Width = 185
        Height = 35
        BevelOuter = bvNone
        TabOrder = 9
        object RbPorcentagem: TRadioButton
          Left = 8
          Top = 8
          Width = 113
          Height = 17
          Caption = 'Porcentagem'
          TabOrder = 0
          OnClick = RbPorcentagemClick
        end
        object RbValorReal: TRadioButton
          Left = 106
          Top = 8
          Width = 79
          Height = 17
          Caption = 'Valor'
          TabOrder = 1
        end
      end
      object PanelBotaoCancelarVenda: TPanel
        Left = 584
        Top = 5
        Width = 250
        Height = 66
        Cursor = crHandPoint
        Caption = 'Cancelar Venda'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        OnClick = PanelBotaoCancelarVendaClick
      end
      object PanelBotaoVerificarEstoque: TPanel
        Left = 429
        Top = 156
        Width = 98
        Height = 36
        Cursor = crHandPoint
        Caption = 'Verificar estoque'
        Color = 10928383
        ParentBackground = False
        TabOrder = 11
        OnClick = PanelBotaoVerificarEstoqueClick
      end
      object DBGridItemVenda: TDBGrid
        Left = 1
        Top = 556
        Width = 854
        Height = 233
        Align = alBottom
        DataSource = FormConexao.DataSourceItensVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PRODUTO_ID'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo Produto'
            Width = 92
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PRECO_UNITARIO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Valor Unid.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DESCONTO'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Valor Desconto'
            Width = 96
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SUBTOTAL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Subtotal'
            Width = 91
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Valor Total'
            Width = 97
            Visible = True
          end>
      end
      object EditCodProduto: TEdit
        Left = 100
        Top = 157
        Width = 48
        Height = 36
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object EditNomeProduto: TEdit
        Left = 147
        Top = 157
        Width = 202
        Height = 36
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
      end
      object ButtonBuscaProduto: TButton
        Left = 348
        Top = 156
        Width = 75
        Height = 36
        Caption = 'Buscar'
        TabOrder = 15
        OnClick = ButtonBuscaProdutoClick
      end
      object EditCodigoVenda: TEdit
        Left = 100
        Top = 16
        Width = 69
        Height = 36
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object PanelNovaVenda: TPanel
        Left = 328
        Top = 5
        Width = 250
        Height = 66
        Cursor = crHandPoint
        Caption = 'Nova Venda'
        Color = 10928383
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 17
        Visible = False
        OnClick = PanelNovaVendaClick
      end
      object PanelAtualizarValorTotal: TPanel
        Left = 599
        Top = 358
        Width = 250
        Height = 66
        Cursor = crHandPoint
        Caption = 'Atualizar Valor Total'
        Color = 10928383
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 18
        OnClick = PanelAtualizarValorTotalClick
      end
    end
  end
end
