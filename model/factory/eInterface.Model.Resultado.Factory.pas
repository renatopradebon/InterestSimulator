﻿unit eInterface.Model.Resultado.Factory;

interface

uses
  eInterface.Model.Interfaces, eInterface.Model.PagamentoUnico, eInterface.Model.PagamentoVariavel,
  eInterface.Model.Alemao, eInterface.Model.Americano,
  eInterface.Model.AmortizacaoMisto, eInterface.Model.Price;

type
  TModelResultadoFactory = class(TInterfacedObject, iResultadoFactory)
    private
      function PagamentoUnico : iResultado;
      function PagamentoVariavel : iResultado;
      function Americano : iResultado;
      function AmortizacaoConstante : iResultado;
      function Price : iResultado;
      function AmortizacaoMisto : iResultado;
      function Alemao : iResultado;
    public
      constructor Create;
      destructor Destroy; override;
      class function  New : iResultadoFactory;
  end;

implementation

uses
  eInterface.Model.AmortizacaoConstante;

{ TModelAmortizacaoFactory }

function TModelResultadoFactory.Alemao: iResultado;
begin
  Result := TModelAmortizacaoAlemao.Create;
end;

function TModelResultadoFactory.Americano: iResultado;
begin
  Result := TModelAmortizacaoAmericano.Create;
end;

function TModelResultadoFactory.AmortizacaoConstante: iResultado;
begin
  Result := TModelAmortizacaoAmortizacaoConstante.Create;
end;

function TModelResultadoFactory.AmortizacaoMisto: iResultado;
begin
  Result := TModelAmortizacaoAmortizacaoMisto.Create;
end;

constructor TModelResultadoFactory.Create;
begin

end;

destructor TModelResultadoFactory.Destroy;
begin
  inherited;
end;

class function TModelResultadoFactory.New: iResultadoFactory;
begin
    Result := Self.Create;
end;

function TModelResultadoFactory.PagamentoUnico: iResultado;
begin
  Result := TModelAmortizacaoPagamentoUnico.Create;
end;

function TModelResultadoFactory.PagamentoVariavel: iResultado;
begin
  Result := TModelAmortizacaoPagamentoVariavel.Create;
end;

function TModelResultadoFactory.Price: iResultado;
begin
  Result := TModelAmortizacaoPrice.Create;
end;

end.
