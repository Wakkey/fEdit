library utf;

{$mode objfpc}{$H+}


uses
  windows, Classes, SysUtils, FileUtil, Process;

function load_text(st:pchar):pchar; stdcall;
begin
  try
     load_text := pchar(ansitoutf8(string(st)));
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

function load_text2(st:pchar):pchar; stdcall;
var
  tf : TextFile;
  s:string;
  st2:TStringList;
begin
  try
    try
      st2:= TStringList.create;
      st2.Clear;
      AssignFile(tf, string(st));
      Reset(tf);
      while not Eof(tf) do begin
        Readln(tf, s);
        st2.Add(ansitoutf8(s));
      end;
    finally
      CloseFile(tf);
      st2.SaveToFile( ExtractFilePath( Paramstr( 0 ) ) + 'tmp.txt' );
      st2.Free;
    end
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
  load_text,load_text2, save_text, encod_unicode, decoed_unicode;

begin
end.

