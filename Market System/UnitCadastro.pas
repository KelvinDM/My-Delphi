﻿unit UnitCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFormCadastros = class(TForm)
    PanelTopCadastros: TPanel;
    PanelBotaoClientes: TPanel;
    PanelBotaoProdutos: TPanel;
    PageControlClientePrinc: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LabelClientes: TLabel;
    LabelProdutos: TLabel;
    PanelManipularCliente: TPanel;
    PanelBotaoAlterar: TPanel;
    PanelBotaoNovoCad: TPanel;
    PanelBotaoSalvarCliente: TPanel;
    DBEditCelular: TDBEdit;
    LabelCelular: TLabel;
    LabelTelefone: TLabel;
    DBEditTelefone: TDBEdit;
    DateTimeNascimento: TDateTimePicker;
    LabelDataNascimento: TLabel;
    DBEditNome: TDBEdit;
    LabelNomeCliente: TLabel;
    LabelCodigo: TLabel;
    DBTextIDCliente: TDBText;
    PanelBuscarCliente: TPanel;
    DBGridCadClientes: TDBGrid;
    PanelBuscaClientes: TPanel;
    PanelCancelar: TPanel;
    PanelBotaoDeletar: TPanel;
    PanelBotaoBuscarClientes: TPanel;
    EditNomeCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PanelBuscarProdutos: TPanel;
    LabelSaldoEstoque: TLabel;
    LabelValorVendaProd: TLabel;
    LabelDescricaoProd: TLabel;
    LabelCodigoProduto: TLabel;
    DBTextIDProduto: TDBText;
    PanelBotaoAlterarProd: TPanel;
    PanelBotaoNovoProd: TPanel;
    PanelBotaoSalvarProd: TPanel;
    DBEditSaldoEstoque: TDBEdit;
    DBEditDescricaoProduto: TDBEdit;
    PanelBotaoCancelarProd: TPanel;
    PanelBotaoDeletarProd: TPanel;
    PanelManipularProdutos: TPanel;
    DBGridProdutos: TDBGrid;
    PanelBuscaProdutos: TPanel;
    LabelDescricao: TLabel;
    LabelBuscaProdutos: TLabel;
    PanelBotaoBuscarProdutos: TPanel;
    EditDescricaoProduto: TEdit;
    DBEditValorVenda: TDBEdit;
    PanelBotaoFechar: TPanel;

    procedure PanelBotaoProdutosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnFecharCadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabelClientesMouseEnter(Sender: TObject);
    procedure LabelClientesMouseLeave(Sender: TObject);
    procedure LabelProdutosMouseEnter(Sender: TObject);
    procedure LabelProdutosMouseLeave(Sender: TObject);
    procedure LabelProdutosClick(Sender: TObject);
    procedure LabelClientesClick(Sender: TObject);
    procedure PanelCadastrarClientesClick(Sender: TObject);
    procedure PanelCadastrarProdutosClick(Sender: TObject);
    procedure PanelBotaoSalvarClienteClick(Sender: TObject);
    procedure PanelBotaoNovoCadClick(Sender: TObject);
    procedure DBEditNomeChange(Sender: TObject);
    procedure PanelBotaoAlterarClick(Sender: TObject);
    procedure DateTimeNascimentoChange(Sender: TObject);
    procedure DBEditTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditCelularKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditNomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridCadClientesCellClick(Column: TColumn);
    procedure PanelCancelarClick(Sender: TObject);
    procedure PanelBotaoDeletarClick(Sender: TObject);
    procedure PanelBotaoBuscarClientesClick(Sender: TObject);
    procedure PanelCancelarMouseEnter(Sender: TObject);
    procedure PanelCancelarMouseLeave(Sender: TObject);
    procedure PanelBotaoDeletarMouseEnter(Sender: TObject);
    procedure PanelBotaoDeletarMouseLeave(Sender: TObject);
    procedure PanelBotaoBuscarProdutosClick(Sender: TObject);
    procedure PanelBotaoNovoProdClick(Sender: TObject);
    procedure PanelBotaoSalvarProdClick(Sender: TObject);
    procedure PanelBotaoCancelarProdClick(Sender: TObject);
    procedure DBEditValorVendaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEditDescricaoProdutoChange(Sender: TObject);
    procedure PanelBotaoAlterarProdClick(Sender: TObject);
    procedure PanelBotaoDeletarProdClick(Sender: TObject);
    procedure PanelBotaoFecharMouseEnter(Sender: TObject);
    procedure PanelBotaoFecharMouseLeave(Sender: TObject);
    procedure PanelBotaoFecharClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastros: TFormCadastros;
  PosicaoOriginal: TBookmark;

