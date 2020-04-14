unit eInterface.Model.Amortizacao.Factory;

interface

uses
  eInterface.Model.Interfaces, eInterface.Model.PagamentoUnico, eInterface.Model.PagamentoVariavel,
  eInterface.Model.Alemao, eInterface.Model.Americano,
  eInterface.Model.AmortizacaoMisto, eInterface.Model.Price;

type
  TModelAmortizacaoFactory = class(TInterfacedObject, iResultadoFactory)
    private
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
      function PagamentoUnico : iResultado;
  end;

implementation

uses
  eInterface.Model.AmortizacaoConstante;

{ TModelAmortizacaoFactory }

function TModelAmortizacaoFactory.Alemao: iResultado;
begin
  Result := TModelAmortizacaoAlemao.Create;
end;

function TModelAmortizacaoFactory.Americano: iResultado;
begin
  Result := TModelAmortizacaoAmericano.Create;
end;

function TModelAmortizacaoFactory.AmortizacaoConstante: iResultado;
begin
  Result := TModelAmortizacaoAmortizacaoConstante.Create;
end;

function TModelAmortizacaoFactory.AmortizacaoMisto: iResultado;
begin
  Result := TModelAmortizacaoAmortizacaoMisto.Create;
end;

constructor TModelAmortizacaoFactory.Create;
begin

end;

destructor TModelAmortizacaoFactory.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoFactory.New: iResultadoFactory;
begin
    Result := Self.Create;
end;

function TModelAmortizacaoFactory.PagamentoUnico: iResultado;
begin
  Result := TModelAmortizacaoPagamentoUnico.Create;
end;

function TModelAmortizacaoFactory.PagamentoVariavel: iResultado;
begin
  Result := TModelAmortizacaoPagamentoVariavel.Create;
end;

function TModelAmortizacaoFactory.Price: iResultado;
begin
  Result := TModelAmortizacaoPrice.Create;
end;

end.
