unit eInterestSimulator.Model.Simulador.Factory;

interface

uses
  eInterestSimulator.Model.Interfaces;

type
  TModelSimuladorFactory = class(TInterfacedObject, iSimuladorFactory)
  private
    function Simulador: iSimulador;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSimuladorFactory;
  end;

implementation

uses
  eInterestSimulator.Model.Simulador;

{ TModelSimuladorFactory }

constructor TModelSimuladorFactory.Create;
begin

end;

destructor TModelSimuladorFactory.Destroy;
begin
  inherited;
end;

class function TModelSimuladorFactory.New: iSimuladorFactory;
begin
  Result := Self.Create;
end;

function TModelSimuladorFactory.Simulador: iSimulador;
begin
  Result := TModelSimulador.Create;
end;

end.
