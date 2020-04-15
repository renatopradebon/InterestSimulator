unit eInterestSimulator.Controller.Observer.Interfaces;

interface

uses
  eInterestSimulator.Model.Interfaces, System.Generics.Collections;

type
  iObserverResultado = interface
    ['{4FEF09C8-26FE-4921-A04C-98A834D3C5BB}']
    function UpdateResultado(Value: Tlist<iResultado>): iObserverResultado;
  end;

  iSubjectResultado = interface
    ['{1FFF8EBB-3565-44AB-8B78-36A9327F99B7}']
    function Add(Value: iObserverResultado): iSubjectResultado;
    function Notify(Value: Tlist<iResultado>): iSubjectResultado;
  end;

implementation

end.
