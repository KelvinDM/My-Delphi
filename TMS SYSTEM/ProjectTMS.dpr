program ProjectTMS;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  UnitCadastroEmpresa in 'UnitCadastroEmpresa.pas' {FormCadastroEmpresa},
  UnitDadosEmpresa in 'UnitDadosEmpresa.pas' {DmEmpresa: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmEmpresa, DmEmpresa);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormCadastroEmpresa, FormCadastroEmpresa);
  Application.Run;
end.
