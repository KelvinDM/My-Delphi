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
  object FDQueryItensVendaDistinto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT MAX(ID) AS "ID" ,'
      #9#9'MAX(PRODUTO_ID) AS "PRODUTO_ID" , '
      #9#9'MAX(PRECO_UNITARIO) AS "PRECO_UNITARIO"'
      'FROM ITENS_VENDA'
      'WHERE NUMERO_CONTROLE = :NUMCTR'
      'GROUP BY PRODUTO_ID;'
      '')
    Left = 112
    Top = 216
    ParamData = <
      item
        Name = 'NUMCTR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItensVendaDistintoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryItensVendaDistintoPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
      ReadOnly = True
    end
    object FDQueryItensVendaDistintoPRECO_UNITARIO: TBCDField
      FieldName = 'PRECO_UNITARIO'
      Origin = 'PRECO_UNITARIO'
      ReadOnly = True
      Precision = 10
      Size = 2
    end
  end
  object DataSourceItensVendaDistintos: TDataSource
    DataSet = FDQueryItensVendaDistinto
    Left = 112
    Top = 272
  end
end
