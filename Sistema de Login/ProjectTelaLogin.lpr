program ProjectTelaLogin;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces, // this includes the LCL widgetset
    Forms, zcomponent, TelaLogin, Conexao, telacadastro
    { you can add units after this };

{$R *.res}

begin
    RequireDerivedFormResource:=True;
	 Application.Scaled:=True;
    Application.Initialize;
	 Application.CreateForm(TTelaPrinc, TelaPrinc);
	 Application.CreateForm(TDM, DM);
	 Application.CreateForm(TFormCadastro, FormCadastro);
    Application.Run;
end.
