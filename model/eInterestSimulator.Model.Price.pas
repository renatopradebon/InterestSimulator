unit eInterestSimulator.Model.Price;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelAmortizacaoPrice = class(TInterfacedObject, iResultado)
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

function TModelAmortizacaoPrice.NumeroParcela(Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoPrice.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoPrice.ValorAmortizacao(Value: Real): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoPrice.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoPrice.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoPrice.ValorJuros: Real;
begin
  Result := FValorJuros;
end;

function TModelAmortizacaoPrice.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoPrice.ValorPagamento(Value: Real): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoPrice.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoPrice.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
