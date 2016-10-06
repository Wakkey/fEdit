unit use_sqlite;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

implementation

uses
{$IFnDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  windows,Messages, SysUtils, Classes,Graphics, Controls, Dialogs,
  StdCtrls;

type
  TReturnDllCommand= function : word;
var
  ReturnDllCommand : TReturnDllCommand;

function run_dll(dll_name,command:string):word;
var
  DLLHandle:THandle;
begin
  DLLHandle := LoadLibrary(pchar(dll_name));
  if DLLHandle <> 0 then begin
    @ReturnDllCommand := GetProcAddress(DLLHandle, pchar(command));
    if @ReturnDllCommand <> nil then begin
      run_dll := ReturnDllCommand;
    end else begin
      showmessage(command + ' is no get FunctinAddress and Stop.');
    end;
      FreeLibrary(DLLHandle);
  end else begin
    showmessage('no '+ dll_name +' found.');
  end;
end;


end.
