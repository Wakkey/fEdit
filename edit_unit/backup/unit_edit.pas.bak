unit unit_edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls, StdCtrls, ExtCtrls, EditBtn, FileCtrl, DBGrids, sqlite3conn,
  sqldb, db, memds;

type

  { Teditform }

  Teditform = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label6: TLabel;
    MemDataset1: TMemDataset;
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
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SynEdit1: TSynEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure PopupMenu1Close(Sender: TObject);
    procedure SaveDialog1SelectionChange(Sender: TObject);
    procedure SaveDialog1TypeChange(Sender: TObject);
    procedure SynEdit1Change(Sender: TObject);
  private
    { private declarations }
    edit_y,edit_x,sel:integer;
  public
    { public declarations }
    dock_sw,dockmode:boolean;
    edittype,char_sets:string;
    filename_path,filename:string;
    sql,sqlset:string;
    nameing_complate,save_complate:boolean;
    Edit:TStringList;
    editCaretY,editCaretX:integer;
    Json_write:TStringList;
    tabNo:integer;
  end;

var
  editform: Teditform;

implementation

uses function_unit, main, comp, repraceMacro, filetype_form;

{$R *.lfm}

{ Teditform }



procedure Teditform.FormCreate(Sender: TObject);
begin
  Edit := TStringList.Create;
  Edit.Clear;
  Json_write := TstringList.Create;
  Json_write.clear;
  PageControl1.PageIndex:= 0;
end;

procedure Teditform.FormDockDrop(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer);
begin

end;

procedure Teditform.FormDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin

end;

procedure Teditform.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
var
  fname:string;
  st,s:TStringlist;
  i,i1:integer;
begin
  st:= TStringList.Create;
  st.Clear;
  s:= TStringList.Create;
  s.Clear;
  for fname in filenames do begin
      {$IFDEF Windows}
         functionunit.FileFindDir(ansitoutf8(fname),st);
      {$ENDIF}
      {$IFDEF LINUX}
         functionunit.EnumFileFromDir((fname),st);
      {$ENDIF}
      {$IFDEF Darwin}
         functionunit.EnumFileFromDir((fname),st);
      {$ENDIF}
  end;
  if st.Count > 0 then begin
    for i1 := 1 to st.count -1 do begin
      if (-1 = openfiletypeform.CheckGroup1.Items.IndexOf(extractfileext(st[i1]))) then begin
        openfiletypeform.CheckGroup1.Items.Add(extractfileext(st[i1]));
      end;
    end;
    if openfiletypeform.CheckGroup1.Items.Count > 0 then begin
      openfiletypeform.ShowModal;
      for i := 0 to openfiletypeform.CheckGroup1.Items.Count -1 do begin
          if openfiletypeform.CheckGroup1.Checked[i] then begin
            s.add( openfiletypeform.CheckGroup1.Items[i] );
          end;
      end;
      for i1 := 0 to st.Count -1 do begin
         if -1 <> s.IndexOf( extractfileext(st[i1]) ) then begin
           try
             functionunit.fileopen(st[i1]);
           except
           end;
         end;
      end;
    end;
  end;
  s.Free;
  st.Free;
end;

procedure Teditform.FormUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin

end;

procedure Teditform.MenuItem23Click(Sender: TObject);
begin
  functionunit.redo();
end;

procedure Teditform.MenuItem25Click(Sender: TObject);
begin
  functionunit.cut();
end;

procedure Teditform.MenuItem26Click(Sender: TObject);
begin
  functionunit.copy();
end;

procedure Teditform.MenuItem27Click(Sender: TObject);
begin
  functionunit.past();
end;

procedure Teditform.MenuItem29Click(Sender: TObject);
begin
  functionunit.findwindow();
end;

procedure Teditform.MenuItem30Click(Sender: TObject);
begin
  reprace_unit.Show;
end;

procedure Teditform.Button1Click(Sender: TObject);
begin
  {SQLite3Connection1.DatabaseName := filename_path;
  SQLite3Connection1.Close; // Ensure the connection is closed when we start
  try
    try
      SQLite3Connection1.Open;
      SQLTransaction1.Active := true;
      synedit1.Lines.Text := 'select * from ' +
      extractfileName(filename_path);
      sqlquery1.SQL.Text:= synedit1.Lines.Text;
      sqlquery1.Open;
    except
    end;
  except
    ShowMessage('Unable to check if database file exists');
  end;}
end;

procedure Teditform.Button2Click(Sender: TObject);
begin
  SynEdit1.Lines.Text:= 'SELECT * FROM ' + sql;
  sqlset := 'SELECT * FROM ';
  Button1Click(sender);
end;

procedure Teditform.Button3Click(Sender: TObject);
begin
  SynEdit1.Lines.Text:= 'SELECT * FROM ' + sql;
  sqlset := 'SELECT * FROM ';
  Button1Click(sender);
end;

procedure Teditform.FileListBox1Click(Sender: TObject);
begin

end;

procedure Teditform.FileListBox1DblClick(Sender: TObject);
begin

end;

procedure Teditform.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i:integer;
begin
  i := TabNo;
  if i > 0 then begin
    mainform.PageControl1.ActivePageIndex:= i -1;
  end;
  mainform.PageControl1.Pages[i].Destroy;
  //functionunit.editlist.Items[i].Destroy;
  functionunit.editlist.Delete(i);

end;

procedure Teditform.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin

end;

procedure Teditform.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage =  TabSheet1 then begin
    SynEdit1.Lines.Text := edit.Text;
    synedit1.SelStart:= sel;
    //synedit1.CaretX:= edit_x;
  end else if PageControl1.ActivePage = TabSheet2 then begin
    Memo1.Lines.Text:= edit.Text;
    memo1.SelStart:= sel;
    //showmessage(inttostr(sel)+ ' ' + inttostr(memo1.SelStart));
    //memo1.CaretPos.X:= edit_x;
  end;

end;

procedure Teditform.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if PageControl1.ActivePage = TabSheet1 then begin
    edit.Text:= SynEdit1.Lines.Text;
    sel := synedit1.SelStart;
    edit_y := synedit1.CaretY;
    edit_x := synedit1.CaretX;

  end else if PageControl1.ActivePage = TabSheet2 then begin
    edit.Text:= Memo1.Lines.Text;
    sel := memo1.SelStart;
    //edit_x := memo1.CaretPos.X;
  end;
end;

procedure Teditform.PopupMenu1Close(Sender: TObject);
begin
  functionunit.undo();
end;

procedure Teditform.SaveDialog1SelectionChange(Sender: TObject);
begin

end;

procedure Teditform.SaveDialog1TypeChange(Sender: TObject);
var
  i:integer;
  s,s2:string;
  st:TStringlist;
begin
  st := TStringList.Create;
  s := savedialog1.ExtractAllFilterMasks(savedialog1.Filter,false);
  st.Text := StringReplace(s, ';', char(13), [rfReplaceAll]);
  s := st[savedialog1.FilterIndex-1];
  s2 := '';
  for i := 2 to length(s) do begin
    s2 := s2 + s[i];
  end;
  savedialog1.DefaultExt:= s2;
  //showmessage(s2);
  st.Free;
end;

procedure Teditform.SynEdit1Change(Sender: TObject);
begin
  save_complate := false;
end;

end.

