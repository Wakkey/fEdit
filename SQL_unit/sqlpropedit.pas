unit sqlpropedit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, SynHighlighterSQL, Forms, Controls,
  Graphics, Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type

  { TSQLProp }

  TSQLProp = class(TForm)
    BitBtn1: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    SynEdit1: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    SetHtmlCodeParts:string;
    SetHtmlSetingPageNo:integer;
    HtmlPropthy:TStringList;
  end;

var
  SQLProp: TSQLProp;

implementation

uses TableBuilder;




{$R *.lfm}

{ TSQLProp }

procedure TSQLProp.Button1Click(Sender: TObject);
begin

end;

procedure TSQLProp.BitBtn1Click(Sender: TObject);
begin

end;

procedure TSQLProp.Button2Click(Sender: TObject);
var
  s,s1:string;
  i:integer;
begin
  if (form2.sql_word[3][0] = 'TEXT') or (form2.sql_word[3][0] = 'BLOB') then begin
      s1 := '''';
  end else if (form2.sql_word[3][0] <> 'TEXT') or (form2.sql_word[3][0] <> 'BLOB') then begin
      s1 := '';
  end;
  s := char(13)+s1 +form2.Edit_arry[0].Text+s1  + char(13);
  i := 1;
  //showmessage(s);
  while i < form2.edit_count do begin
    //showmessage(form2.sql_word[3][i] + '__' + form2.sql_word[1][i]);
     if (form2.sql_word[3][i] = 'TEXT') or (form2.sql_word[3][i] = 'BLOB') then begin
      s1 := '''';
     end else if (form2.sql_word[3][i] <> 'TEXT') or (form2.sql_word[3][i] <> 'BLOB') then begin
      s1 := '';
     end;
    s := s+ ','+s1 +form2.Edit_arry[i].Text +s1+ char(13);
    //showmessage(s);
    inc(i);
  end;
  //showmessage(s);
  //showmessage('insert into ' + form2.sql_title + char(13) +' values('+s+');');
  SynEdit1.Lines.Text := 'insert into ' + form2.sql_title + char(13) +' values('+s+');';
end;

procedure TSQLProp.Button3Click(Sender: TObject);
var
  //database: TSqliteDatabase;
 // tab: TSqliteTable;
  s: string;
begin
  //database := TSqliteDatabase.Create(form2.sql_title+'.db3');
  try
    //database.GetTable(synedit1.Lines.Text);
  finally
    //database.free;
  end;
end;

procedure TSQLProp.Edit1Change(Sender: TObject);
begin
  Button2Click(Sender);
end;

procedure TSQLProp.Edit1Click(Sender: TObject);
begin
  Button2Click(Sender);
end;

procedure TSQLProp.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i:integer;
begin
  for i := 0 to 3 do begin
    form2.sql_word[i].Free;
  end;
end;

procedure TSQLProp.FormCreate(Sender: TObject);
begin
  HtmlPropthy := TStringList.Create;
  HtmlPropthy.Clear;
end;

procedure TSQLProp.ScrollBox1Click(Sender: TObject);
begin

end;

end.

