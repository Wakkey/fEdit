program fedit;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, printer4lazarus, memdslaz, main, unit_edit, function_unit,
  comp, colordlg, tool_window, find_unit, macrow, repraceMacro, filetype_form,
  HtmlEdit, htmlpropedit, sqlpropedit, TableBuilder, JSONFormdialog, Jsonparse,
  versiondialog, tmp_clr, florwchart, supportcodeinput
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tcode_auto_support,supportcodeinput.code_auto_support);
  Application.CreateForm(Tfunctionunit, functionunit);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TToolWindow, ToolWindow);
  Application.CreateForm(Tmacro_form, macro_form);
  Application.CreateForm(Treprace_unit, reprace_unit);
  Application.CreateForm(Topenfiletypeform, openfiletypeform);
  Application.CreateForm(THTMLProp, HTMLProp);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TSQLProp, SQLProp);
  Application.CreateForm(TJSONForm2, JSONForm2);
  Application.CreateForm(TJson_pars, Json_pars);
  Application.CreateForm(Tvershon_form, vershon_form);
  Application.CreateForm(Tcolor_form, color_form);
  Application.CreateForm(TtmpClr, tmpClr);
  Application.CreateForm(THTMLMenu, HTMLMenu);
  Application.CreateForm(TFCFM, FCFM);

  Application.Run;
end.

