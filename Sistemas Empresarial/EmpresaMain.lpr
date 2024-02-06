program EmpresaMain;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    {$IFDEF HASAMIGA}
    athreads,
    {$ENDIF}
    Interfaces, // this includes the LCL widgetset
    Forms, zcomponent, TelaMain, UnitEmpresa, UnitBaseDados
    { you can add units after this };

{$R *.res}

begin
    RequireDerivedFormResource:=True;
    Application.Scaled:=True;
    Application.Initialize;
	 Application.CreateForm(TForm1, Form1);
	 Application.CreateForm(TForm2, Form2);
	 Application.CreateForm(TDataModule1, DataModule1);
    Application.Run;
end.

