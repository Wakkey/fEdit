unit versiondialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, ExtCtrls, windows;

type

  { Tvershon_form }

  Tvershon_form = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  vershon_form: Tvershon_form;

implementation
uses
  functionunit;
{$R *.lfm}

{ Tvershon_form }

procedure Tvershon_form.FormShow(Sender: TObject);
var
  s:string;
  i :integer;
begin
  s := function_unit.version;
  vershon_form.Label1.Caption:= 'fEdit Version '+s;
  try
    memo1.Lines.LoadFromFile(ExtractFilePath(Paramstr(0)) + 'README.md');
  except

  end;
end;

procedure Tvershon_form.Image1DblClick(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', pchar('http://yuhi-it-s.com/'), '', '', SW_SHOW);
end;

procedure Tvershon_form.Label3Click(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', pchar(vershon_form.Label3.Caption), '', '', SW_SHOW);
end;

end.

