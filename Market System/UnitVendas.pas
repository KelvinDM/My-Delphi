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
    PanelBotaoFinalizarVenda: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditValorTotal: TEdit;
    EditQuantidade: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditDescontoTotal: TEdit;
    PanelInserirItemVenda: TPanel;
    PanelExcluitItem: TPanel;
    EditNomeClienteVenda: TEdit;
    ButtonBuscaCliente: TButton;
    EditCodCliente: TEdit;
    PanelMetodoDeDesconto: TPanel;
    RbPorcentagem: TRadioButton;
    RbValorReal: TRadioButton;
    PanelBotaoCancelarVenda: TPanel;
    PanelBotaoVerificarEstoque: TPanel;
    DBGridItemVenda: TDBGrid;
    EditCodProduto: TEdit;
    EditNomeProduto: TEdit;
    ButtonBuscaProduto: TButton;
    LabelCodigo: TLabel;
    EditCodigoVenda: TEdit;
    PanelNovaVenda: TPanel;
    PanelAtualizarValorTotal: TPanel;
    procedure PanelBotaoFecharClick(Sender: TObject);
    procedure PanelBotaoFecharMouseEnter(Sender: TObject);
    procedure PanelBotaoFecharMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PanelInserirItemVendaClick(Sender: TObject);



    procedure ButtonBuscaClienteClick(Sender: TObject);
    procedure ButtonBuscaProdutoClick(Sender: TObject);
    procedure PanelExcluitItemClick(Sender: TObject);
    procedure PanelBotaoVerificarEstoqueClick(Sender: TObject);
    procedure PanelBotaoCancelarVendaClick(Sender: TObject);
    procedure EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EditDescontoTotalKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescontoTotalExit(Sender: TObject);
    procedure RbPorcentagemClick(Sender: TObject);
    procedure PanelBotaoNovaVendaClick(Sender: TObject);
    procedure PanelBotaoFinalizarVendaClick(Sender: TObject);
    procedure PanelNovaVendaClick(Sender: TObject);
    procedure PanelAtualizarValorTotalClick(Sender: TObject);
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
    Unit_Princ, UnitFuncoesDiversas,Math;

{$R *.dfm}

procedure TFormVendas.PanelInserirItemVendaClick(Sender: TObject);
var
    AuxCodProduto, QuantidadeItem, CodCliente, QueryOriginal : String;
    ValorProduto, TotalVenda,TotalVendaItem, ValorItem, RateioItemDesc, RateioValorDesconto: Currency;
    ValorItemSubTotal :Currency;
