object FormConexao: TFormConexao
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=master'
      'User_Name=master'
      'Server=localhost'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDQueryClientes: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 128
    Top = 16
    object FDQueryClientesID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 50
    end
    object FDQueryClientesDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object FDQueryClientesNUMERO_TELEFONE: TStringField
      FieldName = 'NUMERO_TELEFONE'
      Origin = 'NUMERO_TELEFONE'
      Size = 50
    end
    object FDQueryClientesNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'NUMERO_CELULAR'
      Size = 50
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = FDQueryClientes
    Left = 120
    Top = 80
  end
  object FDQueryProdutos: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 232
    Top = 16
    object FDQueryProdutosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQueryProdutosVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      currency = True
    end
    object FDQueryProdutosSALDO_ESTOQUE: TIntegerField
      FieldName = 'SALDO_ESTOQUE'
      Origin = 'SALDO_ESTOQUE'
    end
  end
  object DataSourceProdutos: TDataSource
    DataSet = FDQueryProdutos
    Left = 232
    Top = 80
  end
  object FDQueryVenda: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM VENDAS')
    Left = 344
    Top = 16
    object FDQueryVendaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryVendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object FDQueryVendaVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object FDQueryVendaDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryVendaDESCONTO_PERC: TBCDField
      FieldName = 'DESCONTO_PERC'
      Origin = 'DESCONTO_PERC'
      Precision = 5
      Size = 2
    end
    object FDQueryVendaDESCONTO_VALOR: TBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = 'DESCONTO_VALOR'
      Precision = 10
      Size = 2
    end
  end
  object FDQueryItensVenda: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM ITENS_VENDA')
    Left = 472
    Top = 16
    object FDQueryItensVendaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryItensVendaVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
      Origin = 'VENDA_ID'
    end
    object FDQueryItensVendaPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
    end
    object FDQueryItensVendaQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQueryItensVendaPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      Precision = 10
      Size = 2
    end
    object FDQueryItensVendaDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 10
      Size = 2
    end
    object FDQueryItensVendaSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 10
      Size = 2
    end
    object FDQueryItensVendaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 10
      Size = 2
    end
  end
  object DataSourceVenda: TDataSource
    DataSet = FDQueryVenda
    Left = 344
    Top = 80
  end
  object DataSourceItensVenda: TDataSource
    DataSet = FDQueryItensVenda
    Left = 472
    Top = 80
  end
  object FDQueryItensVendaAux: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT *'
      'FROM ITENS_VENDA'
      'WHERE VENDA_ID=:VENDAID ')
    Left = 112
    Top = 200
    ParamData = <
      item
        Name = 'VENDAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object IntegerField1: TIntegerField
      FieldName = 'VENDA_ID'
      Origin = 'VENDA_ID'
    end
    object IntegerField2: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
    end
    object IntegerField3: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object BCDField1: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      Precision = 10
      Size = 2
    end
    object BCDField2: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 10
      Size = 2
    end
    object BCDField3: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 10
      Size = 2
    end
    object BCDField4: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 10
      Size = 2
    end
  end
  object DataSourceItensVendaAux: TDataSource
    DataSet = FDQueryItensVendaAux
    Left = 112
    Top = 256
  end
  object FDQueryRelatVendas: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      #9'V.ID'#9#9#9'AS'#9'"ID",'
      #9'V.ID_CLIENTE '#9#9'AS'#9'"ID_CLIENTE",'
      #9'C.NOME_CLIENTE '#9#9'AS'#9'"NOME_CLIENTE" ,'
      #9'C.NUMERO_TELEFONE'#9'AS'#9'"NUMERO_TELEFONE" , '
      #9'C.NUMERO_CELULAR '#9'AS'#9'"NUMERO_CELULAR" ,'#9
      #9'V.VALOR_TOTAL '#9#9'AS'#9'"VALOR_TOTAL", '
      #9'V.DESCONTO_VALOR '#9'AS'#9'"DESCONTO_VALOR", '
      #9'V.DESCONTO_PERC '#9'AS'#9'"DESCONTO_PERC", '
      #9'V.DATA_VENDA '#9#9'AS'#9'"DATA_VENDA" ,'
      #9'IV.PRODUTO_ID'#9#9'AS '#9'"PRODUTO_ID" ,'
      #9'IV.QUANTIDADE '#9#9'AS'#9'"QUANTIDADE" ,'
      #9'IV.PRECO_UNITARIO '#9'AS '#9'"PRECO_UNITARIO",'
      #9'IV.DESCONTO '#9#9'AS '#9'"DESCONTO" ,'
      #9'IV.SUBTOTAL '#9#9'AS '#9'"SUBTOTAL" ,'
      #9'P.DESCRICAO '#9#9'AS '#9'"NOME_PRODUTO"'
      'FROM VENDAS V'
      #9'INNER JOIN CLIENTES C ON (V.ID_CLIENTE = C.ID)'
      #9'INNER JOIN ITENS_VENDA IV ON (IV.VENDA_ID = V.ID)'
      #9'INNER JOIN PRODUTOS P ON (P.ID = IV.PRODUTO_ID)'
      'WHERE 1=1;')
    Left = 256
    Top = 200
    object FDQueryRelatVendasID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQueryRelatVendasID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object FDQueryRelatVendasNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME_CLIENTE'
      Size = 50
    end
    object FDQueryRelatVendasNUMERO_TELEFONE: TStringField
      FieldName = 'NUMERO_TELEFONE'
      Origin = 'NUMERO_TELEFONE'
      Size = 50
    end
    object FDQueryRelatVendasNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'NUMERO_CELULAR'
      Size = 50
    end
    object FDQueryRelatVendasVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object FDQueryRelatVendasDESCONTO_VALOR: TBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = 'DESCONTO_VALOR'
      Precision = 10
      Size = 2
    end
    object FDQueryRelatVendasDESCONTO_PERC: TBCDField
      FieldName = 'DESCONTO_PERC'
      Origin = 'DESCONTO_PERC'
      Precision = 5
      Size = 2
    end
    object FDQueryRelatVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryRelatVendasPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
    end
    object FDQueryRelatVendasQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQueryRelatVendasPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      Precision = 10
      Size = 2
    end
    object FDQueryRelatVendasDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      Precision = 10
      Size = 2
    end
    object FDQueryRelatVendasSUBTOTAL: TBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      Precision = 10
      Size = 2
    end
    object FDQueryRelatVendasNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Origin = 'NOME_PRODUTO'
      Size = 100
    end
  end
  object DataSourceRelatVendas: TDataSource
    DataSet = FDQueryRelatVendas
    Left = 256
    Top = 256
  end
end
