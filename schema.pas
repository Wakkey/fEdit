unit Schema;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons;

type

  { TSchemaForm }

  TSchemaForm = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
    integer_max1: TComboBox;
    integer_min: TComboBox;
    number1_Check: TCheckBox;
    integer1_Check2: TCheckBox;
    number2_Check: TCheckBox;
    integer2_Check2: TCheckBox;
    array1_Check: TCheckBox;
    array2_Check: TCheckBox;
    object1_Check: TCheckBox;
    object2_Check: TCheckBox;
    Panel3: TPanel;
    string_max: TComboBox;
    number_max: TComboBox;
    array_max: TComboBox;
    object_max: TComboBox;
    string_min: TComboBox;
    PageControl2: TPageControl;
    Panel2: TPanel;
    P_description: TEdit;
    P_discription_Check: TCheckBox;
    string2_Check: TCheckBox;
    P_ID: TEdit;
    P_ID_Check: TCheckBox;
    P_Title: TEdit;
    P_Title_Check: TCheckBox;
    start: TButton;
    string1_Check: TCheckBox;
    number_min: TComboBox;
    array_min: TComboBox;
    object_min: TComboBox;
    S_Type_Check: TCheckBox;
    S_Var: TEdit;
    S_Title_Check: TCheckBox;
    S_ID_Check: TCheckBox;
    S_discription_Check: TCheckBox;
    PageControl1: TPageControl;
    Panel1: TPanel;
    S_ID: TEdit;
    S_description: TEdit;
    S_Title: TEdit;
    S_Var_Check: TCheckBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    string_page: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    UpDown1: TUpDown;
    UpDown10: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown8: TUpDown;
    UpDown9: TUpDown;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
    type_editbox:string;
    P_type:TStringlist;
  public
    cpy_P:TStringList;
    function edit_mode(sw:boolean):boolean;
    { public declarations }
  end;

var
  SchemaForm: TSchemaForm;

implementation

uses functionunit;

{$R *.lfm}

{ TSchemaForm }

function TSchemaForm.edit_mode(sw:boolean):boolean;
begin
  if sw then begin
    PageControl1.ActivePageIndex:= 0;
    exit;
  end;
  PageControl1.ActivePageIndex:= 1;
  TabSheet1.Enabled:=false;
  TabSheet3.Enabled:=false;
  Button9.Visible:= false;
  Button11.Visible:= true;;
end;

procedure TSchemaForm.startClick(Sender: TObject);
var
  s1,s2,s3,s4,s5:string;
begin
  s1 := '"$schema": "'+S_Var.Text+'",' + chr(13);
  s2 := '"id": "'+S_ID.Text+'",' + chr(13);
  s3 := '"title": "'+S_Title.Text+'",' + chr(13);
  s4 := '"description": "'+ S_description.Text +'",' + chr(13);
  s5 := '"type": "object",' + chr(13);
  if not S_Var_Check.Checked then
    s1 := '';
  if not S_title_Check.Checked then
    s2 := '';
  if not S_ID_Check.Checked then
    s3 := '';
  if not S_discription_Check.Checked then
    s4 := '';
  if not S_type_Check.Checked then
    s5 := '';


  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Clear;
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text := (
  '{' + chr(13)
  +  s1
  +  s2
  +  s3
  +  s4
  +  s5
  );
  type_editbox := '},"required": [';
  PageControl1.ActivePageIndex:= 1;
end;

procedure TSchemaForm.PageControl2Change(Sender: TObject);
begin

end;

procedure TSchemaForm.Button9Click(Sender: TObject);
var
  s1,s2,s3,s4,s5:string;
begin
  s1 :='"properties": {' + chr(13);
  s2 := '"'+P_ID.Text+'": {' + chr(13);
  s3 := '"description": "'+ P_description.Text +'"' + chr(13);


  s4 := '}' + chr(13);
  s5 := '}' + chr(13);
  if not P_Title_Check.Checked then
    s1 := '';
  if not P_ID_Check.Checked then
    s2 := '';
  if not P_discription_Check.Checked then
    s3 := '';

  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(s1);
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(s2);
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(s3);
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(char(13));
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text:=
    function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Text +
  P_type.Text;
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(s4);
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(s5);



  if type_editbox <> '"required": [' then begin
    type_editbox := type_editbox + ',"'+ P_ID.Text +'"';
  end else if type_editbox = '"required": [' then begin
    type_editbox := type_editbox + '"'+ P_ID.Text +'"';
  end;
  PageControl1.ActivePageIndex:= 2;
