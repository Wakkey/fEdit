unit HtmlEdit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { THTMLMenu }

  THTMLMenu = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    ListBox1: TListBox;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  HTMLMenu: THTMLMenu;

implementation

uses function_unit, htmlpropedit, main;

{$R *.lfm}

{ THTMLMenu }

procedure THTMLMenu.Button1Click(Sender: TObject);
var
  setHtmlfunc,getHtmlFunc,st,st2,st3,st4:TStringList;
  s,s1:string;
  form3:Thtmlprop;
  i:integer;
function loadSTringList(S:TStringList;LoadFile:string):boolean;
begin
  try
    s.LoadFromFile(LoadFile);
    loadSTringList := true;
  except
    loadSTringList := false;
  end;
end;

begin
  form3 := Thtmlprop.Create(owner);

  st := TStringList.Create;
  st.Text:= functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.Lines.Text;
  st2 := TStringList.Create;
  st2.Clear;
  st3 := TStringList.Create;
  st3.Clear;
  st4 := TStringList.Create;
  st4.Clear;

  setHtmlfunc := TStringList.Create;
  {$IFDEF Windows}
  s1 := extractfilepath(Paramstr(0)) + 'ini\' + 'Edit_type.txt';
  {$ENDIF}
  {$IFDEF Linux}
  s1 := extractfilepath(Paramstr(0)) + 'ini\' + 'Edit_type.txt';
  {$ENDIF}
  {$IFDEF Darwin}
  s1 := extractfilepath(Paramstr(0)) + 'ini/' + 'Edit_type.txt';
  {$ENDIF}
  //showmessage(s1);
  if not loadSTringList(setHtmlfunc,s1) then begin
    showmessage('読み込みに失敗しました:' + char(13)+s1);
    exit;
  end;




  getHtmlFunc := TStringList.Create;
  s1 := extractfilepath(Paramstr(0)) + 'ini\' + 'HTML_Item.txt';
  if not loadSTringList(getHtmlFunc,s1)  then begin
    showmessage('読み込みに失敗しました:' + char(13)+s1);
    exit;
  end;

  s := ListBox1.Items[ListBox1.ItemIndex];

  st2.Text :=  functionunit.EditHtml(s,setHtmlfunc,getHtmlFunc);
  //showmessage(st2.Text);

  form3.SetHtmlSetingPageNo:= ListBox1.ItemIndex;


  form3.SetHtmlCodeParts:= st2.Text;
  st2.Text :=  functionunit.GetHTMLPropathy(st2.Text,st4);
  functionunit.Set_Coomp(s,st4,form3.ScrollBox1);
  //showmessage(st.Text);
  form3.ShowModal;
  st3.Text := functionunit.BuildHTML(form3.HtmlPropthy);
  functionunit.setHtmlForm(st3,st,functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.CaretY-1);
  form3.Free;
  //form1.SynEdit1.Lines.Text:= st.Text;
  //functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.Lines[functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.CaretY-1]:= st.Text;
  functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.Lines.Clear;
  for i := 0 to st.Count -1do begin
    functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.Lines.Insert(
    functionunit.editlist[mainform.PageControl1.PageIndex].SynEdit1.CaretY-1,
    st[i]
    );
  end;
  st.free;
  st2.Free;
  st3.Free;
  st4.Free;
  setHtmlfunc.Free;
  getHtmlfunc.Free;
end;

procedure THTMLMenu.FormShow(Sender: TObject);
var
  st:TStringList;
  s1:string;
function StrListLoad(S:TStringList;Name:String):Boolean;
begin
  try
    S.LoadFromFile(systoutf8(Name));
  except
    S.Free;
    StrListLoad := False;
  end;
  StrListLoad := True;
end;
begin
  st := TStringList.Create;
  s1 := extractfilepath(paramstr(0)) +'Edit_type.txt';
  StrListLoad(st,s1);
  Htmlmenu.ListBox1.Items.Text:= st.text;
  st.free;
end;

end.

