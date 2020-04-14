unit eInterface.Model.Americano;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAmericano = class(TInterfacedObject, iResultado)
  private
    FNumeroParcela: Integer;
    FValorJuros: Real;
    FValorAmortizacao: Real;
    FValorSaldo: Real;
    FValorPagamento: Real;
    function NumeroParcela (Value : Integer) : iResultado; overload;
    function NumeroParcela : Integer; overload;
    function ValorJuros (Value : Real) : iResultado; overload;
    function ValorJuros : Real; overload;
    function ValorAmortizacao (Value : Real) : iResultado; overload;
    function ValorAmortizacao : Real; overload;
    function ValorSaldo (Value : Real) : iResultado; overload;
    function ValorSaldo : Real; overload;
    function ValorPagamento (Value : Real) : iResultado; overload;
    function ValorPagamento : Real; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iResultado;
  end;

implementation

{ TModelAmortizacao }

constructor TModelAmortizacaoAmericano.Create;
begin

end;

destructor TModelAmortizacaoAmericano.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoAmericano.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoAmericano.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAmericano.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAmericano.ValorAmortizacao(
  Value: Real): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmericano.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmericano.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmericano.ValorJuros: Real;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAmericano.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmericano.ValorPagamento(
  Value: Real): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmericano.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmericano.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
