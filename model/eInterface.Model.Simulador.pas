unit eInterface.Model.Simulador;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelSimulador = class(TInterfacedObject, iSimulador)
  private
    FCapital: Double;
    FTaxaJuros: Double;
    FTotalParcelas: Integer;
    FTipoSistema :  TTypeSistema;
    function Capital (Value : Double): iSimulador; overload;
    function Capital : Double; overload;
    function TaxaJuros (Value : Double): iSimulador; overload;
    function TaxaJuros : Double; overload;
    function TotalParcelas (Value : Integer): iSimulador; overload;
    function TotalParcelas : Integer; overload;
    function TipoSistema (Value : TTypeSistema) : iSimulador; overload;
    function TipoSistema : TTypeSistema; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSimulador;
  end;

implementation

{ TModelSimulador }

function TModelSimulador.Capital: Double;
begin
  Result := FCapital;
end;

function TModelSimulador.Capital(Value: Double): iSimulador;
begin
  Result := Self;
  FCapital := Value;
end;

constructor TModelSimulador.Create;
begin

end;

destructor TModelSimulador.Destroy;
begin
  inherited;
end;

class function TModelSimulador.New: iSimulador;
begin
  Result := Self.Create;
end;

function TModelSimulador.TaxaJuros: Double;
begin
  Result := FTaxaJuros;
end;

function TModelSimulador.TipoSistema: TTypeSistema;
begin
  Result := FTipoSistema;
end;

function TModelSimulador.TotalParcelas: Integer;
begin
  Result := FTotalParcelas;
end;

function TModelSimulador.TotalParcelas(Value: Integer): iSimulador;
begin
  Result := Self;
  FTotalParcelas := Value;
end;

function TModelSimulador.TipoSistema(Value: TTypeSistema): iSimulador;
begin
  Result := Self;
  FTipoSistema := Value;
end;

function TModelSimulador.TaxaJuros(Value: Double): iSimulador;
begin
  Result := Self;
  FTaxaJuros := Value;
end;

end.
