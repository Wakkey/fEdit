unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, ComCtrls, comp;

type

  { Tmainform }

  Tmainform = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    barbottom: TMenuItem;
    barleft: TMenuItem;
    barright: TMenuItem;
    bartop: TMenuItem;
    cpy: TMenuItem;
    cut: TMenuItem;
    Delete: TMenuItem;
    MainMenu1: TMainMenu;
    MenuC_chackmnu: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem102: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem79: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem81: TMenuItem;
    MenuItem86: TMenuItem;
    MenuItem87: TMenuItem;
    MenuItem88: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    MenuItem95: TMenuItem;
    MenuI_UnixShell: TMenuItem;
    MenuWindowTop: TMenuItem;
    Menu_AllClose: TMenuItem;
    Menu_AllSaveAs: TMenuItem;
    Menu_All_Save: TMenuItem;
    Menu_Ansi: TMenuItem;
    Menu_BAT: TMenuItem;
    Menu_C: TMenuItem;
    Menu_Close: TMenuItem;
    Menu_CodeInsert: TMenuItem;
    Menu_code_support: TMenuItem;
    Menu_Css: TMenuItem;
    Menu_Custom: TMenuItem;
    Menu_Delphi: TMenuItem;
    Menu_EditColor: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_FInds: TMenuItem;
    Menu_FreeHeightLight: TMenuItem;
    Menu_HilightColor: TMenuItem;
    Menu_HTML: TMenuItem;
    Menu_INI: TMenuItem;
    Menu_Insert_Calac: TMenuItem;
    Menu_Insert_Day: TMenuItem;
    Menu_Insert_Time: TMenuItem;
    Menu_Java: TMenuItem;
    Menu_JS: TMenuItem;
    Menu_jsn: TMenuItem;
    Menu_lazarus: TMenuItem;
    Menu_LibOpen: TMenuItem;
    Menu_MacroElse: TMenuItem;
    Menu_MacroRun: TMenuItem;
    Menu_MacroSetUp: TMenuItem;
    Menu_Macro_codeRun: TMenuItem;
    Menu_MultWindow: TMenuItem;
    Menu_New: TMenuItem;
    Menu_OLD_Load: TMenuItem;
    Menu_Open: TMenuItem;
    Menu_Option: TMenuItem;
    Menu_Pascal: TMenuItem;
    Menu_Perl: TMenuItem;
    Menu_PHP: TMenuItem;
    Menu_pyhton: TMenuItem;
    Menu_ReOpen: TMenuItem;
    Menu_repraceMcro: TMenuItem;
    Menu_RootEdit: TMenuItem;
    Menu_RootFile: TMenuItem;
    Menu_RootHeightLight: TMenuItem;
    Menu_RootHelp: TMenuItem;
    Menu_RootMacro: TMenuItem;
    Menu_RootOption: TMenuItem;
    Menu_RootSupport: TMenuItem;
    Menu_RootTAB: TMenuItem;
    Menu_RootWindow: TMenuItem;
    menu_save: TMenuItem;
    Menu_SaveAs: TMenuItem;
    Menu_SetFont: TMenuItem;
    Menu_SetMnu: TMenuItem;
    Menu_SQL: TMenuItem;
    Menu_TabCheng: TMenuItem;
    Menu_TemplatCode: TMenuItem;
    Menu_TEMP_Load: TMenuItem;
    Menu_TEMP_Save: TMenuItem;
    Menu_ToolBarTAB: TMenuItem;
    Menu_ToolButtonSet: TMenuItem;
    Menu_URL: TMenuItem;
    Menu_Utf16: TMenuItem;
    Menu_UTF8: TMenuItem;
    Menu_VBScript: TMenuItem;
    Menu_Vershon: TMenuItem;
    Menu_WindowAllMax: TMenuItem;
    Menu_WindowAllMin: TMenuItem;
    Menu_WindowBottom: TMenuItem;
    Menu_WindowLeft: TMenuItem;
    Menu_WindowLock: TMenuItem;
    Menu_WindowMax: TMenuItem;
    Menu_WindowMin: TMenuItem;
    Menu_WIndowNomalSize: TMenuItem;
    Menu_WindowRight: TMenuItem;
    Menu_WIndow_AllNomalSize: TMenuItem;
    Menu_XML: TMenuItem;
    PageControl1: TPageControl;
    peast: TMenuItem;
    redo: TMenuItem;
    selctall: TMenuItem;
    toolpanel: TPanel;
    undo: TMenuItem;
    procedure ApplicationProperties1Activate(Sender: TObject);
    procedure ApplicationProperties1DropFiles(Sender: TObject;
      const FileNames: array of String);
    procedure barbottomClick(Sender: TObject);
    procedure barleftClick(Sender: TObject);
    procedure barrightClick(Sender: TObject);
    procedure bartopClick(Sender: TObject);
    procedure cpyClick(Sender: TObject);
    procedure cutClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormDockOver(Sender: TObject; Source: TDragDockObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure MenuC_chackmnuClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem86Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem90Click(Sender: TObject);
    procedure MenuI_UnixShellClick(Sender: TObject);
    procedure MenuWindowTopClick(Sender: TObject);
    procedure Menu_AllCloseClick(Sender: TObject);
    procedure Menu_All_SaveClick(Sender: TObject);
    procedure Menu_AnsiClick(Sender: TObject);
    procedure Menu_BATClick(Sender: TObject);
    procedure Menu_CClick(Sender: TObject);
    procedure Menu_CloseClick(Sender: TObject);
    procedure Menu_CssClick(Sender: TObject);
    procedure Menu_DelphiClick(Sender: TObject);
    procedure Menu_EditColorClick(Sender: TObject);
    procedure Menu_ExitClick(Sender: TObject);
    procedure Menu_FIndsClick(Sender: TObject);
    procedure Menu_helpgoogle1Click(Sender: TObject);
    procedure Menu_HilightColorClick(Sender: TObject);
    procedure Menu_HTMLClick(Sender: TObject);
    procedure Menu_INIClick(Sender: TObject);
    procedure Menu_Insert_CalacClick(Sender: TObject);
    procedure Menu_Insert_DayClick(Sender: TObject);
    procedure Menu_Insert_TimeClick(Sender: TObject);
    procedure Menu_JavaClick(Sender: TObject);
    procedure Menu_JSClick(Sender: TObject);
    procedure Menu_jsnClick(Sender: TObject);
    procedure Menu_lazarusClick(Sender: TObject);
    procedure Menu_MacroElseClick(Sender: TObject);
    procedure Menu_MacroRunClick(Sender: TObject);
    procedure Menu_MacroSetUpClick(Sender: TObject);
    procedure Menu_Macro_codeRunClick(Sender: TObject);
    procedure Menu_NewClick(Sender: TObject);
    procedure Menu_OLD_LoadClick(Sender: TObject);
    procedure Menu_OpenClick(Sender: TObject);
    procedure Menu_OptionClick(Sender: TObject);
    procedure Menu_PascalClick(Sender: TObject);
    procedure Menu_PerlClick(Sender: TObject);
    procedure Menu_PHPClick(Sender: TObject);
    procedure Menu_pyhtonClick(Sender: TObject);
    procedure Menu_ReOpenClick(Sender: TObject);
    procedure Menu_repraceMcroClick(Sender: TObject);
    procedure Menu_SaveAsClick(Sender: TObject);
    procedure menu_saveClick(Sender: TObject);
    procedure Menu_SetFontClick(Sender: TObject);
    procedure Menu_SetMnuClick(Sender: TObject);
    procedure Menu_SQLClick(Sender: TObject);
    procedure Menu_TabChengClick(Sender: TObject);
    procedure Menu_TEMP_LoadClick(Sender: TObject);
    procedure Menu_TEMP_SaveClick(Sender: TObject);
    procedure Menu_ToolBarTABClick(Sender: TObject);
    procedure Menu_ToolButtonSetClick(Sender: TObject);
    procedure Menu_URLClick(Sender: TObject);
    procedure Menu_Utf16Click(Sender: TObject);
    procedure Menu_UTF8Click(Sender: TObject);
    procedure Menu_VBScriptClick(Sender: TObject);
    procedure Menu_VershonClick(Sender: TObject);
    procedure Menu_WindowAllMaxClick(Sender: TObject);
    procedure Menu_WindowAllMinClick(Sender: TObject);
    procedure Menu_WindowBottomClick(Sender: TObject);
    procedure Menu_WindowLeftClick(Sender: TObject);
    procedure Menu_WindowMaxClick(Sender: TObject);
    procedure Menu_WindowMinClick(Sender: TObject);
    procedure Menu_WIndowNomalSizeClick(Sender: TObject);
    procedure Menu_WindowRightClick(Sender: TObject);
    procedure Menu_WIndow_AllNomalSizeClick(Sender: TObject);
    procedure Menu_XMLClick(Sender: TObject);
    procedure mnu_SelectORlineClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure peastClick(Sender: TObject);
    procedure redoClick(Sender: TObject);
    procedure selctallClick(Sender: TObject);
    procedure undoClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    tabdbclick:integer;
  end;

var
  mainform: Tmainform;

implementation

uses function_unit, unit_edit, colordlg, repraceMacro, macrow, filetype_form,
  HtmlEdit, TableBuilder, JSONFormEdit, Jsonparse, versiondialog, tmp_clr;

{$R *.lfm}

{ Tmainform }

procedure TMainform.ApplicationProperties1Activate(Sender: TObject);
begin

end;

procedure Tmainform.Menu_NewClick(Sender: TObject);
begin
  functionunit.newwindow();

end;

procedure Tmainform.Menu_OLD_LoadClick(Sender: TObject);
begin
  try
    functionunit.deleteAll_edittab();
    functionunit.load('temp3.txt','.ba');
  except
    functionunit.deleteAll_edittab();
    showmessage('前回終了時のファイルがありません');
  end;
end;

procedure Tmainform.Menu_OpenClick(Sender: TObject);
begin
  functionunit.fileopen('');
end;

procedure Tmainform.Menu_OptionClick(Sender: TObject);
begin
  functionunit.colordlgopen(3);
end;

procedure Tmainform.Menu_PascalClick(Sender: TObject);
begin
  functionunit.synHL_No := 3;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_PerlClick(Sender: TObject);
begin
  functionunit.synHL_No := 8;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_PHPClick(Sender: TObject);
begin
  functionunit.synHL_No := 9;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_pyhtonClick(Sender: TObject);
begin
  functionunit.synHL_No := 10;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_ReOpenClick(Sender: TObject);
var
  i:integer;
begin
  i := mainform.PageControl1.PageIndex;
  functionunit.reopen(i);
end;

procedure Tmainform.Menu_repraceMcroClick(Sender: TObject);
begin
  reprace_unit.Show;
end;

procedure Tmainform.Menu_SaveAsClick(Sender: TObject);
var
  i:integer;
begin
  i := mainform.PageControl1.PageIndex;
  functionunit.saveas(i);
end;

procedure Tmainform.menu_saveClick(Sender: TObject);
var
  i:integer;
begin
  i := mainform.PageControl1.PageIndex;
  functionunit.filesave(i);
end;

procedure Tmainform.Menu_SetFontClick(Sender: TObject);
var
  i:integer;
begin
  if not datamodule1.FontDialog1.Execute then
    exit;
  functionunit.LoadFontSizePriset:= datamodule1.Font.Size;
  functionunit.LoadFontColorPriset:=(datamodule1.Font.Color);
  for i :=0 to mainform.PageControl1.PageCount-2 do begin
    functionunit.editlist.Items[i].SynEdit1.Font := datamodule1.font;
    functionunit.editlist.Items[i].Memo1.Font := datamodule1.font;
    //functionunit.editlist.Items[i].Memo1.Font.Color := 0;
  end;
end;

procedure Tmainform.Menu_SetMnuClick(Sender: TObject);
var
  st:TStringList;
begin
  try
    st := TStringList.Create;
    st.LoadFromFile(extractfilepath(paramstr(0))+'mnu_shortcut.txt');
    color_form.List_SubMnu2.Items.Text:= st.Text;
    st.LoadFromFile(extractfilepath(paramstr(0))+'mnu_title.txt');
    color_form.List_SubMnu1.Items.Text:= st.Text;
    st.LoadFromFile(extractfilepath(paramstr(0))+'mnu_caption.txt');
    color_form.List_SubMnu.Items.Text:= st.Text;
  except
  end;
  st.Free;
  functionunit.colordlgopen(5);
end;

procedure Tmainform.Menu_SQLClick(Sender: TObject);
begin
  functionunit.synHL_No := 11;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_TabChengClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.PageIndex;
  functionunit.tab_dock(i);
end;

procedure Tmainform.Menu_TEMP_LoadClick(Sender: TObject);
begin
  try
    //Mainform.Menu_AllCloseClick(mainform.Menu_AllClose);
    functionunit.deleteAll_edittab();
    functionunit.load('temp1.txt','.ba1');
  except
    functionunit.deleteAll_edittab();
    showmessage('一時保存ファイルがありません');
  end;
end;

procedure Tmainform.Menu_TEMP_SaveClick(Sender: TObject);
begin
  {$IFDEF Windows}
       functionunit.TempFIle_Clear1('tmp\','.ba1');
       functionunit.TempFIle_Clear2('tmp\','temp1.txt');
       functionunit.save('tmp\','temp1.txt','.ba1');
  {$ENDIF}
  {$IFDEF LINUX}
       functionunit.TempFIle_Clear1('tmp\','.ba1');
       functionunit.TempFIle_Clear2('tmp\','temp1.txt');
       functionunit.save('tmp\','temp1.txt','.ba1');
  {$ENDIF}
  {$IFDEF Darwin}
       functionunit.TempFIle_Clear1('tmp/','.ba1');
       functionunit.TempFIle_Clear2('tmp/','temp1.txt');
       functionunit.save('tmp/','temp1.txt','.ba1');
  {$ENDIF}
end;

procedure Tmainform.Menu_ToolBarTABClick(Sender: TObject);
begin
  color_form.CheckBox3Change(Sender);
end;

procedure Tmainform.Menu_ToolButtonSetClick(Sender: TObject);
begin
  functionunit.colordlgopen(4);
end;

procedure Tmainform.Menu_URLClick(Sender: TObject);
var
  s:string;
begin
  //s := utf8toansi(functionunit.findsearch);
  s := functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.SelText;
  functionunit.findweb(s,'url');
end;

procedure Tmainform.Menu_Utf16Click(Sender: TObject);
begin
  functionunit.char_set(mainform.PageControl1.ActivePageIndex,'UTF16');
end;

procedure Tmainform.Menu_UTF8Click(Sender: TObject);
begin
  functionunit.char_set(mainform.PageControl1.ActivePageIndex,'UTF8');
end;

procedure Tmainform.Menu_VBScriptClick(Sender: TObject);
begin
  functionunit.synHL_No := 14;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_VershonClick(Sender: TObject);
begin
  vershon_form.ShowModal;
end;

procedure Tmainform.Menu_WindowAllMaxClick(Sender: TObject);
begin
  functionunit.windowallset(1);
end;

procedure Tmainform.Menu_WindowAllMinClick(Sender: TObject);
begin
  functionunit.windowallset(0);
end;

procedure Tmainform.Menu_WindowBottomClick(Sender: TObject);
begin
  functionunit.windowdown;
end;

procedure Tmainform.Menu_WindowLeftClick(Sender: TObject);
begin
  functionunit.windowleft;
end;

procedure Tmainform.Menu_WindowMaxClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.PageIndex;
  functionunit.windowmax(i);
end;

procedure Tmainform.Menu_WindowMinClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.PageIndex;
  functionunit.windowmin(i);
end;

procedure Tmainform.Menu_WIndowNomalSizeClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.PageIndex;
  functionunit.windownormal(i);
end;

procedure Tmainform.Menu_WindowRightClick(Sender: TObject);
begin
  functionunit.windowright;
end;

procedure Tmainform.Menu_WIndow_AllNomalSizeClick(Sender: TObject);
begin
  functionunit.windowallset(2);
end;

procedure Tmainform.Menu_XMLClick(Sender: TObject);
begin
  functionunit.synHL_No := 15;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.mnu_SelectORlineClick(Sender: TObject);
begin

end;

procedure Tmainform.PageControl1Change(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.PageIndex;
  //showmessage((functionunit.editlist.Items[i].Caption));
  if mainform.PageControl1.Pages[i].Caption = 'ADD' then begin
    mainform.PageControl1.PageIndex:= mainform.PageControl1.PageCount-2;
    functionunit.newwindow();
  end else begin
    functionunit.TitleSet(functionunit.editlist.Items[i].filename);
    if not functionunit.editlist.Items[i].dock_sw then begin
      {$IFDEF Windows}
      functionunit.get_window(functionunit.editlist.Items[i].Handle);
      {$ENDIF}

    end;
  end;
end;

procedure Tmainform.peastClick(Sender: TObject);
begin
  functionunit.past();
end;

procedure Tmainform.redoClick(Sender: TObject);
begin
  functionunit.redo();
end;

procedure Tmainform.selctallClick(Sender: TObject);
begin
  functionunit.selectAll();
end;



procedure Tmainform.undoClick(Sender: TObject);
begin
  functionunit.undo();
end;

procedure Tmainform.Menu_CloseClick(Sender: TObject);
var
  i:integer;
begin
  i := mainform.PageControl1.ActivePageIndex;
  if i > 0 then begin
    mainform.PageControl1.ActivePageIndex:= i -1;
  end;
  functionunit.delete_edit_tab(i);
end;

procedure Tmainform.Menu_CssClick(Sender: TObject);
begin
  functionunit.synHL_No := 1;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_DelphiClick(Sender: TObject);
begin
  functionunit.synHL_No := 7;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_EditColorClick(Sender: TObject);
begin
  functionunit.colordlgopen(1);
end;

procedure Tmainform.Menu_ExitClick(Sender: TObject);
begin
  mainform.Close;
end;

procedure Tmainform.Menu_FIndsClick(Sender: TObject);
begin
  functionunit.findwindow();
end;

procedure Tmainform.Menu_helpgoogle1Click(Sender: TObject);
var
  s:string;
begin
  s := InputBox('検索語句指定','必要であればヒントとなる語句を入力','');
  functionunit.findweb('',s);
end;

procedure Tmainform.Menu_HilightColorClick(Sender: TObject);
begin
  functionunit.colordlgopen(2);
end;

procedure Tmainform.Menu_HTMLClick(Sender: TObject);
begin
  functionunit.synHL_No := 4;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_INIClick(Sender: TObject);
begin
  functionunit.synHL_No := 17;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_Insert_CalacClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.ActivePageIndex;
  functionunit.Calac(i);
end;

procedure Tmainform.Menu_Insert_DayClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.ActivePageIndex;
  functionunit.Calendar(i);
end;

procedure Tmainform.Menu_Insert_TimeClick(Sender: TObject);
var
  i:integer;
begin
  i:=mainform.PageControl1.ActivePageIndex;
  functionunit.Time(i);
end;

procedure Tmainform.Menu_JavaClick(Sender: TObject);
begin
  functionunit.synHL_No := 5;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_JSClick(Sender: TObject);
begin
  functionunit.synHL_No := 21;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_jsnClick(Sender: TObject);
begin
  functionunit.synHL_No := 22;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_lazarusClick(Sender: TObject);
begin
  functionunit.synHL_No := 20;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_MacroElseClick(Sender: TObject);
begin
  macro_form.PageControl1.ActivePageIndex:=1;
  macro_form.ShowModal;
end;

procedure Tmainform.Menu_MacroRunClick(Sender: TObject);
begin
  functionunit.macro_run(functionunit.editlist.Items[mainform.PageControl1.PageIndex].filename);
end;

procedure Tmainform.Menu_MacroSetUpClick(Sender: TObject);
begin
  macro_form.PageControl1.ActivePageIndex:=0;
  macro_form.ShowModal;
end;

procedure Tmainform.Menu_Macro_codeRunClick(Sender: TObject);
begin
  functionunit.CodeRun;
end;

procedure Tmainform.Menu_AllCloseClick(Sender: TObject);
begin
  functionunit.deleteAll_edittab();
end;

procedure Tmainform.Menu_All_SaveClick(Sender: TObject);
begin

end;

procedure Tmainform.Menu_AnsiClick(Sender: TObject);
begin
  functionunit.char_set(mainform.PageControl1.ActivePageIndex,'ANSI');
end;

procedure Tmainform.Menu_BATClick(Sender: TObject);
begin
  functionunit.synHL_No := 16;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.Menu_CClick(Sender: TObject);
begin
  functionunit.synHL_No := 0;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.MenuItem19Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
    mainform.PageControl1.ActivePageIndex:= i;
    functionunit.tab_dock(i);
  end;
end;

procedure Tmainform.barbottomClick(Sender: TObject);
begin
  functionunit.toolbaraligin('bottom');
end;

procedure Tmainform.barleftClick(Sender: TObject);
begin
  functionunit.toolbaraligin('left');
end;

procedure Tmainform.barrightClick(Sender: TObject);
begin
  functionunit.toolbaraligin('right');
end;

procedure Tmainform.bartopClick(Sender: TObject);
begin
  functionunit.toolbaraligin('top');
end;

procedure Tmainform.cpyClick(Sender: TObject);
begin
  functionunit.copy();
end;

procedure Tmainform.cutClick(Sender: TObject);
begin
  functionunit.cut();
end;

procedure Tmainform.DeleteClick(Sender: TObject);
begin
  functionunit.delete();
end;

procedure Tmainform.FormClick(Sender: TObject);
begin
  inc(tabdbclick);
  if tabdbclick = 2 then begin
    functionunit.window_off(mainform.PageControl1.PageIndex);
    tabdbclick := 0;
  end;
end;

procedure Tmainform.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  functionunit.exitAPP();
end;

procedure Tmainform.FormDockOver(Sender: TObject; Source: TDragDockObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin

end;


procedure Tmainform.FormShow(Sender: TObject);
begin
  functionunit.boot();
end;

procedure Tmainform.FormUnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
  functionunit.editlist.Items[mainform.PageControl1.PageIndex].dock_sw:= false;
end;

procedure Tmainform.MenuC_chackmnuClick(Sender: TObject);
begin
  functionunit.Mcrocheck(sender,true);
end;

procedure Tmainform.MenuItem10Click(Sender: TObject);
var
  f : TJSONEditForm;
begin
  f := TJSONEditForm.Create(functionunit);
  f.Show;
end;

procedure Tmainform.MenuItem13Click(Sender: TObject);
begin

end;

procedure Tmainform.MenuItem15Click(Sender: TObject);
begin

end;

procedure Tmainform.MenuItem17Click(Sender: TObject);
begin
  functionunit.tool_dock;
end;

procedure Tmainform.MenuItem18Click(Sender: TObject);
begin
  try
    //Mainform.Menu_AllCloseClick(mainform.Menu_AllClose);
    functionunit.deleteAll_edittab();
    functionunit.load('temp2.txt','.ba2');
  except
    functionunit.deleteAll_edittab();
    showmessage('一時保存ファイルがありません');
  end;
end;

procedure Tmainform.MenuItem21Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
    //main.PageControl1.ActivePageIndex:= i;
    functionunit.tab_dock_off(i);
  end;
end;

procedure Tmainform.MenuItem25Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
    //main.PageControl1.ActivePageIndex:= i;
    functionunit.tab_dock_on(i);
  end;
end;

procedure Tmainform.MenuItem28Click(Sender: TObject);
begin
  HTMLMenu.Show;
end;

procedure Tmainform.MenuItem29Click(Sender: TObject);
begin
  {$IFDEF Windows}
       functionunit.TempFIle_Clear1('tmp/','.ba2');
       functionunit.TempFIle_Clear2('tmp/','temp2.txt');
       functionunit.save('tmp/','temp2.txt','.ba2');
  {$ENDIF}
  {$IFDEF LINUX}
       functionunit.TempFIle_Clear1('tmp/','.ba2');
       functionunit.TempFIle_Clear2('tmp/','temp2.txt');
       functionunit.save('tmp/','temp2.txt','.ba2');
  {$ENDIF}
  {$IFDEF Darwin}
       functionunit.TempFIle_Clear1('tmp/','.ba2');
       functionunit.TempFIle_Clear2('tmp/','temp2.txt');
       functionunit.save('tmp/','temp2.txt','.ba2');
  {$ENDIF}
end;

procedure Tmainform.MenuItem31Click(Sender: TObject);
begin
  try
    Json_pars.OpenFile(functionunit.editlist.Items[mainform.PageControl1.PageIndex].filename_path);
  except
    showmessage('err');
  end;
end;

procedure Tmainform.MenuItem32Click(Sender: TObject);
begin
  tmpclr.ShowModal;
end;

procedure Tmainform.MenuItem7Click(Sender: TObject);
begin
  functionunit.MacroInsart(mainform.PageControl1.pageIndex,functionunit.macro_lng);
end;

procedure Tmainform.MenuItem86Click(Sender: TObject);
begin

end;

procedure Tmainform.MenuItem8Click(Sender: TObject);
begin
  functionunit.openSQLBuilder(mainform.PageControl1.pageIndex);
end;

procedure Tmainform.MenuItem90Click(Sender: TObject);
begin
  functionunit.macro(sender);
end;

procedure Tmainform.MenuI_UnixShellClick(Sender: TObject);
begin
  functionunit.synHL_No := 13;
  functionunit.heighligthcheck(functionunit.synhl_No,true);
  functionunit.synchang(functionunit.synhl_No);
end;

procedure Tmainform.MenuWindowTopClick(Sender: TObject);
begin
  functionunit.windowup;
end;

procedure Tmainform.ApplicationProperties1DropFiles(Sender: TObject;
  const FileNames: array of String);
var
  i,i1:integer;
  s,st:TStringlist;
begin
  st:= TStringlist.Create;
  st.Clear;
  s:= TStringlist.Create;
  s.Clear;
  for I := 0 to High(FileNames) do begin
  //functionunit.Run(functionunit.EnumFileFromDir(ansitoutf8(FileNames[i]),st));
  functionunit.EnumFileFromDir(ansitoutf8(FileNames[i]),st)
  end;
  if st.Count > 0 then begin
    for i1 := 1 to st.count -1 do begin
      if -1 = openfiletypeform.CheckGroup1.Items.IndexOf(extractfileext(st[i1])) then begin
        openfiletypeform.CheckGroup1.Items.Add(extractfileext(st[i1]));
      end;
    end;
    if openfiletypeform.CheckGroup1.Items.Count > 2 then begin
      openfiletypeform.ShowModal;
      for i := 0 to openfiletypeform.CheckGroup1.Items.Count -1 do begin
          if openfiletypeform.CheckGroup1.Checked[i] then begin
            s.add( openfiletypeform.CheckGroup1.Items[i] );
          end;
      end;
      for i1 := 0 to st.Count -1 do begin
         if -1 <> s.IndexOf( extractfileext(st[i1]) ) then begin
           try
             functionunit.fileopen(ansitoutf8(st[i1]));
           except
           end;
         end;
      end;
    end else begin
      if st.Count = 1 then begin
        //interface_unit.open(ansitoutf8(FileNames[0]));
      end;
      for i1 := 0 to st.Count -1 do begin
        try
          functionunit.fileopen(ansitoutf8(st[i1]));
        except
        end;
      end;
    end;
  end;
end;

end.

