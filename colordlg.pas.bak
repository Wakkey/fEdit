unit colordlg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ColorBox, Buttons, ExtCtrls, ComCtrls, Menus, types;

type

  { Tcolor_form }

  Tcolor_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BTN_SetMnu1: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    BTN_SetMnu: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ColorListBox1: TColorListBox;
    ColorListBox2: TColorListBox;
    ColorListBox3: TColorListBox;
    ColorListBox4: TColorListBox;
    ColorListBox5: TColorListBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit_RootMnu: TEdit;
    Edit_SubMnu: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    List_RootMnu: TListBox;
    List_SubMnu: TListBox;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    PopupMenu1: TPopupMenu;
    TabControl1: TTabControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure ColorListBox1Click(Sender: TObject);
    procedure ColorListBox2Click(Sender: TObject);
    procedure ColorListBox3Click(Sender: TObject);
    procedure ColorListBox4Click(Sender: TObject);
    procedure ColorListBox5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox6DropDown(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox7DropDown(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure TabControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { private declarations }

  public
    { public declarations }
  end;

var
  color_form: Tcolor_form;

implementation

uses
  functionunit, mainform, tool_window;
{$R *.lfm}

{ Tcolor_form }

procedure Tcolor_form.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tcolor_form.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tcolor_form.Button1Click(Sender: TObject);
begin
  color_form.TabControl1.Tabs[color_form.TabControl1.TabIndex] := color_form.ComboBox5.Text;
end;

procedure Tcolor_form.Button2Click(Sender: TObject);
begin
  if color_form.ComboBox5.Text = '' then
    color_form.TabControl1.Tabs.Add('Menu' + inttostr(color_form.TabControl1.Tabs.Count-1))
  else
    color_form.TabControl1.Tabs.Add(color_form.ComboBox5.Text);
  function_unit.pagenew(color_form.TabControl1.Tabs.Count-1,color_form.ComboBox5.Text);
  function_unit.pageout;
end;

procedure Tcolor_form.Button3Click(Sender: TObject);
begin

 function_unit.pagedelete(color_form.TabControl1.TabIndex);
 color_form.TabControl1.Tabs.Delete(color_form.TabControl1.TabIndex);
end;

procedure Tcolor_form.Button4Click(Sender: TObject);
begin
  if listbox2.ItemIndex = -1 then
    showmessage('追加するボタンを選択してください');
  if '-' = listbox2.Items[listbox2.ItemIndex] then
    exit;
  if -1 = listbox1.Items.IndexOf(listbox2.Items[listbox2.ItemIndex]) then begin
    if not color_form.CheckBox3.Checked then begin
      try
        function_unit.toolbarbuttoncount.Add(inttostr(ListBox2.ItemIndex));
        function_unit.toolbuttonset(function_unit.toolbarbuttoncount.Count, ListBox2.ItemIndex);
      except

      end;
    end else begin
      try
        function_unit.toolbarbuttoncount2.Add(inttostr(ListBox2.ItemIndex));
        function_unit.toolbuttonset2(function_unit.toolbarbuttoncount2.Count ,
                                     ListBox2.ItemIndex,color_form.TabControl1.TabIndex ,
                                     main.Menu.Items.Count
                                     );
      except

      end;
    end;
    color_form.ActiveControl := listbox1;
    if listbox1.Items.Count <> 0 then
      listbox1.ItemIndex:= listbox1.Items.Count -1;
  end;
end;

procedure Tcolor_form.Button5Click(Sender: TObject);
var
  i:integer;
begin
  if listbox1.ItemIndex = -1 then
    exit;
  i := listbox1.ItemIndex;
  if not color_form.CheckBox3.Checked then begin
    function_unit.deletebutton;
  end else begin
    function_unit.deletebutton2;
  end;
  color_form.ActiveControl := listbox1;
  if listbox1.Items.Count <> 0 then
    listbox1.ItemIndex:= i-1;
end;

procedure Tcolor_form.Button8Click(Sender: TObject);
var
  setfile,setfile2,setfile3:string;
begin
  setfile := inttostr(listbox1.ItemIndex)+'.ini';
  setfile2 := inttostr(listbox1.ItemIndex)+'t.ini';
  setfile3 := inttostr(listbox1.ItemIndex)+'tt.ini';
  if not checkbox3.Checked then begin
    function_unit.toolbarbuttoncount.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) ) + setfile ))
    );
  end else begin
    function_unit.toolbarbuttoncount2.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) ) + setfile2 ))
    );
    function_unit.toolbarbuttonparnt2.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) ) + setfile3 ))
    );
  end;

