unit UnitCalculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Windows;

type

  { TCalculadora }

  TCalculadora = class(TForm)
		Button_10: TButton;
    Button_15: TButton;
    Button_17: TButton;
    Button_18: TButton;
    Button_7: TButton;
    Button_0: TButton;
    Button_14: TButton;
    Button_12: TButton;
    Button_13: TButton;
    Button_11: TButton;
    Button_8: TButton;
    Button_9: TButton;
    Button_4: TButton;
    Button_5: TButton;
    Button_6: TButton;
    Button_1: TButton;
    Button_2: TButton;
    Button_3: TButton;
    ValorDigitavel: TEdit;
	procedure Button_0Click(Sender: TObject);
	procedure Button_11Click(Sender: TObject);
	procedure Button_12Click(Sender: TObject);
	procedure Button_13Click(Sender: TObject);
   procedure Button_14Click(Sender: TObject);
	procedure Button_15Click(Sender: TObject);
	procedure Button_17Click(Sender: TObject);
	procedure Button_18Click(Sender: TObject);
   procedure Button_1Click(Sender: TObject);
   procedure Button_2Click(Sender: TObject);
	procedure Button_3Click(Sender: TObject);
	procedure Button_4Click(Sender: TObject);
	procedure Button_5Click(Sender: TObject);
	procedure Button_6Click(Sender: TObject);
	procedure Button_7Click(Sender: TObject);
	procedure Button_8Click(Sender: TObject);
	procedure Button_9Click(Sender: TObject);
	procedure FormCreate(Sender: TObject);
	procedure FormKeyPress(Sender: TObject; var Key: char);
   procedure FormShow(Sender: TObject);
   procedure DesabilitarBotoesAritmeticos;
   procedure HabilitarBotoesAritmeticos;
  private
      Valor_Atual: Double;
      Operacao: Integer;
      Limpar: Boolean;
  public

  end;

var
  Calculadora: TCalculadora;

implementation

{$R *.lfm}

{ TCalculadora }




procedure TCalculadora.FormShow(Sender: TObject);
begin
  ValorDigitavel.Caption := '0';
  Button_1.Color := clHighlight;




end;

procedure TCalculadora.DesabilitarBotoesAritmeticos;
begin
  Button_0.Enabled := False;
  Button_1.Enabled := False;
  Button_2.Enabled := False;
  Button_3.Enabled := False;
  Button_4.Enabled := False;
  Button_5.Enabled := False;
  Button_6.Enabled := False;
  Button_7.Enabled := False;
  Button_8.Enabled := False;
  Button_9.Enabled := False;
  Button_13.Enabled := False; // Botão de adição
  Button_17.Enabled := False; // Botão de subtração
  Button_12.Enabled := False; // Botão de multiplicação
  Button_11.Enabled := False; // Botão de divisão
end;

procedure TCalculadora.HabilitarBotoesAritmeticos;
begin
  Button_0.Enabled := True;
  Button_1.Enabled := True;
  Button_2.Enabled := True;
  Button_3.Enabled := True;
  Button_4.Enabled := True;
  Button_5.Enabled := True;
  Button_6.Enabled := True;
  Button_7.Enabled := True;
  Button_8.Enabled := True;
  Button_9.Enabled := True;
  Button_13.Enabled := True; // Botão de adição
  Button_17.Enabled := True; // Botão de subtração
  Button_12.Enabled := True; // Botão de multiplicação
  Button_11.Enabled := True; // Botão de divisão
end;

procedure TCalculadora.Button_14Click(Sender: TObject);
begin
     try
     DesabilitarBotoesAritmeticos;  //Função para desabilitar botões para salvar o resultado corretamente
	   //Dependo do número da operação vai ser utilizado um tipo diferente de operação
		   case Operacao of
		        1: // Soma
		          Valor_Atual := Valor_Atual + StrToFloat(ValorDigitavel.Text);
		        2: // Subtração
		          Valor_Atual := Valor_Atual - StrToFloat(ValorDigitavel.Text);
		        3: // Multiplicação
		          Valor_Atual := Valor_Atual * StrToFloat(ValorDigitavel.Text);
		        4: // Divisão
		          Valor_Atual := Valor_Atual / StrToFloat(ValorDigitavel.Text);
		   end;
         Limpar := false;
		   ValorDigitavel.Text := FloatToStr(Valor_Atual);  //RESULTADO FINAL
    except
       on E: Exception do
        begin
             ValorDigitavel.Text := 'Erro! valor inválido!!! ';
             Limpar := true;
        end;
    end;

    HabilitarBotoesAritmeticos;
    Button_10.SetFocus;   //ARRUMAR O SET FOCUS EM ALGUM LUGAR

