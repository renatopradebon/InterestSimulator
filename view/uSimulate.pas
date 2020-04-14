unit uSimulate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.DBGrids,
  eInterface.Controller.Interfaces, eInterface.Model.Interfaces,
  System.Generics.Collections, eInterface.Model.Sistema;

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
    ButtonCalcular: TButton;
    ButtonReset: TButton;
    ComboBoxSistema: TComboBox;
    LabelSistema: TLabel;
    DataSourceTemp: TDataSource;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    PanelResultado: TPanel;
    cdsTemporario: TClientDataSet;
    cdsTemporarioPARCELA: TIntegerField;
    cdsTemporarioJUROS: TFloatField;
    cdsTemporarioSALDO_DEVEDOR: TCurrencyField;
    cdsTemporarioPAGAMENTO: TCurrencyField;
    cdsTemporarioAMORTIZACAO_SALDO: TCurrencyField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCalcularClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FResultado: iResultado;
    FDicionarioSistemas: TDictionary<TTypeSistema, iSistema>;
    procedure CalcularFinanciamento;
    procedure ResetForm;
    procedure PopulaComboSistemas;
    procedure PopulaSistemas;
    function getSimulador: iSimulador;
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
  eInterface.Controller.Resultado;

{$R *.dfm}

procedure TfrmSimulate.ButtonCalcularClick(Sender: TObject);
begin
  CalcularFinanciamento();
end;

procedure TfrmSimulate.CalcularFinanciamento();
begin
  try
    FResultado := TControllerResultado
                  .New
                  .Simulador(getSimulador())
                  .Resultado();
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
end;

procedure TfrmSimulate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDicionarioSistemas.Free;
  Action := caFree;
  Release;
  frmSimulate := nil;
end;

procedure TfrmSimulate.FormCreate(Sender: TObject);
begin
  PopulaSistemas();
  PopulaComboSistemas();
end;

function TfrmSimulate.getSimulador: iSimulador;
begin
  Result := TControllerResultado.New.SimuladorFactory.Capital
    (StrToFloatDef(MaskEditValorCapital.Text, cZERO))
    .TaxaJuros(StrToFloatDef(MaskEditTaxaJuros.Text, cZERO))
    .TotalParcelas(StrToIntDef(MaskEditParcelas.Text, cZERO))
    .TipoSistema(TTypeSistema(ComboBoxSistema.ItemIndex));
    end;

procedure TfrmSimulate.PopulaComboSistemas();
var
  Key: TTypeSistema;
begin
  ComboBoxSistema.Items.Clear;
  for Key in FDicionarioSistemas.Keys do
  begin
    // Validação utilizada porque é carregado um monte de Lixo no FDictionary
    if not String.IsNullOrEmpty(FDicionarioSistemas.Items[Key].Descricao) then
      if FDicionarioSistemas.Items[Key].Habilitado then
        ComboBoxSistema.Items.AddObject(FDicionarioSistemas.Items[Key].Descricao,
          TObject(FDicionarioSistemas.Items[Key]));
  end;
end;

procedure TfrmSimulate.PopulaSistemas();
begin
  FDicionarioSistemas := TDictionary<TTypeSistema, iSistema>.Create;

  FDicionarioSistemas.Add(tpAlemao, TModelSistema.New.Descricao('Alemão')
    .Habilitado(False));
  FDicionarioSistemas.Add(tpAmericano, TModelSistema.New.Descricao('Americano')
    .Habilitado(False));
  FDicionarioSistemas.Add(tpAmortizacaoConstante,
    TModelSistema.New.Descricao('Amortização Constante').Habilitado(False));
  FDicionarioSistemas.Add(tpAmortizacaoMisto,
    TModelSistema.New.Descricao('Amortização Misto').Habilitado(False));
  FDicionarioSistemas.Add(tpPagamentoUnico,
    TModelSistema.New.Descricao('Pagamento Único').Habilitado(True));
  FDicionarioSistemas.Add(tpPagamentoVariavel,
    TModelSistema.New.Descricao('Pagamento Variável').Habilitado(False));
  FDicionarioSistemas.Add(tpPrice, TModelSistema.New.Descricao('Price (Francês)')
    .Habilitado(False));
end;

end.
