﻿unit eInterface.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type

  TTypeSistema = (tpAlemao, tpAmericano, tpAmortizacaoConstante,
    tpAmortizacaoMisto, tpPagamentoUnico, tpPagamentoVariavel, tpPrice);

  iSimulador = interface
    ['{3A7BC019-4141-4BA4-A54B-816C49D8194D}']
    function Capital(Value: Double): iSimulador; overload;
    function Capital: Double; overload;
    function TaxaJuros(Value: Double): iSimulador; overload;
    function TaxaJuros: Double; overload;
    function TotalParcelas(Value: Integer): iSimulador; overload;
    function TotalParcelas: Integer; overload;
    function TipoSistema(Value: TTypeSistema): iSimulador; overload;
    function TipoSistema: TTypeSistema; overload;
  end;

  iResultado = interface
    ['{E2D68003-B02B-47D9-99FC-EA394CBC64D1}']
    function NumeroParcela(Value: Integer): iResultado; overload;
    function NumeroParcela: Integer; overload;
    function ValorJuros(Value: Double): iResultado; overload;
    function ValorJuros: Double; overload;
    function ValorAmortizacao(Value: Double): iResultado; overload;
    function ValorAmortizacao: Double; overload;
    function ValorSaldo(Value: Double): iResultado; overload;
    function ValorSaldo: Double; overload;
    function ValorPagamento(Value: Double): iResultado; overload;
    function ValorPagamento: Double; overload;
  end;

  iResultadoFactory = interface
    ['{992B706D-CC77-4905-8406-883CA7675274}']
    function PagamentoUnico: iResultado;
    function PagamentoVariavel: iResultado;
    function Americano: iResultado;
    function AmortizacaoConstante: iResultado;
    function Price: iResultado;
    function AmortizacaoMisto: iResultado;
    function Alemao: iResultado;
  end;

  iSimuladorFactory = interface
    ['{8A0D8945-3F38-4477-B47B-7D2B30C654F9}']
    function Simulador: iSimulador;
  end;

  iSistema = interface
    ['{E90B94AD-F472-497A-9034-6A354849313A}']
    function Descricao(Value: String): iSistema; overload;
    function Descricao: String; overload;
    function Habilitado(Value: Boolean): iSistema; overload;
    function Habilitado: Boolean; overload;
  end;

implementation

end.