end;



procedure Tcolor_form.CheckBox3Change(Sender: TObject);
begin

  if main.Menu_MultWindow.Checked then begin
    if not color_form.CheckBox3.Checked then begin
      //main.winmodeheight:= main.toolbar2.Height + main.PageControl1.Height;
      //main.Height := main.winmodeheight;
      toolwindow.PageControl1.Visible := not true;
      main.Menu_ToolBarTAB.Checked := not true;
      color_form.PageControl1.Visible:= true;
    end else begin
      //main.winmodeheight:= main.toolbar2.Height + main.PageControl1.Height + 30;
      //main.Height := main.winmodeheight;
      toolwindow.PageControl1.Visible := true;
      main.Menu_ToolBarTAB.Checked := true;
      color_form.PageControl1.Visible:= not true;
    end;
  end;
  function_unit.tabseting1;
  function_unit.tabseting2;
  function_unit.pageout;
  function_unit.resizedocwindow(main.PageControl1.ActivePageIndex);
end;

procedure Tcolor_form.CheckBox3Click(Sender: TObject);
begin


end;

procedure Tcolor_form.CheckBox4Change(Sender: TObject);
begin

end;

procedure Tcolor_form.CheckBox4Click(Sender: TObject);
begin
  if checkbox4.Checked then begin
    toolwindow.ToolBar2.Visible:= false;
    toolwindow.PageControl1.Visible:= false;
    main.toolpanel.Visible:=false;
  end else begin
    main.toolpanel.Visible:= not false;
    if checkbox3.Checked then begin
      toolwindow.ToolBar2.Visible:= false;
      toolwindow.PageControl1.Visible:= true;
    end else begin
      toolwindow.ToolBar2.Visible:= true;
      toolwindow.PageControl1.Visible:= false;
    end;
  end;
  main.Height := main.Height -1;
  main.Height := main.Height +1;
end;

procedure Tcolor_form.ColorListBox1Click(Sender: TObject);
var
  i,i1:integer;
  c,c1:integer;
begin
  i := color_form.ColorListBox1.ItemIndex;
  c := color_form.ColorListBox1.Colors[i];
  i1 := color_form.ColorListBox2.ItemIndex;
  c1 := color_form.ColorListBox2.Colors[i1];

  //function_unit.editcolor(c1,c);

  //function_unit.editbcolor(c1,c);
  {
  i2 := color_form.ColorListBox3.ItemIndex;
  c2 := color_form.ColorListBox3.Colors[i];
  i3 := color_form.ColorListBox4.ItemIndex;
  c3 := color_form.ColorListBox4.Colors[i];
  i4 := color_form.ColorListBox5.ItemIndex;
  c4 := color_form.ColorListBox5.Colors[i];

  function_unit.highlitercolorset(c2,c3,c3);
  }

end;

procedure Tcolor_form.ColorListBox2Click(Sender: TObject);
var
  i,i1:integer;
  c,c1:integer;
begin
  if sender = color_form.ColorListBox1 then begin
    i := color_form.ColorListBox1.ItemIndex;
    c := color_form.ColorListBox1.Colors[i];
    c1 := -1;
  end;
  if sender = color_form.ColorListBox2 then begin
    i1 := color_form.ColorListBox2.ItemIndex;
    c1 := color_form.ColorListBox2.Colors[i1];
    c := -1;
  end;

  //function_unit.editfcolor(c1,c);

  //function_unit.editcolor(c1,c);
  {
  i2 := color_form.ColorListBox3.ItemIndex;
  c2 := color_form.ColorListBox3.Colors[i];
  i3 := color_form.ColorListBox4.ItemIndex;
  c3 := color_form.ColorListBox4.Colors[i];
  i4 := color_form.ColorListBox5.ItemIndex;
  c4 := color_form.ColorListBox5.Colors[i];

  function_unit.highlitercolorset(c2,c3,c3);
  }

end;

procedure Tcolor_form.ColorListBox3Click(Sender: TObject);
var
  i,i1,i2,i3,i4:integer;
  c,c1,c2,c3,c4:integer;
