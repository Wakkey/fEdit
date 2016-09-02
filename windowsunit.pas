unit windowsunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  StdCtrls, functionunit, Process;

type

  { Twindows_unit }

  Twindows_unit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    function memoload(i:integer;s:widestring):ThreadFunc;
    function memosave(i:integer;s:widestring;memo:Tmemo):ThreadFunc;
    function get_cusol():TPoint;
    function insert_text(Tabs:integer;data:string):boolean;
    function pross(set_name,set_name2:string):boolean;
    function pross3(command:string):boolean;
    function popupwin(c:char;edt:TsynEdit):boolean;
    function findcodeset(key:string):boolean;
  end;

var
  windows_unit: Twindows_unit;

implementation

uses  mainform, comp, supportcodeinput
  {$IFDEF WIN32}
     ,windows
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF};

{$R *.lfm}

{ Twindows_unit }
function UTF8ToUTF16(const S: AnsiString):WIdeString;
begin
  UTF8ToUTF16 := s;
end;

function UTF16ToUTF8(const S: WIdeString):AnsiString;
begin
  UTF16ToUTF8 := s;
end;

{$IFDEF WIN32}
function Twindows_unit.memoload(i:integer;s:widestring):ThreadFunc;
var
  edt:Tmemo;
  function encode_charset(i:integer;s:widestring):boolean;
  begin
    try
          edt := TMemo.Create(owner);
          edt.Parent := windows_unit;
          edt.Enabled:= true;
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      edt.Lines.LoadFromFile(utf16toutf8(s));
      function_unit.editlist.Items[i].Edit.Text := (edt.Lines.Text);
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      edt.Lines.LoadFromFile(systoutf8(s));
      function_unit.editlist.Items[i].Edit.Text := (utf8toansi(edt.Lines.Text));
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
      edt.Lines.LoadFromFile((s));
      //showmessage(edt.Lines.Text);
       function_unit.editlist.Items[i].Edit.Text := (edt.Lines.Text);

       encode_charset := true;
    end;
    edt.Free;
  finally

  end;
    function_unit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      encode_charset(i,s);
    finally

    end;
end;

function Twindows_unit.memosave(i:integer;s:widestring;memo:TMemo):ThreadFunc;
  function encode_charset(i:integer;memo:Tmemo):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.Lines.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  GetCaretPos(aPos);
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretY -1;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := 'open' + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := 'pass';

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S ' + command );
    sv.Execute;
    sv.Free;
end;

function TWindows_unit.popupwin(c:char;edt:TsynEdit):boolean;
var
  aPos:TPoint;
  indexs,indexs2,i,i1,i2,i3:integer;
  st:TStringList;
  s:string;
