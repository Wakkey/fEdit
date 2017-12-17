unit MySQL;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, mysql56conn, mysql40conn, mysql41conn,
  mysql50conn, mysql51conn, sqldb, mssqlconn, sqlite3conn, odbcconn, db,
  FileUtil, SynEdit, SynHighlighterSQL, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, DBGrids, StdCtrls,
  {$ IFDEF FPC}
     LCLIntf, LCLType, LMessages
  {$ ENDIF}
  {$IFDEF Windows}
    ,windows ,shellapi
  {$ENDIF}
  ;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    SQLType: TComboBox;
    host1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    user1: TEdit;
    pass1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SQLTypeChange(Sender: TObject);
    procedure SQLTypeClick(Sender: TObject);
  private
    { private declarations }
    sqlset1,sqlset2:string;
    sqldrv,drvfile,portNo:TStringList;
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  {$IFDEF Windows}
     function load_text(st:pchar):pchar; stdcall; external 'utf.dll';
     function save_text(st:pchar):pchar; stdcall; external 'utf.dll';
     function encod_unicode(s:pchar):integer; stdcall; external 'utf.dll';
     function decoed_unicode(s:pchar):integer; stdcall; external 'utf.dll';
  {$ENDIF}

implementation

uses main, unit_edit, function_unit;

{$R *.lfm}

{ TForm1 }
function encode_ansi(s:string;memo:TStringList):boolean;
var
    st:TStringList;
    s1:ansistring;
    i1:integer;
begin
    st := TStringList.Create;
    st.Text:= memo.Text;
    memo.Clear;
    //save_text(memo,st);
       for i1 := 0 to st.Count -1 do begin
         memo.Add(string(save_text(pchar(st[i1]))));
       end;
    try
        memo.SaveToFile(((s)));
    finally

    end;
    encode_ansi := true;
end;
function set_code(s1,s2:TstringList;f,r:string):boolean;
var
    k:integer;
begin
    for k := 0 to s1.Count -1 do begin
      s1[k] := StringReplace(s1[k], f, utf8toansi(r), [ rfReplaceAll ]);
      //showmessage(s1[k]);
    end;
    s2.Text:= s1.Text;
end;
function save_java_SQLcode(s:string;str:TStringlist):boolean;
begin
        {$IFDEF Windows}
        encode_ansi(s,str);
        {$ENDIF}
        {$IFDEF LINUX}
           functionunit.linuxsave(i,s);
        {$ENDIF}
        {$IFDEF Darwin}
           functionunit.macsave(i,s);
        {$ENDIF}
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
  st,st2:TStringList;
  fileName:string;
