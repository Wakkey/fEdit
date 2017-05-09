unit htmlpropedit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls, Buttons;

type

  { THTMLProp }

  THTMLProp = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    SetHtmlCodeParts:string;
    SetHtmlSetingPageNo:integer;
    HtmlPropthy:TStringList;
  end;

var
  HTMLProp: THTMLProp;

implementation

uses function_unit;


{$R *.lfm}

{ THTMLProp }

procedure THTMLProp.Button1Click(Sender: TObject);
begin
  HtmlPropthy.Text := functionunit.RepraceHTMLPropathy(SetHtmlCodeParts,functionunit.Edit_arry);
end;

procedure THTMLProp.BitBtn1Click(Sender: TObject);
begin

end;

procedure THTMLProp.Button2Click(Sender: TObject);
begin
  HtmlPropthy.Text := functionunit.RepraceHTMLPropathy(SetHtmlCodeParts,functionunit.Edit_arry);
  HtmlPropthy.SaveToFile(extractfilepath(Paramstr(0))+'temp.html');
  functionunit.macro_run(extractfilepath(Paramstr(0))+'temp.html');
end;

procedure THTMLProp.Button3Click(Sender: TObject);
begin

end;

procedure THTMLProp.FormCreate(Sender: TObject);
begin
  HtmlPropthy := TStringList.Create;
  HtmlPropthy.Clear;
end;

end.

