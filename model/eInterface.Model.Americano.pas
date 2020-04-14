unit eInterface.Model.Americano;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAmericano = class(TInterfacedObject, iResultado)
  private
    FNumeroParcela: Integer;
    FValorJuros: Double;
    FValorAmortizacao: Double;
    FValorSaldo: Double;
    FValorPagamento: Double;
    function NumeroParcela (Value : Integer) : iResultado; overload;
    function NumeroParcela : Integer; overload;
    function ValorJuros (Value : Double) : iResultado; overload;
    function ValorJuros : Double; overload;
    function ValorAmortizacao (Value : Double) : iResultado; overload;
    function ValorAmortizacao : Double; overload;
    function ValorSaldo (Value : Double) : iResultado; overload;
    function ValorSaldo : Double; overload;
    function ValorPagamento (Value : Double) : iResultado; overload;
    function ValorPagamento : Double; overload;
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
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmericano.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmericano.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmericano.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAmericano.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmericano.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmericano.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmericano.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
