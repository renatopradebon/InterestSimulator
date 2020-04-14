unit eInterface.Controller.Interfaces;

interface

uses
  eInterface.Model.Interfaces;

type

  iControllerResultado = interface
    ['{A90C187E-221C-4DFA-945F-085D380B8302}']
    function Resultado: iResultado;
    function Simulador: iSimulador; overload;
    function Simulador(Value: iSimulador): iControllerResultado; overload;
    function SimuladorFactory: iSimulador;
    procedure ValidarDados;
  end;

implementation

end.
