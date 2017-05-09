unit versiondialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Buttons, ExtCtrls{$IFDEF WIN32}, ShellAPI, Windows{$ENDIF};

type

  { Tvershon_form }

  Tvershon_form = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
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
  function_unit;
{$R *.lfm}

{ Tvershon_form }

procedure Tvershon_form.FormShow(Sender: TObject);
var
  s:string;
  i :integer;
begin
  s := functionunit.version;
  vershon_form.Label1.Caption:= 'fEdit Version '+s;
  try
    memo1.Lines.LoadFromFile(ExtractFilePath(Paramstr(0)) + 'README.md');
  except

  end;
end;

procedure Tvershon_form.Image1DblClick(Sender: TObject);
begin

end;

procedure Tvershon_form.Label3Click(Sender: TObject);
begin
  {$IFDEF WIN32}
     ShellExecute(Handle, 'OPEN', pchar(vershon_form.Label3.Caption), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF Darwin}
     functionunit.pross3(vershon_form.Label3.Caption,'');
  {$ENDIF}
  {$IFDEF Linux}
     functionunit.pross2(vershon_form.Label3.Caption);
  {$ENDIF}
end;

end.