implementation
uses
    Unit_Princ, UnitConexao, AnsiStrings, FireDAC.Comp.DataSet;

{$R *.dfm}

procedure TFormCadastros.BtnFecharCadClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TFormCadastros.DateTimeNascimentoChange(Sender: TObject);
begin
    if not (FormConexao.FDQueryClientes.State in [dsinsert,dsedit]) then
    begin
        PanelBotaoSalvarCliente.Enabled:= False;
        PanelBotaoSalvarCliente.Color:= clSilver;
    end
    else
    begin
        PanelBotaoSalvarCliente.Enabled := True;
        PanelBotaoSalvarCliente.Color:= $00004DFF;
    end;
end;

procedure TFormCadastros.DBEditCelularKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
        Key := #0;
end;

procedure TFormCadastros.DBEditDescricaoProdutoChange(Sender: TObject);
begin
    if FormConexao.FDQueryProdutos.State in [dsinsert,dsedit] then
    begin
        PanelBotaoSalvarProd.Enabled := (Trim(DBEditDescricaoProduto.Text) <> '') and
                                        (Trim(DBEditValorVenda.Text) <> '') and
                                        (Trim(DBEditSaldoEstoque.Text) <> '');

        if PanelBotaoSalvarProd.Enabled then
            PanelBotaoSalvarProd.Color := $00004DFF
        else
        begin
            PanelBotaoSalvarProd.Color := clSilver;
            PanelBotaoSalvarProd.Enabled := False;
        end;
    end
    else
    begin
        PanelBotaoSalvarProd.Color := clSilver;
        PanelBotaoSalvarProd.Enabled := False;
    end;

end;

procedure TFormCadastros.DBEditNomeChange(Sender: TObject);
begin
    if (Trim(DBEditNome.Text) = '')  or not (FormConexao.FDQueryClientes.State in [dsinsert,dsedit]) then
    begin
        PanelBotaoSalvarCliente.Enabled:= False;
        PanelBotaoSalvarCliente.Color:= clSilver;
    end
    else
    begin
        PanelBotaoSalvarCliente.Enabled := True;
        PanelBotaoSalvarCliente.Color:= $00004DFF;
    end;

end;

