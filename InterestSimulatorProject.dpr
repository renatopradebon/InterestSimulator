program InterestSimulatorProject;

uses
  Vcl.Forms,
  eInterestSimulator.Model.Interfaces in 'model\interfaces\eInterestSimulator.Model.Interfaces.pas',
  eInterestSimulator.Controller.Resultado in 'controller\eInterestSimulator.Controller.Resultado.pas',
  uParent in 'view\uParent.pas' {frmParent},
  uSimulate in 'view\uSimulate.pas' {frmSimulate},
  uAbout in 'view\uAbout.pas' {frmAbout},
  eInterestSimulator.Model.Alemao in 'model\eInterestSimulator.Model.Alemao.pas',
  eInterestSimulator.Model.Americano in 'model\eInterestSimulator.Model.Americano.pas',
  eInterestSimulator.Model.AmortizacaoConstante in 'model\eInterestSimulator.Model.AmortizacaoConstante.pas',
  eInterestSimulator.Model.AmortizacaoMisto in 'model\eInterestSimulator.Model.AmortizacaoMisto.pas',
  eInterestSimulator.Model.PagamentoUnico in 'model\eInterestSimulator.Model.PagamentoUnico.pas',
  eInterestSimulator.Model.PagamentoVariavel in 'model\eInterestSimulator.Model.PagamentoVariavel.pas',
  eInterestSimulator.Model.Price in 'model\eInterestSimulator.Model.Price.pas',
  eInterestSimulator.Model.Simulador in 'model\eInterestSimulator.Model.Simulador.pas',
  eInterestSimulator.Model.Sistema in 'model\eInterestSimulator.Model.Sistema.pas',
  eInterestSimulator.Model.Resultado.Factory in 'model\factory\eInterestSimulator.Model.Resultado.Factory.pas',
  eInterestSimulator.Model.Simulador.Factory in 'model\factory\eInterestSimulator.Model.Simulador.Factory.pas',
  eInterestSimulator.Model.PagamentoUnico.Calculadora in 'model\eInterestSimulator.Model.PagamentoUnico.Calculadora.pas',
  eInterestSimulator.Model.Calculadora.Factory in 'model\factory\eInterestSimulator.Model.Calculadora.Factory.pas',
  eInterestSimulator.Controller.Sistema in 'controller\eInterestSimulator.Controller.Sistema.pas',
  eInterestSimulator.Controller.Interfaces in 'controller\interfaces\eInterestSimulator.Controller.Interfaces.pas',
  eInterestSimulator.Controller.Observer.Interfaces in 'controller\interfaces\eInterestSimulator.Controller.Observer.Interfaces.pas',
  eInterestSimulator.Controller.Resultado.Observer in 'controller\eInterestSimulator.Controller.Resultado.Observer.pas',
  eInterestSimulator.Model.Interfaces.Calculadora in 'model\interfaces\eInterestSimulator.Model.Interfaces.Calculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParent, frmParent);
  Application.Run;

end.
