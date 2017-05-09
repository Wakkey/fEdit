unit tool_window;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TToolWindow }

  TToolWindow = class(TForm)
    PageControl1: TPageControl;
    ToolBar2: TToolBar;
    procedure PageControl1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    dock_sw:boolean;
  end;

var
  ToolWindow: TToolWindow;

implementation

{$R *.lfm}

{ TToolWindow }

procedure TToolWindow.PageControl1Change(Sender: TObject);
begin
  height := PageControl1.Height;
end;

end.

