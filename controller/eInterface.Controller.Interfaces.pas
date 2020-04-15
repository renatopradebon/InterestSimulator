unit eInterface.Controller.Interfaces;

interface

uses
  eInterface.Model.Interfaces, System.Generics.Collections;

type

  iControllerResultado = interface
    ['{A90C187E-221C-4DFA-945F-085D380B8302}']
    function Calcular: iControllerResultado;
    function Resultado: TList<iResultado>; overload;
    function Resultado(Value: TList<iResultado>): iControllerResultado;
      overload;
    function Simulador: iSimulador; overload;
    function Simulador(Value: iSimulador): iControllerResultado; overload;
    function SimuladorFactory: iSimulador;
    procedure ValidarDados;
  end;

  iControllerSistema = interface
    procedure AdicionaSistemas; overload;
    function SistemasLiberados: TDictionary<TTypeSistema, iSistema>;
    function SistemasLiberadosList: TList<iSistema>;
  end;

implementation

end.
