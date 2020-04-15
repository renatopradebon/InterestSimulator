unit uSimulate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Buttons,
  System.Generics.Collections, eInterestSimulator.Model.Interfaces,
  eInterestSimulator.Controller.Observer.Interfaces,
  eInterestSimulator.Controller.Interfaces;

type
  TfrmSimulate = class(TForm, iObserverResultado)
    PanelDados: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabelValorCapital: TLabel;
    MaskEditValorCapital: TMaskEdit;
    LabelTaxaJuros: TLabel;
    MaskEditTaxaJuros: TMaskEdit;
    LabelParcelas: TLabel;
    MaskEditParcelas: TMaskEdit;
    ComboBoxSistema: TComboBox;
    LabelSistema: TLabel;
    DataSourceResultado: TDataSource;
    DBGridResultado: TDBGrid;
    StatusBarResultado: TStatusBar;
    PanelResultado: TPanel;
    btnCalcular: TBitBtn;
    btnReset: TBitBtn;
    CDResultado: TClientDataSet;
    CDResultadoPARCELA: TIntegerField;
    CDResultadoJUROS: TCurrencyField;
    CDResultadoSALDO_DEVEDOR: TCurrencyField;
    CDResultadoPAGAMENTO: TCurrencyField;
    CDResultadoAMORTIZACAO_SALDO: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCalcularClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEditValorCapitalKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditTaxaJurosKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditParcelasKeyPress(Sender: TObject; var Key: Char);
  private
    FResultados: TList<iResultado>;
    FListaSistemas: TList<iSistema>;
    FControllerResultados: iControllerResultado;
    procedure CalcularFinanciamento;
    procedure ResetForm;
    procedure PopulaComboSistemas;
    procedure PopulaSistemas;
    procedure GerarDadosGrid;
    procedure ClearDataSet;
    procedure ShowStatusBar;
    function FormataValorCurrency(AValor: Real): String;
    procedure ModificaTituloForm;
    function UpdateResultado(Value: Tlist<iResultado>): iObserverResultado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimulate: TfrmSimulate;

const
  cZERO = 0;

implementation

uses
  eInterestSimulator.Controller.Resultado,
  eInterestSimulator.Controller.Sistema;

{$R *.dfm}

procedure TfrmSimulate.ButtonCalcularClick(Sender: TObject);
begin
  ClearDataSet();
  CalcularFinanciamento();
end;

procedure TfrmSimulate.CalcularFinanciamento();
begin
  try
    FControllerResultados := FControllerResultados
                              .Simulador(TControllerResultado.New.SimuladorFactory
                                .Capital(StrToFloatDef(MaskEditValorCapital.Text, cZERO))
                                .TaxaJuros(StrToFloatDef(MaskEditTaxaJuros.Text, cZERO))
                                .TotalParcelas(StrToIntDef(MaskEditParcelas.Text, cZERO))
                                .TipoSistema(TTypeSistema(ComboBoxSistema.Items.Objects[ComboBoxSistema.ItemIndex])))
                    .Calcular();
  finally

  end;
end;

procedure TfrmSimulate.ButtonResetClick(Sender: TObject);
begin
  ResetForm();
end;

procedure TfrmSimulate.ResetForm();
begin
  ComboBoxSistema.ClearSelection;
  MaskEditValorCapital.Clear;
  MaskEditTaxaJuros.Clear;
  MaskEditParcelas.Clear;
  ComboBoxSistema.SetFocus;
  ClearDataSet();
end;

procedure TfrmSimulate.ClearDataSet();
begin
  CDResultado.DisableControls;
  try
    CDResultado.EmptyDataSet;
  finally
    CDResultado.EnableControls;
  end;
  ShowStatusBar();
end;

procedure TfrmSimulate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmSimulate := nil;
end;

procedure TfrmSimulate.FormCreate(Sender: TObject);
begin
  PopulaSistemas();
  PopulaComboSistemas();
  ModificaTituloForm();

  FControllerResultados := TControllerResultado.New;
  FControllerResultados.ObserverResultado.Add(Self);
end;

procedure TfrmSimulate.ModificaTituloForm();
const
  cTITULO_SIMULADOR = 'Simular Financiamento >> Iniciado em %s as %s';
begin
  Self.Caption := System.SysUtils.Format(cTITULO_SIMULADOR,
    [FormatDateTime('dd/mm/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]);
end;

procedure TfrmSimulate.PopulaComboSistemas();
var
  Sistema: iSistema;
begin
  ComboBoxSistema.Items.Clear;
  for Sistema in FListaSistemas do
    ComboBoxSistema.Items.AddObject(Sistema.Descricao,
      TObject(Sistema.TipoSistema));
end;

procedure TfrmSimulate.PopulaSistemas();
begin
  FListaSistemas := TControllerSistema.New.SistemasLiberadosList;
end;

procedure TfrmSimulate.GerarDadosGrid();
var
  FResultado: iResultado;
begin
  for FResultado in FResultados do
  begin
    CDResultado.Append;
    CDResultadoPARCELA.Value := FResultado.NumeroParcela;
    CDResultadoJUROS.Value := FResultado.ValorJuros;
    CDResultadoPAGAMENTO.Value := FResultado.ValorPagamento;
    CDResultadoAMORTIZACAO_SALDO.Value := FResultado.ValorAmortizacao;
    CDResultadoSALDO_DEVEDOR.Value := FResultado.ValorSaldo;
    CDResultado.Post;
  end;
end;

procedure TfrmSimulate.ShowStatusBar();
var
  Key, KeyAggregate: Integer;
  HashStatusBarXAgregate: TDictionary<Integer, Integer>;
begin
  HashStatusBarXAgregate := TDictionary<Integer, Integer>.Create;
  HashStatusBarXAgregate.Add(1, 0);
  HashStatusBarXAgregate.Add(2, 1);
  HashStatusBarXAgregate.Add(3, 2);

  for Key in HashStatusBarXAgregate.Keys do
  begin
    KeyAggregate := HashStatusBarXAgregate.Items[Key];

    StatusBarResultado.Panels[Key].Text := EmptyStr;
    if not VarIsNull(CDResultado.Aggregates[KeyAggregate].Value) then
      StatusBarResultado.Panels[Key].Text :=
        FormataValorCurrency(CDResultado.Aggregates[KeyAggregate].Value);
  end;
  HashStatusBarXAgregate.Free;
end;

function TfrmSimulate.UpdateResultado(Value: Tlist<iResultado>): iObserverResultado;
begin
  FResultados := Value;
  GerarDadosGrid();
  ShowStatusBar();
end;

function TfrmSimulate.FormataValorCurrency(AValor: Real): String;
begin
  Result := FormatFloat('###,###,##0.00', AValor);
end;

procedure TfrmSimulate.MaskEditParcelasKeyPress(Sender: TObject; var Key: Char);
begin
    // Evita a digita��o de letras e pontos no campo de valor
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

procedure TfrmSimulate.MaskEditTaxaJurosKeyPress(Sender: TObject;
  var Key: Char);
begin
    // Evita a digita��o de letras e pontos no campo de valor
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

procedure TfrmSimulate.MaskEditValorCapitalKeyPress(Sender: TObject;
  var Key: Char);
begin
    // Evita a digita��o de letras e pontos no campo de valor
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

end.
