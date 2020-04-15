unit eInterestSimulator.Model.Alemao;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelAmortizacaoAlemao = class(TInterfacedObject, iResultado)
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

constructor TModelAmortizacaoAlemao.Create;
begin

end;

destructor TModelAmortizacaoAlemao.Destroy;
begin
  inherited;
end;

class function TModelAmortizacaoAlemao.New: iResultado;
begin
  Result := Self.Create;
end;

function TModelAmortizacaoAlemao.NumeroParcela(Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAlemao.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAlemao.ValorAmortizacao(Value: Real): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAlemao.ValorAmortizacao: Real;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAlemao.ValorJuros(Value: Real): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAlemao.ValorJuros: Real;
begin
  Result := FValorJuros;
end;

function TModelAmortizacaoAlemao.ValorPagamento: Real;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAlemao.ValorPagamento(Value: Real): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAlemao.ValorSaldo(Value: Real): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAlemao.ValorSaldo: Real;
begin
  Result := FValorSaldo;
end;

end.
