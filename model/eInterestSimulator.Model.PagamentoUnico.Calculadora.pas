unit eInterestSimulator.Model.PagamentoUnico.Calculadora;

interface

uses
  eInterestSimulator.Model.Interfaces, System.Generics.Collections;

type
  TModelPagamentoUnicoCalculadora = class(TInterfacedObject, iCalculadora)
  private
    FSimulador: iSimulador;
    FResultados: TList<iResultado>;
    function Resultados: TList<iResultado>;
    function Calcular: iCalculadora;
    function Simulador: iSimulador; overload;
    function Simulador(Value: iSimulador): iCalculadora; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCalculadora;
  end;

implementation

uses
  eInterestSimulator.Model.Resultado.Factory;

{ TModelPagamentoUnicoCalculadora }

function TModelPagamentoUnicoCalculadora.Resultados: TList<iResultado>;
begin
  Result := FResultados;
end;

function TModelPagamentoUnicoCalculadora.Calcular: iCalculadora;
var
  I: Integer;
  FResultado: iResultado;
  FValorAcumulado, FJuros, FValorAmortizacao, FValorPagamento: Real;
const
  cCEM = 100;
begin
  Result := Self;

  with FSimulador do
  begin
    FValorAcumulado := Capital;
    FJuros := 0;
    FValorAmortizacao := 0;
    FValorPagamento := 0;

    for I := 0 to TotalParcelas do
    begin
      if I = TotalParcelas then
      begin
        FValorAmortizacao := Capital;
        FValorPagamento := FValorAcumulado;
        FValorAcumulado := 0;
      end;

      FResultado := TModelResultadoFactory.New.PagamentoUnico.NumeroParcela(I)
        .ValorJuros(FJuros).ValorAmortizacao(FValorAmortizacao)
        .ValorPagamento(FValorPagamento).ValorSaldo(FValorAcumulado);
      FResultados.Add(FResultado);

      FJuros := (FValorAcumulado * TaxaJuros / cCEM);
      FValorAcumulado := (FValorAcumulado + FJuros);
    end;
  end;
end;

constructor TModelPagamentoUnicoCalculadora.Create;
begin
  FResultados := TList<iResultado>.Create;
end;

destructor TModelPagamentoUnicoCalculadora.Destroy;
begin
  inherited;
end;

class function TModelPagamentoUnicoCalculadora.New: iCalculadora;
begin
  Result := Self.Create;
end;

function TModelPagamentoUnicoCalculadora.Simulador: iSimulador;
begin
  Result := FSimulador;
end;

function TModelPagamentoUnicoCalculadora.Simulador(Value: iSimulador)
  : iCalculadora;
begin
  Result := Self;
  FSimulador := Value;
end;

end.
