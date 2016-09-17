unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, IpHtml, Forms, Controls, Graphics,
  Dialogs, Menus, ExtCtrls, ComCtrls, LResources, PairSplitter;

type
  { TMain }

  TMain = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    barbottom: TMenuItem;
    barleft: TMenuItem;
    barright: TMenuItem;
    bartop: TMenuItem;
    cpy: TMenuItem;
    cut: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem102: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
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
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
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
    Delete: TMenuItem;
    MenuC_chackmnu: TMenuItem;
    MenuItem8: TMenuItem;
    Menu_jsn: TMenuItem;
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
    Menu_helpgoogle1: TMenuItem;
    Menu_HilightColor: TMenuItem;
    Menu_HTML: TMenuItem;
    Menu_INI: TMenuItem;
    Menu_Insert_Calac: TMenuItem;
    Menu_Insert_Day: TMenuItem;
    Menu_Insert_Time: TMenuItem;
    Menu_Java: TMenuItem;
    Menu_JS: TMenuItem;
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
    mnu_SelectORline: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormShow(Sender: TObject);
    procedure JsonEditClick(Sender: TObject);
    procedure JsonSchemaEditClick(Sender: TObject);
    procedure MenuC_chackmnuClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem90Click(Sender: TObject);
    procedure MenuI_UnixShellClick(Sender: TObject);
    procedure MenuWindowTopClick(Sender: TObject);
    procedure Menu_AllCloseClick(Sender: TObject);
    procedure Menu_AllSaveAsClick(Sender: TObject);
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
    procedure Menu_FreeHeightLightClick(Sender: TObject);
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
    procedure Menu_WindowLockClick(Sender: TObject);
    procedure Menu_WindowMaxClick(Sender: TObject);
    procedure Menu_WindowMinClick(Sender: TObject);
    procedure Menu_WIndowNomalSizeClick(Sender: TObject);
    procedure Menu_WindowRightClick(Sender: TObject);
    procedure Menu_WIndow_AllNomalSizeClick(Sender: TObject);
    procedure Menu_XMLClick(Sender: TObject);
    procedure mnu_SelectORlineClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure peastClick(Sender: TObject);
    procedure redoClick(Sender: TObject);
    procedure selctallClick(Sender: TObject);
    procedure undoClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Main: TMain;


implementation

uses functionunit, interfaceunit, unit_edit, comp, repraceMacro, macrow,
  filetype_form, HtmlEdit, versiondialog;


{$R *.lfm}

{ TMain }




procedure TMain.Menu_NewClick(Sender: TObject);
begin
  interface_unit.new(false);
end;

procedure TMain.Menu_OLD_LoadClick(Sender: TObject);
begin
  try
    function_unit.load('temp2.txt','.ba');
  except
    showmessage('前回終了時のファイルがありません');
  end;
end;

procedure TMain.Menu_OpenClick(Sender: TObject);
begin
  interface_unit.open('');
end;

procedure TMain.Menu_OptionClick(Sender: TObject);
begin
  interface_unit.colordlgopen(3);
end;

procedure TMain.Menu_PascalClick(Sender: TObject);
begin
  function_unit.synHL_No := 3;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_PerlClick(Sender: TObject);
begin
  function_unit.synHL_No := 8;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_PHPClick(Sender: TObject);
begin
  function_unit.synHL_No := 9;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_pyhtonClick(Sender: TObject);
begin
  function_unit.synHL_No := 10;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_ReOpenClick(Sender: TObject);
begin
  interface_unit.reopen(main.PageControl1.ActivePageIndex);
end;

procedure TMain.Menu_repraceMcroClick(Sender: TObject);
begin
  reprace_unit.Show;
end;

procedure TMain.Menu_SaveAsClick(Sender: TObject);
begin
  interface_unit.saveas(main.PageControl1.ActivePageIndex);
end;

procedure TMain.menu_saveClick(Sender: TObject);
begin
  interface_unit.save(main.PageControl1.ActivePageIndex);
end;

