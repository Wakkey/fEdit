program fEdit;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainform, unit_edit, comp, printer4lazarus, pascalscript,
  runtimetypeinfocontrols, tool_window, functionunit, interfaceunit,
  find_unit, repracemacro, colordlg, macrow, windowsunit,
  TableBuilder, MySQL, filetype_form, HtmlEdit,versiondialog,
  supportcodeinput;

{$R *.res}

begin
  Application.Title:='fEdit';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(Tcolor_form, color_form);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfind_form, find_form);
  Application.CreateForm(Tfunction_unit, function_unit);
  Application.CreateForm(Tinterface_unit, interface_unit);
  Application.CreateForm(Tmacro_form, macro_form);
  Application.CreateForm(Treprace_unit, reprace_unit);
  Application.CreateForm(TToolWindow, ToolWindow);
  Application.CreateForm(Twindows_unit, windows_unit);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Topenfiletypeform, openfiletypeform);
  Application.CreateForm(THTMLMenu, HTMLMenu);
  Application.CreateForm(Tvershon_form, vershon_form);
  Application.CreateForm(Tcode_auto_support, code_auto_support);

  Application.Run;
end.

