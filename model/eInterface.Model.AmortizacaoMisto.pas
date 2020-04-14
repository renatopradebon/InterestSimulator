unit eInterface.Model.AmortizacaoMisto;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelAmortizacaoAmortizacaoMisto = class(TInterfacedObject, iResultado)
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
  Value: Double): iResultado;
begin
  Result := Self;
  FValorAmortizacao := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorAmortizacao: Double;
begin
  Result := FValorAmortizacao;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorJuros(Value: Double): iResultado;
begin
  Result := Self;
  FValorJuros := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorJuros: Double;
begin
Result := FValorJuros;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorPagamento: Double;
begin
  Result := FValorPagamento;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorPagamento(
  Value: Double): iResultado;
begin
  Result := Self;
  FValorPagamento := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorSaldo(Value: Double): iResultado;
begin
  Result := Self;
  FValorSaldo := Value;
end;

function TModelAmortizacaoAmortizacaoMisto.ValorSaldo: Double;
begin
  Result := FValorSaldo;
end;

end.
