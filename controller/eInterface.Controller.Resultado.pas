unit eInterface.Controller.Resultado;

interface

uses
  eInterface.Controller.Interfaces, eInterface.Model.Interfaces,
  System.Generics.Collections;

type
  TControllerResultado = class(TInterfacedObject, iControllerResultado)
    FSimulador: iSimulador;
    FResultados: TList<iResultado>;
    FCalculadora: iCalculadora;
  private
    function Simulador: iSimulador; overload;
    function Simulador(Value: iSimulador): iControllerResultado; overload;
    function Resultado: TList<iResultado>; overload;
    function Resultado(Value: TList<iResultado>): iControllerResultado; overload;
    procedure ValidarDados;
    function SimuladorFactory: iSimulador;
    function Calcular: iControllerResultado;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerResultado;
  end;

implementation

uses
  eInterface.Model.Calculadora.Factory, System.SysUtils, eInterface.Model.Simulador.Factory;

{ TControllerResultado }

function TControllerResultado.Resultado(): TList<iResultado>;
begin
  Result := FResultados;
end;

function TControllerResultado.Calcular: iControllerResultado;
begin
  Result := Self;

  ValidarDados;

  case FSimulador.TipoSistema of
    tpAlemao:
      FCalculadora := TModelCalculadoraFactory.New.Alemao;
    tpAmericano:
      FCalculadora := TModelCalculadoraFactory.New.Americano;
    tpAmortizacaoConstante:
      FCalculadora := TModelCalculadoraFactory.New.AmortizacaoConstante;
    tpAmortizacaoMisto:
      FCalculadora := TModelCalculadoraFactory.New.AmortizacaoMisto;
    tpPagamentoUnico:
      FCalculadora := TModelCalculadoraFactory.New.PagamentoUnico;
    tpPagamentoVariavel:
      FCalculadora := TModelCalculadoraFactory.New.PagamentoVariavel;
    tpPrice:
      FCalculadora := TModelCalculadoraFactory.New.Price;
  end;

  FResultados := FCalculadora
                  .Simulador(FSimulador)
                  .Calcular
                  .Resultados;
end;

constructor TControllerResultado.Create;
begin

end;

destructor TControllerResultado.Destroy;
begin
  inherited;
end;

class function TControllerResultado.New: iControllerResultado;
begin
  Result := Self.Create;
end;

function TControllerResultado.Resultado(
  Value: TList<iResultado>): iControllerResultado;
begin
  Result := Self;
  FResultados := Value;
end;

function TControllerResultado.Simulador(Value: iSimulador)
  : iControllerResultado;
begin
  Result := Self;
  FSimulador := Value;
end;

function TControllerResultado.SimuladorFactory: iSimulador;
begin
  Result := TModelSimuladorFactory.New.Simulador;
end;

function TControllerResultado.Simulador: iSimulador;
begin
  Result := FSimulador;
end;

procedure TControllerResultado.ValidarDados;
begin
  if not(FSimulador.TipoSistema in [Low(TTypeSistema) .. High(TTypeSistema)]) then
    raise Exception.Create('O Sistema de amortização é obrigatório!');

  if (FSimulador.Capital <= 0.0) then
    raise Exception.Create('O Valor Capital é obrigatório!');

  if (FSimulador.TaxaJuros <= 0.0) then
    raise Exception.Create('A Taxa de Juros é obrigatória!');

  if (FSimulador.TotalParcelas <= 0.0) then
    raise Exception.Create('O Total de Parcelas de obrigatório!');
end;

end.
