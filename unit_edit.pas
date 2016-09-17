unit unit_edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, pqconnection, mssqlconn, sqlite3conn, odbcconn,
  mysql55conn, mysql56conn, mysql40conn, mysql41conn, mysql50conn, mysql51conn,
  FileUtil, SynEdit, SynMemo, IpHtml, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, StdCtrls, DBGrids, ExtCtrls, FileCtrl, EditBtn, Grids;

type
  TUndo = class
    undo:string;
    x:longint;
    y:longint;
    start:integer;
    lenge:integer;
  end;

  TUndoList = class(TList)
  private
    function Get(Index: Integer): TUndo;
    procedure Put(Index: Integer; const Value: TUndo);
  public
    property Items[Index: Integer]: TUndo read Get write Put; default;
     destructor Destroy; override;
  end;
  { TEditform }

  TEditform = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DirectoryEdit1: TDirectoryEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    FileListBox1: TFileListBox;
    Label6: TLabel;
    Memo1: TMemo;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    SynEdit1: TSynEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    procedure ApplicationProperties1DropFiles(Sender: TObject;
      const FileNames: array of String);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: char);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1DropFiles(Sender: TObject; X, Y: integer; AFiles: TStrings
      );
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyPress(Sender: TObject; var Key: char);
    procedure SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }

  public
    { public declarations }
    isDockOut:boolean;
    dock_sw,dockmode:boolean;
    Edit:Tmemo;
    sqlset,sql:string;
    filename_path:string;
    save_complate:boolean;
    nameing_complate:boolean;
    char_sets:string;
    UndoList:TUndoList;
    MyEditNO:integer;
    Undo_count:integer;
    HelpLine:string;
    edittype:string;
    Json_write:TStringList;
    code_suport:TStringList;
    temp_codeset:TStringList;
    editCaretY,editCaretX:integer;
    host,user,pass,database:string;
  end;

var
  Editform: TEditform;


implementation

uses mainform, interfaceunit, supportcodeinput, MySQL, repraceMacro,
  windowsunit, functionunit;

{$R *.lfm}

{ TEditform }

function TUndoList.Get(Index: Integer): TUndo;
begin
  Result :=  TUndo( inherited Get(Index) );
end;

procedure TUndoList.Put(Index: Integer; const Value: TUndo);
begin
  inherited Put( Index, Value );
end;

destructor TUndoList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;
procedure TEditform.MenuItem2Click(Sender: TObject);
begin
  edit.Clear;
   SynEdit1.ClearAll;
   Memo1.Clear;

end;

procedure TEditform.MenuItem30Click(Sender: TObject);
begin
  reprace_unit.Show;
end;

procedure TEditform.MenuItem4Click(Sender: TObject);
begin
  if not  OpenDialog1.Execute then
    exit;
  edit.Lines.LoadFromFile( OpenDialog1.FileName);
   SynEdit1.Lines.Text:= edit.Text;
   Memo1.Lines.Text:= edit.Text;
end;

procedure TEditform.MenuItem6Click(Sender: TObject);
begin
  if SaveDialog1.FileName <> '' then begin
    edit.Lines.SaveToFile(savedialog1.FileName);
  end;
end;

procedure TEditform.MenuItem7Click(Sender: TObject);
begin
  if not savedialog1.Execute then
    exit;
  edit.Lines.SaveToFile(savedialog1.FileName);
end;

procedure TEditform.MenuItem8Click(Sender: TObject);
begin
   Close;
end;

procedure TEditform.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage =  TabSheet1 then begin
    SynEdit1.Lines.Text := edit.Text;
  end else if PageControl1.ActivePage = TabSheet2 then begin
    Memo1.Lines.Text:= edit.Text;
  end;
end;

procedure TEditform.PageControl1Changing(Sender: TObject; var AllowChange: Boolean
  );
begin
  if PageControl1.ActivePage = TabSheet1 then begin
    edit.Text:= SynEdit1.Lines.Text;
  end else if PageControl1.ActivePage = TabSheet2 then begin
    edit.Text:= Memo1.Lines.Text;
  end;

end;

procedure TEditform.SynEdit1Change(Sender: TObject);
begin
  save_complate := false;
end;

procedure TEditform.SynEdit1DropFiles(Sender: TObject; X, Y: integer;
  AFiles: TStrings);
begin

end;

procedure TEditform.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  c:char;
begin
  c := char(key);
  windows_unit.popupwin(c,synedit1);
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;
end;

procedure TEditform.SynEdit1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TEditform.SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;

end;

procedure TEditform.FormCreate(Sender: TObject);
begin
  nameing_complate := false;
  save_complate := true;
  Edit := TMemo.Create(owner);
  Json_write := TStringList.Create;
  Json_write.Clear;
  Edit.Parent := editform;
  Edit.Clear;
  code_suport:=TStringlist.Create;
  code_suport.clear;
  temp_codeset := TStringList.Create;
  temp_codeset.Create;
  PageControl1.PageIndex:= 0;
  undo_count := 0;
  UndoList := TUndoList.Create;
  UndoList.Clear;
  UndoList.Add(UndoList);
  UndoList.Items[undo_count] := TUndo.Create;
  UndoList.Items[undo_count].undo:=char(0);
  UndoList.Items[undo_count].x:=0;
  UndoList.Items[undo_count].y:=0;
  UndoList.Items[undo_count].lenge:=0;
  dock_sw := true;
