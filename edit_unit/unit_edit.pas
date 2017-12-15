unit unit_edit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls, StdCtrls, ExtCtrls, EditBtn, FileCtrl, DBGrids, Grids,
  sqldb, base64,
  pqconnection, oracleconnection, mssqlconn, odbcconn, db, memds;

type

  { Teditform }

  Teditform = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label6: TLabel;
    MemDataset: TMemDataset;
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
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    StringGrid1: TStringGrid;
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
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { private declarations }
    edit_y,edit_x,sel:integer;
    shiftKey:word;
  public
    { public declarations }
    dock_sw,dockmode:boolean;
    edittype,char_sets:string;
    filename_path,filename:string;
    sql,sqlset:string;
    nameing_complate,save_complate:boolean;
    Edit:TStringList;
    editCaretY,editCaretX:integer;
    Json_write,temp_codeset,code_suport:TStringList;
    tabNo:integer;
  end;

var
  editform: Teditform;

implementation

uses function_unit, main, comp, repraceMacro, filetype_form, MySQL,
  supportcodeinput;

{$R *.lfm}

{ Teditform }



procedure Teditform.FormCreate(Sender: TObject);
begin
  Edit := TStringList.Create;
  Edit.Clear;
  Json_write := TstringList.Create;
  Json_write.clear;
  PageControl1.PageIndex:= 0;
  temp_codeset := TstringList.Create;
  temp_codeset.Clear;
  code_suport := TstringList.Create;
  temp_codeset.Clear;
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
         functionunit.FileFindDir((fname),st);
      {$ENDIF}
      {$IFDEF Darwin}
         functionunit.FileFindDir((fname),st);
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
  if (st.count = 1) and (filenames[0] <> null) then begin
      functionunit.fileopen( FileNames[0] );
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
var
  sqlform: TForm1;
begin
  sqlform := TForm1.Create(owner);

  sqlform.Show;
  sqlform.Caption := sqlform.Caption + '[' + IntToStr(tabNo) + ']';
end;

procedure Teditform.Button2Click(Sender: TObject);
begin

end;

procedure Teditform.Button3Click(Sender: TObject);
begin

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

procedure Teditform.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  c:char;
  w:word;
  s,s1:string;
  i:integer;
begin
  c := char(key);
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;
  //showmessage(inttostr(key));
  if (c = char(40)) or (c = char(27)) then
    exit;
  if (c = char(32)) or (c = char(13)) or (c = char(8)) or (c = char(46)) or  ((c >= char(37)) and (c <= char(39))) then begin
    functionunit.wordlist:='';
    if code_auto_support.ListBox1.ItemIndex <> -1 then begin
      code_auto_support.select_code_type:= code_auto_support.ListBox1.Items[code_auto_support.ListBox1.ItemIndex];
      code_auto_support.code_type.Clear;
    end;
    code_auto_support.Visible:= not true;
    exit;
  end else begin
    w := 190;
    if c = char(40) then begin

      functionunit.get_window(code_auto_support.handle);

      code_auto_support.ActiveControl :=code_auto_support.ListBox1;

    end;
    if key = w then begin
      functionunit.get_code2;
      functionunit.wordlist:='';
    end else begin
      if ((key >= 65) and (key <= 102)) then begin
       s := '';
       s1 := '';
       i := functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.CaretY -1;
       s := functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.Lines[i];
       s := s + ' ';
       s1 := char(key);
       if shiftKey = 16 then begin
         s[s.Length] := s1[1];
         shiftKey := 0;
         functionunit.wordlist:=functionunit.wordlist+(char(s1[1]));
       end else begin
         s[s.Length] := LowerCase(s1[1]);
         functionunit.wordlist:=functionunit.wordlist+LowerCase(char(s1[1]));
       end;
      end else begin
        shiftKey := key;
      end;
      functionunit.get_code;
      if code_auto_support.listbox1.Items.Count = 0 then begin
        code_auto_support.close;
      end;
    end;
    functionunit.popupwin(char(key),synedit1);
  end;
  //mainform.Caption:=functionunit.wordlist;

end;

procedure Teditform.SynEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  editCaretY := synEdit1.BlockBegin.y;
  editCaretX := synEdit1.BlockBegin.x;
end;

end.

