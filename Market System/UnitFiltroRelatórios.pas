unit UnitFiltroRelatórios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, UnitConexao,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet, frCoreClasses;

type
  TFormFiltroRelatórios = class(TForm)
    PanelTopCadastros: TPanel;
    PanelBotaoClientes: TPanel;
    LabelClientes: TLabel;
    PanelBotaoFechar: TPanel;
    FrxVendas: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    FrxRelatorioVendas: TfrxReport;
    PanelImprimir: TPanel;
    procedure PanelBotaoFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PanelImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFiltroRelatórios: TFormFiltroRelatórios;

implementation
uses
    Unit_Princ;

{$R *.dfm}

procedure TFormFiltroRelatórios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    HomeScreen.PanelMenu.Enabled            := True;
    HomeScreen.PanelConfigServidor.Enabled  := True;
    HomeScreen.PanelOneTop.Enabled          := True;
    FreeAndNil(FormFiltroRelatórios);
end;

procedure TFormFiltroRelatórios.PanelBotaoFecharClick(Sender: TObject);
begin
    if FormConexao.FDQueryItensVendaAux.Active then
        FormConexao.FDQueryItensVendaAux.Close;

    Self.Close;
end;

procedure TFormFiltroRelatórios.PanelImprimirClick(Sender: TObject);
begin
    FrxRelatorioVendas.LoadFromFile('C:\Users\Thays\Documents\Estudo e Projetos de programas DELPHI\Market System\Relatórios\LISTA.FR3');
    FrxRelatorioVendas.ShowReport;
end;

end.
