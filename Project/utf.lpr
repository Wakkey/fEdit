library utf;

{$mode objfpc}{$H+}


uses
  windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, Menus, ExtDlgs, Process, fpjson, jsonparser,
  Masks, FileCtrl, Interfaces, Types;
function load_stream(st1:string;st2:TStringList):boolean;
  var
    tf : TextFile;
    s:string;
  begin

    try
      try
        //showmessage((st1));
        AssignFile(tf, utf8toansi(st1));
        Reset(tf);
        while not Eof(tf) do begin
          Readln(tf, s);
          st2.Add(s);
        end;
      finally
        CloseFile(tf);
      end
    except
    end;
end;

function load_text(st:pchar):pchar; stdcall;
var
  st3,st4:TStringList;
  i1 : Integer;
begin
  st3 := TStringList.Create;
  st3.Clear;
  st4 := TStringList.Create;
  st4.Clear;
  try

     //showmessage(widestring(st));
     //showmessage((string(st)));
     //showmessage((unicodestring(st)));

     load_stream((st),st3);
     for i1 := 0 to st3.Count -1 do begin
         st4.Add(ansitoutf8(st3[i1]));
     end;
     st4.SaveToFile( ExtractFilePath( ParamStr( 0 ) ) + 'tmp.txt' );
     st4.Free;
     st3.Free;
     //load_text := pchar(ansitoutf8(string(st2)));
  except
  end;
end;

function save_text(st:pchar):pchar; stdcall; stdcall;
begin
  try
     save_text := pchar(utf8toansi(string(st)));
  except
  end;
end;

function encod_unicode(s:pchar):integer; stdcall;
var
 st,st1:TstringList;
 i:integer;
    function pross(pram:string):boolean;
    var Pros:TProcess;
    begin
      Pros := TProcess.Create(nil);
      Pros.Options := [poWaitOnExit, poUsePipes];
      Pros.Executable:= pram;
      Pros.Execute;
      Pros.Free;
    end;
begin
  i :=0;
  try
  st := TStringlist.Create;
  st.Clear;
  st1 := TStringlist.Create;
  inc(i);
  //pross('cmd /c chcp 65001 ^& cmd /c type "' +(s) +'" >' +extractfilepath(paramstr(0))+'tmp.txt');
  st1.Text:= 'cmd start /min cmd /c chcp 65001 ^& cmd /c type "' +string(s) +'" >' +extractfilepath(paramstr(0))+'tmp.txt';
  for i := 0 to st1.Count -1 do begin
      st.add(utf8toansi(st1[i]));
  end;
  st.SaveToFile(extractfilepath(paramstr(0))+'set.bat');
  pross(extractfilepath(paramstr(0))+'set.bat');
  inc(i);
  st1.Free;
  except
    encod_unicode := (i);
  end;
end;

function decoed_unicode(s:pchar):integer; stdcall;
var
 st,st1:TstringList;
 i,i1:integer;
 s1:unicodestring;
    function pross(pram:string):boolean;
    var Pros:TProcess;
    begin
      Pros := TProcess.Create(nil);
      Pros.Options := [poWaitOnExit, poUsePipes];
      Pros.Executable := pram;
      Pros.Execute;
      Pros.Free;
    end;
begin
  i :=0;
  try
  st := TStringlist.Create;
  st.Clear;
  st1 := TStringlist.Create;
  st1.Clear;
  inc(i);
  //st1.Add('cmd /a /c; echo chcp >"'+string(s)+'"');
  //st.Add('chcp 6501');
  st1.Add('cmd /c chcp.com 65001 ^& ^( set /p x=""^<nul ^& cmd /u /c type "'+extractfilepath(paramstr(0))+'tmp.txt")^>"'+string(s)+'"');
  //st.Add('chcp');
  //st.Add('pause');
  for i1:= 0 to st1.Count -1 do begin
      st.add(utf8toansi(st1[i1]));
  end;
  st.SaveToFile(extractfilepath(paramstr(0))+'set.bat');
  pross('cmd /c ' + extractfilepath(paramstr(0))+'set.bat');
  deletefile(pchar(extractfilepath(paramstr(0))+'set.txt'));
  deletefile(pchar(extractfilepath(paramstr(0))+'set.bat'));
  //pross('cmd /c chcp.com 65001 ^& ^( set /p x=""^<nul ^& cmd /u /c type "'+extractfilepath(paramstr(0))+'tmp.txt"^) ^>'+string(s));
  //st.LoadFromFile(extractfilepath(paramstr(0)+'tmp.txt'));
  //Convertfunction(65001,1200,st.Text);
  //st1.Text:= 'start /min /wait cmd /c chcp 65001 ^& cmd /U /c type "'+extractfilepath(paramstr(0))+'tmp.txt">'+string(s);
  //st1.LoadFromFile(extractfilepath(paramstr(0)+'tmp.txt'));
  //st.text := Convertfunction(65001,1200,st1.Text);
 { for i := 0 to st1.Count -1 do begin
      s1 := (st1[i]);
      st.add(s1);
  end;}
  //st.SaveToFile(string(s));
  //pross(extractfilepath(paramstr(0))+'set.bat');
  inc(i);
  st.Free;
  st1.Free;
  except
    decoed_unicode := (i);
  end;
end;

exports
  load_text, save_text, encod_unicode, decoed_unicode;

begin
end.

