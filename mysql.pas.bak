unit MySQL;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql55conn, mysql56conn, mysql40conn, mysql41conn,
  mysql50conn, mysql51conn, sqldb, pqconnection, mssqlconn, sqlite3conn,
  odbcconn, db, FileUtil, SynEdit, SynHighlighterSQL, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls,
  {$ IFDEF FPC}
     LCLIntf, LCLType, LMessages
  {$ ENDIF}
  ;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    database: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    PQConnection1: TPQConnection;
    SQLType: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    host1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    MSSQLConnection1: TMSSQLConnection;
    MySQL40Connection1: TMySQL40Connection;
    MySQL41Connection1: TMySQL41Connection;
    MySQL50Connection1: TMySQL50Connection;
    MySQL51Connection1: TMySQL51Connection;
    MySQL55Connection1: TMySQL55Connection;
    SQLConnection: TMySQL56Connection;
    ODBCConnection1: TODBCConnection;
    SQLite3Connection1: TSQLite3Connection;
    user1: TEdit;
    pass1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SynEdit1: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { private declarations }
    sqlset1,sqlset2:string;

  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses interfaceunit, mainform, functionunit, unit_edit;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
  i := main.PageControl1.PageIndex;
  function_unit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  case sqltype.Text of
    'SQLLite':begin
      SQLite3Connection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := SQLite3Connection1;
      SQLQuery1.DataBase := SQLite3Connection1;

      SQLite3Connection1.HostName := host1.Text;
      SQLite3Connection1.UserName := user1.Text;
      SQLite3Connection1.Password := pass1.Text;
      SQLite3Connection1.DatabaseName:= database.Text;

      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      SQLite3Connection1.Open;
        // First lets get a list of available databases.
        if SQLite3Connection1.Connected then begin
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
        end;
    end;
    'ODBC':begin
      ODBCConnection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := ODBCConnection1;
      SQLQuery1.DataBase := ODBCConnection1;

      ODBCConnection1.HostName := host1.Text;
      ODBCConnection1.UserName := user1.Text;
      ODBCConnection1.Password := pass1.Text;
      ODBCConnection1.DatabaseName:= database.Text;

      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      ODBCConnection1.Open;
        // First lets get a list of available databases.
        if ODBCConnection1.Connected then begin
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
        end;
    end;
    'SQLServer':begin
      MSSQLConnection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MSSQLConnection1;
      SQLQuery1.DataBase := MSSQLConnection1;

      MSSQLConnection1.HostName := host1.Text;
      MSSQLConnection1.UserName := user1.Text;
      MSSQLConnection1.Password := pass1.Text;
      MSSQLConnection1.DatabaseName:= database.Text;

      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      MSSQLConnection1.Open;
        // First lets get a list of available databases.
        if MSSQLConnection1.Connected then begin
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
        end;
    end;

    'PostgrSQL':begin
        PQConnection1.Transaction := SQLTransaction1;
        SQLTransaction1.DataBase := PQConnection1;
        SQLQuery1.DataBase := PQConnection1;

         PQConnection1.HostName := host1.Text;
        PQConnection1.UserName := user1.Text;
        PQConnection1.Password := pass1.Text;
        PQConnection1.DatabaseName:= database.Text;

        function_unit.editlist.Items[i].host:=host1.Text;
        function_unit.editlist.Items[i].user:=user1.Text;
        function_unit.editlist.Items[i].pass:=pass1.Text;
        function_unit.editlist.Items[i].database:=database.TextHint;

         PQConnection1.Open;
          // First lets get a list of available databases.
          if PQConnection1.Connected then begin
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
          end;
    end;

    'MySQL4.0':begin
        MySQL40Connection1.Transaction := SQLTransaction1;
        SQLTransaction1.DataBase := MySQL40Connection1;
        SQLQuery1.DataBase := MySQL40Connection1;

         MySQL40Connection1.HostName := host1.Text;
        MySQL40Connection1.UserName := user1.Text;
        MySQL40Connection1.Password := pass1.Text;
        MySQL40Connection1.DatabaseName:= database.Text;

        MySQL40Connection1.Port:= strtoint(edit1.Text);
        function_unit.editlist.Items[i].host:=host1.Text;
        function_unit.editlist.Items[i].user:=user1.Text;
        function_unit.editlist.Items[i].pass:=pass1.Text;
        function_unit.editlist.Items[i].database:=database.TextHint;

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
          end;
    end;
    'MySQL4.1':begin
      MySQL41Connection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MySQL41Connection1;
      SQLQuery1.DataBase := MySQL41Connection1;

      MySQL41Connection1.HostName := host1.Text;
      MySQL41Connection1.UserName := user1.Text;
      MySQL41Connection1.Password := pass1.Text;
      MySQL41Connection1.DatabaseName:= database.Text;

      MySQL41Connection1.Port:= strtoint(edit1.Text);
      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      MySQL41Connection1.Open;
        // First lets get a list of available databases.
        if MySQL41Connection1.Connected then begin
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
        end;
    end;
    'MySQL5.0':begin
      MySQL50Connection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MySQL50Connection1;
      SQLQuery1.DataBase := MySQL50Connection1;

      MySQL50Connection1.HostName := host1.Text;
      MySQL50Connection1.UserName := user1.Text;
      MySQL50Connection1.Password := pass1.Text;
      MySQL50Connection1.DatabaseName:= database.Text;

      MySQL50Connection1.Port:= strtoint(edit1.Text);
      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      MySQL50Connection1.Open;
        // First lets get a list of available databases.
        if MySQL50Connection1.Connected then begin
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
        end;
    end;
    'MySQL5.1':begin
      MySQL51Connection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MySQL51Connection1;
      SQLQuery1.DataBase := MySQL51Connection1;

      MySQL51Connection1.HostName := host1.Text;
      MySQL51Connection1.UserName := user1.Text;
      MySQL51Connection1.Password := pass1.Text;
      MySQL51Connection1.DatabaseName:= database.Text;

      MySQL51Connection1.Port:= strtoint(edit1.Text);
      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      MySQL51Connection1.Open;
        // First lets get a list of available databases.
        if MySQL51Connection1.Connected then begin
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
        end;
    end;
    'MySQL5.5':begin
      MySQL55Connection1.Transaction := SQLTransaction1;
      SQLTransaction1.DataBase := MySQL55Connection1;
      SQLQuery1.DataBase := MySQL55Connection1;

      MySQL55Connection1.HostName := host1.Text;
      MySQL55Connection1.UserName := user1.Text;
      MySQL55Connection1.Password := pass1.Text;
      MySQL55Connection1.DatabaseName:= database.Text;

      MySQL55Connection1.Port:= strtoint(edit1.Text);
      function_unit.editlist.Items[i].host:=host1.Text;
      function_unit.editlist.Items[i].user:=user1.Text;
      function_unit.editlist.Items[i].pass:=pass1.Text;
      function_unit.editlist.Items[i].database:=database.TextHint;

      MySQL55Connection1.Open;
        // First lets get a list of available databases.
        if MySQL55Connection1.Connected then begin
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
        end;
    end;
    'MySQL5.6':begin
        SQLConnection.Transaction := SQLTransaction1;
        SQLTransaction1.DataBase := SQLConnection;
        SQLQuery1.DataBase := SQLConnection;

        SQLConnection.HostName := host1.Text;
        SQLConnection.UserName := user1.Text;
        SQLConnection.Password := pass1.Text;
        SQLConnection.DatabaseName:= database.Text;

        SQLConnection.Port:= strtoint(edit1.Text);
        function_unit.editlist.Items[i].host:=host1.Text;
        function_unit.editlist.Items[i].user:=user1.Text;
        function_unit.editlist.Items[i].pass:=pass1.Text;
        function_unit.editlist.Items[i].database:=database.TextHint;

        SQLConnection.Open;
          // First lets get a list of available databases.
          if SQLConnection.Connected then begin
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
          end;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
