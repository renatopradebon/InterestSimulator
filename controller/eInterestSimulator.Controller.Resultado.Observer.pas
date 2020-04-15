unit eInterestSimulator.Controller.Resultado.Observer;

interface

uses
  eInterestSimulator.Controller.Observer.Interfaces,
  eInterestSimulator.Model.Interfaces, System.Generics.Collections;

type
  TControllerObserverResultado = class(TInterfacedObject, iSubjectResultado)
  private
    FObserverResultados: TList<iObserverResultado>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSubjectResultado;
    function Add(Value: iObserverResultado): iSubjectResultado;
    function Notify(Value: Tlist<iResultado>): iSubjectResultado;
  end;

implementation

uses
  System.SysUtils;


{ TControllerObserverResultado }

function TControllerObserverResultado.Add(
  Value: iObserverResultado): iSubjectResultado;
begin
  Result := Self;
  FObserverResultados.Add(Value);
end;

constructor TControllerObserverResultado.Create;
begin
  FObserverResultados := TList<iObserverResultado>.Create;
end;

destructor TControllerObserverResultado.Destroy;
begin
  FreeAndNil(FObserverResultados);
  inherited;
end;

class function TControllerObserverResultado.New: iSubjectResultado;
begin
  Result := Self.Create;
end;

function TControllerObserverResultado.Notify(Value: Tlist<iResultado>): iSubjectResultado;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FObserverResultados.Count) do
    FObserverResultados[I].UpdateResultado(Value);
end;

end.
