unit UnitFuncoesDiversas;

interface

uses
  SysUtils, StrUtils;

function StrParaFloat(StrValor: string): Currency;
function DeletaVirgulasEPontos(StrValor: string): Integer;
procedure PermitirApenasNumeros(var Key: Char);
procedure PermitirApenasNumeros2(var Key: Char);



implementation


function StrParaFloat(StrValor: string): Currency;
var
    ValorFormatado: string;
    i, len : Integer;
begin

    // Laço bom para tirar formatação original : )
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
  // Permite apenas dígitos numéricos e teclas de controle
  if not (Key in ['0'..'9', #8, #9, #13, #27, #127]) then
    Key := #0;
end;


procedure PermitirApenasNumeros2(var Key: Char);
begin
  // Permite apenas dígitos numéricos e teclas de controle e virgula
  if not (Key in ['0'..'9', ',', #8, #9, #13, #27, #127]) then
    Key := #0;
end;

function DeletaVirgulasEPontos(StrValor: string): Integer;
var
    ValorFormatado: string;
    i, len : Integer;
begin

    // Laço bom para tirar formatação original : )
    for i := 1 to Length(StrValor) do
    begin
        if not (StrValor[i] in ['R', '$',',','.', ' ']) then
        ValorFormatado := ValorFormatado + StrValor[i];
    end;

     Result := StrToInt(ValorFormatado);
end;
end.

