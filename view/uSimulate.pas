unit uSimulate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.DBGrids, Vcl.Buttons,
  System.Generics.Collections, eInterface.Model.Interfaces;

type
  TfrmSimulate = class(TForm)
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
    procedure FormDestroy(Sender: TObject);
  private
    FResultados: TList<iResultado>;
    FListaSistemas: TList<iSistema>;
    procedure CalcularFinanciamento;
    procedure ResetForm;
    procedure PopulaComboSistemas;
    procedure PopulaSistemas;
    procedure GerarDadosGrid;
    procedure ClearDataSet;
    procedure ShowStatusBar;
    function FormataValorCurrency(AValor: Real): String;
    procedure ModificaTituloForm;
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
  eInterface.Controller.Resultado, eInterface.Controller.Sistema;

{$R *.dfm}

procedure TfrmSimulate.ButtonCalcularClick(Sender: TObject);
begin
  CalcularFinanciamento();
end;

procedure TfrmSimulate.CalcularFinanciamento();
begin
  try
    FResultados := TControllerResultado
                  .New
                  .Simulador(TControllerResultado.New
                                .SimuladorFactory.Capital(StrToFloatDef(MaskEditValorCapital.Text, cZERO))
                                .TaxaJuros(StrToFloatDef(MaskEditTaxaJuros.Text, cZERO))
                                .TotalParcelas(StrToIntDef(MaskEditParcelas.Text, cZERO))
                                .TipoSistema(TTypeSistema(ComboBoxSistema.Items.Objects[ComboBoxSistema.ItemIndex])))
                  .Calcular()
                  .Resultado();
    GerarDadosGrid();
    ShowStatusBar();
  finally

  end;
end;

procedure TfrmSimulate.ButtonResetClick(Sender: TObject);
begin
  ResetForm();
end;

procedure TfrmSimulate.ResetForm();
begin
  MaskEditValorCapital.Clear;
  MaskEditTaxaJuros.Clear;
  MaskEditParcelas.Clear;
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
end;

procedure TfrmSimulate.FormDestroy(Sender: TObject);
begin
  FResultados.Free;
  FListaSistemas.Free;
end;

procedure TfrmSimulate.ModificaTituloForm();
begin
  Self.Caption := System.SysUtils.Format('Simular Financiamento || Iniciado em %s as %s',
  [FormatDateTime('dd/mm/yyyy', Now), FormatDateTime('hh:nn:ss', Now)]);
end;

procedure TfrmSimulate.PopulaComboSistemas();
var
  Sistema: iSistema;
begin
  ComboBoxSistema.Items.Clear;
  for Sistema in FListaSistemas do
    ComboBoxSistema.Items.AddObject(Sistema.Descricao, TObject(Sistema.TipoSistema));
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
  Key, KeyAggregate : Integer;
  HashStatusBarXAgregate : TDictionary<Integer,Integer>;
begin
  HashStatusBarXAgregate := TDictionary<Integer,Integer>.Create;
  HashStatusBarXAgregate.Add(1,0);
  HashStatusBarXAgregate.Add(2,1);
  HashStatusBarXAgregate.Add(3,2);

  for Key in HashStatusBarXAgregate.Keys do
  begin
    KeyAggregate := HashStatusBarXAgregate.Items[Key];

    StatusBarResultado.Panels[Key].Text := EmptyStr;
    if not VarIsNull(CDResultado.Aggregates[KeyAggregate].Value) then
      StatusBarResultado.Panels[Key].Text := FormataValorCurrency(CDResultado.Aggregates[KeyAggregate].Value);
  end;
  HashStatusBarXAgregate.Free;
end;

function TfrmSimulate.FormataValorCurrency(AValor: Real): String;
begin
  Result := FormatFloat('###,###,##0.00', AValor);
end;

end.
