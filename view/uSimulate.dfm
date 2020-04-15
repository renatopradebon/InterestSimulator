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
        Width = 109
        Height = 21
        TabOrder = 1
        Text = '300000'
        TextHint = 'Valor que deseja receber'
        OnKeyPress = MaskEditValorCapitalKeyPress
      end
      object MaskEditTaxaJuros: TMaskEdit
        Left = 335
        Top = 34
        Width = 151
        Height = 21
        Hint = 'Taxa de Juros'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = '4'
        TextHint = 'Taxas de Juros aplicada'
        OnKeyPress = MaskEditTaxaJurosKeyPress
      end
      object MaskEditParcelas: TMaskEdit
        Left = 502
        Top = 34
        Width = 153
        Height = 21
        Hint = 'N'#250'mero de parcelas do financiamento'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '5'
        TextHint = 'N'#250'mero de parcelas do financiamento'
        OnKeyPress = MaskEditParcelasKeyPress
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
      object btnCalcular: TBitBtn
        Left = 672
        Top = 32
        Width = 145
        Height = 25
        Caption = 'Calcular!'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066001EB2311FB13300
          6600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00660031C24F22B7381AB02D21B437006600FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660047D36D3BCB5E25A83B0066001B
          A92E1DB132006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600
          4FD67953DE7F31B54D006600FF00FF006600179D271EAE31006600FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00660041C563006600FF00FFFF00FFFF
          00FFFF00FF00660019AA2B006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600149D210066
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF006600006600FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF006600006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 4
        OnClick = ButtonCalcularClick
      end
      object btnReset: TBitBtn
        Left = 839
        Top = 32
        Width = 100
        Height = 25
        Caption = 'Reset'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF0955A10857A60557AA0655A70954A00954A0FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0872DD0362C3006CDB0877E711
          7DEA0877E70069DD005DC70654A50654A5FF00FFFF00FFFF00FFFF00FFFF00FF
          0F6BC90872DD3E99F591C4F9D6E9FDEEF7FFE4F1FFB0D4FB59A5F50570E5035A
          B70B5095FF00FFFF00FFFF00FF1278E0127CE870B4F9F6FAFEFFFFFFEEF6FDD3
          E6FBE2EEFDFFFFFFFFFFFFAED2FA0E78ED025AB60653A2FF00FFFF00FF1278E0
          6DB2F9FEFEFFE9F3FD1E7FF00D73ED1474EB066BE90C6FE889B9F4E6F0FDB0D5
          FA0970E60653A2FF00FF0B70D53695F4E8F3FEFFFFFF89BAF48FC0F92A86F110
          75EE1275EC1E79EC84B5F489BAF4FFFFFF58A5F5005EC70858AB137AE371B5FB
          FFFFFFB2D7FC278CF992C4FBDAEAFD318BF3388DF2D7E8FC87B8F50D71EAE6F0
          FDB3D7FB016BDE0858AB1F85ECA2CFFDFFFFFF419EFD3495FB298DF992C5FBE6
          F1FEE5F1FD88BCF71075EE0B70EBB4D2F8E6F3FF0E7BE9065AB02F8FF1B7DAFD
          FFFFFF419FFF3196FE3094FC469EFCF1F8FEF1F8FE3892F5187DF11378EF9FC9
          F7F0F8FF1A82EC055CB53693F0B8DAFEFFFFFF59ACFF3499FF55A9FEE8F3FF85
          BFFD83BDFCE7F2FE4498F61A7FF2D3E6FCD9EBFE117DE9095CB22689EDAFD6FD
          FFFFFFC3E1FF4AA4FFEDF6FF81C0FF3296FE2E93FC7BBAFDEBF5FE59A5F8E9F3
          FE99C9FA0773E10958ABFF00FF3994F0F1F8FFFBFDFF78BBFF61AFFF3499FF34
          99FF3398FF3095FD68B0FCF4FAFFF5FAFE49A0F7076ACEFF00FFFF00FF3994F0
          CDE6FFF6FAFFFBFDFFC1DFFF58ABFF43A0FF49A3FF84C1FEFBFDFFFFFFFF78B9
          F9137BE6076ACEFF00FFFF00FFFF00FF64ACF6D4EAFFF9FCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE7F3FE77B8FA1D85ED0D6DD0FF00FFFF00FFFF00FFFF00FF
          FF00FF459AF0A7D2FCD8ECFFE2F1FFE4F1FED1E7FE9DCDFD4DA2F7177FE8177F
          E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3B94F061ABF665
          ADF7489EF42286EC127AE4FF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 5
        OnClick = ButtonResetClick
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
      object DBGridResultado: TDBGrid
        Left = 2
        Top = 15
        Width = 949
        Height = 407
        Align = alClient
        DataSource = DataSourceResultado
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PARCELA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JUROS'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMORTIZACAO_SALDO'
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGAMENTO'
            Width = 172
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO_DEVEDOR'
            Width = 175
            Visible = True
          end>
      end
      object StatusBarResultado: TStatusBar
        Left = 2
        Top = 422
        Width = 949
        Height = 19
        Panels = <
          item
            Text = 'Totais'
            Width = 77
          end
          item
            Alignment = taRightJustify
            Width = 104
          end
          item
            Alignment = taRightJustify
            Width = 225
          end
          item
            Alignment = taRightJustify
            Width = 172
          end
          item
            Width = 50
          end>
      end
    end
  end
  object DataSourceResultado: TDataSource
    DataSet = CDResultado
    Left = 552
    Top = 296
  end
  object CDResultado: TClientDataSet
    PersistDataPacket.Data = {
      B60000009619E0BD010000001800000005000000000003000000B60007504152
      43454C410400010000000000054A55524F53080004000000000011414D4F5254
      495A4143414F5F53414C444F0800040000000100075355425459504502004900
      06004D6F6E65790009504147414D454E544F0800040000000100075355425459
      50450200490006004D6F6E6579000D53414C444F5F44455645444F5208000400
      0000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'TOTAL_JUROS'
        Expression = 'SUM(JUROS)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'TOTAL_AMORTIZACAO'
        Expression = 'SUM(AMORTIZACAO_SALDO)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'TOTAL_PAGAMENTO'
        Expression = 'SUM(PAGAMENTO)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    Left = 464
    Top = 296
    object CDResultadoPARCELA: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
    end
    object CDResultadoJUROS: TCurrencyField
      DisplayLabel = 'Juros'
      FieldName = 'JUROS'
      EditFormat = 'R$%d.%.2d'
    end
    object CDResultadoAMORTIZACAO_SALDO: TCurrencyField
      DisplayLabel = 'Amortiza'#231#227'o Saldo Devedor'
      FieldName = 'AMORTIZACAO_SALDO'
      EditFormat = '%d.%.2d'
    end
    object CDResultadoPAGAMENTO: TCurrencyField
      DisplayLabel = 'Pagamento'
      FieldName = 'PAGAMENTO'
      EditFormat = '%d.%.2d'
    end
    object CDResultadoSALDO_DEVEDOR: TCurrencyField
      DisplayLabel = 'Saldo devedor'
      FieldName = 'SALDO_DEVEDOR'
      EditFormat = '%d.%.2d'
    end
  end
end
