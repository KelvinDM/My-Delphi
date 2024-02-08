object FormCadastros: TFormCadastros
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FormCadastros'
  ClientHeight = 816
  ClientWidth = 1120
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object PanelTopCadastros: TPanel
    Left = 0
    Top = 0
    Width = 1120
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
      Cursor = crHandPoint
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
      OnClick = LabelClientesClick
      OnMouseEnter = LabelClientesMouseEnter
      OnMouseLeave = LabelClientesMouseLeave
      object LabelClientes: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 25
        Width = 179
        Height = 55
        Cursor = crHandPoint
        Margins.Top = 25
        Align = alClient
        Alignment = taCenter
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = LabelClientesClick
        OnMouseEnter = LabelClientesMouseEnter
        OnMouseLeave = LabelClientesMouseLeave
        ExplicitWidth = 81
        ExplicitHeight = 31
      end
    end
    object PanelBotaoProdutos: TPanel
      Left = 185
      Top = 0
      Width = 185
      Height = 83
      Cursor = crHandPoint
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
      TabOrder = 1
      OnClick = LabelProdutosClick
      OnMouseEnter = LabelProdutosMouseEnter
      OnMouseLeave = LabelProdutosMouseLeave
      object LabelProdutos: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 25
        Width = 179
        Height = 55
        Cursor = crHandPoint
        Margins.Top = 25
        Align = alClient
        Alignment = taCenter
        Caption = 'Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = LabelProdutosClick
        OnMouseEnter = LabelProdutosMouseEnter
        OnMouseLeave = LabelProdutosMouseLeave
        ExplicitWidth = 92
        ExplicitHeight = 31
      end
    end
    object PanelBotaoFechar: TPanel
      Left = 1035
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
      TabOrder = 2
      OnClick = PanelBotaoFecharClick
      OnMouseEnter = PanelBotaoFecharMouseEnter
      OnMouseLeave = PanelBotaoFecharMouseLeave
    end
  end
  object PageControlClientePrinc: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 83
    Width = 1120
    Height = 733
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Principal Clientes'
      object PanelManipularCliente: TPanel
        Left = 0
        Top = 0
        Width = 601
        Height = 700
        Align = alLeft
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object LabelCelular: TLabel
          Left = 18
          Top = 243
          Width = 60
          Height = 28
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelTelefone: TLabel
          Left = 6
          Top = 179
          Width = 72
          Height = 28
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelDataNascimento: TLabel
          Left = 6
          Top = 122
          Width = 173
          Height = 28
          Caption = 'Data de nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelNomeCliente: TLabel
          Left = 6
          Top = 60
          Width = 54
          Height = 28
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelCodigo: TLabel
          Left = 6
          Top = 7
          Width = 65
          Height = 28
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBTextIDCliente: TDBText
          Left = 77
          Top = 1
          Width = 31
          Height = 34
          Alignment = taCenter
          DataField = 'ID'
          DataSource = FormConexao.DataSourceClientes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object PanelBotaoAlterar: TPanel
          Left = 504
          Top = 4
          Width = 90
          Height = 43
          Cursor = crHandPoint
          Caption = 'Alterar'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = PanelBotaoAlterarClick
        end
        object PanelBotaoNovoCad: TPanel
          Left = 409
          Top = 4
          Width = 90
          Height = 43
          Cursor = crHandPoint
          Caption = 'Novo Cadastro'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
          OnClick = PanelBotaoNovoCadClick
          OnMouseLeave = PanelCancelarMouseLeave
        end
        object PanelBotaoSalvarCliente: TPanel
          Left = 3
          Top = 351
          Width = 264
          Height = 60
          Cursor = crHandPoint
          Caption = 'Salvar'
          Color = clSilver
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          OnClick = PanelBotaoSalvarClienteClick
        end
        object DBEditCelular: TDBEdit
          Left = 84
          Top = 240
          Width = 165
          Height = 36
          DataField = 'NUMERO_CELULAR'
          DataSource = FormConexao.DataSourceClientes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = DateTimeNascimentoChange
          OnKeyPress = DBEditCelularKeyPress
        end
        object DBEditTelefone: TDBEdit
          Left = 84
          Top = 176
          Width = 165
          Height = 36
          DataField = 'NUMERO_TELEFONE'
          DataSource = FormConexao.DataSourceClientes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = DateTimeNascimentoChange
          OnKeyPress = DBEditTelefoneKeyPress
        end
        object DateTimeNascimento: TDateTimePicker
          Left = 185
          Top = 122
          Width = 186
          Height = 36
          Date = 32874.000000000000000000
          Time = 0.776169155091338300
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = DateTimeNascimentoChange
        end
        object DBEditNome: TDBEdit
          Left = 66
          Top = 57
          Width = 482
          Height = 36
          BiDiMode = bdLeftToRight
          DataField = 'NOME_CLIENTE'
          DataSource = FormConexao.DataSourceClientes
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          OnChange = DBEditNomeChange
          OnExit = DBEditNomeChange
          OnKeyPress = DBEditNomeKeyPress
        end
        object PanelCancelar: TPanel
          Left = 273
          Top = 351
          Width = 127
          Height = 60
          Cursor = crHandPoint
          Caption = 'Cancelar'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 7
          OnClick = PanelCancelarClick
          OnMouseEnter = PanelCancelarMouseEnter
          OnMouseLeave = PanelCancelarMouseLeave
        end
        object PanelBotaoDeletar: TPanel
          Left = 432
          Top = 351
          Width = 116
          Height = 60
          Cursor = crHandPoint
          Caption = 'Deletar'
          Color = 191
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 8
          OnClick = PanelBotaoDeletarClick
          OnMouseEnter = PanelBotaoDeletarMouseEnter
          OnMouseLeave = PanelBotaoDeletarMouseLeave
        end
      end
      object PanelBuscarCliente: TPanel
        Left = 601
        Top = 0
        Width = 511
        Height = 700
        Align = alClient
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object DBGridCadClientes: TDBGrid
          Left = 1
          Top = 113
          Width = 509
          Height = 298
          Align = alTop
          DataSource = FormConexao.DataSourceClientes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridCadClientesCellClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Title.Alignment = taCenter
              Title.Caption = 'Nome Cliente'
              Width = 230
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_NASCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Nascimento'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_CELULAR'
              Title.Alignment = taCenter
              Title.Caption = 'Celular'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_TELEFONE'
              Title.Alignment = taCenter
              Title.Caption = 'Telefone'
              Width = 120
              Visible = True
            end>
        end
        object PanelBuscaClientes: TPanel
          Left = 1
          Top = 1
          Width = 509
          Height = 112
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 20
            Top = 52
            Width = 54
            Height = 28
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 5
            Top = -1
            Width = 183
            Height = 32
            Caption = 'Busca de clientes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object PanelBotaoBuscarClientes: TPanel
            Left = 401
            Top = 44
            Width = 90
            Height = 43
            Cursor = crHandPoint
            Caption = 'Buscar'
            Color = 19967
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = PanelBotaoBuscarClientesClick
            OnMouseLeave = PanelCancelarMouseLeave
          end
          object EditNomeCliente: TEdit
            Left = 80
            Top = 45
            Width = 315
            Height = 36
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Principal Produtos'
      ImageIndex = 1
      object PanelBuscarProdutos: TPanel
        Left = 0
        Top = 0
        Width = 601
        Height = 700
        Align = alLeft
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object LabelSaldoEstoque: TLabel
          Left = 6
          Top = 179
          Width = 157
          Height = 28
          Caption = 'Saldo em estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelValorVendaProd: TLabel
          Left = 6
          Top = 122
          Width = 130
          Height = 28
          Caption = 'Valor de venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelDescricaoProd: TLabel
          Left = 6
          Top = 60
          Width = 84
          Height = 28
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object LabelCodigoProduto: TLabel
          Left = 6
          Top = 7
          Width = 65
          Height = 28
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBTextIDProduto: TDBText
          Left = 77
          Top = 1
          Width = 31
          Height = 34
          Alignment = taCenter
          DataField = 'ID'
          DataSource = FormConexao.DataSourceProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object PanelBotaoAlterarProd: TPanel
          Left = 504
          Top = 4
          Width = 90
          Height = 43
          Cursor = crHandPoint
          Caption = 'Alterar'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = PanelBotaoAlterarProdClick
        end
        object PanelBotaoNovoProd: TPanel
          Left = 409
          Top = 4
          Width = 90
          Height = 43
          Cursor = crHandPoint
          Caption = 'Novo Cadastro'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 4
          OnClick = PanelBotaoNovoProdClick
          OnMouseLeave = PanelCancelarMouseLeave
        end
        object PanelBotaoSalvarProd: TPanel
          Left = 3
          Top = 351
          Width = 264
          Height = 60
          Cursor = crHandPoint
          Caption = 'Salvar'
          Color = clSilver
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          OnClick = PanelBotaoSalvarProdClick
        end
        object DBEditSaldoEstoque: TDBEdit
          Left = 169
          Top = 176
          Width = 161
          Height = 36
          DataField = 'SALDO_ESTOQUE'
          DataSource = FormConexao.DataSourceProdutos
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 2
          OnChange = DBEditDescricaoProdutoChange
          OnKeyPress = DBEditTelefoneKeyPress
        end
        object DBEditDescricaoProduto: TDBEdit
          Left = 96
          Top = 60
          Width = 482
          Height = 36
          BiDiMode = bdLeftToRight
          DataField = 'DESCRICAO'
          DataSource = FormConexao.DataSourceProdutos
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 1
          OnChange = DBEditDescricaoProdutoChange
          OnKeyPress = DBEditNomeKeyPress
        end
        object PanelBotaoCancelarProd: TPanel
          Left = 273
          Top = 351
          Width = 127
          Height = 60
          Cursor = crHandPoint
          Caption = 'Cancelar'
          Color = 19967
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 5
          OnClick = PanelBotaoCancelarProdClick
          OnMouseEnter = PanelCancelarMouseEnter
          OnMouseLeave = PanelCancelarMouseLeave
        end
        object PanelBotaoDeletarProd: TPanel
          Left = 432
          Top = 351
          Width = 116
          Height = 60
          Cursor = crHandPoint
          Caption = 'Deletar'
          Color = 191
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
          OnClick = PanelBotaoDeletarProdClick
          OnMouseEnter = PanelBotaoDeletarMouseEnter
          OnMouseLeave = PanelBotaoDeletarMouseLeave
        end
        object DBEditValorVenda: TDBEdit
          Left = 142
          Top = 119
          Width = 165
          Height = 36
          BiDiMode = bdLeftToRight
          DataField = 'VALOR_VENDA'
          DataSource = FormConexao.DataSourceProdutos
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 13
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 7
          OnChange = DBEditDescricaoProdutoChange
          OnKeyPress = DBEditValorVendaKeyPress
        end
      end
      object PanelManipularProdutos: TPanel
        Left = 601
        Top = 0
        Width = 511
        Height = 700
        Align = alClient
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object DBGridProdutos: TDBGrid
          Left = 1
          Top = 113
          Width = 509
          Height = 298
          Align = alTop
          DataSource = FormConexao.DataSourceProdutos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGridCadClientesCellClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Width = 60
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o Produto'
              Width = 230
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SALDO_ESTOQUE'
              Title.Alignment = taCenter
              Title.Caption = 'Quant.Estoque'
              Width = 120
              Visible = True
            end>
        end
        object PanelBuscaProdutos: TPanel
          Left = 1
          Top = 1
          Width = 509
          Height = 112
          Align = alTop
          TabOrder = 1
          object LabelDescricao: TLabel
            Left = 20
            Top = 52
            Width = 84
            Height = 28
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LabelBuscaProdutos: TLabel
            Left = 5
            Top = -1
            Width = 198
            Height = 32
            Caption = 'Busca de produtos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object PanelBotaoBuscarProdutos: TPanel
            Left = 401
            Top = 44
            Width = 90
            Height = 43
            Cursor = crHandPoint
            Caption = 'Buscar'
            Color = 19967
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            OnClick = PanelBotaoBuscarProdutosClick
            OnMouseLeave = PanelCancelarMouseLeave
          end
          object EditDescricaoProduto: TEdit
            Left = 110
            Top = 44
            Width = 285
            Height = 36
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
    end
  end
end