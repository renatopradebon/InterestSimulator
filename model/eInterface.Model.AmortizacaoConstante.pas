unit eInterface.Model.AmortizacaoConstante;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAmortizacaoConstante = class(TInterfacedObject, iResultado)
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

function TModelAmortizacaoAmortizacaoConstante.NumeroParcela(
  Value: Integer): iResultado;
begin
  Result := Self;
  FNumeroParcela := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.NumeroParcela: Integer;
begin
  Result := FNumeroParcela;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorAmortizacao(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmortizacaoConstante.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
