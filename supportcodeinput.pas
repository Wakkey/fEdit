unit supportcodeinput;

{$mode objfpc}{$H+}

interface

uses
  windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, types;

type

  { Tcode_auto_support }

  Tcode_auto_support = class(TForm)
    ListBox1: TListBox;
    MenuItem1: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure ListBox1KeyPress(Sender: TObject; var Key: char);
    procedure ListBox1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure MenuItem1Click(Sender: TObject);
  private
    { private declarations }
    shift_sw :boolean;
  public
    { public declarations }
    code_supoert_string:string;
  end;

var
  code_auto_support: Tcode_auto_support;

implementation

uses mainform, find_unit, functionunit;


{$R *.lfm}

{ Tcode_auto_support }

procedure Tcode_auto_support.MenuItem1Click(Sender: TObject);
begin
  code_auto_support.Close;
end;

procedure Tcode_auto_support.FormCreate(Sender: TObject);
begin
  //function_unit.codelist_load;
end;

procedure Tcode_auto_support.FormShow(Sender: TObject);
begin
  //function_unit.selstartset:= 0;
  try
    //listbox1.Items.Text := function_unit.editlist.Items[main.PageControl1.PageIndex].code_suport.Text;
    //function_unit.findcode.Text:= function_unit.backupcodelist.Text;
    //function_unit.backupcodelist.Text:= listbox1.Items.Text;
  except
  end;
end;

procedure Tcode_auto_support.ListBox1Click(Sender: TObject);
begin

end;

procedure Tcode_auto_support.ListBox1DblClick(Sender: TObject);
var
  M:TMemo;
  t:string;
begin
  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart :=
  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart -
  length(function_unit.editlist.Items[main.PageControl1.PageIndex].code_temp);

  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selend :=
  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart +
  length(function_unit.editlist.Items[main.PageControl1.PageIndex].code_temp);
  m:=TMemo.Create(owner);
  m.Parent:=main;
  m.PasteFromClipboard;
  t := m.Lines.Text;
  m.Lines.Text:= listbox1.Items[listbox1.ItemIndex];
  m.SelectAll;
  m.CopyToClipboard;

  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.SelText:=m.Lines[0];
  m.Lines.Text:= t;
  m.SelectAll;
  m.CopyToClipboard;
  m.Free;
  close;
end;

procedure Tcode_auto_support.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  s:string;
  i:integer;
begin
  if listbox1.ItemIndex = 0 then begin
    if char(38) = char(key) then
      //windows.SetActiveWindow(MainForm.Handle);
  end;

   { if
      (word(chr(37)) = key) or
      (word(chr(38)) = key) or
      (word(chr(39)) = key) or
      (word(chr(40)) = key) or
      (word(chr(13))= key)
    then begin
      if (word(chr(38)) < key) or
         (word(chr(40)) > key)
      then begin
        if listbox1.ItemIndex = -1 then
          if (word(chr(13))= key) then
            code_auto_support.Visible := false;
      end;
    end else} begin
     { if not function_unit.findcodeset(mainform.keycount) then
              exit
            else begin
            //keycountの内容をエディタに反映させる
              windows.SetActiveWindow(MainForm.Handle);
              if length(mainform.keycount) > 0 then begin
                if key = 8 then begin
                  i := length(MainForm.keycount);
                  if i > 1 then begin
                    MainForm.keycount[length(MainForm.keycount)] := chr(0);
                    function_unit.backspace(function_unit.edit_carety);
                    //Code_auto_support.Visible:= true;
                    //setActiveWindow(code_auto_support.handle);
                  end else begin
                    windows.SetActiveWindow(MainForm.Handle);
                    mainform.keycount:= '';
                    code_auto_support.Close;
                    exit;
                  end;
                end;
                if ( char(key) < char(46)) or (char(key) > char(77) ) then begin
                  if char(key) = char(16) then begin
                    //shift_sw := true;
                    //exit;
                  end;
                end else begin
                  function_unit.keycount_add(key);
                  {if shift_sw then begin
                    s  := (mainform.keycount[length(mainform.keycount)]);
                    shift_sw := false;
                  end else begin}
                    s := Lowercase(mainform.keycount[length(mainform.keycount)]);
                  //end;
                  function_unit.codelistkeypless4(function_unit.edit_carety, s );
                end;
                windows.SetActiveWindow(code_auto_support.handle);
              end;
            end;}

    end;
  //end;
end;

procedure Tcode_auto_support.ListBox1KeyPress(Sender: TObject; var Key: char);
var
  i:integer;
begin
  if key = char(13) then begin
    i := code_auto_support.ListBox1.ItemIndex;
    if i <> -1 then begin
      //function_unit.codelistkeypless3(key,function_unit.edit_carety,code_auto_support.ListBox1.Items[i]);
      //MainForm.keycount:= '';
      //find.find_form.FormStyle:= fsNormal;
      //function_unit.sw_mainform_window:= true;
      //function_unit.setcontlorl(mainform.TabControl1.TabIndex);
      //find.find_form.FormStyle:= fsStayOnTop;
    end;
  end;
end;

procedure Tcode_auto_support.ListBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  s,s1,s2:string;
  i,i1,i2,i3:integer;
begin
  if key = word(13) then begin
  {function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart :=
  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart -
  length(function_unit.editlist.Items[main.PageControl1.PageIndex].code_temp);

  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selend :=
  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.selstart +
  length(function_unit.editlist.Items[main.PageControl1.PageIndex].code_temp);
  }
  s := function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.Lines[
    function_unit.editlist.Items[main.PageControl1.PageIndex].editCaretY -1
  ];

  s1:='';s2:='';
  i1 := function_unit.editlist.Items[main.PageControl1.PageIndex].editCaretX;
  i2 := length(s);
  i3 := length(function_unit.editlist.Items[main.PageControl1.PageIndex].code_temp);
  for i := 1 to i1 - i3 -1 do begin
    s1 := s1 + s[i];
  end;
  for i := i1 to i2 do begin
    s2 := s2 + s[i];
  end;

  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.Lines[
    function_unit.editlist.Items[main.PageControl1.PageIndex].editCaretY -1
  ] := s1 + listbox1.Items[listbox1.ItemIndex] + s2;

  {m:=TMemo.Create(owner);
  m.Parent:=main;
  m.PasteFromClipboard;
  t := m.Lines.Text;
  m.Lines.Text:= listbox1.Items[listbox1.ItemIndex];
  m.SelectAll;
  m.CopyToClipboard;

  function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.SelText:=m.Lines[0];
  m.Lines.Text:= t;
  m.SelectAll;
  m.CopyToClipboard;
  m.Free;}
  close;
  end;
end;

procedure Tcode_auto_support.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin

end;

procedure Tcode_auto_support.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure Tcode_auto_support.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  try
      //code_auto_support.listbox1.Items.LoadFromFile(ExtractFilePath(Paramstr(0)) + 'codelist.txt');
  except

  end;
end;

end.

