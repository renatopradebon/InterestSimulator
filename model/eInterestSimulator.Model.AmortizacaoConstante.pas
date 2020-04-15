unit eInterestSimulator.Model.AmortizacaoConstante;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelAmortizacaoAmortizacaoConstante = class(TInterfacedObject, iResultado)
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

constructor TModelAmortizacaoAmortizacaoConstante.Create;
begin

end;

destructor TModelAmortizacaoAmortizacaoConstante.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoAmortizacaoConstante.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoAmortizacaoConstante.NumeroParcela(Value: Integer)
  : iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorAmortizacao(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorJuros(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorJuros: Real;
begin
  Result := FValorJuros;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorPagamento(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorSaldo(Value: Real)
  : iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
