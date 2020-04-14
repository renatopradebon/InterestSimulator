unit eInterface.Model.PagamentoVariavel;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoPagamentoVariavel = class(TInterfacedObject, iResultado)
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

function TModelAmortizacaoPagamentoVariavel.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPagamentoVariavel.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPagamentoVariavel.ValorAmortizacao(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPagamentoVariavel.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoPagamentoVariavel.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPagamentoVariavel.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPagamentoVariavel.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
