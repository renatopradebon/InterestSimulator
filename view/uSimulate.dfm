object frmSimulate: TfrmSimulate
  Left = 0
  Top = 0
  ActiveControl = ComboBoxSistema
  Caption = 'Simular Financiamento'
  ClientHeight = 557
  ClientWidth = 985
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelDados: TPanel
    Left = 0
    Top = 0
    Width = 985
    Height = 97
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 953
      Height = 73
      Caption = 'Dados Iniciais'
      TabOrder = 0
      object LabelValorCapital: TLabel
        Left = 190
        Top = 15
        Width = 60
        Height = 13
        Hint = 'Valor que deseja receber'
        Alignment = taRightJustify
        Caption = 'Valor Capital'
      end
      object LabelTaxaJuros: TLabel
        Left = 335
        Top = 15
        Width = 68
        Height = 13
        Hint = 'Valor que deseja receber'
        Alignment = taRightJustify
        Caption = 'Taxa de Juros'
      end
      object LabelParcelas: TLabel
        Left = 502
        Top = 15
        Width = 81
        Height = 13
        Hint = 'Valor que deseja receber'
        Alignment = taRightJustify
        Caption = 'Parcelas (meses)'
      end
      object LabelSistema: TLabel
        Left = 11
        Top = 15
        Width = 114
        Height = 13
        Caption = 'Sistema de Amortiza'#231#227'o'
      end
      object MaskEditValorCapital: TMaskEdit
        Left = 190
        Top = 34
        Width = 127
        Height = 21
        EditMask = 'R$ ##.###.##0,00;0;_'
        MaxLength = 16
        TabOrder = 1
        Text = ''
        TextHint = 'Valor que deseja receber'
      end
      object MaskEditTaxaJuros: TMaskEdit
        Left = 335
        Top = 34
        Width = 154
        Height = 21
        EditMask = '!00.00%;0;_'
        MaxLength = 6
        TabOrder = 2
        Text = ''
      end
      object MaskEditParcelas: TMaskEdit
        Left = 502
        Top = 34
        Width = 154
        Height = 21
        EditMask = '!999;0;_'
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = ''
        TextHint = 'Numero de parcelas'
      end
      object ButtonCalcular: TButton
        Left = 672
        Top = 32
        Width = 145
        Height = 25
        Caption = '&Calcular!'
        TabOrder = 4
        OnClick = ButtonCalcularClick
      end
      object ButtonReset: TButton
        Left = 832
        Top = 32
        Width = 105
        Height = 25
        Caption = '&Reset'
        TabOrder = 5
        OnClick = ButtonResetClick
      end
      object ComboBoxSistema: TComboBox
        Left = 11
        Top = 34
        Width = 166
        Height = 21
        TabOrder = 0
        TextHint = 'Sistema de Amortiza'#231#227'o'
        Items.Strings = (
          'Alem'#227'o'
          'Americano'
          'Amortiza'#231#227'o Constante'
          'Amortiza'#231#227'o Misto'
          'Pagamento '#218'nico'
          'Pagamento Vari'#225'vel'
          'Price (Franc'#234's)')
      end
    end
  end
  object PanelResultado: TPanel
    Left = 0
    Top = 97
    Width = 985
    Height = 460
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 16
      Top = 6
      Width = 953
      Height = 443
      Caption = 'Resultado'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 949
        Height = 407
        Align = alClient
        DataSource = DataSourceTemp
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'PARCELA'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUROS'
            Width = 145
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO_DEVEDOR'
            Width = 243
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTO'
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMORTIZACAO_SALDO'
            Width = 298
            Visible = True
          end>
      end
      object StatusBar1: TStatusBar
        Left = 2
        Top = 422
        Width = 949
        Height = 19
        Panels = <
          item
            Text = 'Totais'
            Width = 50
          end
          item
            Width = 50
          end
          item
            Width = 50
          end
          item
            Width = 50
          end>
      end
    end
  end
  object DataSourceTemp: TDataSource
    DataSet = cdsTemporario
    Left = 624
    Top = 336
  end
  object cdsTemporario: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'TOTAL'
        Expression = 'sum(TOTAL)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    Left = 176
    Top = 224
    object cdsTemporarioPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      DisplayFormat = '00000'
      EditFormat = '00000'
    end
    object cdsTemporarioJUROS: TFloatField
      DisplayLabel = 'Juros'
      FieldKind = fkCalculated
      FieldName = 'JUROS'
      Calculated = True
    end
    object cdsTemporarioAMORTIZACAO_SALDO: TCurrencyField
      DisplayLabel = 'Amortiza'#231#227'o Saldo Devedor'
      FieldKind = fkCalculated
      FieldName = 'AMORTIZACAO_SALDO'
      Calculated = True
    end
    object cdsTemporarioPAGAMENTO: TCurrencyField
      DisplayLabel = 'Pagamento'
      FieldKind = fkCalculated
      FieldName = 'PAGAMENTO'
      Calculated = True
    end
    object cdsTemporarioSALDO_DEVEDOR: TCurrencyField
      DisplayLabel = 'Saldo devedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEVEDOR'
      Calculated = True
    end
  end
end
