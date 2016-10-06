unit SQLite3;

{
  Simplified interface for SQLite.

  This version :Ported to D2009 Unicode by Roger Lascelles (support@veecad.com)
  V2.0.0  29 June 2010

  History
  Reworked by Luk癩 Gebauer at http://www.ararat.cz/doku.php/en:sqlitewrap.
  Updated for Sqlite 3 by Tim Anderson (tim@itwriting.com)
  Note: NOT COMPLETE for version 3, just minimal functionality
  Adapted from file created by Pablo Pissanetzky (pablo@myhtpc.net)
  which was based on SQLite.pas by Ben Hochstrasser (bhoc@surfeu.ch)

  Require: Delphi 6+, FreePascal
  Sqlite 3.7.1+
}

{$IFDEF FPC}
  {$MODE DELPHI}
  {$H+}            (* use AnsiString *)
  {$PACKENUM 4}    (* use 4-byte enums *)
  {$PACKRECORDS C} (* C/C++-compatible record packing *)
{$ELSE}
  {$MINENUMSIZE 4} (* use 4-byte enums *)
{$ENDIF}

interface

const
{$IF Defined(MSWINDOWS)}
  SQLiteDLL = 'sqlite3.dll';
{$ELSEIF Defined(DARWIN)}
  SQLiteDLL = 'libsqlite3.dylib';
  {$linklib libsqlite3}
{$ELSEIF Defined(UNIX)}
  SQLiteDLL = 'sqlite3.so';
{$IFEND}

// Return values for sqlite3_exec() and sqlite3_step()

const
  SQLITE_OK          =  0; // Successful result
  (* beginning-of-error-codes *)
  SQLITE_ERROR       =  1; // SQL error or missing database
  SQLITE_INTERNAL    =  2; // An internal logic error in SQLite
  SQLITE_PERM        =  3; // Access permission denied
  SQLITE_ABORT       =  4; // Callback routine requested an abort
  SQLITE_BUSY        =  5; // The database file is locked
  SQLITE_LOCKED      =  6; // A table in the database is locked
  SQLITE_NOMEM       =  7; // A malloc() failed
  SQLITE_READONLY    =  8; // Attempt to write a readonly database
  SQLITE_INTERRUPT   =  9; // Operation terminated by sqlite3_interrupt()
  SQLITE_IOERR       = 10; // Some kind of disk I/O error occurred
  SQLITE_CORRUPT     = 11; // The database disk image is malformed
  SQLITE_NOTFOUND    = 12; // (Internal Only) Table or record not found
  SQLITE_FULL        = 13; // Insertion failed because database is full
  SQLITE_CANTOPEN    = 14; // Unable to open the database file
  SQLITE_PROTOCOL    = 15; // Database lock protocol error
  SQLITE_EMPTY       = 16; // Database is empty
  SQLITE_SCHEMA      = 17; // The database schema changed
  SQLITE_TOOBIG      = 18; // Too much data for one row of a table
  SQLITE_CONSTRAINT  = 19; // Abort due to contraint violation
  SQLITE_MISMATCH    = 20; // Data type mismatch
  SQLITE_MISUSE      = 21; // Library used incorrectly
  SQLITE_NOLFS       = 22; // Uses OS features not supported on host
  SQLITE_AUTH        = 23; // Authorization denied
  SQLITE_FORMAT      = 24; // Auxiliary database format error
  SQLITE_RANGE       = 25; // 2nd parameter to sqlite3_bind out of range
  SQLITE_NOTADB      = 26; // File opened that is not a database file
  SQLITE_ROW         = 100; // sqlite3_step() has another row ready
  SQLITE_DONE        = 101; // sqlite3_step() has finished executing

  SQLITE_INTEGER = 1;
  SQLITE_FLOAT   = 2;
  SQLITE_TEXT    = 3;
  SQLITE_BLOB    = 4;
  SQLITE_NULL    = 5;

  SQLITE_UTF8     = 1;
  SQLITE_UTF16    = 2;
  SQLITE_UTF16BE  = 3;
  SQLITE_UTF16LE  = 4;
  SQLITE_ANY      = 5;

  SQLITE_STATIC    {: TSQLite3Destructor} = Pointer(0);
  SQLITE_TRANSIENT {: TSQLite3Destructor} = Pointer(-1);

type
  TSQLiteDB = Pointer;
  TSQLiteResult = ^PAnsiChar;
  TSQLiteStmt = Pointer;

type
  PPAnsiCharArray = ^TPAnsiCharArray; 
  TPAnsiCharArray = array[0 .. (MaxInt div SizeOf(PAnsiChar))-1] of PAnsiChar;

type
  TSQLiteExecCallback = function(UserData: Pointer; NumCols: integer; ColValues:
    PPAnsiCharArray; ColNames: PPAnsiCharArray): integer; cdecl;
  TSQLiteBusyHandlerCallback = function(UserData: Pointer; P2: integer): integer; cdecl;

  //function prototype for define own collate
  TCollateXCompare = function(UserData: pointer; Buf1Len: integer; Buf1: pointer;
    Buf2Len: integer; Buf2: pointer): integer; cdecl;


//function SQLite3_Initialize(): integer; cdecl; external SQLiteDLL name 'sqlite3_initialize';
//function SQLite3_Shutdown(): integer; //cdecl; external SQLiteDLL name 'sqlite3_shutdown';

