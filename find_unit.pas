unit find_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, Buttons;

type

  { Tfind_form }

  Tfind_form = class(TForm)
    BitBtn1: TBitBtn;
    FInds: TButton;
    FindsAll: TButton;
    ListBox1: TListBox;
    Rprece: TButton;
    RplaceAll: TButton;
    ChekChar: TCheckBox;
    FIndTextAlia: TComboBox;
    RplaceTextAlia: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ListBox2: TListBox;
    Memo1: TMemo;
    TabControl1: TTabControl;
    procedure FIndsClick(Sender: TObject);
    procedure FindsAllClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RpreceClick(Sender: TObject);
    procedure RplaceAllClick(Sender: TObject);
    procedure FIndTextAliaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FIndTextAliaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure RplaceTextAliaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    { private declarations }
    tabclrsw:boolean;
  public
    { public declarations }
    //aList:array [0..255]of TStringList;
    //alist:TStringList;
    Listset:array[0..255] of TStringList;
    Listset2:array[0..255] of TStringList;
    function listclear:boolean;
    function list_set(i:integer;s:Tstringlist):boolean;
    function listload(i:integer):string;
    function listallload(i:integer):string;
  end;

var
  find_form: Tfind_form;

implementation

uses functionunit, mainform, function_find, interfaceunit;

{$R *.lfm}

{ Tfind_form }
function Tfind_form.listclear:boolean;
var
  i:integer;
begin
  for i := 0 to 255 do begin
    //if function_unit.Listset[i] <> nil then
      //function_unit.Listset[i] := TStringList.Create;
    //function_unit.Listset[i].Clear;
    //find_form.alist[i].Free;
    //new(find_form.aList[i]);
    //find_form.aList := TStringList.Create;
    //find_form.alist[i].Clear;
  end;
end;

function listclear2:boolean;
var
  i:integer;
begin
  for i := 0 to 255 do begin
    //if function_unit.Listset[i] <> nil then
      //function_unit.Listset[i] := TStringList.Create;
    //function_unit.Listset[i].Clear;
    //find_form.alist[i].Free;
    //new(find_form.aList[i]);
    //find_form.aList := TStringList.Create;
    //find_form.alist[i].Clear;
  end;
end;

function Tfind_form.list_set(i:integer;s:TstringList):boolean;
var
  alist:TStringList;
begin
  aList := TStringList.Create;
  alist.Clear;
  aList.Text:= s.Text;
  aList.SaveToFile(
        ExtractFilePath( Paramstr(0) ) +
          {ExtractFileName} inttostr(i) + '.lst'
          );
  alist.Free;
end;

function Tfind_form.listload(i:integer):string;
var
  alist:TStringList;
begin
  aList := TStringList.Create;
  aList.LoadFromFile(
        ExtractFilePath( Paramstr(0) ) +
          {ExtractFileName} inttostr(i) + '.lst'
          );
  //function_unit.Listset[i].Text:= alist.Text;
  listload := aList[i];
  alist.Free;
end;

function Tfind_form.listallload(i:integer):string;
var
  alist:TStringList;
begin
  aList := TStringList.Create;
  aList.LoadFromFile(
        ExtractFilePath( Paramstr(0) ) +
          {ExtractFileName} inttostr(i) + '.lst'
          );
  listallload := aList.Text;
  alist.Free;
end;

function listfree:boolean;
//var
  //i:integer;
begin
  //for i := 0 to 255 do begin
   // find_form.alist.Free;
  //end;
end;

procedure Tfind_form.FIndsClick(Sender: TObject);
var
  st1,st2:TStringList;
begin
  st1 := TStringList.Create;
  st2 := TStringList.Create;
  st1.Clear;
  st2.Clear;
  find_form.TabControl1.Tabs.Clear;
  find_form.Memo1.Clear;
  find_form.TabControl1.Tabs.Clear;
  find_form.ListBox1.Items.Clear;

  st1.Text := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].Edit.Text;
  interface_unit.find1page(main.PageControl1.ActivePageIndex,st1,st2);
  find_form.ListBox1.Items.Text:= st2.Text;
  //st2.Clear;
  //st1.Clear;
  //exit;
  //function_unit.find1page(MainForm.TabControl1.TabIndex);
  //function_unit.chekfinds;
  if -1 < FIndTextAlia.Items.IndexOf(FIndTextAlia.Text) then
    FIndTextAlia.Items.Add(FIndTextAlia.Text);
end;

procedure Tfind_form.FindsAllClick(Sender: TObject);
begin
  listclear2;
  find_form.Memo1.Clear;
  find_form.tabclrsw := true;
  find_form.TabControl1.Tabs.Clear;
  find_form.ListBox1.Items.Clear;
  //MainForm.MenuItem62Click(MainForm.MenuItem62);
  interface_unit.findallpage;
  if -1 < RplaceTextAlia.Items.IndexOf(RplaceTextAlia.Text) then
    RplaceTextAlia.Items.Add(RplaceTextAlia.Text);
end;

procedure Tfind_form.FormActivate(Sender: TObject);
begin
  //function_unit.mainformactive;
end;