procedure TMain.Menu_SetFontClick(Sender: TObject);
begin
  interface_unit.memofont;
end;

procedure TMain.Menu_SQLClick(Sender: TObject);
begin
  function_unit.synHL_No := 11;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_TabChengClick(Sender: TObject);
begin
  //showmessage(inttostr(function_unit.TabpageNo));
  interface_unit.tab_dock(function_unit.TabpageNo);
end;

procedure TMain.Menu_TEMP_LoadClick(Sender: TObject);
begin
  try
    //Mainform.Menu_AllCloseClick(mainform.Menu_AllClose);
    interface_unit.Allclose();
    function_unit.load('temp1.txt','.ba1');
  except
    showmessage('一時保存ファイルがありません');
  end;
end;

procedure TMain.Menu_TEMP_SaveClick(Sender: TObject);
begin
  function_unit.save('temp1.txt','.ba1')
end;

procedure TMain.Menu_ToolBarTABClick(Sender: TObject);
begin

end;

procedure TMain.Menu_ToolButtonSetClick(Sender: TObject);
begin
  interface_unit.colordlgopen(4);
end;

procedure TMain.Menu_URLClick(Sender: TObject);
var
  s:string;
begin
  s := utf8toansi(interface_unit.findsearch);
  interface_unit.HelpGoogl(s,'url');
end;

procedure TMain.Menu_Utf16Click(Sender: TObject);
begin
  interface_unit.char_set(main.PageControl1.ActivePageIndex,'UTF16');
end;

procedure TMain.Menu_UTF8Click(Sender: TObject);
begin
  interface_unit.char_set(main.PageControl1.ActivePageIndex,'UTF8');
end;

procedure TMain.Menu_VBScriptClick(Sender: TObject);
begin
  function_unit.synHL_No := 14;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_VershonClick(Sender: TObject);
begin
  vershon_form.ShowModal;
end;

procedure TMain.Menu_WindowAllMaxClick(Sender: TObject);
begin
  interface_unit.windowallset(1);
end;

procedure TMain.Menu_WindowAllMinClick(Sender: TObject);
begin
  interface_unit.windowallset(0);
end;

procedure TMain.Menu_WindowBottomClick(Sender: TObject);
begin
  interface_unit.windowdown;
end;

procedure TMain.Menu_WindowLeftClick(Sender: TObject);
begin
  interface_unit.windowleft;
end;

procedure TMain.Menu_WindowLockClick(Sender: TObject);
begin
  Menu_WindowLock.Checked := not Menu_WindowLock.Checked;
  if Menu_WindowLock.Checked then begin
    interface_unit.windowmove;
  end;
end;

procedure TMain.Menu_WindowMaxClick(Sender: TObject);
begin
  interface_unit.windowmax(function_unit.TabpageNo);
end;

procedure TMain.Menu_WindowMinClick(Sender: TObject);
begin
  interface_unit.windowmin(function_unit.TabpageNo);
end;

procedure TMain.Menu_WIndowNomalSizeClick(Sender: TObject);
begin
  interface_unit.windownormal(function_unit.TabpageNo);
end;

procedure TMain.Menu_WindowRightClick(Sender: TObject);
begin
  interface_unit.windowright;
end;

procedure TMain.Menu_WIndow_AllNomalSizeClick(Sender: TObject);
begin
  interface_unit.windowallset(2);
end;

procedure TMain.Menu_XMLClick(Sender: TObject);
begin
  function_unit.synHL_No := 15;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.mnu_SelectORlineClick(Sender: TObject);
begin
  main.mnu_SelectORline.Checked:= not main.mnu_SelectORline.Checked;
end;

procedure TMain.PageControl1Change(Sender: TObject);
begin
  Function_unit.TabAdd();
end;

procedure TMain.PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  function_unit.OLD_TabNO := main.PageControl1.ActivePageIndex;
end;

procedure TMain.peastClick(Sender: TObject);
begin
  interface_unit.past();
end;

procedure TMain.redoClick(Sender: TObject);
begin
  interface_unit.redo();
end;