//function SQLite3_Open(filename: PAnsiChar; var db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_open';

//function SQLite3_Close(db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_close';

//function SQLite3_Exec(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer; cdecl; external SQLiteDLL name 'sqlite3_exec';
//function SQLite3_Version(): PAnsiChar; cdecl; external SQLiteDLL name 'sqlite3_libversion';
//function SQLite3_ErrMsg(db: TSQLiteDB): PAnsiChar; cdecl; external SQLiteDLL name 'sqlite3_errmsg';
//function SQLite3_ErrCode(db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_errcode';
//procedure SQlite3_Free(P: PAnsiChar); cdecl; external SQLiteDLL name 'sqlite3_free';
//function SQLite3_GetTable(db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer; cdecl; external SQLiteDLL name 'sqlite3_get_table';
//procedure SQLite3_FreeTable(Table: TSQLiteResult); cdecl; external SQLiteDLL name 'sqlite3_free_table';
//function SQLite3_Complete(P: PAnsiChar): boolean; cdecl; external SQLiteDLL name 'sqlite3_complete';
//function SQLite3_LastInsertRowID(db: TSQLiteDB): int64; cdecl; external SQLiteDLL name 'sqlite3_last_insert_rowid';
//procedure SQLite3_Interrupt(db: TSQLiteDB); cdecl; external SQLiteDLL name 'sqlite3_interrupt';
//procedure SQLite3_BusyHandler(db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer); cdecl; external SQLiteDLL name 'sqlite3_busy_handler';
//procedure SQLite3_BusyTimeout(db: TSQLiteDB; TimeOut: integer); cdecl; external SQLiteDLL name 'sqlite3_busy_timeout';
//function SQLite3_Changes(db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_changes';
//function SQLite3_TotalChanges(db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_total_changes';
//function SQLite3_Prepare(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer; cdecl; external SQLiteDLL name 'sqlite3_prepare';
//function SQLite3_Prepare_v2(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer; cdecl; external SQLiteDLL name 'sqlite3_prepare_v2';
//function SQLite3_ColumnCount(hStmt: TSqliteStmt): integer; cdecl; external SQLiteDLL name 'sqlite3_column_count';
//function SQLite3_ColumnName(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl; external SQLiteDLL name 'sqlite3_column_name';
//function SQLite3_ColumnDeclType(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl; external SQLiteDLL name 'sqlite3_column_decltype';
//function SQLite3_Step(hStmt: TSqliteStmt): integer; cdecl; external SQLiteDLL name 'sqlite3_step';
//function SQLite3_DataCount(hStmt: TSqliteStmt): integer; cdecl; external SQLiteDLL name 'sqlite3_data_count';

//function SQLite3_ColumnBlob(hStmt: TSqliteStmt; ColNum: integer): pointer; cdecl; external SQLiteDLL name 'sqlite3_column_blob';
//function SQLite3_ColumnBytes(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl; external SQLiteDLL name 'sqlite3_column_bytes';
//function SQLite3_ColumnDouble(hStmt: TSqliteStmt; ColNum: integer): double; cdecl; external SQLiteDLL name 'sqlite3_column_double';
//function SQLite3_ColumnInt(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl; external SQLiteDLL name 'sqlite3_column_int';
//function SQLite3_ColumnText(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar; cdecl; external SQLiteDLL name 'sqlite3_column_text';
//function SQLite3_ColumnType(hStmt: TSqliteStmt; ColNum: integer): integer; cdecl; external SQLiteDLL name 'sqlite3_column_type';
//function SQLite3_ColumnInt64(hStmt: TSqliteStmt; ColNum: integer): Int64; cdecl; external SQLiteDLL name 'sqlite3_column_int64';
//function SQLite3_Finalize(hStmt: TSqliteStmt): integer; cdecl; external SQLiteDLL name 'sqlite3_finalize';
//function SQLite3_Reset(hStmt: TSqliteStmt): integer; cdecl; external SQLiteDLL name 'sqlite3_reset';
//function SQLite3_Get_Autocommit(db: TSQLiteDB): integer; cdecl; external SQLiteDLL name 'sqlite3_get_autocommit';
//function SQLite3_enable_load_extension(db: TSQLiteDB; OnOff: integer): integer; cdecl; external SQLiteDLL name 'sqlite3_enable_load_extension';

const
  SQLITE_FCNTL_LOCKSTATE       = 1;
  SQLITE_GET_LOCKPROXYFILE     = 2;
  SQLITE_SET_LOCKPROXYFILE     = 3;
  SQLITE_LAST_ERRNO            = 4;
  SQLITE_FCNTL_SIZE_HINT       = 5;
  SQLITE_FCNTL_CHUNK_SIZE      = 6;
  SQLITE_FCNTL_FILE_POINTER    = 7;
  SQLITE_FCNTL_SYNC_OMITTED    = 8;
//function SQLite3_file_control(db: TSQLiteDB; filename: PAnsiChar; option: integer; data: pointer): integer; cdecl; external SQLiteDLL name 'sqlite3_file_control';

