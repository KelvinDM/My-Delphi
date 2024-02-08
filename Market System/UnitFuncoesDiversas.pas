unit UnitFuncoesDiversas;

interface

uses
  SysUtils;

function StrParaFloat(StrValor: string): Currency;
procedure PermitirApenasNumeros(var Key: Char);
procedure PermitirApenasNumeros2(var Key: Char);


implementation


function StrParaFloat(StrValor: string): Currency;
var
    ValorFormatado: string;
    i, len : Integer;
begin

    // La�o bom para tirar formata��o original : )
    for i := 1 to Length(StrValor) do
    begin
        if not (StrValor[i] in ['R', '$',',','.', ' ']) then
        ValorFormatado := ValorFormatado + StrValor[i];
    end;

    len := Length(ValorFormatado);
    if len > 2 then
        Insert(',', ValorFormatado, len - 1)
    else
        Insert(',00', ValorFormatado, 4);

    if ValorFormatado <> '' then
        Result := StrToCurr(ValorFormatado)
    else
        Result := 0.00;
end;


procedure PermitirApenasNumeros(var Key: Char);
begin
  // Permite apenas d�gitos num�ricos e teclas de controle
  if not (Key in ['0'..'9', #8, #9, #13, #27, #127]) then
    Key := #0;
end;


procedure PermitirApenasNumeros2(var Key: Char);
begin
  // Permite apenas d�gitos num�ricos e teclas de controle ponto e virgula
  if not (Key in ['0'..'9', ',','.', #8, #9, #13, #27, #127]) then
    Key := #0;
end;

end.

