program ProjectMarketSystem;

uses
  Vcl.Forms,
  Unit_Princ in '..\..\Embarcadero\Studio\Projects\Unit_Princ.pas' {HomeScreen},
  UnitCadastro in 'UnitCadastro.pas' {FormCadastros},
  UnitConexao in 'UnitConexao.pas' {FormConexao: TDataModule},
  UnitVendas in 'UnitVendas.pas' {FormVendas},
  UnitFuncoesDiversas in 'UnitFuncoesDiversas.pas';

{$R *.res}

begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(THomeScreen, HomeScreen);
  Application.CreateForm(TFormConexao, FormConexao);
  Application.CreateForm(TFormVendas, FormVendas);
  Application.Run;
end.