procedure TMain.selctallClick(Sender: TObject);
begin
  interface_unit.selectAll();
end;

procedure TMain.undoClick(Sender: TObject);
begin
  interface_unit.undo();
end;

procedure TMain.FormCreate(Sender: TObject);
begin

end;

procedure TMain.FormDropFiles(Sender: TObject; const FileNames: array of String
  );
begin

end;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  interface_unit.exitAPP();
end;

procedure TMain.cutClick(Sender: TObject);
begin
  interface_unit.cut();
end;

procedure TMain.DeleteClick(Sender: TObject);
begin
  interface_unit.delete();
end;

procedure TMain.cpyClick(Sender: TObject);
begin
  interface_unit.copy();
end;

procedure TMain.ApplicationProperties1Activate(Sender: TObject);
begin

end;

procedure TMain.ApplicationProperties1DropFiles(Sender: TObject;
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
  function_unit.Run(function_unit.EnumFileFromDir(ansitoutf8(FileNames[i]),st));
  end;
  if st.Count > 0 then begin
    for i1 := 0 to st.count -1 do begin
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
             interface_unit.open(ansitoutf8(st[i1]));
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
          interface_unit.open(ansitoutf8(st[i1]));
        except
        end;
      end;
    end;
  end;
end;

procedure TMain.barbottomClick(Sender: TObject);
begin
  interface_unit.toolbaraligin('bottom');
end;

procedure TMain.barleftClick(Sender: TObject);
begin
  interface_unit.toolbaraligin('left');
end;

procedure TMain.barrightClick(Sender: TObject);
begin
  interface_unit.toolbaraligin('right');
end;

procedure TMain.bartopClick(Sender: TObject);
begin
  interface_unit.toolbaraligin('top');
end;

procedure TMain.FormShow(Sender: TObject);
begin
  function_unit.Run(function_unit.boot);
end;

procedure TMain.JsonEditClick(Sender: TObject);
begin

end;

procedure TMain.JsonSchemaEditClick(Sender: TObject);
begin

end;

procedure TMain.MenuC_chackmnuClick(Sender: TObject);
begin
  interface_unit.Mcrocheck(sender,true);
end;

procedure TMain.MenuItem10Click(Sender: TObject);
//var
  //f : TJSONEditForm;
begin
  //f := TJSONEditForm.Create(function_unit);
  //f.Show;
end;

procedure TMain.MenuItem13Click(Sender: TObject);
begin
  interface_unit.openSQLsetting;
end;

procedure TMain.MenuItem15Click(Sender: TObject);
begin

end;

procedure TMain.MenuItem17Click(Sender: TObject);
begin
  interface_unit.tool_dock;
end;

procedure TMain.MenuItem19Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to main.PageControl1.PageCount -2 do begin
    main.PageControl1.ActivePageIndex:= i;
    interface_unit.tab_dock(i);
  end;
end;

procedure TMain.MenuItem21Click(Sender: TObject);
var
  i:integer;
  sw:boolean;
begin
  for i := 0 to main.PageControl1.PageCount -2 do begin
    //main.PageControl1.ActivePageIndex:= i;
    interface_unit.tab_dock_off(i);
  end;
end;

procedure TMain.MenuItem25Click(Sender: TObject);
var
  i:integer;
  sw:boolean;
begin
  for i := 0 to main.PageControl1.PageCount -2 do begin
    main.PageControl1.ActivePageIndex:= i;
    interface_unit.tab_dock_on(i);
  end;
end;

procedure TMain.MenuItem28Click(Sender: TObject);
begin
  HTMLMenu.Show;
end;

procedure TMain.MenuItem4Click(Sender: TObject);
begin

end;

procedure TMain.MenuItem7Click(Sender: TObject);
begin
  interface_unit.MacroInsart(main.PageControl1.pageIndex,function_unit.macro_lng);
end;

procedure TMain.MenuItem8Click(Sender: TObject);
begin
  interface_unit.openSQLBuilder(main.PageControl1.pageIndex);
end;

procedure TMain.MenuItem90Click(Sender: TObject);
begin
  function_unit.macro(sender);
end;

procedure TMain.MenuI_UnixShellClick(Sender: TObject);
begin
  function_unit.synHL_No := 13;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.MenuWindowTopClick(Sender: TObject);
begin
  interface_unit.windowup;
end;

procedure TMain.Menu_AllCloseClick(Sender: TObject);
begin
  interface_unit.Allclose();
end;

procedure TMain.Menu_AllSaveAsClick(Sender: TObject);
begin
  interface_unit.allsaveas();
end;

procedure TMain.Menu_All_SaveClick(Sender: TObject);
begin
  interface_unit.allsave();
end;

procedure TMain.Menu_AnsiClick(Sender: TObject);
begin
  interface_unit.char_set(main.PageControl1.ActivePageIndex,'ANSI');
end;

procedure TMain.Menu_BATClick(Sender: TObject);
begin
  function_unit.synHL_No := 16;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_CClick(Sender: TObject);
begin
  function_unit.synHL_No := 0;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_CloseClick(Sender: TObject);
begin
  interface_unit.close(main.PageControl1.ActivePageIndex,true);
end;

procedure TMain.Menu_CssClick(Sender: TObject);
begin
  function_unit.synHL_No := 1;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_DelphiClick(Sender: TObject);
begin
  function_unit.synHL_No := 7;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_EditColorClick(Sender: TObject);
begin
  interface_unit.colordlgopen(1);
end;

procedure TMain.Menu_ExitClick(Sender: TObject);
begin
  interface_unit.exitAPP();
  close;
end;

procedure TMain.Menu_FIndsClick(Sender: TObject);
begin
  interface_unit.findwindow();
end;

procedure TMain.Menu_FreeHeightLightClick(Sender: TObject);
begin
    function_unit.synHL_No := 19;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_helpgoogle1Click(Sender: TObject);
var
  s:string;
begin
  s := InputBox('検索語句指定','必要であればヒントとなる語句を入力','');
  interface_unit.HelpGoogl('https://www.google.co.jp/#q=',s);
end;

procedure TMain.Menu_HilightColorClick(Sender: TObject);
begin
  interface_unit.colordlgopen(2);
end;

procedure TMain.Menu_HTMLClick(Sender: TObject);
begin
  function_unit.synHL_No := 4;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_INIClick(Sender: TObject);
begin
  function_unit.synHL_No := 17;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_Insert_CalacClick(Sender: TObject);
begin
  interface_unit.Calac(main.PageControl1.ActivePageIndex);
end;

procedure TMain.Menu_Insert_DayClick(Sender: TObject);
begin
  interface_unit.Calendar(main.PageControl1.ActivePageIndex);
end;

procedure TMain.Menu_Insert_TimeClick(Sender: TObject);
begin
  interface_unit.Time(main.PageControl1.ActivePageIndex);
end;

procedure TMain.Menu_JavaClick(Sender: TObject);
begin
  function_unit.synHL_No := 5;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_JSClick(Sender: TObject);
begin
  function_unit.synHL_No := 21;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_jsnClick(Sender: TObject);
begin
  function_unit.synHL_No := 22;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;



procedure TMain.Menu_lazarusClick(Sender: TObject);
begin
  function_unit.synHL_No := 20;
  function_unit.heighligthcheck(function_unit.synhl_No,true);
  function_unit.synchang(function_unit.synhl_No);
end;

procedure TMain.Menu_MacroElseClick(Sender: TObject);
begin
  macro_form.PageControl1.ActivePageIndex:=1;
  macro_form.ShowModal;
end;

procedure TMain.Menu_MacroRunClick(Sender: TObject);
begin
  interface_unit.macro_run(function_unit.Filename);
end;

procedure TMain.Menu_MacroSetUpClick(Sender: TObject);
begin
  macro_form.PageControl1.ActivePageIndex:=0;
  macro_form.ShowModal;
end;

procedure TMain.Menu_Macro_codeRunClick(Sender: TObject);
begin
  interface_unit.CodeRun;
end;

end.