begin
  GetCaretPos(aPos);
  aPos.Y := aPos.Y + Abs(edt.Font.Height);
  aPos := edt.ClientToScreen(aPos);
  code_auto_support.SetBounds(aPos.X,aPos.Y + ( edt.LineHeight )
  ,code_auto_support.Width,code_auto_support.Height);

  if function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count = 0 then begin
    code_auto_support.ListBox1.Items.Text:=function_unit.editlist.Items[main.PageControl1.PageIndex].code_suport.Text;
  end else begin
    //code_auto_support.ListBox1.Items.Text:= function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text;
    function_unit.editlist.Items[main.PageControl1.PageIndex].code_suport.Text :=
     function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text;
    code_auto_support.ListBox1.Items.Text:= function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text;
  end;

  if (c <> ' ') or ((word(c) > 65) and (word(c) < 102)) then begin

    code_auto_support.Visible:= true;
    function_unit.editlist.Items[main.PageControl1.PageIndex].SynEdit1.SetFocus;
    code_auto_support.code_supoert_string:=code_auto_support.code_supoert_string + c;
    st:=TStringlist.Create;
    if function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count = 0 then begin
      //function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text := code_auto_support.ListBox1.Items.Text;
    end;
    //i2 := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count-1;
    //st.Text:=code_auto_support.ListBox1.Items.Text;

    windows_unit.findcodeset(code_auto_support.code_supoert_string);
    {for i := 0 to st.Count-1 do begin
      s := st[i];
      //showmessage(inttostr(length(s)));
      if length(s) > 0 then begin
        //showmessage((s[length(s)-1]));
      indexs := ansipos(code_auto_support.code_supoert_string,st[i]);
      if (indexs > 0 ) or (code_auto_support.code_supoert_string[indexs] = st[i]) or
        (0 < ansipos(code_auto_support.code_supoert_string,s[length(s)-1])) then begin
        try
          if function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.IndexOf(st[i]) = -1 then begin
            function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Add(st[i]);
          end;
        except

        end;
      end else begin
        {try
          for i3 := 0 to function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count-1 do begin;
            indexs2 := ansipos(function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset[i3],code_auto_support.code_supoert_string);
            if (indexs2 = 0) or
              (function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset[i3] <> code_auto_support.code_supoert_string) then begin
                //function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Delete(i3);
            end;
          end;
        except
          //showmessage(inttostr(function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count) );
          //showmessage(inttostr(i3) );
        end;}
      end;
      end;
      //dec(i2);
    end;}
    //showmessage(st.Text);
    if function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count <= 0 then begin
       code_auto_support.Visible:= not true;
    end;
    code_auto_support.ListBox1.Items.Text := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text;
    st.Free;
  end else begin
    code_auto_support.Visible:= not true;
    code_auto_support.code_supoert_string := '';
    function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text:= '';
  end;
end;

function Twindows_unit.findcodeset(key:string):boolean;
var
  i,i1,i2,i3,i4,i5,i6:integer;
  s,s1,s2,s3:string;
begin
   if length(key) > 0 then
     if key[length(key)] = char(40) then
       exit;
    //s := ExtractFilePath(Paramstr(0)) + 'codelist.txt';
    //function_unit.findcode.LoadFromFile((s));
    //補完リスト読み込み
    i := 0;
    i4 := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count -1;
    i5 := 0;
    for i2 := 0 to i4 -1 do begin
      s1 := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset[i2 + i5];
      if length(s1) < length(code_auto_support.code_supoert_string) then begin
        function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Delete(i2 + i5);
        i4 := i4 -1;
        dec(i5);
      end;
    end;
    function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text :=
    StringReplace(function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text,' ',chr(0),[rfReplaceAll]);
    i5 := 0;
    i4 := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Count;
    for i2 := 0 to i4 -1 do begin
      s1 := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset[i2 +i5];
      if s1 <> '' then begin
           if code_auto_support.code_supoert_string <> '' then begin
              s2 := ''; s3 := '';
                s2 := '';
                for i6 := 0 to length(key)  do begin
                  s2 := s2 + function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset[i2+i5][i6];
                end;
                if 0 = ansipos(upcase(key),upcase(s2)) then begin

                      if i2 + i5 >= 0 then begin
                      function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Delete(i2 + i5);
                      i4 := i4 -1;
                      dec(i5);
                    end else begin
                      //showmessage('aa');
                      //findcodeset := false;
                    end;
                  end else begin
                  end;
            end else begin end;
      end;
    end;
    function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text :=
      StringReplace(function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset.Text,' ',chr(0),[rfReplaceAll]);

    code_auto_support.ListBox1.Items := function_unit.editlist.Items[main.PageControl1.PageIndex].temp_codeset;



end;




{$ENDIF}
{$IFDEF LINUX}

