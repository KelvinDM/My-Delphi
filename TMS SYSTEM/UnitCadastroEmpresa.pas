unit UnitCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Data.Win.ADODB;

type
  TFormCadastroEmpresa = class(TForm)
    EditNomeEmpresa: TEdit;
    LabelEmpresa: TLabel;
    EditCelularEmpresa: TEdit;
    LabelCelularEmpresa: TLabel;
    QueryEmpresa: TADOQuery;
    QueryEmpresaID: TAutoIncField;
    QueryEmpresaNOME_EMPRESA: TStringField;
    QueryEmpresaNUMERO_CELULAR: TStringField;
    QueryEmpresaID_CIDADE: TIntegerField;
    Label1: TLabel;
    LabelNumInterno: TLabel;
    Gravar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroEmpresa: TFormCadastroEmpresa;

implementation

{$R *.dfm}

uses UnitDadosEmpresa;

procedure TFormCadastroEmpresa.FormCreate(Sender: TObject);
begin
    QueryEmpresa.Close;
    QueryEmpresa.SQL.Text := 'SELECT * FROM EMPRESAS';
    QueryEmpresa.Open;
end;

procedure TFormCadastroEmpresa.FormShow(Sender: TObject);
begin
    //
    LabelNumInterno.Caption := QueryEmpresa.FieldByName('ID').AsString;
    EditNomeEmpresa.Text := QueryEmpresa.FieldByName('NOME_EMPRESA').AsString;
    EditCelularEmpresa.Text := QueryEmpresa.FieldByName('NUMERO_CELULAR').AsString;

    QueryEmpresa.Close;

end;

procedure TFormCadastroEmpresa.GravarClick(Sender: TObject);
var
    NomeEmpresa,NumeroCelular: string;
begin
    NomeEmpresa := Trim(EditNomeEmpresa.Text);
    NumeroCelular := Trim(EditCelularEmpresa.Text);
    //
    if NomeEmpresa = '' then
    begin
        ShowMessage('Informe o nome da empresa.');
        EditNomeEmpresa.SetFocus;
        Exit;
    end;

    if Length(NomeEmpresa) > 50 then
    begin
        ShowMessage('Nome da empresa ultrapassou 50 caracteres.');
        EditNomeEmpresa.SetFocus;
        Exit;
    end;


    if NumeroCelular = '' then
    begin
        ShowMessage('Informe o n�mero de celular da empresa.');
        EditCelularEmpresa.SetFocus;
        Exit;
    end;



    QueryEmpresa.Close;
    QueryEmpresa.SQL.Text := 'UPDATE EMPRESAS SET '+
                              'NOME_EMPRESA= :NOME_EMPRESA '+
                              ', NUMERO_CELULAR= :NUMERO_CELULAR'+
                              ' WHERE ID= :ID' ;

    QueryEmpresa.Parameters.ParamByName('NOME_EMPRESA').Value := NomeEmpresa;
    QueryEmpresa.Parameters.ParamByName('NUMERO_CELULAR').Value := NumeroCelular;
    QueryEmpresa.Parameters.ParamByName('ID').Value := StrToInt(LabelNumInterno.Caption);
    QueryEmpresa.ExecSQL;
    ShowMessage('Gravado com Sucesso!!!');
end;

end.