begin
    CodCliente := Trim(EditCodCliente.Text);
    QuantidadeItem := Trim(EditQuantidade.Text) ;
    AuxCodProduto := Trim(EditCodProduto.Text);

    if (CodCliente = '' )  then
    begin
        MessageDlg('Cliente precisa ser preenchido para realizar a venda!', mtError, [mbOK], 0);
        Exit;
    end;
    if (AuxCodProduto = '' ) then
    begin
        MessageDlg('Produto n�o foi preenchido para realizar a inser��o!!', mtError, [mbOK], 0);
        Exit;
    end;
    
    if QuantidadeItem <> '' then
    begin
        FormConexao.FDQueryProdutos.Close;
        QueryOriginal := FormConexao.FDQueryProdutos.SQL.Text;
        FormConexao.FDQueryProdutos.SQL.Text := 'SELECT * FROM PRODUTOS WHERE ID= :IDPROD ';
        FormConexao.FDQueryProdutos.ParamByName('IDPROD').AsInteger := StrToInt(AuxCodProduto);
        FormConexao.FDQueryProdutos.Open;

        ValorProduto := FormConexao.FDQueryProdutos.FieldByName('VALOR_VENDA').AsCurrency;

        if not FormConexao.FDQueryProdutos.IsEmpty then
        begin
            if StrToInt(QuantidadeItem) > FormConexao.FDQueryProdutos.FieldByName('SALDO_ESTOQUE').AsInteger then
            begin
                MessageDlg('A quantidade informada � maior do que a dispon�vel em estoque!', mtError, [mbOK], 0);
                FormConexao.FDQueryProdutos.Close;
                FormConexao.FDQueryProdutos.SQL.Text := QueryOriginal;
                Exit;
            end;
        end;
        FormConexao.FDQueryProdutos.Close;
        FormConexao.FDQueryProdutos.SQL.Text := QueryOriginal;
    end
    else
    begin
        MessageDlg('Informe uma quantidade de item para a venda.!', mtError, [mbOK], 0);
        Exit;
    end;



    //Calculo para venda
    TotalVendaItem := StrToFloat(QuantidadeItem) *  ValorProduto;  // 2 * 150 = 300
    
    if FormConexao.FDQueryItensVenda.Locate('PRODUTO_ID',AuxCodProduto ) then
    begin
        FormConexao.FDQueryItensVenda.Edit; 
        FormConexao.FDQueryItensVenda.FieldByName('QUANTIDADE').Asinteger := FormConexao.FDQueryItensVenda.FieldByName('QUANTIDADE').Asinteger + StrToInt(EditQuantidade.Text);
        FormConexao.FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency := FormConexao.FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency + TotalVendaItem;
        FormConexao.FDQueryItensVenda.Post;
    end
    else
    begin
        FormConexao.FDQueryItensVenda.Insert;
        FormConexao.FDQueryItensVenda.FieldByName('VENDA_ID').AsInteger := StrToInt(EditCodigoVenda.text);
        FormConexao.FDQueryItensVenda.FieldByName('PRODUTO_ID').AsInteger := StrToInt (EditCodProduto.Text);
        FormConexao.FDQueryItensVenda.FieldByName('QUANTIDADE').AsInteger := StrToInt (EditQuantidade.Text);
        FormConexao.FDQueryItensVenda.FieldByName('PRECO_UNITARIO').AsCurrency := ValorProduto;
        FormConexao.FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency := TotalVendaItem;
        //Commit
        FormConexao.FDQueryItensVenda.Post;
        FormConexao.FDConnection.Commit;        
    end;   

        


    //Obter o total da venda de todos os itens sem o desconto
    With FormConexao do
    begin
        FDQueryItensVenda.First ;
        TotalVenda := 0;

        while not FDQueryItensVenda.Eof do
        begin

            TotalVenda := TotalVenda + FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency;          
            FormConexao.FDQueryItensVenda.Next;
        end;
    end;
  
    // Calculo realizado de rateio para propor��o em cada item
//--------------------------------------------
    With FormConexao do
    begin
        FDQueryItensVenda.First;
        while not FDQueryItensVenda.Eof do
        begin
            ValorItemSubTotal := FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency;
            RateioItemDesc := ValorItemSubTotal / TotalVenda;

            RateioValorDesconto := RateioItemDesc * StrToCurr(EditDescontoTotal.Text);

            FDQueryItensVenda.Edit; 
            FDQueryItensVenda.FieldByName('DESCONTO').AsCurrency := Round(RateioValorDesconto);
            TotalVenda := TotalVenda - RateioValorDesconto;
            
            FDQueryItensVenda.Post;
            FDQueryItensVenda.Next;
        end;
    end;


    //Arredonda venda
    TotalVenda := Ceil(TotalVenda);
    //Atualizando total da venda
    EditValorTotal.Text :=  FloatToStrF(TotalVenda, ffNumber, 15, 2);


    FormConexao.FDQueryProdutos.SQL.Text := QueryOriginal;
    FormConexao.FDQueryItensVenda.Refresh;
    DBGridItemVenda.Refresh;
end;

procedure TFormVendas.PanelNovaVendaClick(Sender: TObject);
begin
    //

    EditCodigoVenda.Enabled := False;
    EditNomeClienteVenda.Enabled := True;
    EditCodCliente.Enabled := True;
    EditNomeProduto.Enabled := True;
    EditCodProduto.Enabled := True;
    ButtonBuscaCliente.Enabled := True;
    ButtonBuscaProduto.Enabled := True;
    EditQuantidade.Enabled := True;
    PanelInserirItemVenda.Enabled := True;
    PanelExcluitItem.Enabled := True;
    EditDescontoTotal.Enabled := True;
    PanelBotaoFinalizarVenda.Enabled := True;

    
    PanelNovaVenda.Visible := False;
    
    
