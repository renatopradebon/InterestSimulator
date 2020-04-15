unit eInterestSimulator.Controller.Sistema;

interface

uses
  eInterestSimulator.Controller.Interfaces, System.Generics.Collections,
  eInterestSimulator.Model.Interfaces;

type
  TControllerSistema = class(TInterfacedObject, iControllerSistema)
  private
    FDicionarioSistemas: TDictionary<TTypeSistema, iSistema>;
    function SistemasLiberados: TDictionary<TTypeSistema, iSistema>;
    function SistemasLiberadosList: TList<iSistema>;
    procedure AdicionaSistemas;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerSistema;
  end;

implementation

uses
  eInterestSimulator.Model.Calculadora.Factory, System.SysUtils,
  eInterestSimulator.Model.Simulador.Factory,
  eInterestSimulator.Model.Sistema;

{ TControllerSistema }

constructor TControllerSistema.Create;
begin
  AdicionaSistemas;
end;

procedure TControllerSistema.AdicionaSistemas;
begin
  FDicionarioSistemas := TDictionary<TTypeSistema, iSistema>.Create;
  FDicionarioSistemas.Add(tpAlemao, TModelSistema.New.Descricao('Alemão')
    .Habilitado(False).TipoSistema(tpAlemao));
  FDicionarioSistemas.Add(tpAmericano, TModelSistema.New.Descricao('Americano')
    .Habilitado(False).TipoSistema(tpAmericano));
  FDicionarioSistemas.Add(tpAmortizacaoConstante,
    TModelSistema.New.Descricao('Amortização Constante').Habilitado(False)
    .TipoSistema(tpAmortizacaoConstante));
  FDicionarioSistemas.Add(tpAmortizacaoMisto,
    TModelSistema.New.Descricao('Amortização Misto').Habilitado(False)
    .TipoSistema(tpAmortizacaoMisto));
  FDicionarioSistemas.Add(tpPagamentoUnico,
    TModelSistema.New.Descricao('Pagamento Único').Habilitado(True)
    .TipoSistema(tpPagamentoUnico));
  FDicionarioSistemas.Add(tpPagamentoVariavel,
    TModelSistema.New.Descricao('Pagamento Variável').Habilitado(False)
    .TipoSistema(tpPagamentoVariavel));
  FDicionarioSistemas.Add(tpPrice,
    TModelSistema.New.Descricao('Price (Francês)').Habilitado(False)
    .TipoSistema(tpPrice));
end;

destructor TControllerSistema.Destroy;
begin
  FDicionarioSistemas.Free;
  inherited;
end;

class function TControllerSistema.New: iControllerSistema;
begin
  Result := Self.Create;
end;

function TControllerSistema.SistemasLiberadosList: TList<iSistema>;
var
  Sistema: iSistema;
  FSistemasLiberados: TList<iSistema>;
begin
  FSistemasLiberados := TList<iSistema>.Create;
  for Sistema in FDicionarioSistemas.Values do
  begin
    if Sistema.Habilitado() then
      FSistemasLiberados.Add(Sistema);
  end;

  {TODO -oRenatoPradebon -cGeneral : aqui tem um problema memory leak que eu não consegui resolver}
  Result := TList<iSistema>.Create(FSistemasLiberados);
  FreeandNil(FSistemasLiberados);
end;

function TControllerSistema.SistemasLiberados
  : TDictionary<TTypeSistema, iSistema>;
begin
  Result := FDicionarioSistemas;
end;

end.