end;

procedure TSchemaForm.Button1Click(Sender: TObject);
var
  s1,s2,s3:string;
begin
  s1 := ',"type": "integer"';
  s2 := ',"minLength":' + string_min.Text;
  s3 := ',"maxLength":' + string_max.Text;
  if not integer1_Check2.Checked then begin
    s2 := '';
  end;
  if not integer2_Check2.Checked then begin
    s3 := '';
  end;
  P_type.Add(s1);
  P_type.Add(s2);
  P_type.Add(s3);
end;

procedure TSchemaForm.Button10Click(Sender: TObject);
begin
  function_unit.editlist.Items[function_unit.TabpageNo].SynEdit1.Lines.Add(type_editbox + ']')
end;

procedure TSchemaForm.Button11Click(Sender: TObject);
var
  s1,s2,s3,s4,s5:string;
begin
  s1 :=',"properties": {' + chr(13);
  s2 := '"'+P_ID.Text+'": {' + chr(13);
  s3 := '"description": "'+ P_description.Text +'"' + chr(13);


  s4 := '}' + chr(13);
  s5 := '}' + chr(13);
  if not P_Title_Check.Checked then
    s1 := '';
  if not P_ID_Check.Checked then
    s2 := '';
  if not P_discription_Check.Checked then
    s3 := '';

  cpy_P.Add(s1);
  cpy_P.Add(s2);
  cpy_P.Add(s3);
  //cpy_P.Add(char(13));
  cpy_P.Text:= cpy_P.Text +
    P_type.Text;
  cpy_P.Add(s4);
  cpy_P.Add(s5);
  close;
end;

procedure TSchemaForm.Button3Click(Sender: TObject);
var
  s1,s2,s3:string;
begin
  s1 := ',"type": "number"';
  s2 := ',"minimum":' + number_min.Text;
  s3 := ',"maximum":' + number_max.Text;
  if not number1_Check.Checked then begin
    s2 := '';
  end;
  if not number2_Check.Checked then begin
    s3 := '';
  end;
  P_type.Add(s1);
  P_type.Add(s2);
  P_type.Add(s3);

end;

procedure TSchemaForm.Button4Click(Sender: TObject);
var
  s1,s2,s3:string;
  f:TSchemaForm;
begin
  s1 := ',"type": "object"';
  s2 := ',"minItems":' + object_min.Text;
  s3 := ',"maxItems":' + object_max.Text;
  if not object1_Check.Checked then begin
    s2 := '';
  end;
  if not object2_Check.Checked then begin
    s3 := '';
  end;
  f := TSchemaForm.Create(function_unit);
  f.edit_mode(false);
  f.Showmodal;

  P_type.Add(s1);
  p_type.Text:= P_type.Text+
  f.cpy_P.Text;
  P_type.Add(s2);
  P_type.Add(s3);
  //P_type.Add('');
end;

procedure TSchemaForm.Button5Click(Sender: TObject);
var
  s1,s2,s3:string;
  f:TSchemaForm;
begin
  s1 := ',"type": "array", items{';
  s2 := ',"minItems":' + object_min.Text;
  s3 := ',"maxItems":' + object_max.Text;
  if not object1_Check.Checked then begin
    s2 := '';
  end;
  if not object2_Check.Checked then begin
    s3 := '';
  end;
  f := TSchemaForm.Create(function_unit);
  f.edit_mode(false);
  f.Showmodal;

  P_type.Add(s1);
  p_type.Text:= P_type.Text+
  f.cpy_P.Text;
  P_type.Add('}');
  P_type.Add(s2);
  P_type.Add(s3);

end;

procedure TSchemaForm.FormCreate(Sender: TObject);
begin
  P_type := TStringList.Create;
  P_type.Clear;
  cpy_P := TStringList.Create;
  cpy_P.Clear;
end;

procedure TSchemaForm.Button2Click(Sender: TObject);
var
  s1,s2,s3:string;
begin
  s1 := ',"type": "string"';
  s2 := ',"minimum":' + integer_min.Text;
  s3 := ',"maximum":' + integer_max1.Text;
  if not string1_Check.Checked then begin
    s2 := '';
  end;
  if not string2_Check.Checked then begin
    s3 := '';
  end;
  P_type.Add(s1);
  P_type.Add(s2);
  P_type.Add(s3);
end;

end.