end;

procedure TCalculadora.Button_15Click(Sender: TObject);
begin
     ValorDigitavel.Text := '0';
     Valor_Atual := 0;
     Operacao := 0;
     Limpar := true;
end;

procedure TCalculadora.Button_17Click(Sender: TObject);
begin
     Operacao := 2;
     Limpar := true;
     Valor_Atual := StrToFloat(ValorDigitavel.Text);
end;

procedure TCalculadora.Button_18Click(Sender: TObject);
begin
     //
	  if limpar then
	  begin
	       ValorDigitavel.Text := '';
	       limpar := false;
	  end;
	  if ValorDigitavel.Text = '0' then
	  begin
	       ValorDigitavel.Text := '';
	  end;
	  ValorDigitavel.Text := ValorDigitavel.Text + ',';
end;

procedure TCalculadora.Button_0Click(Sender: TObject);
begin
     //
	  if limpar then
	  begin
	       ValorDigitavel.Text := '';
	       limpar := false;
	  end;
	  if ValorDigitavel.Text = '0' then
	  begin
	       ValorDigitavel.Text := '';
	  end;
	  ValorDigitavel.Text := ValorDigitavel.Text + '0';
end;

procedure TCalculadora.Button_11Click(Sender: TObject);
begin
     Operacao := 4;
     Limpar := true;
     Valor_Atual := StrToFloat(ValorDigitavel.Text);
end;

procedure TCalculadora.Button_12Click(Sender: TObject);
begin
     Operacao := 3;
     Limpar := true;
     Valor_Atual := StrToFloat(ValorDigitavel.Text);
end;

procedure TCalculadora.Button_13Click(Sender: TObject);
begin
     Operacao := 1;
     Limpar := true;
     Valor_Atual := StrToFloat(ValorDigitavel.Text);
end;

procedure TCalculadora.Button_1Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '1';
end;

procedure TCalculadora.Button_2Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '2';
end;

procedure TCalculadora.Button_3Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '3';
end;

procedure TCalculadora.Button_4Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '4';
end;

procedure TCalculadora.Button_5Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '5';
end;

procedure TCalculadora.Button_6Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '6';
end;

procedure TCalculadora.Button_7Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '7';
end;

procedure TCalculadora.Button_8Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '8';
end;

procedure TCalculadora.Button_9Click(Sender: TObject);
begin
     if limpar then
     begin
          ValorDigitavel.Text := '';
          limpar := false;
	 end;
     if ValorDigitavel.Text = '0' then
     begin
          ValorDigitavel.Text := '';
	 end;
     ValorDigitavel.Text := ValorDigitavel.Text + '9';
end;

procedure TCalculadora.FormCreate(Sender: TObject);
begin
     Valor_Atual := 0;
     Operacao := 0;
     Limpar := false;
end;

procedure TCalculadora.FormKeyPress(Sender: TObject; var Key: char);
begin
     case key of
         char('0'):
             Button_0.Click;
         char('1'):
             Button_1.Click;
         char('2'):
             Button_2.Click;
         char('3'):
             Button_3.Click;
         char('4'):
             Button_4.Click;
         char('5'):
             Button_5.Click;
         char('6'):
             Button_6.Click;
         char('7'):
             Button_7.Click;
         char('8'):
             Button_8.Click;
         char('9'):
             Button_9.Click;
         char('+'):
             Button_13.Click;
         char('-'):
             Button_17.Click;
         char('*'):
             Button_12.Click;
         char('/'):
             Button_11.Click;
         char(#8): //DELETE
             Button_15.Click;
         #13:  //ENTER
		       Button_14.Click;
         char(','):
             Button_18.Click;

	  end;
end;
end.

