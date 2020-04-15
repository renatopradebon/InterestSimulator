unit uParent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmParent = class(TForm)
    MenuPrincipal: TMainMenu;
    Simulate1: TMenuItem;
    Fechar1: TMenuItem;
    About1: TMenuItem;
    procedure SimuladorClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure openSimulate;
    procedure FecharFormulario;
    procedure openAbout;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParent: TfrmParent;

implementation

uses uSimulate, uAbout;

{$R *.dfm}

procedure TfrmParent.SimuladorClick(Sender: TObject);
begin
  openSimulate();
end;

procedure TfrmParent.openSimulate();
begin
  frmSimulate := TfrmSimulate.Create(Application);
  frmSimulate.Show();
end;

procedure TfrmParent.About1Click(Sender: TObject);
begin
  openAbout();
end;

procedure TfrmParent.openAbout();
begin
  if not Assigned(frmAbout) then
  begin
    frmAbout := TfrmAbout.Create(Application);
    frmAbout.Show;
  end;
end;

procedure TfrmParent.Fechar1Click(Sender: TObject);
begin
  FecharFormulario();
end;

procedure TfrmParent.FecharFormulario();
begin
  Application.Terminate();
end;

procedure TfrmParent.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown :=  DebugHook = 1;
end;

end.
