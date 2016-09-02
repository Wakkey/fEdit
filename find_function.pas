unit find_function;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

Tfind_function = class(TObject)
  private

  public
    function findtext(fText:string;setText,getText:TStringList;setfind:integer):boolean;
  end;

implementation

function Tfind.findtext(fText:string;setText,getText:TStringList;setfind:integer):boolean;
var
  s:Tstringlist;
  s1:string;
  i,i1,i2,i4:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false
    end
    else begin
      i4 := 0;
      for i3 := 0 to i1 -1 do begin
        i4 := i4 + length(s[i3]) + 2;
      end;
      i4 := i4 + i;
      getText.Add(inttostr(i4));
      findword := true;
    end;
  end;
begin
  //findtext.Free;
  s:=TStringlist.Create;
  s.Clear;
  memo:=Tmemo.Create(MainForm);
  memo.Visible := false;
  memo.Parent := MainForm;
  //function_unit.Show;
  memo.Text := settext.Text;
  //getText := TStringList.Create;
  //getText.Clear;
  s.Text:=settext.Text;
  i := -1;
  i1 := 0;
  for i1 := 0 to s.Count -1 do begin;
    if findword then begin
      s1 := s[i1];
      for i2 := i to length(s1) do begin
        s1[i] := ' ';
      end;
      s[i1] := s1;
    end;
  end;
  memo.Free;
  s.Free;
end;


end.

