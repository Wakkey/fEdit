unit TableBuilder;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ExtCtrls, Buttons, ComCtrls;

type
  TForm2 = class(TForm)
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
    ComboBox1: TComboBox;
    UpDown1: TUpDown;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private 宣言 }
    sw1:boolean;
  public
    { Public 宣言 }
  end;

var
  Form2: TForm2;
  keysettei, tblname:string;
  nosaize: boolean;
implementation



{$R *.lfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  memo1.Lines.Text := 'CREATE TABLE ' + EDIT2.Text + char(13) + '(';
  edit3.Enabled := true; ComboBox3.Enabled := true; 
  tblname := edit2.Text;
  ComboBox2.Items.Clear;
  sw1 := true;
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
  ',' + char(13) + 'PRIMARY KEY ' + '(' + ComboBox2.Text + ')';
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  detakata: string;
begin
  if not sw1 then begin
    memo1.Lines.Text := memo1.Lines.Text + ',' + char(13);
  end;
  sw1 := false;
  if ComboBox3.Text = 'CHAR' then begin
    if form2.ComboBox1.Text = '0' then
      exit;
    detakata := 'CHAR';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata + '(' + form2.ComboBox1.Text + ')';
  end;
  if ComboBox3.Text = 'VARCHAR' then begin
    if form2.ComboBox1.Text = '0' then
      exit;
    detakata := 'VARCHAR';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata + '(' + form2.ComboBox1.Text + ')';
  end;
  if ComboBox3.Text = 'TINYBLOB' then begin      exit;
    detakata := 'TINYBLOB';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'BLOB' then begin
    detakata := 'BLOB';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'MEDIUMBLOB' then begin
    detakata := 'MEDIUMBLOB';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'LONGBLOB' then begin
    detakata := 'LONGBLOB';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'TINYTEXT' then begin
    detakata := 'TINYTEXT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'TEXT' then begin
    detakata := 'TEXT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'MEDIUMTEXT' then begin
    detakata := 'MEDIUMTEXT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'LONGTEXT' then begin
    detakata := 'LONGTEXT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;

  if ComboBox3.Text = 'TINYINT' then begin
    detakata := 'TINYINT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'SMALLINT' then begin
    detakata := 'SMALLINT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'MEDIUMINT' then begin
    detakata := 'MEDIUMINT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'INT' then begin
    detakata := 'INT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'BIGINT' then begin
    detakata := 'BIGINT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'FLOAT' then begin
    detakata := 'FLOAT';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'DOUBLE' then begin
    detakata := 'DOUBLE';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;


  if ComboBox3.Text = 'DATE' then begin

    detakata := 'DATE';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'TIME' then begin

    detakata := 'TIME';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'DATETIME' then begin

    detakata := 'DATETIME';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'TIMESTAMP' then begin

    detakata := 'TIMESTAMP';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'YEAR' then begin

    detakata := 'YEAR';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'BOOLEAN' then begin

    detakata := 'BOOLEAN';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;
  if ComboBox3.Text = 'DECIMAL' then begin

    detakata := 'DECIMAL';
    memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;
  end;


  ComboBox2.Items.Add(edit3.Text);
  edit3.Text := ''; detakata := ''; ComboBox3.Text := '';

  //edit3.Enabled := false; ComboBox3.Enabled := false; edit5.Enabled := false;
  //button6.Enabled := false;
  button3.Enabled := true;

  //Edit1.Enabled := true; ComboBox1.Enabled := true; edit4.Enabled := true;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
  button2.Enabled := true;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
  Button6.Enabled := true;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  memo1.Lines.Text := memo1.Lines.Text + ');';
  ComboBox2.Enabled := false; Button4.Enabled := false;
  Button3.Enabled := false;
  Button5.Enabled := true;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
var
  i,i2:integer;
  s:string;
begin
  s := combobox3.Text;
  if s = 'CHAR' then begin
      form2.ComboBox1.Items.Clear;
      i2 := 255;
      for I := 0 to i2 do begin
        form2.ComboBox1.Items.Add(inttostr(I));
      end;
      form2.UpDown1.Max := i2;
    end else if s = 'VARCHAR' then begin
      form2.ComboBox1.Items.Clear;
      i2 := 255;
      for I := 0 to i2 do begin
        form2.ComboBox1.Items.Add(inttostr(I));
      end;
      form2.UpDown1.Max := i2;
    end else begin
      form2.ComboBox1.Items.Clear;
      i2 := 0;
      form2.UpDown1.Max := i2;
    end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  //form1.Memo1.Text := form2.Memo1.Lines.Text;
  form2.Close;
end;

end.