procedure Tfind_form.RpreceClick(Sender: TObject);
begin
  if -1 = RplaceTextAlia.Items.IndexOf(RplaceTextAlia.Text) then
    RplaceTextAlia.Items.Add(RplaceTextAlia.Text);
  FIndsClick(Sender);
  function_unit.TXTReplace;
end;

procedure Tfind_form.RplaceAllClick(Sender: TObject);
var
  i:integer;
begin
  if -1 = RplaceTextAlia.Items.IndexOf(RplaceTextAlia.Text) then
    RplaceTextAlia.Items.Add(RplaceTextAlia.Text);
  FIndsAllClick(find_form.FIndsAll);
  for i := 0 to find_form.TabControl1.Tabs.Count -1 do begin
    find_form.TabControl1.TabIndex := i;
    find_form.TabControl1Change(find_form.TabControl1);
    function_unit.TXTReplace;
  end;
end;

procedure Tfind_form.FIndTextAliaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;

procedure Tfind_form.FIndTextAliaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,i1,i2:integer;
  clist:TStringlist;
begin
  //find_form.ComboBox1.AutoDropDown:= false;
  {clist := Tstringlist.Create;
  FormShow(Sender);
  clist.Text := find_form.FIndTextAlia.Items.Text;
  if find_form.FIndTextAlia.Text = '' then
    exit;
  i := 0;
  i2 := 0;
  for i := 0 to clist.Count -1 do begin
    i1 := ansipos(find_form.FIndTextAlia.Text,clist[i2]);
    if i1 <> 0 then begin
      inc(i2);
    end else begin
      clist.Delete(i2);
    end;
  end;
  find_form.FIndTextAlia.Items.Text := clist.Text;
  clist.Free;
  if key = word(13) then
    if not find_form.FIndTextAlia.DroppedDown then
      find_form.FIndTextAlia.DroppedDown:= true;  }
end;

procedure Tfind_form.RplaceTextAliaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i,i1,i2:integer;
  clist:TStringlist;
begin
  {clist := Tstringlist.Create;
  FormShow(Sender);
  clist.Text := find_form.RplaceTextAlia.Items.Text;
  if find_form.RplaceTextAlia.Text = '' then
    exit;
  i := 0;
  i2 := 0;
  for i := 0 to clist.Count -1 do begin
    i1 := ansipos(find_form.RplaceTextAlia.Text,clist[i2]);
    if i1 <> 0 then begin
      inc(i2);
    end else begin
      clist.Delete(i2);
    end;
  end;
  find_form.RplaceTextAlia.Items.Text := clist.Text;
  clist.Free;
  if key = word(13) then
    if not find_form.RplaceTextAlia.DroppedDown then
      find_form.RplaceTextAlia.DroppedDown:= true; }
end;

procedure Tfind_form.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  i:integer;
begin
    //listclear;
  for i := 0 to 255 do begin
    find_form.Listset[i].Free;
  end;
    //listfree;
end;

procedure Tfind_form.FormCreate(Sender: TObject);
var
  i:integer;
begin
    //listclear;
  for i := 0 to 255 do begin
    find_form.Listset[i] := TStringList.Create;
    find_form.Listset[i].Clear;
    find_form.Listset2[i] := TStringList.Create;
    find_form.Listset2[i].Clear;
  end;
end;

procedure Tfind_form.FormShow(Sender: TObject);
var
  st:TStringlist;
  i:integer;
begin
  st:=TStringlist.Create;

  try
    st.LoadFromFile(utf8toansi(ansitoutf8(extractfilepath(paramstr(0)) + 'findwordlist.txt')));
  except

  end;
    for i := 0 to st.Count -1 do begin
      find_form.FIndTextAlia.Items.Add(st[i]);
    end;
    st.Free;
    find_form.RplaceTextAlia.Items.Text:= find_form.FIndTextAlia.Items.Text;
end;

procedure Tfind_form.ListBox2Click(Sender: TObject);
begin
  if find_form.ListBox1.Items.Count = 0 then
    exit;
  interface_unit.selselect(
    main.PageControl1.ActivePageIndex
  );
end;

procedure Tfind_form.TabControl1Change(Sender: TObject);
begin
  {
  MainForm.TabControl1.TabIndex:= strtoint(find_form.Memo1.Lines[find_form.TabControl1.TabIndex]);
  find_form.aList.LoadFromFile(
        ExtractFilePath( Paramstr(0) ) +
          {ExtractFileName} find_form.Memo1.Lines[find_form.TabControl1.TabIndex] + '.lst'
          );
  find_form.ListBox1.Items.Text:= find_form.aList.Text;
  }
  //showmessage(find_form.Memo1.Lines[find_form.TabControl1.TabIndex]);
  if find_form.tabclrsw then begin
    find_form.tabclrsw := false;
    exit;
  end;
  Main.PageControl1.PageIndex := strtoint(find_form.Memo1.Lines[find_form.TabControl1.TabIndex]);
  find_form.ListBox1.Items.Text:= listset[strtoint(memo1.Lines[find_form.TabControl1.TabIndex])].Text;
  find_form.ListBox2.Items.Text:= listset2[strtoint(memo1.Lines[find_form.TabControl1.TabIndex])].Text;

  //listallload(strtoint(find_form.Memo1.Lines[find_form.TabControl1.TabIndex]));
end;

procedure Tfind_form.TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin

end;

end.

