program InterestSimulatorProject;

uses
  Vcl.Forms,
  eInterface.Model.Interfaces in 'model\interfaces\eInterface.Model.Interfaces.pas',
  eInterface.Controller.Interfaces in 'controller\eInterface.Controller.Interfaces.pas',
  eInterface.Controller.Resultado in 'controller\eInterface.Controller.Resultado.pas',
  uParent in 'view\uParent.pas' {frmParent},
  uSimulate in 'view\uSimulate.pas' {frmSimulate},
  uAbout in 'view\uAbout.pas' {frmAbout},
  eInterface.Model.Alemao in 'model\eInterface.Model.Alemao.pas',
  eInterface.Model.Americano in 'model\eInterface.Model.Americano.pas',
  eInterface.Model.AmortizacaoConstante in 'model\eInterface.Model.AmortizacaoConstante.pas',
  eInterface.Model.AmortizacaoMisto in 'model\eInterface.Model.AmortizacaoMisto.pas',
  eInterface.Model.PagamentoUnico in 'model\eInterface.Model.PagamentoUnico.pas',
  eInterface.Model.PagamentoVariavel in 'model\eInterface.Model.PagamentoVariavel.pas',
  eInterface.Model.Price in 'model\eInterface.Model.Price.pas',
  eInterface.Model.Simulador in 'model\eInterface.Model.Simulador.pas',
  eInterface.Model.Sistema in 'model\eInterface.Model.Sistema.pas',
  eInterface.Model.Amortizacao.Factory in 'model\factory\eInterface.Model.Amortizacao.Factory.pas',
  eInterface.Model.Simulador.Factory in 'model\factory\eInterface.Model.Simulador.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParent, frmParent);
  Application.Run;

end.
