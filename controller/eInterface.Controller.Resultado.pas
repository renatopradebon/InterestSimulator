unit eInterface.Controller.Resultado;

interface

uses
  eInterface.Controller.Interfaces, eInterface.Model.Interfaces;

type
  TControllerResultado = class(TInterfacedObject, iControllerResultado)
  FSimulador : iSimulador;
  private
    function Simulador(): iSimulador; overload;
    function Simulador(Value: iSimulador): iControllerResultado; overload;
    procedure ValidarDados;
    function SimuladorFactory: iSimulador;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerResultado;
    function Resultado: iResultado;
  end;

implementation

uses
  eInterface.Model.Amortizacao.Factory, eInterface.Model.Simulador.Factory,
  eInterface.Model.Simulador, System.SysUtils;

{ TControllerResultado }


function TControllerResultado.Resultado(): iResultado;
begin
  ValidarDados();

  case FSimulador.TipoSistema of
    tpAlemao: Result := TModelAmortizacaoFactory.New.Alemao;
    tpAmericano: Result := TModelAmortizacaoFactory.New.Americano;
    tpAmortizacaoConstante: Result := TModelAmortizacaoFactory.New.AmortizacaoConstante;
    tpAmortizacaoMisto: Result := TModelAmortizacaoFactory.New.AmortizacaoMisto;
    tpPagamentoUnico: Result := TModelAmortizacaoFactory.New.PagamentoUnico;
    tpPagamentoVariavel: Result := TModelAmortizacaoFactory.New.PagamentoVariavel;
    tpPrice: Result := TModelAmortizacaoFactory.New.Price;
  end;
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

function TControllerResultado.Simulador(
  Value: iSimulador): iControllerResultado;
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
  if not (FSimulador.TipoSistema in [Low(TTypeSistema)..High(TTypeSistema)]) then
    raise Exception.Create('O Sistema de amortização é obrigatório!');

  if (FSimulador.Capital <= 0.0) then
    raise Exception.Create('O Valor Capital é obrigatório!');

  if (FSimulador.TaxaJuros <= 0.0) then
    raise Exception.Create('A Taxa de Juros é obrigatória!');

  if (FSimulador.TotalParcelas = 0.0) then
    raise Exception.Create('O Total de Parcelas de óbrigatório!');
end;

end.
