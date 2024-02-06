unit TelaMain;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
	 ExtCtrls,UnitEmpresa;

type

	 { TForm1 }

    TForm1 = class(TForm)
		  Image1: TImage;
		  MainMenu1: TMainMenu;
		  MenuItem1: TMenuItem;
		  MenuItem2: TMenuItem;
		  MenuItem3: TMenuItem;
		  MenuItem4: TMenuItem;
		  MenuItem5: TMenuItem;
		  MenuItem6: TMenuItem;
		  MenuItem7: TMenuItem;
		  procedure Button1Click(Sender: TObject);
		  procedure Button1MouseEnter(Sender: TObject);
		  procedure Image1Click(Sender: TObject);
		  procedure MenuItem4Click(Sender: TObject);
    private

    public

    end;

var
    Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
	 // Exibe uma caixa de diálogo com uma mensagem de confirmação
	 if MessageDlg('Exemplo', 'Você deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
	    ShowMessage('Você clicou em Sim!')
	 else
	     ShowMessage('Você clicou em Não!');
end;

procedure TForm1.Button1MouseEnter(Sender: TObject);
begin

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var
   Form2: TForm2; // Supondo que TForm2 é o nome do formulário que você deseja chamar
begin
	 Form2 := TForm2.Create(nil); // Crie uma instância do formulário
	 try
	    Form2.ShowModal; // Exiba o formulário de forma modal
	 finally
	        Form2.Free; // Libere a memória alocada para o formulário quando não for mais necessário
	 end;
end;

end.

