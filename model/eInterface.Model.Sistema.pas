unit eInterface.Model.Sistema;

interface

uses
  eInterface.Model.Interfaces;

type
  TModelSistema = class(TInterfacedObject, iSistema)
  private
    FDescricao: String;
    FHabilitado: Boolean;
    FTipoSistema: TTypeSistema;
    function Descricao(Value: String) : iSistema; overload;
    function Descricao: String; overload;
    function Habilitado(Value: Boolean): iSistema; overload;
    function Habilitado: Boolean; overload;
    function TipoSistema(Value: TTypeSistema): iSistema; overload;
    function TipoSistema: TTypeSistema; overload;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSistema;
  end;

implementation

{ TModelSistema }

constructor TModelSistema.Create;
begin

end;

function TModelSistema.Descricao(Value: String): iSistema;
begin
  Result := Self;
  FDescricao := Value;
end;

function TModelSistema.Descricao: String;
begin
  Result := FDescricao;
end;

destructor TModelSistema.Destroy;
begin
  inherited;
end;

function TModelSistema.Habilitado: Boolean;
begin
  Result := FHabilitado;
end;

function TModelSistema.Habilitado(Value: Boolean): iSistema;
begin
  Result := Self;
  FHabilitado := Value;
end;

class function TModelSistema.New: iSistema;
begin
  Result := Self.Create;
end;

function TModelSistema.TipoSistema: TTypeSistema;
begin
  Result := FTipoSistema;
end;

function TModelSistema.TipoSistema(Value: TTypeSistema): iSistema;
begin
  Result := Self;
  FTipoSistema := Value;
end;

end.
