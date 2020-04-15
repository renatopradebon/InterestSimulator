unit eInterestSimulator.Model.PagamentoUnico;

interface

uses
  eInterestSimulator.Model.Interfaces, System.Generics.Collections;

type
  TModelAmortizacaoPagamentoUnico = class(TInterfacedObject, iResultado)
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

constructor TModelAmortizacaoPagamentoUnico.Create;
begin

end;

destructor TModelAmortizacaoPagamentoUnico.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoPagamentoUnico.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoPagamentoUnico.NumeroParcela(Value: Integer)
  : iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPagamentoUnico.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPagamentoUnico.ValorAmortizacao(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPagamentoUnico.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorJuros: Real;
begin
  Result := FValorJuros;
end;

function TModelAmortizacaoPagamentoUnico.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPagamentoUnico.ValorPagamento(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