// In the SQL strings input to sqlite3_prepare() and sqlite3_prepare16(),
// one or more literals can be replace by a wildcard "?" or ":N:" where
// N is an integer.  These value of these wildcard literals can be set
// using the routines listed below.
//
// In every case, the first parameter is a pointer to the sqlite3_stmt
// structure returned from sqlite3_prepare().  The second parameter is the
// index of the wildcard.  The first "?" has an index of 1.  ":N:" wildcards
// use the index N.
//
// The fifth parameter to sqlite3_bind_blob(), sqlite3_bind_text(), and
//sqlite3_bind_text16() is a destructor used to dispose of the BLOB or
//text after SQLite has finished with it.  If the fifth argument is the
// special value SQLITE_STATIC, then the library assumes that the information
// is in static, unmanaged space and does not need to be freed.  If the
// fifth argument has the value SQLITE_TRANSIENT, then SQLite makes its
// own private copy of the data.
// 
// The sqlite3_bind_* routine must be called before sqlite3_step() after
// an sqlite3_prepare() or sqlite3_reset().  Unbound wildcards are interpreted
// as NULL.
// 

type
  TSQLite3Destructor = procedure(Ptr: Pointer); cdecl;

function sqlite3_bind_blob(hStmt: TSqliteStmt; ParamNum: integer;
  ptrData: pointer; numBytes: integer; ptrDestructor: TSQLite3Destructor): integer;
cdecl; external SQLiteDLL name 'sqlite3_bind_blob';
function sqlite3_bind_text(hStmt: TSqliteStmt; ParamNum: integer;
  Text: PAnsiChar; numBytes: integer; ptrDestructor: TSQLite3Destructor): integer;
cdecl; external SQLiteDLL name 'sqlite3_bind_text';
function sqlite3_bind_double(hStmt: TSqliteStmt; ParamNum: integer; Data: Double): integer;
  cdecl; external SQLiteDLL name 'sqlite3_bind_double';
function sqlite3_bind_int(hStmt: TSqLiteStmt; ParamNum: integer; Data: integer): integer;
  cdecl; external SQLiteDLL name 'sqlite3_bind_int';
function sqlite3_bind_int64(hStmt: TSqliteStmt; ParamNum: integer; Data: int64): integer;
  cdecl; external SQLiteDLL name 'sqlite3_bind_int64';
function sqlite3_bind_null(hStmt: TSqliteStmt; ParamNum: integer): integer;
  cdecl; external SQLiteDLL name 'sqlite3_bind_null';

function sqlite3_bind_parameter_index(hStmt: TSqliteStmt; zName: PAnsiChar): integer;
  cdecl; external SQLiteDLL name 'sqlite3_bind_parameter_index';
function sqlite3_clear_bindings(hStmt: TSqliteStmt): integer;
  cdecl; external SQLiteDLL name 'sqlite3_clear_bindings';

function sqlite3_enable_shared_cache(Value: integer): integer; cdecl; external SQLiteDLL name 'sqlite3_enable_shared_cache';

//user collate definiton
function SQLite3_create_collation(db: TSQLiteDB; Name: PAnsiChar; eTextRep: integer;
  UserData: pointer; xCompare: TCollateXCompare): integer; cdecl; external SQLiteDLL name 'sqlite3_create_collation';


function SQLite3_Initialize(): integer; //cdecl; external SQLiteDLL name 'sqlite3_initialize';
function SQLite3_Shutdown(): integer; //cdecl; external SQLiteDLL name 'sqlite3_shutdown';

