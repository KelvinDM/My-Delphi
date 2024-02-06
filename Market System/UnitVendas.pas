unit UnitVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, UnitConexao, Vcl.DBCtrls, Vcl.Buttons,System.StrUtils;

type
  TFormVendas = class(TForm)
    PanelTopCadastros: TPanel;
    PanelBotaoClientes: TPanel;
    LabelClientes: TLabel;
    PanelBotaoFechar: TPanel;
    PanelCenterVendas: TPanel;
    Panel1: TPanel;
    Cliente: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditValorTotal: TEdit;
    EditQuantidade: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    PanelInserirItemVenda: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PanelExcluitItem: TPanel;
    EditNomeClienteVenda: TEdit;
    ButtonBuscaCliente: TButton;
    EditCodCliente: TEdit;
    ButtonBuscaProduto: TButton;
    EditNomeProduto: TEdit;
    EditCodProduto: TEdit;
    DBGridItemVenda: TDBGrid;
    procedure PanelBotaoFecharClick(Sender: TObject);
    procedure PanelBotaoFecharMouseEnter(Sender: TObject);
    procedure PanelBotaoFecharMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PanelInserirItemVendaClick(Sender: TObject);



    procedure ButtonBuscaClienteClick(Sender: TObject);
    procedure ButtonBuscaProdutoClick(Sender: TObject);
    procedure PanelExcluitItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularTotal;
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation
uses
    Unit_Princ;

{$R *.dfm}

procedure TFormVendas.PanelInserirItemVendaClick(Sender: TObject);
begin
  // L�gica para o clique no painel 3
    FormConexao.FDQueryItensVenda.Insert;
    FormConexao.FDQueryItensVenda.FieldByName('PRODUTO_ID').AsInteger := StrToInt (EditCodProduto.Text);
    FormConexao.FDQueryItensVenda.FieldByName('QUANTIDADE').AsInteger := StrToInt (EditCodCliente.Text);


    FormConexao.FDQueryItensVenda.Post;
    FormConexao.FDConnection.Commit;
    FormConexao.FDQueryItensVenda.Refresh;
    DBGridItemVenda.Refresh;
end;

procedure TFormVendas.PanelBotaoFecharClick(Sender: TObject);
begin
  Self.Close;
end;



procedure TFormVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  HomeScreen.PanelMenu.Enabled            := True;
  HomeScreen.PanelConfigServidor.Enabled  := True;
  HomeScreen.PanelOneTop.Enabled          := True;
  FreeAndNil(FormVendas);
end;

procedure TFormVendas.PanelBotaoFecharMouseEnter(Sender: TObject);
begin
  PanelBotaoFechar.Color := ClRed;
  PanelBotaoFechar.Font.Color := ClWhite;
  PanelBotaoFechar.Font.Style := [fsBold];
end;

procedure TFormVendas.PanelBotaoFecharMouseLeave(Sender: TObject);
begin
  PanelBotaoFechar.Color := $00191919;
  PanelBotaoFechar.Font.Color := ClWhite;
  PanelBotaoFechar.Font.Style := [];
end;



procedure TFormVendas.PanelExcluitItemClick(Sender: TObject);
begin
//
    FormConexao.FDQueryItensVenda.Delete;
    FormConexao.FDConnection.Commit;
    FormConexao.FDQueryItensVenda.Refresh;
end;

procedure TFormVendas.ButtonBuscaProdutoClick(Sender: TObject);
var
  DescricaoBusca: string;
  ProdutoID: Integer;
begin
  DescricaoBusca := EditNomeProduto.Text;

  FormConexao.FDQueryProdutos.Open;
    while not FormConexao.FDQueryProdutos.Eof do
    begin
    if AnsiStartsText(DescricaoBusca, FormConexao.FDQueryProdutos.FieldByName('DESCRICAO').AsString) then
    begin
          ProdutoID := FormConexao.FDQueryProdutos.FieldByName('ID').AsInteger;
          EditNomeProduto.Text := FormConexao.FDQueryProdutos.FieldByName('DESCRICAO').AsString;
          EditCodProduto.Text := IntToStr(ProdutoID);
          FormConexao.FDQueryProdutos.Close;
          Exit;
    end;
     FormConexao.FDQueryProdutos.Next;
    end;
    ShowMessage('Nenhum produto correspondente encontrado.');

  FormConexao.FDQueryProdutos.Close;
end;


procedure TFormVendas.ButtonBuscaClienteClick(Sender: TObject);
var
    ClienteBusca: string;
    ClienteID: Integer;
begin
    ClienteBusca := EditNomeClienteVenda.Text;

    FormConexao.FDQueryClientes.Open;
    while not FormConexao.FDQueryClientes.Eof do
    begin
        if AnsiStartsText(ClienteBusca, FormConexao.FDQueryClientes.FieldByName('NOME_CLIENTE').AsString) then
        begin
            ClienteID := FormConexao.FDQueryClientes.FieldByName('ID').AsInteger;
            EditNomeClienteVenda.Text := FormConexao.FDQueryClientes.FieldByName('NOME_CLIENTE').AsString;
            EditCodCliente.Text:= IntToStr (ClienteID);
            FormConexao.FDQueryClientes.Close;
            Exit;
        end;
    FormConexao.FDQueryClientes.Next;
    end;
    ShowMessage('Nenhum cliente correspondente encontrado.');
    FormConexao.FDQueryClientes.Close;

end;

procedure TFormVendas.CalcularTotal;
begin
  // L�gica para calcular o total da venda
end;

end.

