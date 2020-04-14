unit uSimulate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Data.DB, Datasnap.DBClient, Vcl.ComCtrls, Vcl.DBGrids,
  eInterface.Controller.Interfaces, eInterface.Model.Interfaces,
  System.Generics.Collections, eInterface.Model.Sistema, Vcl.Buttons;

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
    btnCalcular: TBitBtn;
    btnReset: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonCalcularClick(Sender: TObject);
    procedure ButtonResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FResultados: TList<iResultado>;
    FDicionarioSistemas: TDictionary<TTypeSistema, iSistema>;
    procedure CalcularFinanciamento;
    procedure ResetForm;
    procedure PopulaComboSistemas;
    procedure PopulaSistemas;
    procedure GerarDados;
    procedure ClearDataSet;
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
    FResultados := TControllerResultado
                  .New
                  .Simulador(TControllerResultado.New
                                .SimuladorFactory.Capital(StrToFloatDef(MaskEditValorCapital.Text, cZERO))
                                .TaxaJuros(StrToFloatDef(MaskEditTaxaJuros.Text, cZERO))
                                .TotalParcelas(StrToIntDef(MaskEditParcelas.Text, cZERO))
                                .TipoSistema(TTypeSistema(ComboBoxSistema.Items.Objects[ComboBoxSistema.ItemIndex])))
                  .Calcular()
                  .Resultado();
    GerarDados();
  finally
//    FResultados.Free;
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
   cdsTemporario.DisableControls;
   try
     cdsTemporario.EmptyDataSet;
   finally
     cdsTemporario.EnableControls;
   end;
end;

procedure TfrmSimulate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FResultados);
  Action := caFree;
  Release;
  frmSimulate := nil;
end;

procedure TfrmSimulate.FormCreate(Sender: TObject);
begin
  PopulaSistemas();
  PopulaComboSistemas();
end;

procedure TfrmSimulate.FormDestroy(Sender: TObject);
begin
  FDicionarioSistemas.Free;
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
    begin
      if (FDicionarioSistemas.Items[Key].Habilitado) then
      begin
        ComboBoxSistema.Items.AddObject(FDicionarioSistemas.Items[Key].Descricao, TObject(Key));
      end;
    end;
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

procedure TfrmSimulate.GerarDados();
var
  FResultado: iResultado;
begin
  for FResultado in FResultados do
  begin
    cdsTemporario.Append;
//    cdsTemporarioPARCELA.Value := FResultado.NumeroParcela;
//    cdsTemporarioJUROS.Value := FResultado.ValorJuros;
//    cdsTemporarioPAGAMENTO.Value := FResultado.ValorPagamento;
//    cdsTemporarioAMORTIZACAO_SALDO.Value := FResultado.ValorSaldo;
//    cdsTemporarioSALDO_DEVEDOR.Value := FResultado.ValorAmortizacao;

    cdsTemporarioPARCELA.Value := FResultado.NumeroParcela;
    cdsTemporarioJUROS.AsFloat := FResultado.ValorJuros;
    cdsTemporarioPAGAMENTO.AsFloat := FResultado.ValorPagamento;
    cdsTemporarioAMORTIZACAO_SALDO.AsFloat := FResultado.ValorSaldo;
    cdsTemporario.FieldByName('SALDO_DEVEDOR').AsFloat := FResultado.ValorAmortizacao;
    cdsTemporario.Post;
  end;
end;

end.