function TWindows_unit.memoload(i:integer;s:string):boolean;
  function encode_charset(i:integer;memo:Tstringlist):boolean;
  begin
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (utf16toutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (utf16toutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (ansitoutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (ansitoutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       function_unit.editlist.Items[i].Synedit1.Text:=memo.Text;
       function_unit.editlist.Items[i].memo1.Text:= memo.Text;
       encode_charset := true;
    end;
  end;
begin
  try
    function_unit.editlist.Items[i].Edit.LoadFromFile((utf8toansi(s)));
  finally
    try
      encode_charset(i,function_unit.editlist.Items[i].Edit);
    finally

    end;
  end;
end;

function TWindows_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  //GetCaretPos(aPos);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.CaretXY;
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.CaretY:=function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.CaretX:=function_unit.editlist.Items[i].SynEdit1.CaretXY.X;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := function_unit.editlist.Items[i].Memo1.CaretPos.Y;  //SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := set_name + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := 'm0jpw10p';

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;

    sv.Executable:= '/bin';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' {+ps+ ' | sudo -S '} + command );
    sv.Execute;
    sv.Free;
end;

{$ENDIF}


{$IFDEF Darwin}

function TWindows_unit.memoload(i:integer;s:string):boolean;
  function encode_charset(i:integer;memo:Tstringlist):boolean;
  begin
    if Main.Menu_Utf16.Checked then begin
      //memo.LoadFromFile((utf16toutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (utf16toutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (utf16toutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      function_unit.editlist.Items[i].Synedit1.Text:= (ansitoutf8(memo.Text));
      function_unit.editlist.Items[i].memo1.Text:= (ansitoutf8(memo.Text));
      encode_charset := true;
    end else if Main.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       function_unit.editlist.Items[i].Synedit1.Text:=memo.Text;
       function_unit.editlist.Items[i].memo1.Text:= memo.Text;
       encode_charset := true;
    end;
  end;
begin
  try
    function_unit.editlist.Items[i].Edit.LoadFromFile((utf8toansi(s)));
  finally
    try
      encode_charset(i,function_unit.editlist.Items[i].Edit);
    finally

    end;
  end;
end;

function TWindows_unit.memosave(i:integer;s:string;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  begin
    if function_unit.editlist.Items[i].char_sets = 'UTF16' then begin
      memo.Text:= (utf8toutf16(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'ANSI' then begin
      memo.Text:= (utf8toansi(memo.Text));
      encode_charset := true;
    end else if function_unit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
    end;
  end;
begin
    encode_charset(i,memo);
  try
    memo.SaveToFile(utf8toansi((s)));
  finally

  end;
end;

function Twindows_unit.get_cusol():TPoint;
var
  aPos:TPoint;
begin
  //GetCaretPos(aPos);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.CaretXY;
  aPos.Y := aPos.Y + Abs(function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.Font.Height);
  aPos := function_unit.editlist.Items[main.PageControl1.ActivePageIndex].SynEdit1.ClientToScreen(apos);

end;

function TWindows_unit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.SelStart:= i1;
    function_unit.editlist.Items[i].SynEdit1.CaretY:=function_unit.editlist.Items[i].SynEdit1.CaretXY.Y;
    function_unit.editlist.Items[i].SynEdit1.CaretX:=function_unit.editlist.Items[i].SynEdit1.CaretXY.X;
    function_unit.editlist.Items[i].SynEdit1.SelText := data;
  end else if function_unit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    i1 := function_unit.editlist.Items[i].Memo1.CaretPos.Y;  //SendMessage(function_unit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, function_unit.editlist.Items[i].Memo1.SelStart, 0);
    function_unit.editlist.Items[i].Memo1.SelStart:= i1;
    function_unit.editlist.Items[i].Memo1.SelText := data;
  end;
end;

function TWindows_unit.pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
  prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];


    //sd.CommandLine := 'sudo';
    sd.Execute;
    //sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := form1.Edit19.Text + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    prss.Execute;
    sd.Execute;
    ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;

  sd.Free;
  prss.Free;
  sv.Free;
end;

function TWindows_unit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    ps := form1.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S ' + command );
    sv.Execute;
    sv.Free;
end;

{$ENDIF}

procedure Twindows_unit.FormCreate(Sender: TObject);
begin

end;

end.

