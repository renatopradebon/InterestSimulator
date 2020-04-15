unit eInterestSimulator.Model.Interfaces.Calculadora;

interface

uses
  System.Generics.Collections, eInterestSimulator.Model.Interfaces,
  eInterestSimulator.Controller.Observer.Interfaces;

type
  iCalculadora = interface
    ['{44213C01-9F0A-47A5-9B39-CC53BAE1123A}']
    function Resultados: Tlist<iResultado>;
    function Calcular: iCalculadora;
    function Simulador: iSimulador; overload;
    function Simulador(Value: iSimulador): iCalculadora; overload;
    function ObserverResultado(Value : iSubjectResultado): iCalculadora; overload;
    function ObserverResultado: iSubjectResultado; overload;
  end;

  iCalculadoraFactory = interface
    function PagamentoUnico: iCalculadora;
    function PagamentoVariavel: iCalculadora;
    function Americano: iCalculadora;
    function AmortizacaoConstante: iCalculadora;
    function Price: iCalculadora;
    function AmortizacaoMisto: iCalculadora;
    function Alemao: iCalculadora;
  end;

implementation

end.
