unit macrow;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ComCtrls;

type

  { Tmacro_form }

  Tmacro_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    edit2: TComboBox;
    Edit1: TEdit;
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
    procedure edit2Change(Sender: TObject);
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

uses functionunit;

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
  function_unit.r[i].Free;
  for i := macro_form.ListBox1.ItemIndex to function_unit.macrocount -1 do begin
    function_unit.r[i] := function_unit.r[i +1];
  end;
  i := macro_form.ListBox1.ItemIndex;
  dec(function_unit.macrocount);
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

procedure Tmacro_form.edit2Change(Sender: TObject);
begin
  edit1.Text:= edit2.Text;
end;

procedure Tmacro_form.FormActivate(Sender: TObject);
begin
  //function_unit.mainformactive;
end;

procedure Tmacro_form.FormCreate(Sender: TObject);
begin
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
    for i := 0 to function_unit.macrocount -1 do begin;
      macro_form.ListBox1.Items.Add(function_unit.r[i].Caption);
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
    function_unit.macrosetup(function_unit.macrocount);
    inc(function_unit.macrocount);
  end;
  macro_form.Edit1.Clear;
  macro_form.Edit2.Text:= '';
  macro_form.ComboBox1.Text:= '';
  macro_form.Close;
end;

{$R *.lfm}

end.

