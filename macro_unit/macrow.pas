unit macrow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ComCtrls, FileCtrl{$IFDEF Windows}
    ,windows
  {$ENDIF};

type

  { Tmacro_form }

  Tmacro_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    edit2: TComboBox;
    Edit1: TEdit;
    FileListBox1: TFileListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure edit2Change(Sender: TObject);
    procedure edit2DropDown(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  macro_form: Tmacro_form;

implementation

uses function_unit, colordlg, main;

{ Tmacro_form }

procedure Tmacro_form.Button1Click(Sender: TObject);
begin
  if not opendialog1.Execute then
    exit;
  edit2.Text:= opendialog1.FileName;
  edit1.Text:= extractfilename(opendialog1.FileName);
end;

procedure Tmacro_form.Button2Click(Sender: TObject);
var
  i:integer;
begin
  i := macro_form.ListBox1.ItemIndex;
  if i = -1 then
    exit;
  functionunit.r[i].Free;
  for i := macro_form.ListBox1.ItemIndex to functionunit.macrocount -1 do begin
    functionunit.r[i] := functionunit.r[i +1];
  end;
  i := macro_form.ListBox1.ItemIndex;
  dec(functionunit.macrocount);
  macro_form.ListBox1.Items.Delete(i);
end;

procedure Tmacro_form.Button3Click(Sender: TObject);
var
  i:integer;
begin
  if not opendialog1.Execute then
    exit;
  combobox1.Text:= '';
  for i := 0 to opendialog1.Files.Count -1 do begin
    combobox1.Text:= combobox1.Text + opendialog1.Files[i]
  end;
end;

procedure Tmacro_form.Button4Click(Sender: TObject);
var
  i:integer;
begin
  if not opendialog1.Execute then
    exit;
  combobox2.Text:= '';
  for i := 0 to opendialog1.Files.Count -1 do begin
    combobox2.Text:= combobox2.Text + opendialog1.Files[i]
  end;

end;

procedure Tmacro_form.Button5Click(Sender: TObject);
var
  dir,macro:String;
begin
  {$IFDEF Windows}
    dir := 'macro\';
  {$ENDIF}
  {$IFDEF LINUX}
   dir := 'macro/';
  {$ENDIF}
  {$IFDEF Darwin}
     dir := 'tmacro/';
  {$ENDIF}
  ForceDirectories( ExtractFilePath( (Paramstr(0)) )  + dir );
  //macro := inputbox('マクロ名入力','','');
  functionunit.newwindow();
  SetCurrentDir( extractfilepath(Paramstr(0))+dir );
  //functionunit.editlist.Items[mainform.PageControl1.PageCount-2].SaveDialog1.FileName:=extractfilepath(Paramstr(0))+dir+macro + combobox3.Text;
  //functionunit.editlist.Items[mainform.PageControl1.PageCount-2].filename_path :=extractfilepath(Paramstr(0))+dir+macro + combobox3.Text;
  //functionunit.editlist.Items[mainform.PageControl1.PageCount-2].filename:=macro;
  showmessage('マクロを記述してください');
  {$IFDEF Windows}
    ShellExecute(Handle, 'OPEN', pchar(Paramstr(0)),pchar(extractfilepath(Paramstr(0))+dir+macro),'', SW_SHOW);

  {$ENDIF}
  {$IFDEF LINUX}
   dir := 'macro/';
  {$ENDIF}
  {$IFDEF Darwin}
     dir := 'tmacro/';
  {$ENDIF}
end;

procedure Tmacro_form.edit2Change(Sender: TObject);
begin
  edit1.Text:= edit2.Text;
end;

procedure Tmacro_form.edit2DropDown(Sender: TObject);
var
  i:integer;
begin
  macro_form.FileListBox1.UpdateFileList;
  edit2.Items.Clear;
  edit2.Items.Add('コード補完読込');
  edit2.Items.Add('fEdit起動');
  edit2.Items.Add('エクスプローラ起動');
  for i := 0 to macro_form.FileListBox1.Items.Count -1 do begin
    edit2.Items.Add( macro_form.FileListBox1.Items[i]);
  end;
end;

procedure Tmacro_form.FormActivate(Sender: TObject);
begin
  //functionunit.mainformactive;
end;

procedure Tmacro_form.FormCreate(Sender: TObject);
begin
  macro_form.FileListBox1.Directory := extractfilepath(paramstr(0))+'macro';
  {for i := 0 to MainForm.count -1 do begin
    macro_form.ComboBox1.Items.Add();
  end;}
end;

procedure Tmacro_form.PageControl1Change(Sender: TObject);
begin

end;

procedure Tmacro_form.TabSheet1Show(Sender: TObject);
begin

end;

procedure Tmacro_form.TabSheet2Show(Sender: TObject);
var
  i:integer;
begin
  if macro_form.PageControl1.ActivePageIndex = 1 then begin
    for i := 0 to functionunit.macrocount -1 do begin;
      macro_form.ListBox1.Items.Add(functionunit.r[i].Caption);
    end;
  end;

end;

procedure Tmacro_form.BitBtn1Click(Sender: TObject);
begin
  macro_form.Close;
end;

procedure Tmacro_form.BitBtn2Click(Sender: TObject);
begin
  if edit1.Text <> '' then begin
    functionunit.macrosetup(functionunit.macrocount);
    inc(functionunit.macrocount);
  end;
  color_form.BTN_SetMnu2Click(Sender);
  color_form.Button11Click(Sender);
  macro_form.Edit1.Clear;
  macro_form.Edit2.Text:= '';
  macro_form.ComboBox1.Text:= '';
  macro_form.Close;
end;

{$R *.lfm}

end.

