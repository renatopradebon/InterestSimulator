unit eInterface.Model.Alemao;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAlemao = class(TInterfacedObject, iResultado)
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

function TModelAmortizacaoAlemao.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAlemao.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAlemao.ValorAmortizacao(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAlemao.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAlemao.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAlemao.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAlemao.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAlemao.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAlemao.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAlemao.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