procedure TFormCadastros.DBEditNomeKeyPress(Sender: TObject; var Key: Char);
begin
   //Permitir apenas letras, acentuação e teclas de controle
  if not (Key in ['A'..'Z', 'a'..'z', 'Á'..'ú', 'â'..'û', 'ã'..'ũ', 'ç', 'é', 'í', 'ó', 'ú',
                  'À'..'Ú', 'Â'..'Û', 'Ã'..'Ũ', 'Ç', 'É', 'Í', 'Ó', 'Ú','0'..'9', #8, #13, #27, #32]) then
    Key := #0; // Anula o caractere não permitido
end;


procedure TFormCadastros.DBEditTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
        Key := #0;
end;

procedure TFormCadastros.DBEditValorVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9', #8, ',', '.']) then
        Key := #0;
end;

procedure TFormCadastros.DBGridCadClientesCellClick(Column: TColumn);
begin
    //
    if (Trim(DBEditNome.Text) = '')  or not (FormConexao.FDQueryClientes.State in [dsinsert,dsedit]) then
    begin
        PanelBotaoSalvarCliente.Enabled:= False;
        PanelBotaoSalvarCliente.Color:= clSilver;
        if DBEditNome.Enabled = True then
            DBEditNome.SetFocus;
    end
    else
    begin
        PanelBotaoSalvarCliente.Enabled := True;
        PanelBotaoSalvarCliente.Color:= $00004DFF;
    end;
end;


procedure TFormCadastros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    HomeScreen.PanelMenu.Enabled            := True;
    HomeScreen.PanelConfigServidor.Enabled  := True;
    HomeScreen.PanelOneTop.Enabled          := True;

    FreeAndNil(FormCadastros);
end;

procedure TFormCadastros.FormShow(Sender: TObject);
var
    pages : integer;
begin
    for pages := 0 to PageControlClientePrinc.PageCount -1  do
    begin
        PageControlClientePrinc.Pages[pages].TabVisible := False;
    end;
end;


procedure TFormCadastros.LabelClientesMouseEnter(Sender: TObject);
begin
    LabelClientes.Font.Style := [fsBold];
    LabelClientes.Font.Color := $00004DFF;
    PanelBotaoClientes.Color := $00C1D3FF;
end;

procedure TFormCadastros.LabelClientesMouseLeave(Sender: TObject);
begin
    LabelClientes.Font.Style := [];
    LabelClientes.Font.Color := clWhite;
    PanelBotaoClientes.Color := $00191919;
end;


procedure TFormCadastros.LabelProdutosMouseEnter(Sender: TObject);
begin
    LabelProdutos.Font.Style := [fsBold];
    LabelProdutos.Font.Color := $00004DFF;
    PanelBotaoProdutos.Color := $00C1D3FF;
end;

procedure TFormCadastros.LabelProdutosMouseLeave(Sender: TObject);
begin
    LabelProdutos.Font.Style := [];
    LabelProdutos.Font.Color := clWhite;
    PanelBotaoProdutos.Color := $00191919;
end;

procedure TFormCadastros.PanelCadastrarProdutosClick(Sender: TObject);
begin
    //Tela de Cadastro de Produtos pelo Page
    PageControlClientePrinc.ActivePageIndex := 1;
end;

procedure TFormCadastros.PanelCancelarClick(Sender: TObject);
begin
    // CANCELAR
    if (FormConexao.FDQueryClientes.State in [DsInsert, DsEdit]) then
    begin
        FormConexao.FDQueryClientes.Cancel;
        LabelCodigo.Visible := True;
        DBTextIDCliente.Visible := True;
        DBEditNome.Enabled := False;
        DateTimeNascimento.Enabled := False;
        DBEditTelefone.Enabled := False;
        DBEditCelular.Enabled := False;
        PanelBotaoSalvarCliente.Enabled := False;
        PanelBotaoSalvarCliente.Color := clSilver;

        EditNomeCliente.Enabled:= True;
        PanelBotaoAlterar.Enabled:= True;
        PanelBuscaClientes.Enabled:= True;
        PanelBotaoDeletar.Enabled:= True;
        PanelBotaoNovoCad.Enabled:= True;

        DBGridCadClientes.Enabled := True;
        DBGridCadClientes.Refresh;
    end;
end;


procedure TFormCadastros.PanelCancelarMouseEnter(Sender: TObject);
begin
//entrando no botao
    PanelCancelar.Color:= $00A6C0FF;
    PanelCancelar.Font.Style := [fsBold];
    PanelCancelar.Font.Color := $00004DFF;
end;

procedure TFormCadastros.PanelCancelarMouseLeave(Sender: TObject);
begin
    //saindo do botao
    PanelCancelar.Color:= $00004DFF;
    PanelCancelar.Font.Style := [];
    PanelCancelar.Font.Color := clWhite;
end;

procedure TFormCadastros.PanelCadastrarClientesClick(Sender: TObject);
begin
    PanelBotaoSalvarCliente.Enabled := False;
    PageControlClientePrinc.ActivePageIndex := 0;
    DateTimeNascimento.Date := FormConexao.FDQueryClientes.FieldByName('DATA_NASCIMENTO').AsDateTime;
end;


procedure TFormCadastros.LabelClientesClick(Sender: TObject);
begin
    //Tela de Cadastro de Clientes pelo Page
    PageControlClientePrinc.ActivePageIndex := 2;

    PanelBotaoSalvarCliente.Enabled := False;
    PageControlClientePrinc.ActivePageIndex := 0;
    DateTimeNascimento.Date := FormConexao.FDQueryClientes.FieldByName('DATA_NASCIMENTO').AsDateTime;


end;

procedure TFormCadastros.LabelProdutosClick(Sender: TObject);
begin
    //Tela de Cadastro de Produtos pelo Page
    PageControlClientePrinc.ActivePageIndex := 1;
end;




procedure TFormCadastros.PanelBotaoSalvarClienteClick(Sender: TObject);
var
    Botaoselecionado: Integer;
begin
    if (Trim(DBEditNome.Text) = '') then
    begin
        MessageDlg('ERRO: Nome do cliente obrigatório!.', mtError, [mbOK], 0);
        DBEditNome.SetFocus;
        Exit;
    end;

    Botaoselecionado := MessageDlg('Deseja salvar o cliente?', mtInformation, [mbYes, mbNo], 0);
    if Botaoselecionado = mrYes then
    begin
        if FormConexao.FDQueryClientes.State in [DsInsert,DsEdit] then
        begin
            try
                FormConexao.FDQueryClientes.FieldByName('DATA_NASCIMENTO').AsDateTime := DateTimeNascimento.DateTime;
                FormConexao.FDQueryClientes.Post;
                FormConexao.FDConnection.Commit;
                FormConexao.FDQueryClientes.Refresh;
                ShowMessage('Cliente gravado com sucesso!');

                //Cadastro não-editável
                LabelCodigo.Visible := True;
                DBTextIDCliente.Visible := True;
                DBEditNome.Enabled := False;
                DateTimeNascimento.Enabled := False;
                DBEditTelefone.Enabled := False;
                DBEditCelular.Enabled := False;
                PanelBotaoSalvarCliente.Enabled := False;
                PanelBotaoSalvarCliente.Color:= clSilver;

                DBGridCadClientes.Enabled:= True;
                EditNomeCliente.Enabled:= True;
                PanelBuscaClientes.Enabled:= True;
                PanelBotaoDeletar.Enabled:= True;
                PanelBotaoNovoCad.Enabled:= True;
                PanelBotaoAlterar.Enabled:= True;
                //Atualiza grid
                DBGridCadClientes.Refresh;
            except
                FormConexao.FDConnection.Rollback;
                raise;
            end;
        end;
    end;
end;


procedure TFormCadastros.PanelBotaoSalvarProdClick(Sender: TObject);
var
    Botaoselecionado: Integer;
    MsgError: String;
begin
    MsgError:= '';

    if (Trim(DBEditDescricaoProduto.Text) = '') or (DBEditDescricaoProduto.Field.IsNull) then
        MsgError := 'ERRO: Descrição do produto obrigatório!.'
    else if (Trim(DBEditValorVenda.Text) = '') or (FormConexao.FDQueryProdutos.FieldByName('VALOR_VENDA').AsInteger <0) then
        MsgError := MsgError + '/'  + 'ERRO: Valor de venda é obrigatório!.'
    else if (Trim(DBEditSaldoEstoque.Text) = '') then
        MsgError := MsgError + '/'  + 'ERRO: Saldo de estoque é obrigatório!.';

    if MsgError <> '' then
    begin
        MessageDlg(MsgError, mtError, [mbOK], 0);
        Exit;
    end;

    Botaoselecionado := MessageDlg('Deseja salvar o Produto?', mtInformation, [mbYes, mbNo], 0);
    if Botaoselecionado = mrYes then
    begin
        if FormConexao.FDQueryProdutos.State in [DsInsert,DsEdit] then
        begin
            try
                FormConexao.FDQueryProdutos.Post;
                FormConexao.FDConnection.Commit;
                FormConexao.FDQueryProdutos.Refresh;
                ShowMessage('Produto gravado com sucesso!');

                //Cadastro não-editável após gravar
                DBEditDescricaoProduto.Enabled:= False;
                DBEditValorVenda.Enabled:= False;
                DBEditSaldoEstoque.Enabled:= False;
                PanelBotaoSalvarProd.Enabled:= False;
                PanelBotaoSalvarCliente.Enabled := False;
                PanelBotaoSalvarCliente.Color := clSilver;

                LabelCodigoProduto.Enabled:= True;
                DBTextIDProduto.Enabled:= True;
                PanelBotaoNovoProd.Enabled:= True;
                PanelBotaoAlterarProd.Enabled:= True;
                PanelBotaoDeletarProd.Enabled:= True;
                EditDescricaoProduto.Enabled := True;
                DBGridProdutos.Enabled := True;
                PanelBuscaProdutos.Enabled := True;
                PanelBotaoBuscarProdutos.Enabled := True;

                FormConexao.FDQueryProdutos.Active;
                DBGridProdutos.Refresh;
            except
                FormConexao.FDConnection.Rollback;
                raise;
            end;
        end;
    end;
end;

procedure TFormCadastros.PanelBotaoBuscarProdutosClick(Sender: TObject);
begin
var
    NomeProduto: string;
begin
    NomeProduto := Trim(EditDescricaoProduto.Text);
    if NomeProduto <> '' then
    begin
        PosicaoOriginal := DBGridProdutos.DataSource.DataSet.GetBookmark;
        try
            if DBGridProdutos.DataSource.DataSet.Locate('DESCRICAO', NomeProduto, [loCaseInsensitive, loPartialKey]) then
            begin
                DBGridProdutos.SetFocus;
                Exit;
            end;
        except
            DBGridProdutos.DataSource.DataSet.GotoBookmark(PosicaoOriginal);
            raise;
        end;
    end
    else
    ShowMessage('Digite um produto para buscar!.');
end;
end;

procedure TFormCadastros.PanelBotaoCancelarProdClick(Sender: TObject);
begin
    // CANCELAR
    if (FormConexao.FDQueryProdutos.State in [DsInsert, DsEdit]) then
    begin
        FormConexao.FDQueryProdutos.Cancel;

        DBEditDescricaoProduto.Enabled:= False;
        DBEditValorVenda.Enabled:= False;
        DBEditSaldoEstoque.Enabled:= False;
        PanelBotaoSalvarProd.Enabled:= False;
        PanelBotaoSalvarProd.Color := clSilver;

        LabelCodigoProduto.Enabled:= True;
        DBTextIDProduto.Enabled:= True;
        LabelCodigoProduto.Visible:= True;
        DBTextIDProduto.Visible:= True;
        PanelBotaoNovoProd.Enabled:= True;
        PanelBotaoAlterarProd.Enabled:= True;
        PanelBotaoDeletarProd.Enabled:= True;
        EditDescricaoProduto.Enabled := True;
        DBGridProdutos.Enabled := True;
        PanelBuscaProdutos.Enabled := True;
        PanelBotaoBuscarProdutos.Enabled := True;

        FormConexao.FDQueryProdutos.Active;
        DBGridProdutos.Refresh;
    end;
end;

procedure TFormCadastros.PanelBotaoAlterarClick(Sender: TObject);
begin
    if FormConexao.FDQueryClientes.State in [DsEdit,DsInsert] then
        ShowMessage('Cadastro ja está em modo de Inserção ou alteração!!!');
    DBGridCadClientes.Enabled:= False;
    EditNomeCliente.Enabled:= False;
    PanelBuscaClientes.Enabled:= False;
    PanelBotaoDeletar.Enabled:= False;
    PanelBotaoNovoCad.Enabled:= False;

    FormConexao.FDQueryClientes.Edit;
    DBEditNome.Enabled := True;
    DateTimeNascimento.Enabled := True;
    DBEditTelefone.Enabled := True;
    DBEditCelular.Enabled := True;
end;

procedure TFormCadastros.PanelBotaoAlterarProdClick(Sender: TObject);
begin
    //
    if FormConexao.FDQueryClientes.State in [DsEdit,DsInsert] then
        ShowMessage('Cadastro ja está em modo de Inserção ou alteração!!!');

    DBGridProdutos.Enabled:= False;
    EditDescricaoProduto.Enabled:= False;
    PanelBuscaProdutos.Enabled:= False;
    PanelBotaoDeletarProd.Enabled:= False;
    PanelBotaoNovoProd.Enabled:= False;

    FormConexao.FDQueryProdutos.Edit;
    DBEditDescricaoProduto.Enabled := True;
    DBEditValorVenda.Enabled := True;
    DBEditTelefone.Enabled := True;
    DBEditSaldoEstoque.Enabled := True;

end;

procedure TFormCadastros.PanelBotaoBuscarClientesClick(Sender: TObject);
var
    NomeCliente: string;
begin
    NomeCliente := Trim(EditNomeCliente.Text);
    if NomeCliente <> '' then
    begin
        PosicaoOriginal := DBGridCadClientes.DataSource.DataSet.GetBookmark;
        try
            if DBGridCadClientes.DataSource.DataSet.Locate('NOME_CLIENTE', NomeCliente, [loCaseInsensitive, loPartialKey]) then
            begin
                DBGridCadClientes.SetFocus;
                Exit;
            end;
        except
            DBGridCadClientes.DataSource.DataSet.GotoBookmark(PosicaoOriginal);
            raise;
        end;
    end
    else
    ShowMessage('Digite um nome de cliente para buscar.');
end;

procedure TFormCadastros.PanelBotaoDeletarClick(Sender: TObject);
begin
    //DELETAR
    try
    if not FormConexao.FDQueryClientes.IsEmpty then
    begin
        FormConexao.FDQueryClientes.Delete;
        FormConexao.FDConnection.Commit;
        FormConexao.FDQueryClientes.Refresh;
        ShowMessage('Cliente excluído com sucesso.');

        LabelCodigo.Visible := True;
        DBTextIDCliente.Visible := True;
        DBEditNome.Enabled := False;
        DateTimeNascimento.Enabled := False;
        DBEditTelefone.Enabled := False;
        DBEditCelular.Enabled := False;
        PanelBotaoSalvarCliente.Enabled := False;
        PanelBotaoSalvarCliente.Color := clSilver;

        DBGridCadClientes.Enabled := True;
        DBGridCadClientes.Refresh;

    end;
    except
        FormConexao.FDConnection.Rollback;
        raise;
    end;

end;

procedure TFormCadastros.PanelBotaoDeletarMouseEnter(Sender: TObject);
begin
    PanelBotaoDeletar.Color:= Clred;
    PanelBotaoDeletar.Font.Style := [fsBold];
    PanelBotaoDeletar.Font.Color := ClWhite;
end;

procedure TFormCadastros.PanelBotaoDeletarMouseLeave(Sender: TObject);
begin
    PanelBotaoDeletar.Color:= $000000BF;
    PanelBotaoDeletar.Font.Style := [];
    PanelBotaoDeletar.Font.Color := ClWhite;
end;

procedure TFormCadastros.PanelBotaoDeletarProdClick(Sender: TObject);
begin
    //DELETAR
    try
    if not FormConexao.FDQueryProdutos.IsEmpty then
    begin
        FormConexao.FDQueryProdutos.Delete;
        FormConexao.FDConnection.Commit;
        FormConexao.FDQueryProdutos.Refresh;
        ShowMessage('Produto excluído com sucesso.');

        DBEditDescricaoProduto.Enabled:= False;
        DBEditValorVenda.Enabled:= False;
        DBEditSaldoEstoque.Enabled:= False;
        PanelBotaoSalvarProd.Enabled:= False;
        PanelBotaoSalvarProd.Color := clSilver;

        LabelCodigoProduto.Enabled:= True;
        DBTextIDProduto.Enabled:= True;
        PanelBotaoNovoProd.Enabled:= True;
        PanelBotaoAlterarProd.Enabled:= True;
        PanelBotaoDeletarProd.Enabled:= True;
        EditDescricaoProduto.Enabled := True;
        DBGridProdutos.Enabled := True;
        PanelBuscaProdutos.Enabled := True;
        PanelBotaoBuscarProdutos.Enabled := True;


        DBGridProdutos.Enabled := True;
        DBGridProdutos.Refresh;

    end;
    except
        FormConexao.FDConnection.Rollback;
        raise;
    end;

end;

procedure TFormCadastros.PanelBotaoFecharClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TFormCadastros.PanelBotaoFecharMouseEnter(Sender: TObject);
begin
    PanelBotaoFechar.Color := ClRed;
    PanelBotaoFechar.Font.Color := ClWhite;
    PanelBotaoFechar.Font.Style := [fsBold];
end;

procedure TFormCadastros.PanelBotaoFecharMouseLeave(Sender: TObject);
begin
    PanelBotaoFechar.Color := $00191919;
    PanelBotaoFechar.Font.Color := ClWhite;
    PanelBotaoFechar.Font.Style := [];
end;

procedure TFormCadastros.PanelBotaoNovoCadClick(Sender: TObject);
begin
    DBEditNome.Enabled := True;
    DateTimeNascimento.Enabled := True;
    DBEditTelefone.Enabled := True;
    DBEditCelular.Enabled := True;

    LabelCodigo.Visible:= False;
    DBTextIDCliente.Visible := False;
    PanelBotaoSalvarCliente.Enabled:= False;
    PanelBotaoSalvarCliente.Color := clSilver;
    DBGridCadClientes.Enabled:= False;
    PanelBotaoAlterar.Enabled:= False;
    PanelBotaoDeletar.Enabled:= False;

    FormConexao.FDQueryClientes.Close();
    FormConexao.FDQueryClientes.Open();
    FormConexao.FDQueryClientes.Insert;

    //Setando vazio no date
    DateTimeNascimento.Date := Date();
end;

procedure TFormCadastros.PanelBotaoNovoProdClick(Sender: TObject);
begin

    DBEditDescricaoProduto.Enabled := True;
    DBEditValorVenda.Enabled := True;
    DBEditSaldoEstoque.Enabled := True;

    LabelCodigoProduto.Enabled:= False;
    DBTextIDProduto.Enabled:= False;
    LabelCodigoProduto.Visible:= False;
    DBTextIDProduto.Visible:= False;
    PanelBotaoSalvarProd.Enabled:= False;
    PanelBotaoSalvarProd.Color:= clSilver;

    PanelBotaoAlterarProd.Enabled:= False;
    DBGridProdutos.Enabled:= False;
    PanelBotaoDeletarProd.Enabled:= False;
    PanelBuscaProdutos.Enabled:= False;

    FormConexao.FDQueryProdutos.Close();
    FormConexao.FDQueryProdutos.Open();
    FormConexao.FDQueryProdutos.Insert;

end;

Procedure TFormCadastros.PanelBotaoProdutosClick(Sender: TObject);
begin
    //Tela de Cadastro de Produtos pelo Page
    //PageControlClientePrinc.ActivePageIndex := 1;
end;

end.