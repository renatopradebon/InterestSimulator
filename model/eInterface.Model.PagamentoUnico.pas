unit eInterface.Model.PagamentoUnico;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoPagamentoUnico = class(TInterfacedObject, iResultado)
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

function TModelAmortizacaoPagamentoUnico.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPagamentoUnico.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPagamentoUnico.ValorAmortizacao(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPagamentoUnico.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoPagamentoUnico.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPagamentoUnico.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPagamentoUnico.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