end;

procedure TFormVendas.RbPorcentagemClick(Sender: TObject);
begin
    //
    EditDescontoTotal.Text := '';

end;

procedure TFormVendas.PanelBotaoVerificarEstoqueClick(Sender: TObject);
var
    CodProduto : String;
begin
    try
        CodProduto :=  Trim(EditCodProduto.Text);
        if CodProduto<> '' then
        begin
            FormConexao.FDQueryProdutos.Close;
            FormConexao.FDQueryProdutos.SQL.Text := 'SELECT * FROM PRODUTOS WHERE ID= :IDPROD ';
            FormConexao.FDQueryProdutos.ParamByName('IDPROD').AsInteger := StrToInt(CodProduto);
            FormConexao.FDQueryProdutos.Open;

            if not FormConexao.FDQueryProdutos.IsEmpty then
                ShowMessage('Produto: ' + FormConexao.FDQueryProdutos.FieldByName('DESCRICAO').AsString + sLineBreak +
                 'SALDO EM ESTOQUE: ' + FormConexao.FDQueryProdutos.FieldByName('SALDO_ESTOQUE').AsString)

        end
        else
            ShowMessage('C�digo do produto n�o selecionado.!!');
    Except
        on E: Exception do
        begin
            ShowMessage('Ocorreu um erro: ' + E.Message);
        end;

    end;
end;

procedure TFormVendas.PanelBotaoNovaVendaClick(Sender: TObject);
begin
//   PanelBotaoNovaVenda

    EditCodigoVenda.Enabled := True;
    EditNomeClienteVenda.Enabled := True;
    EditCodCliente.Enabled := True;
    EditNomeProduto.Enabled := True;
    EditCodProduto.Enabled := True;
    ButtonBuscaCliente.Enabled := True;
    ButtonBuscaProduto.Enabled := True;
    EditQuantidade.Enabled := True;
    PanelInserirItemVenda.Enabled := True;
    PanelExcluitItem.Enabled := True;
    EditDescontoTotal.Enabled := True;
    
    PanelNovaVenda.Visible := False;

end;

procedure TFormVendas.PanelBotaoFinalizarVendaClick(Sender: TObject);
var
    DataNascimentoCliente: TDateTime;
    TotalVenda: Currency;
    Desconto: Currency;
    DataAtual: TDateTime;
begin
//
    EditCodigoVenda.Enabled := False;
    EditNomeClienteVenda.Enabled := False;
    EditCodCliente.Enabled := False;
    EditNomeProduto.Enabled := False;
    EditCodProduto.Enabled := False;
    ButtonBuscaCliente.Enabled := False;
    ButtonBuscaProduto.Enabled := False;
    EditQuantidade.Enabled := False;
    PanelInserirItemVenda.Enabled := False;
    PanelExcluitItem.Enabled := False;
    EditDescontoTotal.Enabled := False;
    PanelBotaoFinalizarVenda.Enabled := False;
    
    PanelNovaVenda.Visible := True;

  


    if FormConexao.FDQueryVenda.Locate('ID', EditCodigoVenda.Text) then
    begin
        DataAtual := Now;
        FormConexao.FDQueryVenda.Edit; 
        FormConexao.FDQueryVenda.FieldByName('ID_CLIENTE').Asinteger :=   StrToInt(EditCodCliente.Text);
        FormConexao.FDQueryVenda.FieldByName('VALOR_TOTAL').AsCurrency := StrToCurr(EditValorTotal.Text);
        FormConexao.FDQueryVenda.FieldByName('DATA_VENDA').AsDateTime := DataAtual;
        FormConexao.FDQueryVenda.FieldByName('DESCONTO_CALOR').AsCurrency :=  StrToCurr(EditDescontoTotal.Text);                     
        FormConexao.FDQueryVenda.Post;
    end


