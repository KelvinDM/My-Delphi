unit telacadastro;

{$mode ObjFPC}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
	 Buttons;

type

	 { TFormCadastro }

    TFormCadastro = class(TForm)
		  CadName: TEdit;
		  CadUser: TEdit;
		  CadSenha: TEdit;
		  Image1: TImage;
		  Image2: TImage;
		  Image3: TImage;
		  Image4: TImage;
		  Label3: TLabel;
		  Label4: TLabel;
		  Label5: TLabel;
		  Label6: TLabel;
		  Label7: TLabel;
		  Label8: TLabel;
		  PanelCadastrar: TPanel;
		  PanelCadastrar1: TPanel;
		  PanelHome: TPanel;
		  procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
		  procedure FormShow(Sender: TObject);
		  procedure Image5MouseEnter(Sender: TObject);
		  procedure PanelCadastrarClick(Sender: TObject);
		  procedure PanelCadastrarMouseDown(Sender: TObject;
				Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
		  procedure PanelCadastrarMouseEnter(Sender: TObject);
		  procedure PanelCadastrarMouseLeave(Sender: TObject);
		  procedure PanelHomeClick(Sender: TObject);
		  procedure PanelHomeMouseEnter(Sender: TObject);
		  procedure PanelHomeMouseLeave(Sender: TObject);
    private

    public

    end;

var
    FormCadastro: TFormCadastro;

implementation

uses TelaLogin, Conexao;
{$R *.lfm}

{ TFormCadastro }

procedure TFormCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    //OPaa
    TelaPrinc.Visible := True;
end;

procedure TFormCadastro.FormShow(Sender: TObject);
begin
    //Exibir tela de cadastro na tela principal.
    //Left := (Screen.Width - Width) div 2;
    //Top := (Screen.Height - Height) div 2;
end;

procedure TFormCadastro.Image5MouseEnter(Sender: TObject);
begin

end;

procedure TFormCadastro.PanelCadastrarClick(Sender: TObject);
var
    UltimoID: Integer;
    InfoNome, InfoUsuario, InfoSenha: String;
begin
    // Abri a QueryID para pegar o ultimo ID Cadastrado no banco.
    DM.SQLQueryID.Open;
    UltimoID := DM.SQLQueryID.FieldByName('ULTIMO_ID').AsInteger;
    DM.SQLQueryID.Close;

    //Incremento de mais um para gerar o próximo ID.
    UltimoID := UltimoID + 1;
    InfoNome := CadName.Text;
    InfoUsuario := CadUser.Text;
    InfoSenha := CadSenha.Text;

    //Verificação se todos os campos estão preenchidos
    if (Trim(InfoNome)= '') then
    begin
         MessageDlg('O campo Nome está vazio!', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
         Exit;
	 end;

    if (Trim(InfoUsuario)= '') then
    begin
         MessageDlg('O campo Usuário está vazio!', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
         Exit;
	 end;

    if (Trim(InfoSenha)= '') then
    begin
         MessageDlg('O campo Senha está vazio!', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
         Exit;
	 end;



    //Ira Verificar se o usuário informado no cadastro ja possui no banco de dados
    try
       DM.SQLQueryUsers.Close; // Fechando a Query e passando o Clear nele
       DM.SQLQueryUsers.Sql.Clear;
       DM.SQLQueryUsers.Sql.Text := 'select * from USERS where USUARIO = :Usuario';
       DM.SQLQueryUsers.ParamByName('Usuario').AsString := InfoUsuario;
       DM.SQLQueryUsers.Open;

       if not DM.SQLQueryUsers.IsEmpty then
       begin
            MessageDlg('Usúario informado ja está em uso, por favor informe outro!!', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
            Exit;
		 end;
	 except
	    on E: Exception do
	    begin
            MessageDlg('Erro n:001 :', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
	    end;
	 end;
    // Aqui estou inserindo um novo usúario
    try
       DM.SQLQueryCreateUser.ParamByName('ID').AsInteger := UltimoID;
       DM.SQLQueryCreateUser.ParamByName('NOME').AsString := InfoNome;
       DM.SQLQueryCreateUser.ParamByName('USUARIO').AsString := InfoUsuario;
       DM.SQLQueryCreateUser.ParamByName('SENHA').AsString := InfoSenha;

	    try
	       DM.SQLQueryCreateUser.ExecSQL;
          DM.TransactionLogin.Commit;
          MessageDlg('Usuário cadastrado com sucesso!', mtWarning, [mbOK], 0); // Exibe uma mensagem de sucesso.
          Exit;
	    except
	          on E: Exception do
	          begin
	               ShowMessage('Erro ao inserir usuário: ' + E.Message); // Exibe uma mensagem de erro em caso de falha.
	          end;
	    end;
	 except
	    on E: Exception do
	    begin
            MessageDlg('Erro ao cadastrar usuário:', mtError, [mbOK], 0); // Exibe uma mensagem de erro.
	    end;
	 end;

end;

procedure TFormCadastro.PanelCadastrarMouseDown(Sender: TObject;
	 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    //PanelCadastrar.Font.Color := $000080FF;
    PanelCadastrar.Color := $0055AAFF;
end;

procedure TFormCadastro.PanelCadastrarMouseEnter(Sender: TObject);
begin
    PanelCadastrar.Font.Color := $000080FF;
    PanelCadastrar.Color := $00FF0080;
end;

procedure TFormCadastro.PanelCadastrarMouseLeave(Sender: TObject);
begin
    PanelCadastrar.Font.Color := $00FF0080;
    PanelCadastrar.Color := $00800040;
end;

procedure TFormCadastro.PanelHomeClick(Sender: TObject);
begin
    Close;  //Fecha a tela atual
    TelaPrinc.Visible := True;
end;

procedure TFormCadastro.PanelHomeMouseEnter(Sender: TObject);
begin
    //PanelHome
    PanelHome.Font.Color := $000080FF;
    PanelHome.Color := $00800040;
end;

procedure TFormCadastro.PanelHomeMouseLeave(Sender: TObject);
begin
    PanelHome.Font.Color := $00FF0080;
    PanelHome.Color := $000080FF;
end;

end.

