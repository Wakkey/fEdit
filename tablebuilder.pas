unit TableBuilder;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,sqlpropedit;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Button2: TButton;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Button4: TButton;
    Memo1: TMemo;
    Button5: TButton;
    Bevel4: TBevel;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label9: TLabel;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private 宣言 }
    sw1:boolean;
  public
    { Public 宣言 }
    sql,sql_title:string;
    edit_count:integer;
    cancel_sw:boolean;
    Edit_arry:array[0..40] of TEdit;
    sql_word:array[0..3] of TStringList;
    form3:Tsqlprop;
    function Set_Label(No:integer;SetLabel:string;ParentComp:TWinControl):TLabel;
    function Set_Edit(No:integer;SetEdit:string;ParentComp:TWinControl):TEdit;
    function Set_Coomp(HtmlParts:string;EditParts1,EditParts2:TStringList;comp:TWinControl):boolean;
  end;

var
  Form2: TForm2;
  keysettei, tblname:string;
  nosaize: boolean;
implementation

uses SQLiteWrap;



{$R *.lfm}

function TForm2.Set_Label(No:integer;SetLabel:string;ParentComp:TWinControl):TLabel;
begin
  Set_Label := TLabel.Create(ParentComp);
  Set_Label.Parent :=ParentComp;
  Set_Label.Name:= 'L' + inttostr(No);
  Set_label.Caption:= SetLabel;
  Set_Label.Top:= 10 + (No * 45 );
  Set_Label.Left:=50;
end;


function TForm2.Set_Edit(No:integer;SetEdit:string;ParentComp:TWinControl):TEdit;
begin
  Set_Edit := TEdit.Create(ParentComp);
  Set_Edit.Parent :=ParentComp;
  Set_Edit.Name:= 'E' + inttostr(No);
  Set_Edit.Text:= SetEdit;
  set_Edit.OnChange := Edit1.OnChange;
  Set_Edit.OnClick := Edit1.OnClick;

  Set_Edit.Top:= 25 + (No * 45 );
  Set_Edit.Left:=50;
end;

function TForm2.Set_Coomp(HtmlParts:string;EditParts1,EditParts2:TStringList;comp:TWinControl):boolean;
var
  i:integer;
  function CutLeftAndRightStr(Str:String):string;
  var
    i:integer;
    s:string;
  begin
    for i := 3 to length(Str)-2 do begin
      s := s + Str[i];
    end;
    CutLeftAndRightStr := s;
  end;
begin
  Set_Label(0,HtmlParts,Comp);
  //showmessage(EditParts1.Text);
  for i := 0 to EditParts1.Count -1 do begin
    Set_Label(i+1,EditParts1[i],comp);
    Edit_arry[i] := Set_Edit(i+1,EditParts2[i],comp);
    edit_count := i+1;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  memo1.Lines.Text := 'CREATE TABLE ' + EDIT2.Text + char(13) + '(';
  edit3.Enabled := true; ComboBox3.Enabled := true; 
  tblname := edit2.Text;
  sql_title:=tblname;
  ComboBox2.Items.Clear;
  sw1 := true;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  edit3.Text := ''; ComboBox3.Text := '';
  combobox2.Items.Clear;
  cancel_sw := true;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  //memo1.Lines.Text := memo1.Lines.Text + ')';

 // Edit1.Enabled := false; ComboBox1.Enabled := false; edit4.Enabled := false;


  ComboBox2.Enabled := true; Button4.Enabled := true;
  button7.Enabled := true;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  memo1.Lines.Text := memo1.Lines.Text +
  ',' + char(13) + ' PRIMARY KEY ' + '(' + ComboBox2.Text + ')';
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  detakata: string;
begin
  if not sw1 then begin
    memo1.Lines.Text := memo1.Lines.Text + ',' + char(13);
  end;
  sw1 := false;

  if ComboBox3.Text = 'NULL' then begin
    detakata := 'NULL';
    sql_word[2].Add('NULL');
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'INTEGER' then begin
    detakata := 'INTEGER';
     sql_word[2].Add('1');
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'REAL' then begin
    detakata := 'REAL';
     sql_word[2].Add('0.01');
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'TEXT' then begin
    detakata := 'TEXT';
     sql_word[2].Add('文字列');
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'BLOB' then begin
    detakata := 'BLOB';
     sql_word[2].Add('バイナリデータ');
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;

  ComboBox2.Items.Add(edit3.Text);


  //edit3.Enabled := false; ComboBox3.Enabled := false; edit5.Enabled := false;
  button6.Enabled := false;
  button3.Enabled := true;
   sql_word[0].Add(edit3.Text+'_'+detakata);
   sql_word[1].Add(edit3.Text);
   sql_word[3].Add(detakata);
  edit3.Text := ''; detakata := ''; ComboBox3.Text := '';
  //Edit1.Enabled := true; ComboBox1.Enabled := true; edit4.Enabled := true;
end;

procedure TForm2.ComboBox3Click(Sender: TObject);
begin
  Button6.Enabled := true;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  form3.Button2Click(Sender);
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
  form3.Button2Click(Sender);
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
  button2.Enabled := true;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin

end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  memo1.Lines.Text := memo1.Lines.Text + ');';
  ComboBox2.Enabled := false; Button4.Enabled := false;
  Button3.Enabled := false;
  Button5.Enabled := true;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
begin

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin

end;

procedure TForm2.FormCreate(Sender: TObject);
var
  i:integer;
begin
    for i := 0 to 3 do begin
    sql_word[i] := TStringList.Create;
    sql_word[i].clear;
  end;
  //form1.FileListBox1.Directory:= extractfilepath(paramstr(0));
  cancel_sw:= false;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   cancel_sw := true;
end;

procedure TForm2.Panel1Click(Sender: TObject);
begin

end;

procedure TForm2.Button5Click(Sender: TObject);
var
    database: TSqliteDatabase;
begin
   sql := form2.Memo1.Lines.Text;
  memo1.Lines.Clear;
  edit3.Text := ''; ComboBox3.Text := '';
  combobox2.Items.Clear;
    database := TSqliteDatabase.Create( sql_title+'.db3');
      try
        try
          database.GetTable( sql);
        except

        end;
      finally
        database.free;
      end;
       cancel_sw := not true;
  form2.Close;
end;

end.
