object DmEmpresa: TDmEmpresa
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=master;Data Source=localho' +
      'st;Initial File Name="";Server SPN="";Authentication="";Access T' +
      'oken=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 72
    Top = 264
  end
  object QueryAux: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    Left = 72
    Top = 328
  end
end