begin
  i := color_form.ColorListBox1.ItemIndex;
  c := color_form.ColorListBox1.Colors[i];
  i1 := color_form.ColorListBox2.ItemIndex;
  c1 := color_form.ColorListBox2.Colors[i];

  function_unit.editcolor(c,c1);

  if sender = color_form.ColorListBox3 then begin
    i2 := color_form.ColorListBox3.ItemIndex;
    c2 := color_form.ColorListBox3.Colors[i2];
    c3 := -1;
    c4 := -1;
  end;
  if sender = color_form.ColorListBox4 then begin
    i3 := color_form.ColorListBox4.ItemIndex;
    c3 := color_form.ColorListBox4.Colors[i3];
    c2 := -1;
    c4 := -1;
  end;
  if sender = color_form.ColorListBox5 then begin
    i4 := color_form.ColorListBox5.ItemIndex;
    c4 := color_form.ColorListBox5.Colors[i4];
    c2 := -1;
    c3 := -1;
  end;

  function_unit.highlitercolorset(c2,c3,c4,color_form.ComboBox2.Text);

end;

procedure Tcolor_form.ColorListBox4Click(Sender: TObject);
begin
  color_form.ColorListBox3Click(Sender);
end;

procedure Tcolor_form.ColorListBox5Click(Sender: TObject);
begin
  color_form.ColorListBox3Click(Sender);
end;

procedure Tcolor_form.ComboBox1Change(Sender: TObject);
begin
  {case color_form.ComboBox1.Text of
    'VK_LCONTROL' : function_unit.listvkkey := 0;
    'VK_RCONTROL' : function_unit.listvkkey := 1;
    'VK_CONTROL'  : function_unit.listvkkey := 2;
    'VK_F1'    : function_unit.listvkkey := 3;
    'VK_F2'    : function_unit.listvkkey := 4;
    'VK_F3'    : function_unit.listvkkey := 5;
    'VK_F4'    : function_unit.listvkkey := 6;
    'VK_F5'    : function_unit.listvkkey := 7;
    'VK_F6'    : function_unit.listvkkey := 8;
    'VK_F7'    : function_unit.listvkkey := 9;
    'VK_F8'    : function_unit.listvkkey := 10;
    'VK_F9'    : function_unit.listvkkey := 11;
    'VK_F10'    : function_unit.listvkkey := 12;
    'VK_F11'    : function_unit.listvkkey := 13;
    'VK_F12'    : function_unit.listvkkey := 14;
  end;}
  //function_unit.vkkey := char(color_form.ComboBox1.Text);
  color_form.Label6.Caption := color_form.ComboBox1.Text;
end;

procedure Tcolor_form.ComboBox3Change(Sender: TObject);
begin
  color_form.ComboBox2.Clear;
  color_form.FormShow(sender);
end;

procedure Tcolor_form.ComboBox4Change(Sender: TObject);
begin
  {case color_form.ComboBox4.Text of
    'VK_LCONTROL' : function_unit.listvkkey2 := 0;
    'VK_RCONTROL' : function_unit.listvkkey2 := 1;
    'VK_CONTROL'  : function_unit.listvkkey2 := 2;
    'VK_F1'    : function_unit.listvkkey2 := 3;
    'VK_F2'    : function_unit.listvkkey2 := 4;
    'VK_F3'    : function_unit.listvkkey2 := 5;
    'VK_F4'    : function_unit.listvkkey2 := 6;
    'VK_F5'    : function_unit.listvkkey2 := 7;
    'VK_F6'    : function_unit.listvkkey2 := 8;
    'VK_F7'    : function_unit.listvkkey2 := 9;
    'VK_F8'    : function_unit.listvkkey2 := 10;
    'VK_F9'    : function_unit.listvkkey2 := 11;
    'VK_F10'    : function_unit.listvkkey2 := 12;
    'VK_F11'    : function_unit.listvkkey2 := 13;
    'VK_F12'    : function_unit.listvkkey2 := 14;
  end;}
  //function_unit.vkkey := char(color_form.ComboBox1.Text);
  color_form.Label9.Caption := color_form.ComboBox4.Text;
end;

procedure Tcolor_form.ComboBox5Change(Sender: TObject);
begin

end;

procedure Tcolor_form.ComboBox6Change(Sender: TObject);
var
  i:integer;
  function resetbutton:boolean;
  var count:integer;
  begin
    listbox1.ItemIndex:= listbox1.Items.Count -1;
    for count := 0 to listbox1.Items.Count -1 do begin
      Button5Click(Sender);
    end;
  end;