begin
  st:= TStringList.Create;
  st2:= TStringList.Create;
  st.Clear;
  st2.Clear;
  st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_set_base.java');
  st2.Text:= st.Text;

  set_code(st,st2,'sql_driver', sqldrv[sqltype.ItemIndex]);
  set_code(st,st2,'sql_type',sqltype.Items[sqltype.ItemIndex]);
  if edit1.Text <> '' then
    edit1.text := ':'+Edit1.Text+'/';
  set_code(st,st2,'protsNo',Edit1.Text);

  set_code(st,st2,'//hosts',StringReplace(host1.Text, '\', '/', [ rfReplaceAll ]));
  //set_code(st,st2,'db_name',combobox1.Items[combobox1.ItemIndex]);
  set_code(st,st2,'root',user1.Text);
  set_code(st,st2,'password',pass1.Text);
  set_code(st,st2,'select_sql','show databases');

  //st.text := StringReplace(st.text, 'sql_driver', set_sql, [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'sql_type',sqltype.Items[sqltype.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'hosts',host1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'ports',Edit1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'db_name',combobox1.Items[combobox1.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'root',user1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'password',pass1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'select_sql','show databases' , [ rfReplaceAll ]);


  try

    save_java_SQLcode(ExtractFilePath(ParamStr(0))+'Script_lib\sql_set.java',st);
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset.bat');
    set_code(st,st2,'sql1', 'sql_set');
    set_code(st,st2,'driver', drvfile[sqltype.ItemIndex]);
    save_java_SQLcode(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset1.bat',st);
  except

  end;
  //st.Free;
  st2.Free;
  try
  {$IFDEF Windows}
    ShellExecute(Handle, 'OPEN', pchar('.\Script_lib\sqlset1.bat'),'','', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
  finally
    try
        fileName := ExtractFilePath(ParamStr(0))+'Script_lib\list.txt';
      while not FileExists(fileName) do begin
        sleep(100);
      end;
      st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\list.txt');
      combobox1.Items.Text := st.Text;
      st.Free;
      while FileExists(fileName) do begin
        SysUtils.DeleteFile(fileName);
      end;
    except

    end;
  end;

  i := mainform.PageControl1.PageIndex;
  //function_unit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  with functionunit.editlist.Items[i] do begin
    case sqltype.Text of
      'sqlite':begin
        if not OpenDialog1.Execute then
          exit;

      end;
    {'ODBC':begin
      ODBCConnection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := ODBCConnection1;
      SQLQuery1.DataBase := ODBCConnection1;

      ODBCConnection1.HostName := host1.Text;
      ODBCConnection1.UserName := user1.Text;
      ODBCConnection1.Password := pass1.Text;
      //function_unit.editlist.Items[i].host:=host1.Text;
      //function_unit.editlist.Items[i].user:=user1.Text;
      //function_unit.editlist.Items[i].pass:=pass1.Text;
      ODBCConnection1.Open;
        // First lets get a list of available databases.
        if ODBCConnection1.Connected then begin
          //Showmessage('Connected to server: ' + HostEdit.Text);
          Showmessage('Retrieving list of available databases.');
          SQLQuery1.SQL.Text := 'show databases';
          synedit1.Lines.Text := SQLQuery1.SQL.Text;
          SQLQuery1.Open;
          while not SQLQuery1.EOF do begin
            ComboBox1.Items.Add(SQLQuery1.Fields[0].AsString);
            SQLQuery1.Next;
          end;
          SQLQuery1.Close;
          Showmessage('List of databases received!');
        end;
    end;
    'SQLServer':begin
      MSSQLConnection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MSSQLConnection1;
      SQLQuery1.DataBase := MSSQLConnection1;

      MSSQLConnection1.HostName := host1.Text;
      MSSQLConnection1.UserName := user1.Text;
      MSSQLConnection1.Password := pass1.Text;
      //function_unit.editlist.Items[i].host:=host1.Text;
      //function_unit.editlist.Items[i].user:=user1.Text;
      //function_unit.editlist.Items[i].pass:=pass1.Text;
      MSSQLConnection1.Open;
        // First lets get a list of available databases.
        if MSSQLConnection1.Connected then begin
          //Showmessage('Connected to server: ' + HostEdit.Text);
          Showmessage('Retrieving list of available databases.');
          SQLQuery1.SQL.Text := 'show databases';
          synedit1.Lines.Text := SQLQuery1.SQL.Text;
          SQLQuery1.Open;
          while not SQLQuery1.EOF do begin
            ComboBox1.Items.Add(SQLQuery1.Fields[0].AsString);
            SQLQuery1.Next;
          end;
          SQLQuery1.Close;
          Showmessage('List of databases received!');
        end;
    end;
    'MySQL':begin
        {MySQL40Connection1.Transaction := SQLTransaction1;
        SQLTransaction1.DataBase := MySQL40Connection1;
        SQLQuery1.DataBase := MySQL40Connection1;

         MySQL40Connection1.HostName := host1.Text;
        MySQL40Connection1.UserName := user1.Text;
        MySQL40Connection1.Password := pass1.Text;
        MySQL40Connection1.Port:= strtoint(edit1.Text);
        //function_unit.editlist.Items[i].host:=host1.Text;
        //function_unit.editlist.Items[i].user:=user1.Text;
        //function_unit.editlist.Items[i].pass:=pass1.Text;
         MySQL40Connection1.Open;
          // First lets get a list of available databases.
          if MySQL40Connection1.Connected then begin
            //Showmessage('Connected to server: ' + HostEdit.Text);
            Showmessage('Retrieving list of available databases.');
            SQLQuery1.SQL.Text := 'show databases';
            SQLQuery1.Open;
            while not SQLQuery1.EOF do begin
              ComboBox1.Items.Add(SQLQuery1.Fields[0].AsString);
              SQLQuery1.Next;
            end;
            SQLQuery1.Close;
            Showmessage('List of databases received!');
          end;}
    end;}
    'postgresql': begin

    end;{
    'ORACLE':begin
      OracleConnection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := OracleConnection1;
      SQLQuery1.DataBase := OracleConnection1;

      OracleConnection1.HostName := host1.Text;
      OracleConnection1.UserName := user1.Text;
      OracleConnection1.Password := pass1.Text;
      //OracleConnection1.Port:= strtoint(edit1.Text);
      //function_unit.editlist.Items[i].host:=host1.Text;
      //function_unit.editlist.Items[i].user:=user1.Text;
      //function_unit.editlist.Items[i].pass:=pass1.Text;
      OracleConnection1.Open;
        // First lets get a list of available databases.
        if OracleConnection1.Connected then begin
          //Showmessage('Connected to server: ' + HostEdit.Text);
          Showmessage('Retrieving list of available databases.');
          SQLQuery1.SQL.Text := 'show databases';
          synedit1.Lines.Text := SQLQuery1.SQL.Text;
          SQLQuery1.Open;
          while not SQLQuery1.EOF do begin
            ComboBox1.Items.Add(SQLQuery1.Fields[0].AsString);
            SQLQuery1.Next;
          end;
          SQLQuery1.Close;
          Showmessage('List of databases received!');
        end;
    end;}

    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
  st,st2:TStringList;
  filename:string;
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

  st:= TStringList.Create;
  st2:= TStringList.Create;
  st.Clear;
  st2.Clear;
  st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_tbl_base.java');
  st2.Text:= st.Text;

  set_code(st,st2,'sql_driver', sqldrv[sqltype.ItemIndex]);
  set_code(st,st2,'sql_type',sqltype.Items[sqltype.ItemIndex]);
  set_code(st,st2,':protsNo/',':'+Edit1.Text+'/');
  set_code(st,st2,'//hosts',host1.Text);
  set_code(st,st2,'db_name',combobox1.Items[combobox1.ItemIndex]);
  set_code(st,st2,'root',user1.Text);
  set_code(st,st2,'password',pass1.Text);
  set_code(st,st2,'select_sql','show tables');

  //st.text := StringReplace(st.text, 'sql_driver', set_sql, [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'sql_type',sqltype.Items[sqltype.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'hosts',host1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'ports',Edit1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'db_name',combobox1.Items[combobox1.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'root',user1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'password',pass1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'select_sql','show databases' , [ rfReplaceAll ]);


  try
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_tbl.java');
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset.bat');
    set_code(st,st2,'sql1', 'sql_tbl');
    set_code(st,st2,'driver', drvfile[sqltype.ItemIndex]);
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset1.bat');
  except

  end;
  //st.Free;
  st2.Free;
  try
  {$IFDEF Windows}
    ShellExecute(Handle, 'OPEN', pchar('.\Script_lib\sqlset1.bat'),'','', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
  finally
    try
      fileName := ExtractFilePath(ParamStr(0))+'Script_lib\list2.txt';
      while not FileExists(fileName) do begin
        sleep(100);
      end;
      st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\list2.txt');
      combobox2.Items.Text := st.Text;
      st.Free;
      while FileExists(fileName) do begin
        SysUtils.DeleteFile(fileName);
      end;
    except

    end;
  end;
  i := mainform.PageControl1.PageIndex;
  //functionunit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  with functionunit.editlist.Items[i] do begin
    case sqltype.Text of
      'SQLLite':begin

      end;
      'ODBC':begin

      end;
      'SQLServer':begin

      end;
      'MySQL':begin
          {if ComboBox1.ItemIndex <> -1 then begin
               with ComboBox1 do
                 MySQL40Connection1.DatabaseName := Items[ItemIndex];
               function_unit.editlist.Items[i].database:=MySQL40Connection1.DatabaseName;
               Showmessage('Retreiving list of tables');
               SQLQuery1.SQL.Text := 'show tables';
               SQLQuery1.Open;
               while not SQLQuery1.EOF do begin
                 ComboBox2.Items.Add(SQLQuery1.Fields[0].AsString);
                 SQLQuery1.Next;
               end;
               SQLQuery1.Close;
               Showmessage('List of tables received');
               sqlset1 := form1.SynEdit1.Lines.Text;
             end; }
      end;
      'PostgleSQL':begin

      end;
      'ORACLE':begin

      end;
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,i1,k:integer;
  st,st2:TStringList;
  filename,sql_set:string;
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
  i := mainform.PageControl1.PageIndex;
  functionunit.editlist.Items[i].PageControl1.PageIndex:=2;
  sql_set := '"select * from ' + combobox2.Items[combobox2.ItemIndex] + '"'+char(13);
  {for i1 := 0 to functionunit.editlist.Items[i].SynEdit1.Lines.Count do begin
    sql_set := sql_set + '+"' + functionunit.editlist.Items[i].SynEdit1.Lines[i1] + '"' + char(13);
  end;}

  st:= TStringList.Create;
  st2:= TStringList.Create;
  st.Clear;
  st2.Clear;
  st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_con_base.java');
  st2.Text:= st.Text;

  set_code(st,st2,'sql_driver', sqldrv[sqltype.ItemIndex]);
  set_code(st,st2,'sql_type',sqltype.Items[sqltype.ItemIndex]);
  set_code(st,st2,':protsNo/',':'+Edit1.Text+'/');
  set_code(st,st2,'//hosts',host1.Text);
  set_code(st,st2,'db_name',combobox1.Items[combobox1.ItemIndex]);
  set_code(st,st2,'root',user1.Text);
  set_code(st,st2,'password',pass1.Text);
  set_code(st,st2,'select_sql',sql_set);

  //st.text := StringReplace(st.text, 'sql_driver', set_sql, [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'sql_type',sqltype.Items[sqltype.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'hosts',host1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'ports',Edit1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'db_name',combobox1.Items[combobox1.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'root',user1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'password',pass1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'select_sql','show databases' , [ rfReplaceAll ]);


  try
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_con.java');
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset.bat');
    set_code(st,st2,'sql1', 'sql_con');
    set_code(st,st2,'driver', drvfile[sqltype.ItemIndex]);
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
    try
      fileName := ExtractFilePath(ParamStr(0))+'Script_lib\database.csv';
      while (not FileExists(fileName)) do begin
        sleep(100);
      end;

      st.LoadFromFile(filename);
      st2.CommaText:= st[0];
      functionunit.editlist.Items[i].StringGrid1.ColCount := st2.Count;
      functionunit.editlist.Items[i].StringGrid1.RowCount:=1;
      for i1 := 0 to st.Count -1 do begin
        for k := 0 to st2.Count -2 do begin
          functionunit.editlist.Items[i].StringGrid1.Cells[k+1,i1] := st2[k];
        end;
        st2.Clear;
        st2.CommaText:= st[i1+1];
        functionunit.editlist.Items[i].StringGrid1.RowCount:=
        functionunit.editlist.Items[i].StringGrid1.RowCount + 1;
      end;
      k := functionunit.editlist.Items[i].StringGrid1.RowCount;
      dec(k);
      functionunit.editlist.Items[i].StringGrid1.RowCount := k;
              //combobox2.Items.Text := st.Text;

    except

    end;
    while FileExists(fileName) do begin
        SysUtils.DeleteFile(fileName);
    end;

    st.Free;
    st2.Free;

  //function_unit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  //functionunit.editlist.Items[i].SQLQuery1.Close;
  //functionunit.editlist.Items[i].SQLQuery1.SQL.Text := functionunit.editlist.Items[i].SynEdit1.Lines.Text;
  //functionunit.editlist.Items[i].SQLQuery1.Open;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i,i1,k:integer;
  st,st2:TStringList;
  filename,sql_set:string;
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
  i := mainform.PageControl1.PageIndex;
  functionunit.editlist.Items[i].PageControl1.PageIndex:=2;
  sql_set := '""'+char(13);
  for i1 := 0 to functionunit.editlist.Items[i].SynEdit1.Lines.Count do begin
    sql_set := sql_set + '+"' + functionunit.editlist.Items[i].SynEdit1.Lines[i1] + '"' + char(13);
  end;

  st:= TStringList.Create;
  st2:= TStringList.Create;
  st.Clear;
  st2.Clear;
  st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_con_base.java');
  st2.Text:= st.Text;

  set_code(st,st2,'sql_driver', sqldrv[sqltype.ItemIndex]);
  set_code(st,st2,'sql_type',sqltype.Items[sqltype.ItemIndex]);
  set_code(st,st2,':protsNo/',':'+Edit1.Text+'/');
  set_code(st,st2,'//hosts',host1.Text);
  set_code(st,st2,'db_name',combobox1.Items[combobox1.ItemIndex]);
  set_code(st,st2,'root',user1.Text);
  set_code(st,st2,'password',pass1.Text);
  set_code(st,st2,'select_sql',sql_set);

  //st.text := StringReplace(st.text, 'sql_driver', set_sql, [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'sql_type',sqltype.Items[sqltype.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'hosts',host1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'ports',Edit1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'db_name',combobox1.Items[combobox1.ItemIndex] , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'root',user1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'password',pass1.Text , [ rfReplaceAll ]);
  //st.text := StringReplace(st.text, 'select_sql','show databases' , [ rfReplaceAll ]);


  try
    st.SaveToFile(ExtractFilePath(ParamStr(0))+'Script_lib\sql_con.java');
    st.LoadFromFile(ExtractFilePath(ParamStr(0))+'Script_lib\sqlset.bat');
    set_code(st,st2,'sql1', 'sql_con');
    set_code(st,st2,'driver', drvfile[sqltype.ItemIndex]);
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
    try
      fileName := ExtractFilePath(ParamStr(0))+'Script_lib\database.csv';
      while (not FileExists(fileName)) do begin
        sleep(100);
      end;

      st.LoadFromFile(filename);
      st2.CommaText:= st[0];
      functionunit.editlist.Items[i].StringGrid1.ColCount := st2.Count;
      functionunit.editlist.Items[i].StringGrid1.RowCount:=1;
      for i1 := 0 to st.Count -1 do begin
        for k := 0 to st2.Count -2 do begin
          functionunit.editlist.Items[i].StringGrid1.Cells[k+1,i1] := st2[k];
        end;
        st2.Clear;
        st2.CommaText:= st[i1+1];
        functionunit.editlist.Items[i].StringGrid1.RowCount:=
        functionunit.editlist.Items[i].StringGrid1.RowCount + 1;
      end;
      k := functionunit.editlist.Items[i].StringGrid1.RowCount;
      dec(k);
      functionunit.editlist.Items[i].StringGrid1.RowCount := k;
              //combobox2.Items.Text := st.Text;

    except

    end;
    SysUtils.DeleteFile(fileName);
    st.Free;
    st2.Free;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  drvfile.Free;
  sqldrv.Free;
  form1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  st,st2:TStringList;
  i:integer;
begin
  try
    st := TStringList.Create;
    st2 := TStringList.Create;
    st2.Clear;
    SQLType.Items.Clear;
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
      SQLType.Items.Add(st2[2]);
      portNo.Add(st2[3]);
    end;
    st.free;
    st2.Free;
  except

  end;
end;

procedure TForm1.SQLTypeChange(Sender: TObject);
var
  i,i2:integer;
  s:string;
begin
  i2 := SQLType.ItemIndex;
  //s := SQLType.Items[i2];
  //i2 :=  SQLType.items.IndexOf(s);
  if i2 > -1 then begin
    if PortNo[i2] = 'non' then begin
      edit1.Text := '';
      exit;
    end;
    edit1.Text := PortNo[i2];
  end;
end;

procedure TForm1.SQLTypeClick(Sender: TObject);
begin
  if SQLType.Text = 'sqlite' then begin
    if not OpenDialog1.Execute then
      exit;
    host1.Text:= OpenDialog1.FileName;
  end;
end;

end.

