unit eInterestSimulator.Controller.Interfaces;

interface

uses
  eInterestSimulator.Model.Interfaces, System.Generics.Collections,
  eInterestSimulator.Controller.Observer.Interfaces;

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
    function ObserverResultado : iSubjectResultado;
  end;

  iControllerSistema = interface
    procedure AdicionaSistemas; overload;
    function SistemasLiberados: TDictionary<TTypeSistema, iSistema>;
    function SistemasLiberadosList: TList<iSistema>;
  end;

implementation

end.