begin
  if not checkbox3.Checked then begin
    resetbutton;
    function_unit.toolbarbuttoncount.Clear;
    function_unit.SelectToolBarPreSet(ComboBox6.ItemIndex + 1);
  end else begin
    resetbutton;
    for i := 0 to color_form.TabControl1.Tabs.Count *2 do begin
      try
        color_form.TabControl1.TabIndex := i;
        function_unit.pagedelete(i);
        color_form.TabControl1.Tabs.Delete(color_form.TabControl1.TabIndex);
      except
      end;
    end;
    function_unit.toolbarbuttoncount2.Clear;
    function_unit.toolbarcount.Clear;
    function_unit.toolbarbuttonparnt.Clear;
    try
      function_unit.SelectToolBarPreSet2(ComboBox6.ItemIndex + 1);
    except
    end;
    //showmessage(function_unit.toolbarbuttonparnt2.Text);
    //function_unit.toolbarbuttonparnt2 := function_unit.toolbarbuttonparnt;
  end;
end;

procedure Tcolor_form.ComboBox6DropDown(Sender: TObject);
var
  i,i1:integer;
begin
  if not color_form.CheckBox3.Checked then begin
    i1 := function_unit.SelectToolBarPreSet(0);
      color_form.ComboBox6.Items.Clear;
    for i := 1 to i1 do begin
      color_form.ComboBox6.Items.Add('プリセット設定' + inttostr(i));
    end;
  end else begin
     i1 := function_unit.SelectToolBarPreSet2(0);
      color_form.ComboBox6.Items.Clear;
    for i := 1 to i1 do begin
      color_form.ComboBox6.Items.Add('プリセット設定' + inttostr(i));
    end;
  end;
end;

procedure Tcolor_form.ComboBox7Change(Sender: TObject);
begin
    function_unit.LoadHighLightColorPriSet(ComboBox7.ItemIndex + 1);
    function_unit.LoadColorPriset := ComboBox7.ItemIndex + 1;
end;

procedure Tcolor_form.ComboBox7DropDown(Sender: TObject);
var
  i,i1:integer;
begin
  i1 := function_unit.LoadHighLightColorPriSet(0);
    color_form.ComboBox7.Items.Clear;
  for i := 1 to i1 do begin
    color_form.ComboBox7.Items.Add('プリセット設定' + inttostr(i));
  end;
end;

procedure Tcolor_form.Edit1Change(Sender: TObject);
begin

end;

procedure Tcolor_form.Edit1KeyPress(Sender: TObject; var Key: char);
begin

end;

procedure Tcolor_form.Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //function_unit.popupkey:= key;
  color_form.Label7.Caption:= inttostr(key);
end;

procedure Tcolor_form.Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //function_unit.popupkey2:= key;
  color_form.Label9.Caption:= inttostr(key);
end;

procedure Tcolor_form.FormActivate(Sender: TObject);
begin
  //function_unit.mainactive;
end;

procedure Tcolor_form.FormCreate(Sender: TObject);
begin


end;