end;

procedure TFormVendas.PanelAtualizarValorTotalClick(Sender: TObject);
var
    AuxCodProduto, QuantidadeItem, CodCliente, QueryOriginal : String;
    ValorProduto, TotalVenda,TotalVendaItem, ValorItem, RateioItemDesc, RateioValorDesconto: Currency;
    ValorItemSubTotal :Currency;
begin
    //Obter o total da venda de todos os itens sem o desconto
    With FormConexao do
    begin
        FDQueryItensVenda.First ;
        TotalVenda := 0;

        while not FDQueryItensVenda.Eof do
        begin

            TotalVenda := TotalVenda + FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency;          
            FormConexao.FDQueryItensVenda.Next;
        end;
    end;
  
    // Calculo realizado de rateio para propor��o em cada item
    With FormConexao do
    begin
        FDQueryItensVenda.First;
        while not FDQueryItensVenda.Eof do
        begin
            ValorItemSubTotal := FDQueryItensVenda.FieldByName('SUBTOTAL').AsCurrency;
            RateioItemDesc := ValorItemSubTotal / TotalVenda;

            RateioValorDesconto := RateioItemDesc * StrToCurr(EditDescontoTotal.Text);

            FDQueryItensVenda.Edit; 
            FDQueryItensVenda.FieldByName('DESCONTO').AsCurrency := Round(RateioValorDesconto);
            TotalVenda := TotalVenda - RateioValorDesconto;
            
            FDQueryItensVenda.Post;
            FDQueryItensVenda.Next;
        end;
    end;


    //Arredonda venda
    TotalVenda := Ceil(TotalVenda);
    //Atualizando total da venda
    EditValorTotal.Text :=  FloatToStrF(TotalVenda, ffNumber, 15, 2);


    FormConexao.FDQueryProdutos.SQL.Text := QueryOriginal;
    FormConexao.FDQueryItensVenda.Refresh;
    DBGridItemVenda.Refresh;
end;

procedure TFormVendas.PanelBotaoCancelarVendaClick(Sender: TObject);
begin
    //CancelarVenda
    if EditCodigoVenda.Text <> '' then
    begin
        EditNomeClienteVenda.Enabled := True;
        EditNomeProduto.Enabled := True;
        ButtonBuscaCliente.Enabled:= True;
    
        //setar vazio
        EditCodCliente.Text := '';
        EditCodProduto.Text := '';
        EditNomeProduto.Text := '';
        EditNomeClienteVenda.Text := '';
        EditQuantidade.Text := '';

        FormConexao.FDQueryItensVenda.Close;
        FormConexao.FDQueryItensVenda.Open;
        if FormConexao.FDQueryItensVenda.Locate('VENDA_ID', EditCodigoVenda.Text, []) then
        begin
            FormConexao.FDQueryVenda.Delete;
            EditCodigoVenda.Text := '';
            FormConexao.FDQueryItensVenda.Close;
        end;


        FormConexao.FDQueryVenda.Close; 
        FormConexao.FDQueryVenda.Open;
        if FormConexao.FDQueryVenda.Locate('ID', EditCodigoVenda.Text, []) then
        begin
            FormConexao.FDQueryVenda.Delete;
            EditCodigoVenda.Text := '';
            FormConexao.FDQueryVenda.Close;
        end;
    end;
  
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

procedure TFormVendas.FormCreate(Sender: TObject);
begin
    RbValorReal.Checked := True;


    
    EditDescontoTotal.Text := '10,00'; //APAGAR TESTES
    EditQuantidade.Text := '2';   //APAGAR TESTES
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
    DescricaoBusca := Trim(EditNomeProduto.Text);

    if DescricaoBusca <> '' then
    begin
        FormConexao.FDQueryProdutos.Close;
        FormConexao.FDQueryProdutos.Open;
        FormConexao.FDQueryProdutos.First;
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
    end;
  FormConexao.FDQueryProdutos.Close;
end;


procedure TFormVendas.ButtonBuscaClienteClick(Sender: TObject);
var
    ClienteBusca: string;
    ClienteID, RespMsg: Integer;
    InserirVenda : Boolean;
