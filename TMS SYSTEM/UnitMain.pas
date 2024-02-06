unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.ActnColorMaps, Vcl.CustomizeDlg, Vcl.ComCtrls, Vcl.Menus, UnitCadastroEmpresa;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MainMenuTMS: TMainMenu;
    Cadastro1: TMenuItem;
    Empresa1: TMenuItem;
    procedure Empresa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Empresa1Click(Sender: TObject);
var
  FormCadastroEmpresa: TFormCadastroEmpresa;
begin
  FormCadastroEmpresa := TFormCadastroEmpresa.Create(Application);
  //TFormCadastroEmpresa := TForm.Create(nil);
  try
    // Ajuste as propriedades do novo formulário, se necessário
    //FormCadastroEmpresa.Show;

    // Exiba o novo formulário
    FormCadastroEmpresa.ShowModal;
  finally
    // Libere a memória alocada para o novo formulário
    FormCadastroEmpresa.Free;
  end;
end;

end.
