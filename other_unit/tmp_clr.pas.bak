unit tmp_clr;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TtmpClr }

  TtmpClr = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  tmpClr: TtmpClr;

implementation

uses
  function_unit;

{$R *.lfm}

{ TtmpClr }

procedure TtmpClr.FormCreate(Sender: TObject);
begin

end;

procedure TtmpClr.Button1Click(Sender: TObject);
begin
    {$IFDEF Windows}
         functionunit.TempFIle_Clear1('Backupfile\','.ba1');
         functionunit.TempFIle_Clear2('Backupfile\','temp1.txt');
    {$ENDIF}
    {$IFDEF LINUX}
         functionunit.TempFIle_Clear1('Backupfile/','.ba1');
         functionunit.TempFIle_Clear2('Backupfile/','temp1.txt');
    {$ENDIF}
    {$IFDEF Darwin}
         functionunit.TempFIle_Clear1('Backupfile/','.ba1');
         functionunit.TempFIle_Clear2('Backupfile/','temp1.txt');
    {$ENDIF}
end;

procedure TtmpClr.Button2Click(Sender: TObject);
begin
  {$IFDEF Windows}
       functionunit.TempFIle_Clear1('Backupfile\','.ba2');
       functionunit.TempFIle_Clear2('Backupfile\','temp2.txt');
  {$ENDIF}
  {$IFDEF LINUX}
       functionunit.TempFIle_Clear1('Backupfile/','.ba2');
       functionunit.TempFIle_Clear2('Backupfile/','temp2.txt');
  {$ENDIF}
  {$IFDEF Darwin}
       functionunit.TempFIle_Clear1('Backupfile\','.ba2');
       functionunit.TempFIle_Clear2('Backupfile\','temp2.txt');
  {$ENDIF}
end;

procedure TtmpClr.Button3Click(Sender: TObject);
begin
  {$IFDEF Windows}
       functionunit.TempFIle_Clear1('Backupfile\','.ba');
       functionunit.TempFIle_Clear2('Backupfile\','temp3.txt');
  {$ENDIF}
  {$IFDEF LINUX}
       functionunit.TempFIle_Clear1('Backupfile/','.ba');
       functionunit.TempFIle_Clear2('Backupfile/','temp3.txt');
  {$ENDIF}
  {$IFDEF Darwin}
       functionunit.TempFIle_Clear1('Backupfile/','.ba');
       functionunit.TempFIle_Clear2('Backupfile/','temp3.txt');
  {$ENDIF}
end;

procedure TtmpClr.Button4Click(Sender: TObject);
begin
  {$IFDEF Windows}
       functionunit.TempFIle_Clear2('tmp\','test.*');
  {$ENDIF}
  {$IFDEF LINUX}
       functionunit.TempFIle_Clear2('tmp/','test.*');
  {$ENDIF}
  {$IFDEF Darwin}
       functionunit.TempFIle_Clear2('tmp/','test.*');
  {$ENDIF}
end;

end.

