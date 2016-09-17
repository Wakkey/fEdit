unit MySQL;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, mysql56conn, mysql40conn, mysql41conn,
  mysql50conn, mysql51conn, sqldb, pqconnection, mssqlconn, sqlite3conn,
  odbcconn, db, FileUtil, SynEdit, SynHighlighterSQL, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls,
  {$ IFDEF FPC}
     LCLIntf, LCLType, LMessages, FileCtrl, EditBtn, Grids
  {$ ENDIF}
  ;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DirectoryEdit1: TDirectoryEdit;
    FileListBox1: TFileListBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    SynEdit1: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    sqlset1,sqlset2:string;

  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses interfaceunit, mainform, functionunit, unit_edit;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  form1.SynEdit1.Lines.Text:= 'SELECT * FROM ' + form1.sqlset2;
  form1.sqlset1:= 'SELECT * FROM ';
  form1.Button3Click(sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  form1.SynEdit1.Lines.Text:= 'SELECT * FROM ' + form1.sqlset2;
  form1.sqlset1:= 'SELECT * FROM ';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  function_unit.Run(function_unit.set_SQLtoStringGrid(form1.sqlset2,form1.SynEdit1.Lines.Text,form1.StringGrid1));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  form1.FileListBox1.Directory:= extractfilepath(paramstr(0));
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  //sqlset2 := ' ' + ComboBox2.Text;
  form1.SynEdit1.Lines.Text := sqlset1 + sqlset2;
end;

procedure TForm1.DirectoryEdit1Change(Sender: TObject);
begin
  form1.FileListBox1.Directory:= form1.DirectoryEdit1.Directory;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
var
  i:integer;
  s:string;
begin
  form1.sqlset2 := extractfilename(form1.FileListBox1.FileName);
  s := '';
  for i := 1 to length(form1.sqlset2) -4 do begin;
    s := s + form1.sqlset2[i];
  end;
  form1.sqlset2:= s;
  if sqlset1 = '' then begin
    form1.sqlset1:= 'SELECT * FROM ';
  end;
  form1.SynEdit1.Lines.Text:= form1.sqlset1 + s;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  s:string;
  i:integer;
begin
  form1.Button4Click(sender);
  if form1.FileListBox1.ItemIndex = -1 then
    exit;
  form1.sqlset2:= extractfilename(form1.FileListBox1.FileName);
  s := '';
  for i := 1 to length(form1.sqlset2) -4 do begin;
    s := s + form1.sqlset2[i];
  end;
  form1.sqlset2:=s;
end;

end.

