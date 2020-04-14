object frmParent: TfrmParent
  Left = 0
  Top = 0
  Caption = 'Simulador de Juros Tabajara'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MenuPrincipal
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MenuPrincipal: TMainMenu
    Left = 24
    Top = 24
    object Simulate1: TMenuItem
      Caption = '&Simulador'
      OnClick = SimuladorClick
    end
    object About1: TMenuItem
      Caption = '&About'
      OnClick = About1Click
    end
    object Fechar1: TMenuItem
      Caption = '&Fechar'
      OnClick = Fechar1Click
    end
  end
end
