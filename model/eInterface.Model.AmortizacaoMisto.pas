unit eInterface.Model.AmortizacaoMisto;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAmortizacaoMisto = class(TInterfacedObject, iResultado)
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

constructor TModelAmortizacaoAmortizacaoMisto.Create;
begin

end;

destructor TModelAmortizacaoAmortizacaoMisto.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoAmortizacaoMisto.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoAmortizacaoMisto.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorAmortizacao(
  Value: Real): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorJuros: Real;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorPagamento(
  Value: Real): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
