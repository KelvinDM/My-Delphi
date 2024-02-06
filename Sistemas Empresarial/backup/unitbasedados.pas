unit UnitBaseDados;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, ZConnection, ZDataset, ZSqlUpdate, MSSQLConn, DB;

type

	 { TDataModule1 }

    TDataModule1 = class(TDataModule)
		  DataSource1: TDataSource;
		  MSSQLConnection: TMSSQLConnection;
		  ZConnection1: TZConnection;
		  ZQuery1: TZQuery;
		  ZUpdateSQL1: TZUpdateSQL;
    private

    public

    end;

var
    DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