end;

procedure TEditform.FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
begin

end;

procedure TEditform.FormDragDrop(Sender, Source: TObject; X, Y: Integer);
begin

end;

procedure TEditform.ApplicationProperties1DropFiles(Sender: TObject;
  const FileNames: array of String);
begin

end;

procedure TEditform.Button1Click(Sender: TObject);
begin
   function_unit.Run(function_unit.set_SQLtoStringGrid(sql,SynEdit1.Lines.Text,StringGrid1));
  //interface_unit.sqlOpen;//databaseOpen;
end;

procedure TEditform.Button2Click(Sender: TObject);
begin
  SynEdit1.Lines.Text:= 'SELECT * FROM ' + sql;
  sqlset := 'SELECT * FROM ';
  Button1Click(sender);
end;

procedure TEditform.Button3Click(Sender: TObject);
begin
  SynEdit1.Lines.Text:= 'SELECT * FROM ' + sql;
  sqlset := 'SELECT * FROM ';
  Button1Click(sender);
end;

procedure TEditform.Button4Click(Sender: TObject);
begin
  FileListBox1.Directory:= extractfilepath(paramstr(0));
end;

procedure TEditform.DirectoryEdit1Change(Sender: TObject);
begin
  FileListBox1.Directory:= DirectoryEdit1.Directory;
end;

procedure TEditform.Edit2Change(Sender: TObject);
var
  s:string;
  i:integer;
begin
  sqlset := edit2.Text;
  s := '';
  for i := 1 to length(sqlset) -4 do begin;
    s := s + sqlset[i];
  end;
  sqlset := s;
end;

procedure TEditform.FileListBox1Change(Sender: TObject);
var
  i:integer;
  s:string;
begin
  sqlset := extractfilename(FileListBox1.FileName);
  edit2.Text := sqlset;
  s := '';
  for i := 1 to length(sqlset) -4 do begin;
    s := s + sqlset[i];
  end;
  sqlset := s;
  SynEdit1.Lines.Text:= sql + sqlset;

end;

procedure TEditform.FormActivate(Sender: TObject);
begin
  MyEditNO := interface_unit.callEditNo(sender);
end;

procedure TEditform.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  interface_unit.close(main.PageControl1.ActivePageIndex,false);
end;

procedure TEditform.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin

end;

procedure TEditform.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDockOut := true;
end;

procedure TEditform.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if isDockOut then
    Dock_sw := false
end;

procedure TEditform.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  isDockOut := false;
end;

procedure TEditform.FormUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin

end;

procedure TEditform.Memo1Change(Sender: TObject);
begin
  save_complate := false;
end;

procedure TEditform.Memo1KeyPress(Sender: TObject; var Key: char);
begin
  save_complate := false;
end;

procedure TEditform.MenuItem10Click(Sender: TObject);
begin
   Close;
end;

procedure TEditform.MenuItem12Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CaretX:= UndoList.Items[undo_count-1].x;
     SynEdit1.CaretY:= UndoList.Items[undo_count-1].y;
     //SynEdit1.BlockBegin.x:=SynEdit1.CaretX;
     //SynEdit1.BlockBegin.y:=SynEdit1.CaretY;
     SynEdit1.SelEnd:= UndoList.Items[undo_count-1].lenge;
     SynEdit1.SelText:= UndoList.Items[undo_count -1].undo;
     dec(undo_count);

  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.Undo;
  end;
end;

procedure TEditform.MenuItem13Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.Redo;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.Undo;
  end;
end;

procedure TEditform.MenuItem15Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CutToClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.CutToClipboard;
  end;
end;

procedure TEditform.MenuItem16Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.CopyToClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.CopyToClipboard;
  end;
end;

procedure TEditform.MenuItem17Click(Sender: TObject);
begin
  if  PageControl1.ActivePage =  TabSheet1 then begin
     SynEdit1.PasteFromClipboard;
  end else if  PageControl1.ActivePage =  TabSheet2 then begin
     Memo1.PasteFromClipboard;
  end;
end;

procedure TEditform.MenuItem22Click(Sender: TObject);
begin
  interface_unit.undo();
end;

procedure TEditform.MenuItem23Click(Sender: TObject);
begin
  interface_unit.redo();
end;

procedure TEditform.MenuItem25Click(Sender: TObject);
begin
  interface_unit.cut();
end;

procedure TEditform.MenuItem26Click(Sender: TObject);
begin
  interface_unit.copy();
end;

procedure TEditform.MenuItem27Click(Sender: TObject);
begin
  interface_unit.past();
end;

procedure TEditform.MenuItem29Click(Sender: TObject);
begin
  interface_unit.findwindow();
end;

end.

