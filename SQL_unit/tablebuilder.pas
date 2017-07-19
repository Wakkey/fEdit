unit TableBuilder;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,sqlpropedit, sqldb, db, sqlite3conn, Types
  {$IFDEF Windows}
    ,windows ,shellapi
  {$ENDIF}

  ;

type

  { TForm2 }

  TForm2 = class(TForm)
    Bevel5: TBevel;
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
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
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
    procedure ComboBox3DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure ComboBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
    sqldrv,drvfile,sqlname,sqltype,sql_datataype,sql_help,portNo:TStringList;
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

  detakata := combobox3.Items[combobox3.ItemIndex];
  sql_word[2].Add(Label2.Caption);
  memo1.Lines.Text := memo1.Lines.Text + edit3.Text + ' ' + detakata;


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

procedure TForm2.ComboBox1Change(Sender: TObject);
var
  i,i2:integer;
  s:string;
begin
  i2 := combobox1.ItemIndex;
  s := combobox1.Items[i2];
  combobox3.Items.Clear;
  for i := 0 to sqlname.Count -1 do begin
    if s = sqlname[i] then begin
      combobox3.Items.Add( sql_datataype[i] );
    end;
  end;
  //showmessage(PortNo.Text);
  i2 :=  SQLType.IndexOf(s);
  if i2 > -1 then begin
    if PortNo[i2] = 'non' then begin
      edit4.Text := '';
      exit;
    end;
    edit4.Text := PortNo[i2];
  end;
end;

procedure TForm2.ComboBox3Click(Sender: TObject);
begin
  Button6.Enabled := true;
end;

procedure TForm2.ComboBox3DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
begin

end;

procedure TForm2.ComboBox3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

begin

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
var
  i:integer;
begin
  if -1 < combobox3.ItemIndex then begin
    i := sql_datataype.IndexOf( combobox3.Items[combobox3.ItemIndex] );
    label2.Caption := sql_help[i];
  end;
  Button6.Enabled := true;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  drvfile.Free;
  sqldrv.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  st,st2:TStringList;
  i:integer;
begin
  try
    st := TStringList.Create;
    st2 := TStringList.Create;
    st2.Clear;
    SQLType := TStringList.Create;
    sqltype.Clear;
    sqldrv := TStringList.Create;
    sqldrv.Clear;
    drvfile := TStringList.Create;
    drvfile.Clear;
    portNo := TStringList.Create;
    portNo.clear;
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'ini\drvlist.csv');
    for i := 0 to st.Count -1 do begin;
      st2.CommaText := st[i];
      drvfile.Add(st2[0]);
      sqldrv.Add(st2[1]);
      SQLType.Add(st2[2]);
      portNo.Add(st2[3]);
    end;
    st.free;
    st2.Free;
  except

  end;

  try
    st := TStringList.Create;
    st2 := TStringList.Create;
    st2.Clear;
    sqlname := TStringList.Create;
    sqlname.Clear;
    sql_datataype := TStringList.Create;
    sql_datataype.Clear;
    sql_help := TStringList.Create;
    sql_help.Clear;
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'ini\sqllist.csv');
    for i := 0 to st.Count -1 do begin;
      st2.CommaText := st[i];
      sqlname.Add(st2[0]);
      sql_datataype.Add(st2[1]);
      sql_help.Add(st2[2]);
      if -1 = combobox1.Items.IndexOf(st2[0]) then begin
        combobox1.Items.Add(st2[0]);
      end;
    end;
    st.free;
    st2.Free;
  except

  end;

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
    //database: TSqliteDatabase;
  newFile : Boolean;
  st,st2:Tstringlist;
  i,i1:integer;
  sql_set,hosts,ports,user,pass,dbname:string;
  function set_code(s1,s2:TstringList;f,r:string):boolean;
  var
    k:integer;
  begin
    for k := 0 to s1.Count -1 do begin
      s1[k] := StringReplace(s1[k], f, r, [ rfReplaceAll ]);
    end;
    s2.Text:= s1.Text;
  end;
begin
  //sql := Memo1.Lines.Text;
  st:= TStringList.Create;
  st2:= TStringList.Create;
  st.Clear;
  st2.Clear;

  try
    st.LoadFromFile( ExtractFilePath( ParamStr( 0 ) ) + 'Script_lib\create_table_base.java' );
  except

  end;

  sql_set := '""'+char(13);
  for i1 := 0 to Memo1.Lines.Count -1 do begin
    sql_set := sql_set + '+"' + Memo1.Lines[i1] + '"' + char(13);
  end;
  st2.Text:= st.Text;

  if edit4.Text <> '' then begin
    ports := ':'+Edit4.Text+'/';
  end else begin
    ports := ' ';
  end;

  if edit5.Text <> '' then begin
    user := ',"'+Edit5.Text+'"';
  end else begin
    user := ' ';
  end;

  if edit6.Text <> '' then begin
    pass := ',"'+Edit6.Text+'"';
  end else begin
    pass := ' ';
  end;

  if edit8.Text <> '' then begin
    dbname := Edit8.Text;
  end else begin
    dbname := '';
  end;

  i := sqltype.IndexOf(combobox1.Items[combobox1.ItemIndex]);
  set_code(st,st2,'sql_driver', sqldrv[i]);
  set_code(st,st2,'sql_type',sqltype[i]);
  set_code(st,st2,':protsNo/',ports);
  set_code(st,st2,'//hosts',edit7.Text);
  set_code(st,st2,'db_name',dbname);
  set_code(st,st2,',"root"',user);
  set_code(st,st2,',"password"',pass);
  set_code(st,st2,'select_sql',sql_set);

  try
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\create_table.java');
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset.bat');
    st2.Text := st.Text;
    set_code(st,st2,'sql1', 'create_table');
    set_code(st,st2,'driver', drvfile[i]);
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset1.bat');
  except

  end;
  //st.Free;
  //st2.Free;

  {$IFDEF Windows}
    ShellExecute(Handle, 'OPEN', pchar('.\Script_lib\sqlset1.bat'),'','', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
    if sql_set = '' then begin
        showmessage('no SQL code not Run!');
        exit;
    end;

    st.Free;
    st2.Free;


  {SQLite3Connection1.DatabaseName := edit2.Text + '.db3';
  memo1.Lines.Clear;
  edit3.Text := ''; ComboBox3.Text := '';
  combobox2.Items.Clear;

  SQLite3Connection1.Close; // Ensure the connection is closed when we start

  try
    // Since we're making this database for the first time,
    // check whether the file already exists
    newFile := not FileExists(SQLite3Connection1.DatabaseName);

    if newFile then
    begin
      // Create the database and the tables
      try
        SQLite3Connection1.Open;
        SQLTransaction1.Active := true;

        // Here we're setting up a table named "DATA" in the new database
        SQLite3Connection1.ExecuteDirect(sql);

        // Creating an index based upon id in the DATA Table
        //SQLite3Connection1.ExecuteDirect('CREATE UNIQUE INDEX "Data_id_idx" ON "DATA"( "id" );');

        SQLTransaction1.Commit;

        ShowMessage('Succesfully created database.');
      except
        ShowMessage('Unable to Create new Database');
      end;
    end;
  except
    ShowMessage('Unable to check if database file exists');
  end;
   sql := Memo1.Lines.Text;
  memo1.Lines.Clear;
  edit3.Text := ''; ComboBox3.Text := '';
  combobox2.Items.Clear;}
    {database := TSqliteDatabase.Create( sql_title+'.db3');
      try
        try
          database.GetTable( sql);
        except

        end;
      finally
        database.free;
      end;}
  cancel_sw := not true;
  Close;
end;

end.
