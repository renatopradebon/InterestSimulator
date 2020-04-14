unit uAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmAbout = class(TForm)
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  frmAbout := nil;
end;

end.