begin
  i := main.PageControl1.PageIndex;
  function_unit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  case sqltype.Text of
      'SQLLite':begin
            if ComboBox1.ItemIndex <> -1 then begin
                    with ComboBox1 do
                      SQLite3Connection1.DatabaseName := Items[ItemIndex];
                    function_unit.editlist.Items[i].database:=SQLite3Connection1.DatabaseName;
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
                  end;
      end;
      'ODBC':begin
          if ComboBox1.ItemIndex <> -1 then begin
                 with ComboBox1 do
                   ODBCConnection1.DatabaseName := Items[ItemIndex];
                 function_unit.editlist.Items[i].database:=ODBCConnection1.DatabaseName;
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
               end;
      end;
      'SQLServer':begin
        if ComboBox1.ItemIndex <> -1 then begin
               with ComboBox1 do
                 MSSQLConnection1.DatabaseName := Items[ItemIndex];
               function_unit.editlist.Items[i].database:=MSSQLConnection1.DatabaseName;
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
             end;
      end;
      'MySQL4.0':begin
          if ComboBox1.ItemIndex <> -1 then begin
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
             end;
      end;
      'MySQL4.1':begin
            if ComboBox1.ItemIndex <> -1 then begin
                 with ComboBox1 do
                   MySQL41Connection1.DatabaseName := Items[ItemIndex];
                 function_unit.editlist.Items[i].database:=MySQL41Connection1.DatabaseName;
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
               end;
      end;
      'MySQL5.0':begin
          if ComboBox1.ItemIndex <> -1 then begin
               with ComboBox1 do
                 MySQL50Connection1.DatabaseName := Items[ItemIndex];
               function_unit.editlist.Items[i].database:=MySQL50Connection1.DatabaseName;
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
             end;
      end;
      'MySQL5.1':begin
          if ComboBox1.ItemIndex <> -1 then begin
               with ComboBox1 do
                 MySQL51Connection1.DatabaseName := Items[ItemIndex];
               function_unit.editlist.Items[i].database:=MySQL51Connection1.DatabaseName;
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
             end;
      end;
      'MySQL5.5':begin
          if ComboBox1.ItemIndex <> -1 then begin
               with ComboBox1 do
                 MySQL55Connection1.DatabaseName := Items[ItemIndex];
               function_unit.editlist.Items[i].database:=MySQL55Connection1.DatabaseName;
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
             end;
      end;
      'MySQL5.6':begin
          if ComboBox1.ItemIndex <> -1 then begin
              with ComboBox1 do
                SQLConnection.DatabaseName := Items[ItemIndex];
              function_unit.editlist.Items[i].database:=SQLConnection.DatabaseName;
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
            end;
      end;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i:integer;
begin
  i := main.PageControl1.PageIndex;
  function_unit.editlist.Items[i].SQLType.Text:= sqltype.Text;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := form1.SynEdit1.Lines.Text;
  SQLQuery1.Open;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  sqlset2 := ' ' + ComboBox2.Text;
  form1.SynEdit1.Lines.Text := sqlset1 + sqlset2;
end;

end.

