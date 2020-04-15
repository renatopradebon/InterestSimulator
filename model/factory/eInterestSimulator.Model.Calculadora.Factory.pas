unit eInterestSimulator.Model.Calculadora.Factory;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelCalculadoraFactory = class(TInterfacedObject, iCalculadoraFactory)
  private
    function PagamentoUnico: iCalculadora;
    function PagamentoVariavel: iCalculadora;
    function Americano: iCalculadora;
    function AmortizacaoConstante: iCalculadora;
    function Price: iCalculadora;
    function AmortizacaoMisto: iCalculadora;
    function Alemao: iCalculadora;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iCalculadoraFactory;
  end;

implementation

uses
  eInterestSimulator.Model.Simulador,
  eInterestSimulator.Model.PagamentoUnico.Calculadora;

{ TModelCalculadoraFactory }

function TModelCalculadoraFactory.Alemao: iCalculadora;
begin

end;

function TModelCalculadoraFactory.Americano: iCalculadora;
begin

end;

function TModelCalculadoraFactory.AmortizacaoConstante: iCalculadora;
begin

end;

function TModelCalculadoraFactory.AmortizacaoMisto: iCalculadora;
begin

end;

constructor TModelCalculadoraFactory.Create;
begin

end;

destructor TModelCalculadoraFactory.Destroy;
begin
  inherited;
end;

class function TModelCalculadoraFactory.New: iCalculadoraFactory;
begin
  Result := Self.Create;
end;

function TModelCalculadoraFactory.PagamentoUnico: iCalculadora;
begin
  Result := TModelPagamentoUnicoCalculadora.New;
end;

function TModelCalculadoraFactory.PagamentoVariavel: iCalculadora;
begin

end;

function TModelCalculadoraFactory.Price: iCalculadora;
begin

end;

end.
