unit eInterestSimulator.Model.PagamentoVariavel;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelAmortizacaoPagamentoVariavel = class(TInterfacedObject, iResultado)
  private
    FNumeroParcela: Integer;
    FValorJuros: Real;
    FValorAmortizacao: Real;
    FValorSaldo: Real;
    FValorPagamento: Real;
    function NumeroParcela(Value: Integer): iResultado; overload;
    function NumeroParcela: Integer; overload;
    function ValorJuros(Value: Real): iResultado; overload;
    function ValorJuros: Real; overload;
    function ValorAmortizacao(Value: Real): iResultado; overload;
    function ValorAmortizacao: Real; overload;
    function ValorSaldo(Value: Real): iResultado; overload;
    function ValorSaldo: Real; overload;
    function ValorPagamento(Value: Real): iResultado; overload;
    function ValorPagamento: Real; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iResultado;
  end;

implementation

{ TModelAmortizacao }

constructor TModelAmortizacaoPagamentoVariavel.Create;
begin

end;

destructor TModelAmortizacaoPagamentoVariavel.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoPagamentoVariavel.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoPagamentoVariavel.NumeroParcela(Value: Integer)
  : iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPagamentoVariavel.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPagamentoVariavel.ValorAmortizacao(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPagamentoVariavel.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorJuros: Real;
begin
  Result := FValorJuros;
end;

function TModelAmortizacaoPagamentoVariavel.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPagamentoVariavel.ValorPagamento(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
