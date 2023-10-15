unit Conexao;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, IBConnection, SQLDB, SQLite3Conn, dbf,
	 DB;

type

	 { TDM }

    TDM = class(TDataModule)
		  ConexaoLogin: TIBConnection;
		  SQLQueryCreateUser: TSQLQuery;
		  SQLQueryID: TSQLQuery;
		  SQLQueryUsers: TSQLQuery;
		  SQLQueryUsersID: TLongintField;
		  SQLQueryUsersNOME: TStringField;
		  SQLQueryUsersSENHA: TStringField;
		  SQLQueryUsersUSUARIO: TStringField;
		  TransactionLogin: TSQLTransaction;
    private

    public

    end;

var
    DM: TDM;

implementation

{$R *.lfm}

end.