function SQLite3_Open(filename: PAnsiChar; var db: TSQLiteDB): integer; //cdecl; external SQLiteDLL name 'sqlite3_open';
function SQLite3_Close(db: TSQLiteDB): integer;// cdecl; external SQLiteDLL name 'sqlite3_close';
function SQLite3_Exec(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer; //cdecl; external SQLiteDLL name 'sqlite3_exec';
function SQLite3_Version(): PAnsiChar;// cdecl; external SQLiteDLL name 'sqlite3_libversion';
function SQLite3_ErrMsg(db: TSQLiteDB): PAnsiChar; //cdecl; external SQLiteDLL name 'sqlite3_errmsg';
function SQLite3_ErrCode(db: TSQLiteDB): integer;// cdecl; external SQLiteDLL name 'sqlite3_errcode';
procedure SQlite3_Free(P: PAnsiChar); //cdecl; external SQLiteDLL name 'sqlite3_free';
function SQLite3_GetTable(db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer; //cdecl; external SQLiteDLL name 'sqlite3_get_table';
procedure SQLite3_FreeTable(Table: TSQLiteResult); //cdecl; external SQLiteDLL name 'sqlite3_free_table';

function SQLite3_Complete(P: PAnsiChar): boolean; //cdecl; external SQLiteDLL name 'sqlite3_complete';
function SQLite3_LastInsertRowID(db: TSQLiteDB): int64;// cdecl; external SQLiteDLL name 'sqlite3_last_insert_rowid';
procedure SQLite3_Interrupt(db: TSQLiteDB);// cdecl; external SQLiteDLL name 'sqlite3_interrupt';
procedure SQLite3_BusyHandler(db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer);// cdecl; external SQLiteDLL name 'sqlite3_busy_handler';
procedure SQLite3_BusyTimeout(db: TSQLiteDB; TimeOut: integer);// cdecl; external SQLiteDLL name 'sqlite3_busy_timeout';
function SQLite3_Changes(db: TSQLiteDB): integer;// cdecl; external SQLiteDLL name 'sqlite3_changes';
function SQLite3_TotalChanges(db: TSQLiteDB): integer;// cdecl; external SQLiteDLL name 'sqlite3_total_changes'
function SQLite3_ColumnCount(hStmt: TSqliteStmt): integer;// cdecl; external SQLiteDLL name 'sqlite3_column_count';
function SQLite3_ColumnName(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;// cdecl; external SQLiteDLL name 'sqlite3_column_name';
function SQLite3_ColumnDeclType(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;// cdecl; external SQLiteDLL name 'sqlite3_column_decltype';
function SQLite3_Step(hStmt: TSqliteStmt): integer;// cdecl; external SQLiteDLL name 'sqlite3_step';
function SQLite3_DataCount(hStmt: TSqliteStmt): integer;// cdecl; external SQLiteDLL name 'sqlite3_data_count';
function SQLite3_ColumnBlob(hStmt: TSqliteStmt; ColNum: integer): pointer;// cdecl; external SQLiteDLL name 'sqlite3_column_blob';
function SQLite3_ColumnBytes(hStmt: TSqliteStmt; ColNum: integer): integer;// cdecl; external SQLiteDLL name 'sqlite3_column_bytes';
function SQLite3_ColumnDouble(hStmt: TSqliteStmt; ColNum: integer): double;// cdecl; external SQLiteDLL name 'sqlite3_column_double';
function SQLite3_ColumnInt(hStmt: TSqliteStmt; ColNum: integer): integer;// cdecl; external SQLiteDLL name 'sqlite3_column_int';
function SQLite3_ColumnText(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;// cdecl; external SQLiteDLL name 'sqlite3_column_text';
function SQLite3_ColumnType(hStmt: TSqliteStmt; ColNum: integer): integer;// cdecl; external SQLiteDLL name 'sqlite3_column_type';
function SQLite3_ColumnInt64(hStmt: TSqliteStmt; ColNum: integer): Int64;// cdecl; external SQLiteDLL name 'sqlite3_column_int64';
function SQLite3_Finalize(hStmt: TSqliteStmt): integer;// cdecl; external SQLiteDLL name 'sqlite3_finalize';
function SQLite3_Reset(hStmt: TSqliteStmt): integer;// cdecl; external SQLiteDLL name 'sqlite3_reset';
function SQLite3_Get_Autocommit(db: TSQLiteDB): integer;// cdecl; external SQLiteDLL name 'sqlite3_get_autocommit';
function SQLite3_enable_load_extension(db: TSQLiteDB; OnOff: integer): integer;// cdecl; external SQLiteDLL name 'sqlite3_enable_load_extension';


function SQLite3_Prepare(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer;// cdecl; external SQLiteDLL name 'sqlite3_prepare';
function SQLite3_Prepare_v2(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer;// cdecl; external SQLiteDLL name 'sqlite3_prepare_v2';
function SQLite3_file_control(db: TSQLiteDB; filename: PAnsiChar; option: integer; data: pointer): integer;// cdecl; external SQLiteDLL name 'sqlite3_file_control';



function SQLiteFieldType(SQLiteFieldTypeCode: Integer): String;
function SQLiteErrorStr(SQLiteErrorCode: Integer): String;

implementation

uses
  Windows, SysUtils, Classes,Graphics, Controls, Forms, Dialogs;

type
  TReturnDllCommand_word= function : word;
  TReturnDllCommand_int= function : integer;
  TReturnDllCommand_int2= function(db:TSQLiteDB) : integer;

  TReturnDllCommand_str= function : string;
  TReturnDllCommand_pachr= function : PAnsiChar;
  TReturnDllCommand_pachr2= function : PAnsiChar;
  TReturnDllCommand_db= function(f_name:PansiChar;db:TSQLiteDB):integer;
  TReturnDllCommand_db2= function(db:TSQLiteDB):integer;
  TReturnDllCommand_db3= function(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer;
  TReturnDllCommand_db4= function(db:TSQLiteDB):PAnsiChar;
  TReturnDllCommand_db5= function(f_name:PansiChar;db:TSQLiteDB):PAnsiChar;
  TReturnDllCommand_db6= function(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar):integer;
  TReturnDllCommand_db7= function(db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer;
  TReturnDllCommand_db8= procedure(Table: TSQLiteResult);
  TReturnDllCommand_db9= function(P: PAnsiChar): boolean;
  TReturnDllCommand_db10= function(db: TSQLiteDB): int64;
  TReturnDllCommand_db11= procedure(db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer);
  TReturnDllCommand_db12= procedure(db: TSQLiteDB; TimeOut: integer);
  TReturnDllCommand_smt= function(hStmt: TSqliteStmt): integer;
  TReturnDllCommand_smt2= function(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;
  TReturnDllCommand_smt3= function(hStmt: TSqliteStmt; ColNum: integer): integer;
  TReturnDllCommand_smt4= function(hStmt: TSqliteStmt; ColNum: integer): int64;
  TReturnDllCommand_db13= function(db: TSQLiteDB; OnOff: integer): integer;
  TReturnDllCommand_db14=function(db: TSQLiteDB; filename: PAnsiChar; option: integer; data: pointer): integer;
var
  ReturnDllCommand_word : TReturnDllCommand_word;
  ReturnDllCommand_int : TReturnDllCommand_int;
  ReturnDllCommand_int2 : TReturnDllCommand_int2;
  ReturnDllCommand_str : TReturnDllCommand_str;
  ReturnDllCommand_pachr : TReturnDllCommand_pachr;
  ReturnDllCommand_pachr2 : TReturnDllCommand_pachr2;
  ReturnDllCommand_db : TReturnDllCommand_db;
  ReturnDllCommand_db2 : TReturnDllCommand_db2;
  ReturnDllCommand_db3 : TReturnDllCommand_db3;
  ReturnDllCommand_db4 : TReturnDllCommand_db4;
  ReturnDllCommand_db5 : TReturnDllCommand_db5;
  ReturnDllCommand_db6 : TReturnDllCommand_db6;
  ReturnDllCommand_db7 : TReturnDllCommand_db7;
  ReturnDllCommand_db8 : TReturnDllCommand_db8;
  ReturnDllCommand_db9 : TReturnDllCommand_db9;
  ReturnDllCommand_db10 : TReturnDllCommand_db10;
  ReturnDllCommand_db11: TReturnDllCommand_db11;
  ReturnDllCommand_db12:TReturnDllCommand_db12;
  ReturnDllCommand_smt:TReturnDllCommand_smt;
  ReturnDllCommand_smt2:TReturnDllCommand_smt2;
  ReturnDllCommand_smt3:TReturnDllCommand_smt3;
  ReturnDllCommand_smt4:TReturnDllCommand_smt4;
  ReturnDllCommand_db13:TReturnDllCommand_db13;
  ReturnDllCommand_db14:TReturnDllCommand_db14;
  DLLHandles,DLLHandles2:THandle;


function run_dll_word(dll_name,command:string):word;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand_word := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand_word <> nil then begin
      run_dll_word := ReturnDllCommand_word;
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_int(dll_name,command:string):integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand_int := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand_int <> nil then begin
      run_dll_int := ReturnDllCommand_int;
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_str(dll_name,command:string):string;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand_str := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand_str <> nil then begin
      run_dll_str := ReturnDllCommand_str;
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_pachr(dll_name,command:string):PAnsiChar;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand_pachr := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand_pachr <> nil then begin
      run_dll_pachr := ReturnDllCommand_pachr;
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_pachr2(dll_name,command:string;db: TSQLiteDB):PAnsiChar;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand_db4 := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand_db4 <> nil then begin
      run_dll_pachr2 := ReturnDllCommand_db4(db);
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_end(dll_name,command:string;f_name:PansiChar;db:TSQLiteDB):integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_int2 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_int2 <> nil then begin
        showmessage(f_name);
        run_dll_end := ReturnDllCommand_int2(db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_open(dll_name,command:string;f_name:PansiChar;db:TSQLiteDB):integer;
begin
  DLLHandles := LoadLibrary(pchar(dll_name));
  if DLLHandles <> 0 then begin

      @ReturnDllCommand_db := GetProcAddress(DLLHandles, pchar(command));
      if @ReturnDllCommand_db <> nil then begin
        run_dll_open :=ReturnDllCommand_db(f_name,db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      //FreeLibrary(DLLHandles);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;


function run_dll_db(dll_name,command:string;f_name:PansiChar;db:TSQLiteDB):integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    if f_name <> '' then begin
      @ReturnDllCommand_db := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db <> nil then begin
        showmessage(f_name);
        run_dll_db := ReturnDllCommand_db(f_name,db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
    end else begin
      @ReturnDllCommand_db2 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db2 <> nil then begin
        run_dll_db := ReturnDllCommand_db2(db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
    end;
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_db2(dll_name,command:string;db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar):integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db3 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db3 <> nil then begin
        run_dll_db2 := ReturnDllCommand_db3(db, SQLStatement, CallbackPtr, UserData, ErrMsg);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_db_pachr(dll_name,command:string;f_name:PansiChar;db:TSQLiteDB):PAnsiChar;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    if f_name <> '' then begin
      @ReturnDllCommand_db5 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db5 <> nil then begin
        run_dll_db_pachr := ReturnDllCommand_db5(f_name,db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
    end else begin
      @ReturnDllCommand_db4 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db4 <> nil then begin
        run_dll_db_pachr := ReturnDllCommand_db4(db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
    end;
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_db_Prepare(dll_name,command:string; db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer;
var
  DLLHandle:THandle;
begin
  DLLHandles2 := LoadLibrary(pchar(dll_name));
  if DLLHandles2 <> 0 then begin
      @ReturnDllCommand_db6 := GetProcAddress(DLLHandles2, pchar(command));
      if @ReturnDllCommand_db6 <> nil then begin
        run_dll_db_Prepare:= ReturnDllCommand_db6(db, SQLStatement, nBytes, hStmt, pzTail);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      //FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
  exit;
end;

function run_dll_SQLite3_GetTable(dll_name,command:string; db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar):integer;
var
  DLLHandle:THandle;
begin
  DLLHandles := LoadLibrary(pchar(dll_name));
  if DLLHandles <> 0 then begin
      @ReturnDllCommand_db7 := GetProcAddress(DLLHandles, pchar(command));
      if @ReturnDllCommand_db7 <> nil then begin
        run_dll_SQLite3_GetTable := ReturnDllCommand_db7( db, SQLStatement, ResultPtr, RowCount, ColCount, ErrMsg);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      //FreeLibrary(DLLHandles);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

procedure run_dll_FreeTable(dll_name,command:string;Table: TSQLiteResult);
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db8 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db8 <> nil then begin
        ReturnDllCommand_db8(Table);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_Complete(dll_name,command:string; P: PAnsiChar): boolean;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db9 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db9 <> nil then begin
        run_dll_SQLite3_Complete := ReturnDllCommand_db9( p);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;


function run_dll_SQLite3_LastInsertRowID(dll_name,command:string; db: TSQLiteDB):int64;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db10 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db10 <> nil then begin
        run_dll_SQLite3_LastInsertRowID := ReturnDllCommand_db10( db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

procedure run_dll_SQLite3_Interrupt(dll_name,command:string;db: TSQLiteDB);
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db10 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db10 <> nil then begin
        ReturnDllCommand_db10( db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

procedure run_dll_SQLite3_BusyHandler(dll_name,command:string;db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer);
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db11 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db11 <> nil then begin
        ReturnDllCommand_db11( db, CallbackPtr, UserData);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

procedure run_dll_SQLite3_SQLite3_BusyTimeout(dll_name,command:string;db: TSQLiteDB; TimeOut: integer);
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db12 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db12 <> nil then begin
        ReturnDllCommand_db12(db, TimeOut);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_Changes(dll_name,command:string;db: TSQLiteDB): integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db2 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db2 <> nil then begin
        run_dll_SQLite3_Changes := ReturnDllCommand_db2(db);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_SQLite3_ColumnCount(dll_name,command:string;hStmt: TSqliteStmt): integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_smt := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_smt <> nil then begin
        run_dll_SQLite3_SQLite3_ColumnCount := ReturnDllCommand_smt(hStmt);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_SQLite3_ColumnName(dll_name,command:string;hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_smt2 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_smt2 <> nil then begin
        run_dll_SQLite3_SQLite3_ColumnName := ReturnDllCommand_smt2(hStmt, ColNum);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_SQLite3_Column(dll_name,command:string;hStmt: TSqliteStmt; ColNum: integer): integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_smt3 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_smt3 <> nil then begin
        run_dll_SQLite3_SQLite3_Column := ReturnDllCommand_smt3(hStmt, ColNum);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_SQLite3_Column2(dll_name,command:string;hStmt: TSqliteStmt; ColNum: integer): int64;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_smt4 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_smt4 <> nil then begin
        run_dll_SQLite3_SQLite3_Column2 := ReturnDllCommand_smt4(hStmt, ColNum);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;


function run_dll_SQLite3_SQLite3_enable_load_extension(dll_name,command:string;db: TSQLiteDB; OnOff: integer): integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db13 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db13 <> nil then begin
        run_dll_SQLite3_SQLite3_enable_load_extension := ReturnDllCommand_db13(db, OnOff);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;

function run_dll_SQLite3_SQLite3_file_control(dll_name,command:string;db: TSQLiteDB; filename: PAnsiChar; option: integer; data: pointer): integer;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
      @ReturnDllCommand_db14 := GetProcAddress(DLLHandle, pchar(command));
      if @ReturnDllCommand_db14 <> nil then begin
        run_dll_SQLite3_SQLite3_file_control := ReturnDllCommand_db14(db, filename, option, data);
      end else begin
        showmessage(command + ' is no get FunctinAddress and Stop.');
      end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;



function SQLite3_ErrCode(db: TSQLiteDB): integer;
begin
  SQLite3_ErrCode:= run_dll_db(SQLiteDLL , 'sqlite3_errcode','',db);
end;

procedure SQlite3_Free(P: PAnsiChar);
begin
  run_dll_pachr2(SQLiteDLL, 'sqlite3_free',p);
end;


function SQLite3_Initialize(): integer;
begin
  SQLite3_Initialize := run_dll_int(SQLiteDLL,'sqlite3_initialize');
end;

function SQLite3_Shutdown(): integer;
begin
  SQLite3_Shutdown := run_dll_end(SQLiteDLL, 'sqlite3_shutdown','',nil);
end;

function SQLite3_Open(filename: PAnsiChar; var db: TSQLiteDB): integer;
begin
  SQLite3_Open := run_dll_open(SQLiteDLL, 'sqlite3_open',filename,db);
end;

function SQLite3_Close(db: TSQLiteDB): integer;
begin
  SQLite3_Close := run_dll_db(SQLiteDLL , 'sqlite3_close', '', db);
end;

function SQLite3_Exec(db: TSQLiteDB; SQLStatement: PAnsiChar; CallbackPtr: TSQLiteExecCallback; UserData: Pointer; var ErrMsg: PAnsiChar): integer;
begin
  SQLite3_Exec := run_dll_db2(SQLiteDLL, 'sqlite3_exec',db, SQLStatement, CallbackPtr, UserData, ErrMsg);
end;

function SQLite3_Version(): PAnsiChar;
begin
  SQLite3_Version := run_dll_pachr(SQLiteDLL ,'sqlite3_libversion');
end;

function SQLite3_ErrMsg(db: TSQLiteDB): PAnsiChar;
begin
  SQLite3_ErrMsg := run_dll_db_pachr(SQLiteDLL, 'sqlite3_errmsg','',db);
end;

function SQLite3_Prepare(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer;
begin
  SQLite3_Prepare := run_dll_db_Prepare(SQLiteDLL , 'sqlite3_prepare',db, SQLStatement, nBytes, hStmt, pzTail);
end;


function SQLite3_Prepare_v2(db: TSQLiteDB; SQLStatement: PAnsiChar; nBytes: integer; var hStmt: TSqliteStmt; var pzTail: PAnsiChar): integer;
begin
  SQLite3_Prepare_v2 := run_dll_db_Prepare(SQLiteDLL , 'sqlite3_prepare_v2',db, SQLStatement, nBytes, hStmt, pzTail);
end;

function SQLite3_GetTable(db: TSQLiteDB; SQLStatement: PAnsiChar; var ResultPtr: TSQLiteResult; var RowCount: Cardinal; var ColCount: Cardinal; var ErrMsg: PAnsiChar): integer;
begin
    SQLite3_GetTable := run_dll_SQLite3_GetTable( SQLiteDLL , 'sqlite3_get_table', db, SQLStatement, ResultPtr, RowCount, ColCount, ErrMsg);
end;


procedure SQLite3_FreeTable(Table: TSQLiteResult);
begin
  run_dll_FreeTable(SQLiteDLL , 'sqlite3_free_table',Table);
end;

function SQLite3_Complete(P: PAnsiChar): boolean;
begin
  SQLite3_Complete:= run_dll_SQLite3_Complete(SQLiteDLL , 'sqlite3_complete', p);
end;

function SQLite3_LastInsertRowID(db: TSQLiteDB): int64;
begin
  SQLite3_LastInsertRowID:= run_dll_SQLite3_LastInsertRowID(SQLiteDLL , 'sqlite3_last_insert_rowid', db);
end;
////
procedure SQLite3_Interrupt(db: TSQLiteDB);
begin
   run_dll_SQLite3_Interrupt(SQLiteDLL, 'sqlite3_interrupt', db);
end;

procedure SQLite3_BusyHandler(db: TSQLiteDB; CallbackPtr: TSQLiteBusyHandlerCallback; UserData: Pointer);
begin
  run_dll_SQLite3_BusyHandler(SQLiteDLL, 'sqlite3_busy_handler', db, CallbackPtr, UserData);
end;

procedure SQLite3_BusyTimeout(db: TSQLiteDB; TimeOut: integer);
begin
   run_dll_SQLite3_SQLite3_BusyTimeout(SQLiteDLL , 'sqlite3_busy_timeout', db, TimeOut);
end;

function SQLite3_Changes(db: TSQLiteDB): integer;
begin
  SQLite3_Changes:= run_dll_SQLite3_Changes(SQLiteDLL,'sqlite3_changes', db);
end;

function SQLite3_TotalChanges(db: TSQLiteDB): integer;
begin
  SQLite3_TotalChanges:= run_dll_SQLite3_Changes(SQLiteDLL, 'sqlite3_total_changes', db)
end;

function SQLite3_ColumnCount(hStmt: TSqliteStmt): integer;
begin
  SQLite3_ColumnCount:=run_dll_SQLite3_SQLite3_ColumnCount(SQLiteDLL, 'sqlite3_column_count',hStmt);
end;

function SQLite3_ColumnName(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;
begin
  SQLite3_ColumnName:=run_dll_SQLite3_SQLite3_ColumnName(SQLiteDLL, 'sqlite3_column_name',hStmt, ColNum);
end;

function SQLite3_ColumnDeclType(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;
begin
  SQLite3_ColumnDeclType:=run_dll_SQLite3_SQLite3_ColumnName(SQLiteDLL, 'sqlite3_column_decltype',hStmt, ColNum);
end;

function SQLite3_Step(hStmt: TSqliteStmt): integer;
begin
  SQLite3_Step:=run_dll_SQLite3_SQLite3_ColumnCount(SQLiteDLL, 'sqlite3_step',hStmt);
end;

function SQLite3_DataCount(hStmt: TSqliteStmt): integer;
begin
  SQLite3_DataCount:=run_dll_SQLite3_SQLite3_ColumnCount(SQLiteDLL, 'sqlite3_data_count',hStmt);
end;

function SQLite3_ColumnBlob(hStmt: TSqliteStmt; ColNum: integer): pointer;
begin
  SQLite3_ColumnBlob:=run_dll_SQLite3_SQLite3_ColumnName(SQLiteDLL, 'sqlite3_column_blob',hStmt, ColNum);
end;

function SQLite3_ColumnBytes(hStmt: TSqliteStmt; ColNum: integer): integer;
begin
  SQLite3_ColumnBytes:=run_dll_SQLite3_SQLite3_Column(SQLiteDLL, 'sqlite3_column_bytes',hStmt, ColNum);
end;

function SQLite3_ColumnDouble(hStmt: TSqliteStmt; ColNum: integer): double;
begin
  SQLite3_ColumnDouble:=run_dll_SQLite3_SQLite3_Column(SQLiteDLL, 'sqlite3_column_double',hStmt, ColNum);
end;

function SQLite3_ColumnInt(hStmt: TSqliteStmt; ColNum: integer): integer;
begin
  SQLite3_ColumnInt:=run_dll_SQLite3_SQLite3_Column(SQLiteDLL, 'sqlite3_column_int',hStmt, ColNum);
end;

function SQLite3_ColumnText(hStmt: TSqliteStmt; ColNum: integer): PAnsiChar;
begin
  SQLite3_ColumnText:=run_dll_SQLite3_SQLite3_ColumnName(SQLiteDLL, 'sqlite3_column_text',hStmt, ColNum);
end;

function SQLite3_ColumnType(hStmt: TSqliteStmt; ColNum: integer): integer;
begin
  SQLite3_ColumnType:=run_dll_SQLite3_SQLite3_Column(SQLiteDLL, 'sqlite3_column_type',hStmt, ColNum);
end;

function SQLite3_ColumnInt64(hStmt: TSqliteStmt; ColNum: integer): Int64;
begin
  SQLite3_ColumnInt64:=run_dll_SQLite3_SQLite3_Column2(SQLiteDLL, 'sqlite3_column_int64',hStmt, ColNum);
end;

function SQLite3_Finalize(hStmt: TSqliteStmt): integer;
begin
  SQLite3_Finalize:=run_dll_SQLite3_SQLite3_ColumnCount(SQLiteDLL, 'sqlite3_finalize',hStmt);
end;

function SQLite3_Reset(hStmt: TSqliteStmt): integer;
begin
  SQLite3_Reset:=run_dll_SQLite3_SQLite3_ColumnCount(SQLiteDLL, 'sqlite3_reset',hStmt);
end;

function SQLite3_Get_Autocommit(db: TSQLiteDB): integer;
begin
  SQLite3_Get_Autocommit:=run_dll_SQLite3_Changes(SQLiteDLL, 'sqlite3_get_autocommit',db);
end;

function SQLite3_enable_load_extension(db: TSQLiteDB; OnOff: integer): integer;
begin
  SQLite3_enable_load_extension:=run_dll_SQLite3_SQLite3_enable_load_extension(SQLiteDLL, 'sqlite3_enable_load_extension',db, OnOff);
end;

function SQLite3_file_control(db: TSQLiteDB; filename: PAnsiChar; option: integer; data: pointer): integer;
begin
  SQLite3_file_control:=run_dll_SQLite3_SQLite3_file_control(SQLiteDLL, 'sqlite3_file_control',db, filename, option, data);
end;




function SQLiteFieldType(SQLiteFieldTypeCode: Integer): String;
begin
  case SQLiteFieldTypeCode of
    SQLITE_INTEGER: Result := 'Integer';
    SQLITE_FLOAT: Result := 'Float';
    SQLITE_TEXT: Result := 'Text';
    SQLITE_BLOB: Result := 'Blob';
    SQLITE_NULL: Result := 'Null';
  else
    Result := 'Unknown SQLite Field Type Code "' + IntToStr(SQLiteFieldTypeCode) + '"';
  end;
end;

function SQLiteErrorStr(SQLiteErrorCode: Integer): String;
begin
  case SQLiteErrorCode of
    SQLITE_OK: Result := 'Successful result';
    SQLITE_ERROR: Result := 'SQL error or missing database';
    SQLITE_INTERNAL: Result := 'An internal logic error in SQLite';
    SQLITE_PERM: Result := 'Access permission denied';
    SQLITE_ABORT: Result := 'Callback routine requested an abort';
    SQLITE_BUSY: Result := 'The database file is locked';
    SQLITE_LOCKED: Result := 'A table in the database is locked';
    SQLITE_NOMEM: Result := 'A malloc() failed';
    SQLITE_READONLY: Result := 'Attempt to write a readonly database';
    SQLITE_INTERRUPT: Result := 'Operation terminated by sqlite3_interrupt()';
    SQLITE_IOERR: Result := 'Some kind of disk I/O error occurred';
    SQLITE_CORRUPT: Result := 'The database disk image is malformed';
    SQLITE_NOTFOUND: Result := '(Internal Only) Table or record not found';
    SQLITE_FULL: Result := 'Insertion failed because database is full';
    SQLITE_CANTOPEN: Result := 'Unable to open the database file';
    SQLITE_PROTOCOL: Result := 'Database lock protocol error';
    SQLITE_EMPTY: Result := 'Database is empty';
    SQLITE_SCHEMA: Result := 'The database schema changed';
    SQLITE_TOOBIG: Result := 'Too much data for one row of a table';
    SQLITE_CONSTRAINT: Result := 'Abort due to contraint violation';
    SQLITE_MISMATCH: Result := 'Data type mismatch';
    SQLITE_MISUSE: Result := 'Library used incorrectly';
    SQLITE_NOLFS: Result := 'Uses OS features not supported on host';
    SQLITE_AUTH: Result := 'Authorization denied';
    SQLITE_FORMAT: Result := 'Auxiliary database format error';
    SQLITE_RANGE: Result := '2nd parameter to sqlite3_bind out of range';
    SQLITE_NOTADB: Result := 'File opened that is not a database file';
    SQLITE_ROW: Result := 'sqlite3_step() has another row ready';
    SQLITE_DONE: Result := 'sqlite3_step() has finished executing';
  else
    Result := 'Unknown SQLite Error Code "' + IntToStr(SQLiteErrorCode) + '"';
  end;
end;


end.