procedure Tcolor_form.FormShow(Sender: TObject);
begin
 color_form.ComboBox2.Clear;

    //Delphi
    if (combobox3.Text = 'FreePascal') or (combobox3.Text = 'Delphi') then  begin
      color_form.ComboBox2.Items.Text:=
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'SymbolAttri' + char(13)+
      'CaseLabelAttri' + char(13) +
      'AsmAttri' + char(13);
    end;
    //C++
    if (combobox3.Text = 'C++') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'DirecAttri' + char(13) +
      'AsmAttri' + char(13);
    end;

    //Java
    if (combobox3.Text = 'Java') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'DocumentAttri' + char(13) +
      'InvalidAttri' + char(13);
    end;

    if (combobox3.Text = 'SQL') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'DefaultPackageAttri' + char(13) +
      'FunctionAttri' + char(13) +
      'PLSQLAttri' + char(13) +
      'SQLPlusAttri' + char(13) +
      'TableNameAttri' + char(13) +
      'VariableAttri' + char(13);
    end;

    if (combobox3.Text = 'XML') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'AttributeValueAttri' + char(13) +
      'DocTypeAttri' + char(13) +
      'NamespaceAttributeAttri' + char(13) +
      'NamespaceAttributeValueAttri' + char(13) +
      'ElementAttri' + char(13) +
      'TextAttri' + char(13);
    end;

    if (combobox3.Text = 'HTML') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13)+
    'DirectiveAttri' + char(13)+
    'IDEDirectiveAttri' + char(13)+
    'IdentifierAttri' + char(13)+
    'KeyAttri' + char(13)+
    'SpaceAttri' + char(13)+
    'StringAttri' + char(13)+
    'NumberAttri' + char(13) +
      'AndAttri' + char(13) +
      'ASPAttri' + char(13) +
      'UndefKeyAttri' + char(13) +
      'ValueAttri' + char(13) +
      'TextAttri' + char(13);
    end;

    if (combobox3.Text = 'CSS') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'StringAttri' + char(13) +
      'SymbolAttri' + char(13);
    end;

    if (combobox3.Text = 'Linux Command') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'SymbolAttri' + char(13) +
      'StringAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'SecondKeyAttri' + char(13) +
      'VarAttri' + char(13);
    end;

    if (combobox3.Text = 'Bat') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'VariableAttri' + char(13);
    end;

    if (combobox3.Text = 'INI') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'SectionAttri' + char(13) +
      'TextAttri' + char(13);
    end;

    if (combobox3.Text = 'VBScript') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'StringAttri' + char(13) +
      'SymbolAttri' + char(13);
    end;

    if (combobox3.Text = '自由設定') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'NumberAttri' + char(13) +
      'KeyAttri' + char(13) +
      'VariableAttri' + char(13) +
      'SymbolAttri' + char(13) +
      'StringAttri' + char(13) +
      'ConstantAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'ObjectAttri' + char(13);
    end;

     if (combobox3.Text = 'PHP') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'KeyAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'StringAttri' + char(13) +
      'SymbolAttri' + char(13) +
      'NumberAttri' + char(13) +
      'InvalidSymbolAttri' + char(13) +
      'VariableAttri' + char(13);
    end;

    if (combobox3.Text = 'Perl') then begin
      color_form.ComboBox2.Items.Text:= color_form.ComboBox2.Items.Text +
      'CommentAttri' + char(13) +
      'IdentifierAttri' + char(13) +
      'KeyAttri' + char(13) +
      'SpaceAttri' + char(13) +
      'StringAttri' + char(13) +
      'SymbolAttri' + char(13) +
      'NumberAttri' + char(13) +
      'VariableAttri' + char(13) +
      'InvalidAttri' + char(13) +
      'OperatorAttri' + char(13) +
      'PragmaAttri' + char(13);
    end;

    if (combobox3.Text = 'All') then begin
        color_form.ComboBox2.Items.Text:=
        'CaseLabelAttri' + char(13) +
        'DirecAttri' + char(13) +
        'AsmAttri' + char(13) +
        'DocumentAttri' + char(13) +
        'InvalidAttri' + char(13) +
        'DefaultPackageAttri' + char(13) +
        'FunctionAttri' + char(13) +
        'PLSQLAttri' + char(13) +
        'SQLPlusAttri' + char(13) +
        'TableNameAttri' + char(13) +
        'CommentAttri' + char(13)+
        'AttributeValueAttri' + char(13) +
        'DocTypeAttri' + char(13) +
        'NamespaceAttributeAttri' + char(13) +
        'NamespaceAttributeValueAttri' + char(13) +
        'ElementAttri' + char(13) +
        'DirectiveAttri' + char(13)+
        'IDEDirectiveAttri' + char(13)+
        'IdentifierAttri' + char(13)+
        'SpaceAttri' + char(13)+
        'StringAttri' + char(13)+
        'NumberAttri' + char(13) +
        'AndAttri' + char(13) +
        'ASPAttri' + char(13) +
        'UndefKeyAttri' + char(13) +
        'ValueAttri' + char(13) +
        'CommentAttri' + char(13) +
        'IdentifierAttri' + char(13) +
        'SpaceAttri' + char(13) +
        'KeyAttri' + char(13) +
        'SymbolAttri' + char(13) +
        'SecondKeyAttri' + char(13) +
        'VarAttri' + char(13) +
        'VariableAttri' + char(13) +
        'SectionAttri' + char(13) +
        'TextAttri' + char(13) +
        'ConstantAttri' + char(13) +
        'ObjectAttri' + char(13) +
        'InvalidSymbolAttri' + char(13) +
        'StringAttri' + char(13) +
        'SymbolAttri' + char(13) +
        'VariableAttri' + char(13) +
        'InvalidAttri' + char(13) +
        'OperatorAttri' + char(13) +
        'PragmaAttri' + char(13);
    end;
end;

procedure Tcolor_form.GroupBox4Click(Sender: TObject);
begin

end;

procedure Tcolor_form.MenuItem1Click(Sender: TObject);
begin

end;

procedure Tcolor_form.PageControl1Change(Sender: TObject);
begin

end;

procedure Tcolor_form.TabControl1Change(Sender: TObject);
begin
  toolwindow.PageControl1.ActivePageIndex := color_form.TabControl1.TabIndex;
end;

procedure Tcolor_form.TabControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin

end;

procedure Tcolor_form.TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure Tcolor_form.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

end.

