unit filetype_form;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons;

type

  { Topenfiletypeform }

  Topenfiletypeform = class(TForm)
    BitBtn1: TBitBtn;
    CheckGroup1: TCheckGroup;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  openfiletypeform: Topenfiletypeform;

implementation

{$R *.lfm}

end.

