unit TelaLogin;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
	 Buttons, Conexao;

type

	 { TTelaPrinc }

    TTelaPrinc = class(TForm)
		  Image1: TImage;
		  Image2: TImage;
		  Image3: TImage;
		  Label1: TLabel;
		  Label2: TLabel;
		  Label3: TLabel;
		  Label4: TLabel;
		  Label5: TLabel;
		  LabelCadastro: TLabel;
		  NameUser: TEdit;
		  PanelEntrar: TPanel;
		  SenhaUser: TEdit;
		  procedure FormShow(Sender: TObject);
    procedure LabelCadastroClick(Sender: TObject);
        procedure LabelCadastroMouseEnter(Sender: TObject);
		  procedure LabelCadastroMouseLeave(Sender: TObject);
		  procedure PanelEntrarClick(Sender: TObject);
		  procedure PanelEntrarMouseDown(Sender: TObject; Button: TMouseButton;
				Shift: TShiftState; X, Y: Integer);
		  procedure PanelEntrarMouseEnter(Sender: TObject);
		  procedure PanelEntrarMouseLeave(Sender: TObject);
		  procedure PanelEntrarMouseUp(Sender: TObject; Button: TMouseButton;
				Shift: TShiftState; X, Y: Integer);
		  procedure SenhaUserKeyPress(Sender: TObject; var Key: char);
    private

    public

    end;

var
    TelaPrinc: TTelaPrinc;

implementation

uses TelaCadastro;

{$R *.lfm}

{ TTelaPrinc }

procedure TTelaPrinc.LabelCadastroMouseEnter(Sender: TObject);
begin
    LabelCadastro.Font.Color := $000080FF;
end;

procedure TTelaPrinc.LabelCadastroClick(Sender: TObject);
var
   FormTelaCadastro: TFormCadastro;
begin
     TelaPrinc.Visible := False;
     FormTelaCadastro := TFormCadastro.Create(nil);
	 try
	    FormTelaCadastro.ShowModal; // Use ShowModal se desejar que a nova tela seja modal
	 finally
	    FormTelaCadastro.Free;
	 end;
end;

procedure TTelaPrinc.FormShow(Sender: TObject);
begin
    //SERVE PARA ALINHAR A TELA NO CENTRO.
    //Left := (Screen.Width - Width) div 2;
    //Top := (Screen.Height - Height) div 2;
end;

procedure TTelaPrinc.LabelCadastroMouseLeave(Sender: TObject);
begin
     LabelCadastro.Font.Color := $00FF0080;
end;

procedure TTelaPrinc.PanelEntrarClick(Sender: TObject);
var
    Usuario, Senha, SenhaBD: String;
begin
     Usuario := NameUser.Text;
     Senha := SenhaUser.Text;

     if (Usuario <> Null) and (Usuario <> '') and
	    (Senha <> Null) and (Senha <> '') then
     begin
	       DM.SQLQueryUsers.Close; // Fechando a Query e passando o Clear nele
	       DM.SQLQueryUsers.Sql.Clear;
	       DM.SQLQueryUsers.Sql.Text := 'select * from USERS where USUARIO = :Usuario';
	       DM.SQLQueryUsers.ParamByName('Usuario').AsString := Usuario;

		 //Após encontrar o usuário informado ele ira comparar a senha informada com a senha do Banco de dados.
          try
		       DM.SQLQueryUsers.Open;

		       if not DM.SQLQueryUsers.IsEmpty then
		       begin
	             SenhaBD := DM.SQLQueryUsers.FieldByName('SENHA').AsString;

	             if Senha = SenhaBD then
	             begin
                     MessageDlg('Login efetuado com sucesso!!!', mtInformation, [mbOK], 0);
                     Exit;
	                 //ShowMessage('Login efetuado com sucesso!!!');

	     		    end
	             else
	             begin
	                 ShowMessage('Nome de usúario ou senha estão incorretos!');
	                 Exit;
	 		       end;
				 end
		       else
		       begin
	             MessageDlg('Nome de usúario ou senha estão incorretos!', mtError, [mbOK], 0);
	             //ShowMessage('Nome de usúario ou senha estão incorretos!');
	             Exit;
			    end;

		    except
	            on E: Exception do
	            begin
	                 ShowMessage('Erro ao executar a consulta: ' + E.Message);
	            end;
		    end;
	  end
     else
     begin
	       ShowMessage('Usúario e senha não informados!!');
	  end;
end;

procedure TTelaPrinc.PanelEntrarMouseDown(Sender: TObject;
	 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     PanelEntrar.Color := $0055AAFF;  // Ou qualquer outra cor que desejar.
end;

procedure TTelaPrinc.PanelEntrarMouseEnter(Sender: TObject);
begin
     PanelEntrar.Font.Color := $000080FF;
     PanelEntrar.Color := $00FF0080;
end;

procedure TTelaPrinc.PanelEntrarMouseLeave(Sender: TObject);
begin
     PanelEntrar.Font.Color := $00FF0080;
     PanelEntrar.Color := $00800040;
end;

procedure TTelaPrinc.PanelEntrarMouseUp(Sender: TObject; Button: TMouseButton;
	 Shift: TShiftState; X, Y: Integer);
begin
    PanelEntrar.Color := $00800040
end;

procedure TTelaPrinc.SenhaUserKeyPress(Sender: TObject; var Key: char);
begin
    if Ord(Key) = 13 then // 13 é o código da tecla "Enter"
    begin
      // Chama o evento de clique do botão de login aqui
      PanelEntrarClick(Sender); // Substitua "ButtonLogin" pelo nome do seu botão de login
    end;
end;

end.

