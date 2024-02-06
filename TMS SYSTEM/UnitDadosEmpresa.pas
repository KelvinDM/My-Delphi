unit UnitDadosEmpresa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Dialogs,
  Datasnap.DBClient ;

type
  TDmEmpresa = class(TDataModule)
    Conexao: TADOConnection;
    QueryAux: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    //procedure DataModuleCreate(Sender: Tobject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmEmpresa: TDmEmpresa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}





procedure TDmEmpresa.DataModuleCreate(Sender: TObject);
begin
    conexao.Connected := False;
    conexao.ConnectionString := conexao.ConnectionString;

    try
        conexao.Connected := True;
    except
        on e: exception do begin
              ShowMessage('Erro ao conectar:' + #13 + e.Message);
        end;
    end;
end;

end.