begin
    ClienteBusca := EditNomeClienteVenda.Text;
    InserirVenda := False;
    FormConexao.FDQueryClientes.Open;
    while not FormConexao.FDQueryClientes.Eof do
    begin
        if AnsiStartsText(ClienteBusca, FormConexao.FDQueryClientes.FieldByName('NOME_CLIENTE').AsString) then
        begin
            ClienteID := FormConexao.FDQueryClientes.FieldByName('ID').AsInteger;
            EditNomeClienteVenda.Text := FormConexao.FDQueryClientes.FieldByName('NOME_CLIENTE').AsString;
            EditCodCliente.Text:= IntToStr (ClienteID);
            FormConexao.FDQueryClientes.Close;

            if Trim(EditCodCliente.Text) <> '' then
            begin
                RespMsg := MessageDlg('Confirma o cliente selecionado?', mtConfirmation, [mbYes, mbNo], 0);
                if RespMsg = mrYes then
                begin
                    EditNomeClienteVenda.Enabled := False;
                    ButtonBuscaCliente.Enabled := False;
                    InserirVenda := True;
                    
                    FormConexao.FDQueryClientes.Close;
                    FormConexao.FDQueryVenda.Open;
                    FormConexao.FDQueryVenda.Insert;
                    FormConexao.FDQueryVenda.FieldByName('ID_CLIENTE').AsInteger := ClienteID;
                    FormConexao.FDQueryVenda.Post;
                    FormConexao.FDConnection.Commit;
                    EditCodigoVenda.Text :=  FormConexao.FDQueryVenda.FieldByName('ID').AsString;                         
                end
                else
                begin
                    EditNomeClienteVenda.Enabled := True;
                    EditCodCliente.Text := '';
                end;

            end;

            Exit;
        end;
        FormConexao.FDQueryClientes.Next;
    end;
    if (Trim(EditCodCliente.Text) = '') then
    begin
        ShowMessage('Nenhum cliente correspondente encontrado.');
        FormConexao.FDQueryClientes.Close;
    end;




  



end;

procedure TFormVendas.CalcularTotal;
begin
  // L�gica para calcular o total da venda
end;



procedure TFormVendas.EditQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
    PermitirApenasNumeros(Key);
end;

procedure TFormVendas.EditDescontoTotalExit(Sender: TObject);
var
    Valor: Double;
begin
    if (Trim(EditDescontoTotal.Text) <> '') and RbValorReal.Checked then
    begin
        Valor := StrParaFloat(EditDescontoTotal.Text);
        EditDescontoTotal.Text := FormatFloat('#,##0.00', Valor);
    end
    else
        Valor := 0.00;
end;

procedure TFormVendas.EditDescontoTotalKeyPress(Sender: TObject; var Key: Char);
var
    Valor: Double;
begin

    if RbPorcentagem.Checked then
        PermitirApenasNumeros(Key);
    if RbValorReal.Checked then
        PermitirApenasNumeros2(Key);

    if (Key = #13) and RbPorcentagem.Checked then
    begin
        if Trim(EditDescontoTotal.Text) <> '' then
            Valor := StrParaFloat(EditDescontoTotal.Text)
        else
            Valor := 0.00;
        //EditDescontoTotal.Text := FormatFloat('#,##0.00', Valor);
        EditDescontoTotal.Text := FloatToStrF(Valor, ffNumber, 15, 2);
        EditDescontoTotal.SelStart := Length(EditDescontoTotal.Text); //Indicador de texto a direita
    end;


        //Problemas arrumar.
    if (Key = #13) and RbValorReal.Checked then
    begin
        if Trim(EditDescontoTotal.Text) <> '' then
            Valor := StrParaFloat(EditDescontoTotal.Text)
        else
            Valor := 0.00;
        EditDescontoTotal.Text := FloatToStrF(Valor, ffNumber, 15, 2);
        EditDescontoTotal.SelStart := Length(EditDescontoTotal.Text); //Indicador de texto a direita
    end;

end;

end.
