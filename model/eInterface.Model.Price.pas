unit eInterface.Model.Price;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoPrice = class(TInterfacedObject, iResultado)
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

constructor TModelAmortizacaoPrice.Create;
begin

end;

destructor TModelAmortizacaoPrice.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoPrice.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoPrice.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPrice.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPrice.ValorAmortizacao(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPrice.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPrice.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPrice.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoPrice.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPrice.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPrice.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPrice.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
