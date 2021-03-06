unit function_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, unit_edit,
  ComCtrls, StdCtrls, Menus, ExtDlgs, Process, fpjson, jsonparser, Masks,
  SynEdit, FileCtrl, Types
  {$IFDEF Windows}, shellAPI, memds, WIndows {$ENDIF};

type
  TeditList = class(TList)
  private
    function Get(Index: Integer): TEditform;
    procedure Put(Index: Integer; const Value: TEditform);
  public
    property Items[Index: Integer]: TEditform read Get write Put; default;
     destructor Destroy; override;
  end;

  TisThread = class(TThread)
  public
    procedure Execute; override;
  end;

  TMyFunctionArray = array[0..255] of function():boolean;

  ThreadFunc = function:boolean;

  { Tfunctionunit }

  Tfunctionunit = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    saveep:array[0..255] of integer;
    fcolorset,bcolorset:string;

    font_name:string;
    font_size:integer;

    o1:array[0..255] of integer;
    o2:array[0..255] of integer;
    b:array[0..50] of tbutton;
    tb:array[0..255] of tbutton;
    //colorset
    SymbolFrameColor,SymbolBackground,SymbolForeground,
    StringFrameColor,StringBackground,StringForeground,
    SpaceFrameColor,SpaceBackground,SpaceForeground,
    KeyFrameColor,KeyBackground,KeyForeground,
    IdentifierFrameColor,IdentifierBackground,IdentifierForeground,
    IDEDirectiveFrameColor,IDEDirectiveBackground,IDEDirectiveForeground,
    DirectiveFrameColor,DirectiveBackground,DirectiveForeground,
    commentFrameColor,commentBackground,commentForeground,
    caseFrameColor,caseBackground,caseForeground,
    asmFrameColor,asmBackground,asmForeground,
    DocumentFrameColor,DocumentBackground,DocumentForeground,
    InvalidFrameColor,InvalidBackground,InvalidForeground,
    NumberFrameColor,NumberBackground,NumberForeground,
    DirecFrameColor,DirecBackground,DirecForeground,
    DefaultPackageFrameColor,DefaultPackageBackground,DefaultPackageForeground,
    FunctionFrameColor,FunctionBackground,FunctionForeground,
    PLSQLFrameColor,PLSQLBackground,PLSQLForeground,
    SQLPlusFrameColor,SQLPlusBackground,SQLPlusForeground,
    TableNameFrameColor,TableNameBackground,TableNameForeground,
    VariableFrameColor,VariableBackground,VariableForeground,
    DocTypeFrameColor,DocTypeBackground,DocTypeForeground,
    NamespaceAttributeFrameColor,NamespaceAttributeBackground,NamespaceAttributeForeground,
    NamespaceAttributeValueFrameColor,NamespaceAttributeValueBackground,NamespaceAttributeValueForeground,
    ElementFrameColor,ElementBackground,ElementForeground,
    TextFrameColor,TextBackground,TextForeground,
    AndFrameColor,AndBackground,AndForeground,
    ASPFrameColor,ASPBackground,ASPForeground,
    UndefKeyFrameColor,UndefKeyBackground,UndefKeyForeground,
    ValueFrameColor,ValueBackground,ValueForeground,
    AttributeFrameColor,AttributeBackground,AttributeForeground,
    AttributeValueFrameColor,AttributeValueBackground,AttributeValueForeground,
    SectionFrameColor,SectionBackground,SectionForeground,
    ConstantFrameColor,ConstantBackground,ConstantForeground,
    ObjectFrameColor,ObjectBackground,ObjectForeground,
    SecondKeyFrameColor,SecondKeyBackground,SecondKeyForeground,
    varFrameColor,varBackground,varForeground,
    DefaultFrameColor,DefaultBackground,DefaultForeground,
    InvalidSymbolFrameColor,InvalidSymbolBackground,InvalidSymbolForeground,
    OperatorFrameColor,OperatorBackground,OperatorForeground,
    PragmaFrameColor,PragmaBackground,PragmaForeground
    :integer;
  public
    { public declarations }
    editlist:TEditList;
    edit_count:integer;
    NewSet:TStringList;
    toolbar:string;
    toolbarset : boolean;
    HighlintColorIndex:integer;
    LoadColorPriset,LoadFontSizePriset,LoadFontColorPriset:integer;
    toolbarbuttoncount,toolbarbuttoncount2,
    toolbarbuttonparnt,toolbarbuttonparnt2,
    toolbarcount:TStringList;
    toolbar_deflut:boolean;
    toolbar_deflut2:boolean;
    toolbar_compreat:boolean;
    tabtoolbarcount:integer;
    synHL_No:integer;
    macrocount,lng_mnu_count:integer;
    macro_lng,lun_macro,lngtype1,lngtype2:string;
    MainTitle,version:string;
    type_editbox:TStringList;
    isThread: TisThread;
    func_set: ThreadFunc;
    lng_mnu:array[0..20] of TMenuItem;
    r_name:array[0..10]of string;
    macro_c:array[0..10]of string;
    macro_p:array[0..10]of string;
    r:array[0..10]of TmenuItem;
    macro_comand:array[0..10]of string;
    macro_param:array[0..10]of string;
    p:array[0..100] of TTabSheet;
    p1:array[0..100] of TTabSheet;
    ptoolbar:array[0..100] of TToolbar;
    Edit_arry:array[0..40] of TEdit;
    true_boot:boolean;
    CodeMemDB:TMemDataset;
    st_ary1,st_ary2,st_ary3:array[0..2]of TStringList;
    stwordtype:TStringList;
    i_sw,i_sw2:integer;
    wordlist:string;
    code_supportList_sw:boolean;
    function load(dir, setfile,setname2:widestring):boolean;
    function save(dir,setfile,setname1:widestring):boolean;
    function loadmenulist:boolean;
    function mnu_Load():boolean;
    function iniread(dir:string):boolean;
    function iniwrite(dir:string):boolean;
    function toolbar_start():boolean;
    function setdialog:boolean;
    function create_StringList():boolean;
    function boot():boolean;
    function newwindow():boolean;
    function new:boolean;
    function window_off(i:integer):boolean;
    function window_on(i:integer):boolean;
    function addnew_tab(sw:boolean):boolean;
    function delete_edit_tab(tab:integer):boolean;
    function deleteAll_edittab():boolean;
    function tool_dock:boolean;
    function tab_dock_on(tab:integer):boolean;
    function tab_dock_off(tab:integer):boolean;
    function tab_dock(tab:integer):boolean;
    function windowallset(i:integer):boolean;
    function windownormal(i:integer):boolean;
    function windowmin(i:integer):boolean;
    function windowmax(i:integer):boolean;
    function windowmove:boolean;
    function windowleft:boolean;
    function windowright:boolean;
    function windowup:boolean;
    function windowdown:boolean;
    function toolwindow_off:boolean;
    function toolwindow_on:boolean;
    function toolbaraligin(s:string):string;
    function resizedocwindow(tabs:integer):boolean;
    function colordlgopen(typesw:integer):boolean;
    function pagenew(i:integer;Tabname:string):boolean;
    function pageout:boolean;
    function pagedelete(i:integer):boolean;
    function SelectToolBarPreSet(i:integer):integer;
    function SelectToolBarPreSet2(i:integer):integer;
    function toolbuttonset_autoset(i:integer):boolean;
    function setToolBarPreSet(S:TstringList):boolean;
    function setToolBarPreSet2(St:TstringList):boolean;
    function settoolbar(S:TstringList):boolean;

    function loadtoobutton:boolean;
    function loadtoobutton2(btn_count:integer):boolean;
    function save_mnu_set:boolean;
    function load_mnu_set:boolean;

    function toolbuttonset(i,i1:integer):boolean;
    function toolbuttonset2(i,i1,i2:integer):boolean;
    function mnu_custum(mnu_name1,mnu_name2,mnu_shortcut:TStringList):boolean;
    function mnu_custum_set(mnu_name1,mnu_name2,mnu_shortcut:TStringList):boolean;

    function deletebutton2():boolean;
    function deletebutton():boolean;
    function pagenew2(i:integer;s:string):TComponent;
    function tabseting2:boolean;
    function tabseting1:boolean;

    function pas(s:string):boolean;
    function fpas(s:string):boolean;
    function cpp(s:string):boolean;
    function java(s:string):boolean;
    function sql(s:string):boolean;
    function xml(s:string):boolean;
    function html(s:string):boolean;
    function css(s:string):boolean;
    function vbs(s:string):boolean;
    function bat(s:string):boolean;
    function ini(s:string):boolean;
    function freeset(s:string):boolean;
    function unics(s:string):boolean;
    function php(s:string):boolean;
    function perl(s:string):boolean;
    function JS(s:string):boolean;
    function highlitercolorset(fgcolor,bgcolor,frcolor:integer;s:string):boolean;
    function seteditcolor(fcolor,bcolor,fgcolor,bgcolor,frcolor:integer):boolean;
    function editcolor(fcolor,bcolor:integer):boolean;
    function LoadHighLightColorPriSet(i:integer):integer;
    function LoadEditColorPriset(alist:TstringList):boolean;
    function HighLightColorPriSet(alist:TStringList):boolean;
    function editcolorset(Fcolor,Bcolor:string):boolean;
    function heighligthcheck(i:integer;sw:boolean):string;
    function synchang(i:integer):boolean;
    function memoload(i:integer;s:string):boolean;
    function memosave(i:integer;s:widestring;memo:TStringList):boolean;
    function All_save():boolean;
    function All_saveAs():boolean;
    function exitAPP():boolean;
    function TitleSet(fname:string):boolean;
    function fileopen(FileNames: String):boolean;
    function reopen(Tabs:integer):boolean;
    function filesave(Tabs:integer):boolean;
    function saveas(Tabs:integer):boolean;
    function allsaveas():boolean;
    function allsave():boolean;
    function char_set(SetTab:integer;char_type:string):boolean;
    function str_charsets(i:integer;s:string):string;
    function versionSet(ver:string):boolean;
    {$IFDEF Windows}
    function winload(i:integer;s:string):boolean;
    function winsave(i:integer;s:widestring;memo:TStringList):boolean;
    function get_window(h:handle):boolean;
    function activeWindow(h:handle):boolean;
    {$ENDIF}
    {$IFDEF Linux}
    function linuxload(i:integer;s:string):boolean;
    function linuxsave(i:integer;s:string):boolean;
    {$ENDIF}
    {$IFDEF Darwin}
    function macOpen(s:string):boolean;
    function macload(i:integer;s:string):boolean;
    function macsave(i:integer;s:string):boolean;
    {$ENDIF}
    function TempFIle_Clear1(dir,s:string):boolean;
    function TempFIle_Clear2(dir,s:string):boolean;
    function TempFIle_Clear3(dir,s:string):boolean;

    function FileFindDir(Dir: string;st:TstringList):boolean;
    {Edit menu}
    function undo():boolean;
    function redo():boolean;
    function cut():boolean;
    function copy():boolean;
    function past():boolean;
    function selectAll():boolean;
    function delete():boolean;
    function Calendar(Tabs:integer):boolean;
    function Time(Tabs:integer):boolean;
    function Calac(Tabs:integer):boolean;
    function insert_text(Tabs:integer;data:string):boolean;

    {Find Menu}
    function findwindow():boolean;

    function findtext(fText:string;setText,getText:TStringList;X:integer):boolean;
    function findtext_test1(fText:string;setText,getText:TStringList;X:integer):boolean;
    function findtext_test2(fText:string;setText,getText:TStringList;X:integer):boolean;
    function findsearch:string;





    function reprace_selselect(pos:integer;find:string): boolean;

    function reprace_macro(s,find,reprace:string;count:integer):boolean;
    function findweb(word,helpword:string):boolean;

    {macro}
    function macro(send:TObject):boolean;
    function macrosetup(i:integer):boolean;
    function MacroInsart(i:integer;Lng:string):boolean;
    function CodeRun:boolean;
    function macro_run(file_name:string):boolean;
    function macro_run2(file_name:string):boolean;
    function macro_runex(file_name:string):boolean;
    function pross(set_name,set_name2:string):boolean;
    function pross2(command:string):boolean;
    function pross3(command:string):boolean;
    function Mcrocheck(send:TObject;sw:boolean):boolean;
    function LngeMenu_copy:boolean;

    {htmledit}
    function EditHtml(EditType:string;sorce,sorce2:TStringList):string;
    function BuildHTML(HTMLtext:TStringList):string;
    function setHtmlForm(HTMLtext,Sorse:TStringList;LineNo:integer):boolean;
    function SetHTMLPropathy(HTMLtext,GetProp,SetProp:string):string;
    function GetReplaceKeyWord(HTMLtext:string):string;
    function GetHTMLPropathy(HTMLtext:string;GetKeyWord:TStringList):string;
    function RepraceHTMLPropathy(HTMLtext:string;SetKeyWord:array of TEdit):string;
    function Set_Label(No:integer;SetLabel:string;ParentComp:TWinControl):TLabel;
    function Set_Edit(No:integer;SetEdit:string;ParentComp:TWinControl):TEdit;
    function Set_Coomp(HtmlParts:string;EditParts:TStringList;comp:TWinControl):boolean;

    function bunkatu(st,st2:TStringList):boolean;
    function bunkatu2(st:string;st2:TStringList):boolean;
    function bunkatu3(st,st1,st2:TStringList):boolean;
    function bunkatu4(st:string;st2:TStringList):boolean;
    function bunkatu5(st,st2:TStringList):boolean;
    function popupwin(c:char;edt:TsynEdit):boolean;
    function findcodeset(key:string):boolean;
    function get_code_list(sorce:TStringList):boolean;
    function get_code:boolean;
    function get_code2:boolean;
    function save_codeList(path:string):boolean;

    {sqlBuilder}
    function openSQLBuilder(i:integer):boolean;

    {jsonedit}
    function JsonParse(ST,st2:TStringlist;findword:string):boolean;
    function json_Keword_parse(st,st1:TStringList):boolean;

    {Thread}
    function set_function(f:ThreadFunc):boolean;
    function Run(f:ThreadFunc):boolean;
  end;

var
  functionunit: Tfunctionunit;
  {$IFDEF Windows}
     function load_text(st:pchar):pchar; stdcall; external 'utf.dll';
     function save_text(st:pchar):pchar; stdcall; external 'utf.dll';
     function encod_unicode(s:pchar):integer; stdcall; external 'utf.dll';
     function decoed_unicode(s:pchar):integer; stdcall; external 'utf.dll';
  {$ENDIF}
implementation

uses main, tool_window, colordlg, comp, macrow, find_unit, filetype_form,
  TableBuilder, sqlpropedit, Jsonparse, supportcodeinput;

{$R *.lfm}

{ Tfunctionunit }


function TeditList.Get(Index: Integer): TEditform;
begin
  Result :=  TEditform( inherited Get(Index) );
end;

procedure TeditList.Put(Index: Integer; const Value: TEditform);
begin
  inherited Put( Index, Value );
end;

destructor TeditList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;





function Tfunctionunit.load(dir, setfile,setname2:widestring):boolean;
var
  i,i1,i2,i3,count:integer;
  LIst:TStringList;
  s,s1,s2,s3:string;
begin
  List := TStringList.Create;
  List.Clear;
  try
    List.LoadFromFile(utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) ) + dir + setfile )));
  finally
    functionunit.deleteAll_edittab();
    try
      i1 := List.IndexOf('count');
      count := strtoint(List[i1 +1]);
      s3 := mainform.PageControl1.Pages[0].Caption;
      for i := 0 to count -1 do begin
        i1 := List.IndexOf('Backup_'+inttostr(i));
        if -1 < i1 then begin
          mainform.PageControl1.PageIndex := 0;
          //showmessage(inttostr(mainform.PageControl1.PageIndex));
          if i <> 0 then
            functionunit.newwindow();
          case list[i1+1] of
            'UFT8':mainform.Menu_UTF8Click(mainform.Menu_UTF8);
            'UTF16':mainform.Menu_UTF16Click(mainform.Menu_UTF16);
            'ANSI':mainform.Menu_ANSIClick(mainform.Menu_ANSI);
          end;
          //showmessage(utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) +
            //( IntToStr(i) + setname2)));
          functionunit.editlist.Items[i].Edit.LoadFromFile(utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) +
            (  dir + IntToStr(i) + setname2)));
          //functionunit.memoload(i,utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) ) +
          //  ( IntToStr(i) + setname2)));
          functionunit.editlist.Items[i].SynEdit1.Lines.Text:=
            functionunit.editlist.Items[i].Edit.Text;
          //showmessage(List[i1 +2]);
          mainform.PageControl1.Pages[i].Caption := List[i1 +2];
          //
          //showmessage(mainform.PageControl1.Pages[i].Caption);
          mainform.PageControl1.Pages[i].Caption:= List[i1 +2];

          functionunit.editlist.Items[i].filename_path:= List[i1 +3];
          functionunit.editlist.Items[i].filename:= List[i1 +3];
          functionunit.editlist.Items[i].Caption:= extractfilename(List[i1 +3]);
          //functionunit.editlist.Items[i].PageControl1.ActivePage.Caption:=extractfilename(List[i1 +3]);
          //extractfilename(List[i1 +3]);
          s := extractfileext(functionunit.editlist.Items[i].filename_path);
          s1 := extractfilename(functionunit.editlist.Items[i].filename_path);
      //showmessage(s);
      case s of
        '.txt':;
        '.html':mainform.Menu_HTMLClick(mainform.Menu_HTML);
        '.htm':mainform.Menu_HTMLClick(mainform.Menu_HTML);
        '.js':mainform.Menu_JSClick(mainform.Menu_JS);
        '.json':mainform.Menu_JsnClick(mainform.Menu_jsn);
        '.xml':mainform.Menu_XMLClick(mainform.Menu_XML);
        '.pas':mainform.Menu_DelphiClick(mainform.Menu_Delphi);
        '.c':mainform.Menu_CClick(mainform.Menu_C);
        '.h':mainform.Menu_CClick(mainform.Menu_C);
        '.cpp':mainform.Menu_CClick(mainform.Menu_C);
        '.sql':mainform.Menu_SQLClick(mainform.Menu_SQL);
        '.css':mainform.Menu_CssClick(mainform.Menu_Css);
        '.parl':mainform.Menu_PerlClick(mainform.Menu_Perl);
        '.php':mainform.Menu_PHPClick(mainform.Menu_PHP);
        '.vb':mainform.Menu_VBScriptClick(mainform.Menu_VBScript);
        '.bat':mainform.Menu_BATClick(mainform.Menu_BAT);
        '.ini':mainform.Menu_INIClick(mainform.Menu_INI);
        '.java':mainform.Menu_JavaClick(mainform.Menu_Java);
        '.sh':mainform.MenuI_UnixShellClick(mainform.MenuI_UnixShell);
        '.db3':begin
            s2 := '';
            for i3 := 1 to length(s1) -4 do begin;
                s2 := s2 + s1[i3];
            end;
            //functionunit.Run(functionunit.set_SQLtoStringGrid(s2,'SELECT * FROM '+S2,functionunit.editlist.Items[i].StringGrid1));
            functionunit.editlist.Items[i].SynEdit1.Lines.Text:= 'SELECT * FROM '+S2;
            functionunit.editlist.Items[i].PageControl1.ActivePageIndex:=2;
            functionunit.editlist.Items[i].Panel1.Visible:=TRUE;
         end;
      end;
        end;

      end;

    except
    end;
    mainform.PageControl1.Pages[0].Caption := s3;
    functionunit.editlist.Items[i].SaveDialog1.Filter := datamodule1.SaveDialog1.Filter;
  end;
end;

function Tfunctionunit.save(dir,setfile,setname1:widestring):boolean;
var
  i:integer;
  s,s1:string;
  List:TstringList;
begin
  //一時保存ファイル読み出し設定ファイル作成
  List := TstringList.Create;
  List.Clear;
  try
    List.Add('count');
    List.Add(inttostr(mainform.PageControl1.PageCount-1));
    for i := 0 to mainform.PageControl1.PageCount -2 do begin
      list.Add('Backup_'+inttostr(i));
      list.Add(functionunit.editlist.Items[i].char_sets);
      List.Add(mainform.PageControl1.Pages[i].Caption);
      List.Add(functionunit.editlist.Items[i].filename_path);
    end;
  finally
    ForceDirectories( ExtractFilePath( ParamStr(0) ) + dir);
    List.SaveToFile(
       utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) ) + dir + setfile )
      ));
  end;
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
       mainform.PageControl1.PageIndex := i;
       s1 := mainform.PageControl1.Pages[i].Caption;
       s :=  (ansitoutf8( ExtractFilePath( (Paramstr(0) )) + dir +
             IntToStr(i) + setname1));
       try
         //functionunit.save_sw := true;
         if functionunit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin
           functionunit.editlist.Items[i].Edit.Text:=
           functionunit.editlist.Items[i].SynEdit1.Text;
         end else if functionunit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
           functionunit.editlist.Items[i].Edit.Text:=
           functionunit.editlist.Items[i].Memo1.Text;
         end else if functionunit.editlist.Items[i].PageControl1.ActivePageIndex = 2 then begin
           functionunit.editlist.Items[i].Edit.Text:=
           functionunit.editlist.Items[i].SynEdit1.Text;
         end;
         functionunit.editlist.Items[i].Edit.SaveToFile(s);
         //functionunit.memosave(i,s,functionunit.editlist.Items[i].Edit);
       except

       end;
       functionunit.editlist.Items[i].filename_path := ((ExtractFilePath( (Paramstr(0) )) +
            s1));
       mainform.PageControl1.Pages[i].Caption := s1;
  end;
end;

function Tfunctionunit.loadmenulist:boolean;
var
  i,i1:integer;
begin
  i1 := 0;
  color_form.ListBox2.Items.Clear;
  for i := 0 to Mainform.Menu.Items.Count -1 do begin
    functionunit.o1[1] := i;
    for i1 := 0 to Mainform.Menu.Items.Items[i].Count -1 do begin
        color_form.ListBox2.Items.Add(Mainform.Menu.Items.Items[i].Items[i1].Caption);
        functionunit.o2[i1]  := i1;
    end;
  end;
end;

function Tfunctionunit.mnu_Load():boolean;
var
  i,i1,i2:integer;
begin
  i2 := 0;
  functionunit.loadmenulist;
      if functionunit.toolbar_deflut then begin
        functionunit.SelectToolBarPreSet(1);
        for i := 0 to Mainform.Menu.Items.Count -1 do begin
          inc(i2);
          for i1 := 0 to Mainform.Menu.Items[i].Count -1 do begin
            inc(i2);
          end;
        end;
        for i := 0 to i2 do begin
          functionunit.toolbuttonset_autoset(i);
        end;
      end else begin
      //functionunit.loadmenulist;
      end;
end;

function Tfunctionunit.iniread(dir:string):boolean;
var
  alist:TStringList;
  i,i1,i2,i3:integer;
  s,s1:string;
begin
  alist := TStringList.Create;
  alist.Clear;
  alist.LoadFromFile(
    utf8tosys(ExtractFilePath( systoutf8(Paramstr(0)) )  + dir + 'seting.ini')
  );

  i := alist.IndexOf('formtop');
  if -1 < i then begin
    mainform.Top := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formleft');
  if -1 < i then begin
    mainform.Left := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formwidth');
  if -1 < i then begin
    mainform.Width := strtoint(alist[i+1]);
  end;
  i := alist.IndexOf('formheight');
  if -1 < i then begin
    mainform.Height := strtoint(alist[i+1]);
  end;

  i := alist.IndexOf('editcolor');
  if -1 < i then begin
    try
      LoadColorPriset := strtoint(alist[i+1]);
      //functionunit.LoadHighLightColorPriSet(functionunit.LoadColorPriset);
    except
    end;
    try
      //functionunit.editlist.Items[mainform.PageControl1.PageCount -2].SynEdit1.Font.Size := strtoint(alist[i+2]);
      //LoadFontSizePriset := strtoint(alist[i+2]);
    except
    end;
    try
      NewSet.add(alist[i]);
      NewSet.add(alist[i+1]);
      //functionunit.editlist.Items[mainform.PageControl1.PageCount -2].SynEdit1.Font.Color := stringtocolor(alist[i+3]);
      functionunit.LoadFontColorPriset := stringtocolor(alist[i+3]);
    except
    end;
    try
      NewSet.add(alist[i+2]);
      //functionunit.editlist.Items[mainform.PageControl1.PageCount -2].SynEdit1.Color := stringtocolor(alist[i+4]);
    except
    end;
  end;

  i := alist.IndexOf('font');
  font_name := alist[i+1];
  font_size := strtoint(alist[i+2]);

  i := alist.IndexOf('memo1');
  if not mainform.Menu_MultWindow.Checked then begin
    if -1 < i then begin
      if (alist[i+ 1]) = 'on' then begin
        NewSet.add(alist[i]);
        NewSet.add(alist[i+1]);
        //mainform.Menu_MemoModeClick(mainform.Menu_MemoMode);
      end;
   end;
  end else begin
    if -1 < i then begin
      if (alist[i+ 1]) = 'on' then begin
        NewSet.add(alist[i]);
        NewSet.add(alist[i+1]);
        //mainform.Menu_MemoModeClick(mainform.Menu_MemoMode);
      end;
    end;
  end;

  {i := alist.IndexOf('memocolor');
  if -1 < i then begin
    NewSet.add(alist[i]);
    NewSet.add(alist[i+1]);
    NewSet.add(alist[i+2]);
    functionunit.editlist.Items[mainform.PageControl1.PageCount -2].Memo1.Font.Color := stringtocolor(alist[i+1]);
    functionunit.editlist.Items[mainform.PageControl1.PageCount -2].Memo1.Color := stringtocolor(alist[i+2]);
    functionunit.editlist.Items[mainform.PageControl1.PageCount -2].Memo1.Font.Size := strtoint(alist[i+3]);
  end;}

  i := alist.IndexOf('chrset');
  if -1 < i then begin
    if 'UTF8' = (alist[i+1]) then begin
      mainform.Menu_UTF8click(mainform.Menu_UTF8);
    end else if 'UTF16' = (alist[i+1]) then begin
      mainform.Menu_UTF16click(mainform.Menu_UTF16);
    end else if 'Ansi' = (alist[i+1]) then begin
      mainform.Menu_Ansiclick(mainform.Menu_Ansi);
    end;
  end;

  i := alist.IndexOf('codeblock');
  if -1 < i then begin
    if alist[i +1 ] = 'on' then
      color_form.CheckBox1.Checked:=true;
  end;

  i := alist.IndexOf('codesupport');
  if -1 < i then begin
    if alist[i +1 ] = 'on' then
      color_form.CheckBox2.Checked:=true;
  end;

  i := alist.IndexOf('listpopup');
  if -1 < i then begin
    //functionunit.readkey1 := alist[i +1 ];
    //functionunit.readkey2 := alist[i + 2];
  end;

  i := alist.IndexOf('codesupportpopup');
  if  -1 < i then begin
    //functionunit.readkey3 := alist[i +1 ];
    //functionunit.readkey4 := alist[i + 2];
  end;

  i := alist.IndexOf('syncolor');
  if -1 < i then begin
    i := alist.IndexOf('CommentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IDEDirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IdentifierAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('KeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SpaceAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('StringAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NumberAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AsmAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SymbolAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('CaseLabelAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirecAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('InvalidAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocumentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DefaultPackageAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('FunctionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('PLSQLAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SQLPlusAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TableNameAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('VariableAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocTypeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ElementAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TextAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AndAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ASPAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('UndefKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SectionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ConstantAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ObjectAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SecondKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('varAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
  end;


  i := alist.IndexOf('macro');
  if -1 < i then begin
    functionunit.macrocount:= strtoint(alist[i + 1]);
    for i1 := 0 to functionunit.macrocount -1 do begin
      functionunit.r_name[i1] := alist[i + 2];
      macro_form.Edit1.Text := alist[i+2];
      functionunit.macro_c[i1] := alist[i + 3];
      macro_form.edit2.Text := alist[i + 3];
      functionunit.macro_p[i1] := alist[i + 4];
      macro_form.ComboBox1.text := alist[i + 4];
      i := i + 3;
      functionunit.macrosetup(i1);
    end;
   end;

   i := alist.IndexOf('toolbarbutton');
   if -1 < i then begin
     for i1 := 0 to strtoint(alist[i+1]) -1 do begin
       functionunit.toolbarbuttoncount.Add(alist[i +2]);
       inc(i);
     end;
   end else begin
     functionunit.toolbar_deflut := true;
   end;

   //タブツールバー復元
   functionunit.settoolbar(alist);
   functionunit.setToolBarPreSet2(alist);

   i := alist.IndexOf('toolbar_deflut');
   if i <> -1 then begin
     i := alist.IndexOf('toolbarbutton');
     s := alist[i + 1];
     if '0' = s then begin
       functionunit.toolbar_deflut := true;
     end else begin
       functionunit.toolbar_deflut := false;
     end;
   end;

   i := alist.IndexOf('toolbar_deflut2');
   if i <> -1 then begin
     i := alist.IndexOf('toolbarbutton2');
     s := alist[i + 1];
     if '0' = s then begin
       functionunit.toolbar_deflut2 := true;
     end else begin
       functionunit.toolbar_deflut2 := false;
     end;
   end;

   i := alist.IndexOf('toolbarNotVisble');
   if i <> -1 then begin
     if 'true' = alist[i+1] then
     color_form.CheckBox4.Checked := true;
   end;

   i := alist.IndexOf('tabtoolbar');
   if i <> -1 then begin
     if 'true' = alist[i+1] then begin
       color_form.CheckBox3.Checked := true;
     end;
   end;

   i := alist.IndexOf('toolbarset');
   if -1 < i then begin
    if alist[i +1 ] = 'on' then begin
      functionunit.toolbarset := true;
    end;
  end;

   i := alist.IndexOf('toolbaraligin');
   if -1 < i then begin
    functionunit.toolbar := alist[i + 1];
  end;

  alist.Free;

end;

function Tfunctionunit.iniwrite(dir:string):boolean;
var
  alist:TStringList;
  i,i1,i2:integer;
begin
  i := mainform.PageControl1.ActivePageIndex;
  alist := TStringList.Create;
  alist.Clear;

  alist.Add('formtop');
  if mainform.WindowState <> wsNormal then begin
    mainform.WindowState:= wsNormal;
  end;
  alist.Add(inttostr(mainform.Top));
  alist.Add('formleft');
  alist.Add(inttostr(mainform.Left));
  alist.Add('formwidth');
  alist.Add(inttostr(mainform.Width));
  alist.Add('formheight');
  alist.Add(inttostr(mainform.Height));

  alist.Add('editcolor');
  alist.Add(inttostr(functionunit.LoadColorPriset));
  alist.Add(inttostr(functionunit.editlist.Items[i].Memo1.Font.Size));
  alist.Add(inttostr(functionunit.editlist.Items[i].SynEdit1.Color));
  alist.Add(inttostr(functionunit.editlist.Items[i].SynEdit1.Font.Size));


  alist.Add('Memo1');
  with functionunit.editlist.Items[i] do begin
    if PageControl1.ActivePage =  TabSheet1 then begin
      alist.Add('off');
    end else if PageControl1.ActivePage =  TabSheet2 then begin
      alist.Add('on');
    end;

    alist.Add('font');
    alist.Add(SynEdit1.Font.Name);
    alist.Add(inttostr(SynEdit1.Font.Size));

    {alist.Add('Memo1color');
    alist.Add(inttostr(Memo1.Font.Color));
    alist.Add(inttostr(Memo1.Color));
    alist.Add(inttostr(Memo1.Font.Size));}
  end;
  alist.Add('chrset');
  if mainform.Menu_UTF8.Checked then begin
    alist.Add('UTF8');
  end else if mainform.Menu_Ansi.Checked then begin
    alist.Add('Ansi');
  end else if mainform.Menu_UTF16.Checked then begin
    alist.Add('UTF16');
  end;

  alist.add('codeblock');
  if color_form.CheckBox1.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  alist.add('codesupport');
  if color_form.CheckBox2.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  {alist.Add('listpopup');
    alist.Add(inttostr(functionunit.listvkkey));
    alist.Add(inttostr(functionunit.popupkey));

  alist.Add('codesupportpopup');
    alist.Add(inttostr(functionunit.listvkkey2));
    alist.Add(inttostr(functionunit.popupkey2));
   }
  alist.Add('syncolor');
    alist.Add('CommentAttri');
    with datamodule1.SynCppSyn1.CommentAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DirecAttri');
    with datamodule1.SynCppSyn1.DirecAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('IDEDirectiveAttri');
    with datamodule1.SynPasSyn1.IDEDirectiveAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('IdentifierAttri');
    with datamodule1.SynCppSyn1.IdentifierAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('KeyAttri');
    with datamodule1.SynCppSyn1.KeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('SpaceAttri');
    with datamodule1.SynCppSyn1.SpaceAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('StringAttri');
    with datamodule1.SynCppSyn1.StringAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('NumberAttri');
    with datamodule1.SynCppSyn1.NumberAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('AsmAttri');
    with datamodule1.SynCppSyn1.AsmAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('SymbolAttri');
    with datamodule1.SynCppSyn1.SymbolAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('CaseLabelAttri');
    with datamodule1.SynPasSyn1.CaseLabelAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DirecAttri');
    with datamodule1.SynCppSyn1.DirecAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('InvalidAttri');
    with datamodule1.SynCppSyn1.InvalidAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('DocumentAttri');
    with datamodule1.SynJavaSyn1.DocumentAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('DefaultPackageAttri');
    with datamodule1.SynSQLSyn1.DefaultPackageAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('FunctionAttri');
    with datamodule1.SynSQLSyn1.FunctionAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('PLSQLAttri');
    with datamodule1.SynSQLSyn1.PLSQLAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SQLPlusAttri');
    with datamodule1.SynSQLSyn1.SQLPlusAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('TableNameAttri');
    with datamodule1.SynSQLSyn1.TableNameAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('VariableAttri');
    with datamodule1.SynSQLSyn1.VariableAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('DocTypeAttri');
    with datamodule1.SynXMLSyn1.DocTypeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('NamespaceAttributeAttri');
    with datamodule1.SynXMLSyn1.NamespaceAttributeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('NamespaceAttributeValueAttri');
    with datamodule1.SynXMLSyn1.NamespaceAttributeValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ElementAttri');
    with datamodule1.SynXMLSyn1.ElementAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('TextAttri');
    with datamodule1.SynXMLSyn1.TextAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AndAttri');
    with datamodule1.SynHTMLSyn1.AndAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ASPAttri');
    with datamodule1.SynHTMLSyn1.ASPAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('UndefKeyAttri');
    with datamodule1.SynHTMLSyn1.UndefKeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ValueAttri');
    with datamodule1.SynHTMLSyn1.ValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AttributeAttri');
    with datamodule1.SynXMLSyn1.AttributeAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('AttributeValueAttri');
    with datamodule1.SynXMLSyn1.AttributeValueAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SectionAttri');
    with datamodule1.SynIniSyn1.SectionAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;
    alist.Add('ConstantAttri');
    with datamodule1.SynAnySyn1.ConstantAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('ObjectAttri');
    with datamodule1.SynAnySyn1.ObjectAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('SecondKeyAttri');
    with datamodule1.SynUNIXShellScriptSyn1.SecondKeyAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

    alist.Add('varAttri');
    with datamodule1.SynUNIXShellScriptSyn1.VarAttri do begin
      alist.Add(inttostr(Foreground));
      alist.Add(inttostr(Background));
      alist.Add(inttostr(FrameColor));
    end;

  alist.Add('macro');
  alist.Add(inttostr(functionunit.macrocount));
  for i1 := 0 to functionunit.macrocount -1 do begin
    alist.Add(functionunit.r[i1].Caption);
    alist.Add(functionunit.macro_comand[i1]);
    alist.Add(functionunit.macro_param[i1]);
  end;

  alist.Add('toolbarbutton');
  alist.Add(inttostr(functionunit.toolbarbuttoncount.Count));
  for i1 := 0 to functionunit.toolbarbuttoncount.Count -1 do begin
    alist.Add(functionunit.toolbarbuttoncount[i1]);
  end;

  alist.Add('toolbarNotVisble');
  if color_form.CheckBox4.Checked then
    alist.Add('true')
  else
    alist.Add('false');

  alist.Add('tabtoolbar');
  if color_form.CheckBox3.Checked then
    alist.Add('true')
  else
    alist.Add('false');

  alist.Add('toolbar_deflut');
  alist.Add('off');

  alist.Add('toolpage');
  alist.Add(inttostr(toolwindow.PageControl1.PageCount));
  i2 := color_form.TabControl1.Tabs.Count;
  for i1 := 0 to toolwindow.PageControl1.PageCount -1 do begin
    alist.Add(toolwindow.PageControl1.Pages[i1].Caption);
  end;


    alist.Add('toolbarbutton2');
    alist.Add(inttostr(functionunit.toolbarbuttoncount2.Count));
    //showmessage(functionunit.toolbarbuttoncount2.Text);
    //showmessage(functionunit.toolbarbuttonparnt2.Text);
    if functionunit.toolbarbuttoncount2.Count >= 0 then begin
      for i1 := 0 to functionunit.toolbarbuttoncount2.Count -1 do begin
        alist.Add(functionunit.toolbarbuttoncount2[i1]);
        //設定読み込みからの起動後、終了前、toolbarbuttonparnt2の値が空白になる
        alist.Add(functionunit.toolbarbuttonparnt2[i1]);
      end;
    end;

  alist.Add('toolbar_deflut2');
  alist.Add('off');

  alist.Add('toolbarset');
  if color_form.CheckBox3.Checked then
    alist.Add('on')
  else
    alist.Add('off');

  alist.Add('toolbaraligin');
    alist.Add(functionunit.toolbaraligin(''));

    ForceDirectories( ExtractFilePath( (Paramstr(0)) )  + dir );
  alist.SaveToFile(
    utf8tosys(systoutf8(ExtractFilePath( (Paramstr(0)) )  + dir + 'seting.ini')
  ));
end;

function Tfunctionunit.toolbar_start():boolean;
begin
   if not functionunit.toolbar_deflut then begin
      functionunit.loadtoobutton;
    end;
    functionunit.toolbaraligin(functionunit.toolbar);
    if not functionunit.toolbarset then begin
      toolwindow.ToolBar2.Visible:= true;
    end else begin
      toolwindow.PageControl1.Visible:= not true;
      color_form.CheckBox3.Checked:= not true;
    end;
    color_form.CheckBox4Click(color_form.CheckBox4);
    if not functionunit.toolbar_deflut2 then begin
      //functionunit.loadtoobutton2(functionunit.tabtoolbarcount);
    end;
end;

function Tfunctionunit.create_StringList():boolean;
begin
  try
        functionunit.NewSet := TStringList.Create;
        functionunit.NewSet.clear;

        functionunit.toolbarbuttoncount := TStringList.Create;
        functionunit.toolbarbuttoncount.Clear;
        functionunit.toolbarbuttoncount2 := TStringList.Create;
        functionunit.toolbarbuttoncount2.Clear;
        functionunit.toolbarbuttonparnt := TStringList.Create;
        functionunit.toolbarbuttonparnt.Clear;
        functionunit.toolbarbuttonparnt2 := TStringList.Create;
        functionunit.toolbarbuttonparnt2.Clear;
        functionunit.toolbarcount := TStringList.Create;
        functionunit.toolbarcount.Clear;
        type_editbox := TstringList.Create;
        type_editbox.Clear;
        //functionunit.iniread;
      except
       // functionunit.frmpsnset;
      //  functionunit.iniwrite;
       // functionunit.iniread;
      end;
end;

function Tfunctionunit.setdialog:boolean;
var
  s:string;
begin
  s :=
  'AllFile|*.*|Text|*.txt|CSV|*.csv|JavaScript|*.js|HTML|*.html;*.htm|Css|*.css|Json|*.json|XML|*.xml|Java|*.java|C|*.c|C++|*.cpp|C hedder|*.h|C++ hedder|*.hpp|Pascal/Delphi|*.pas|PHP|*.php|UnixShell|*.sh|Bat|*.bat|INI|*.ini';
  datamodule1.OpenDialog1.Filter:= s;
  datamodule1.SaveDialog1.Filter:= s;
  macro_form.OpenDialog1.Filter:= s;
end;

function Tfunctionunit.boot():boolean;
var
  i,i1,i2:integer;
  s,st,st1,st2:TStringlist;
  tmp:string;
begin
  mainform.tabdbclick:=0;
  i := 0;
  try
    if not functionunit.true_boot then begin
    end else begin
      exit;
    end;
    mainform.AllowDropFiles := true;
    setdialog;
    //functionunit.Filename:= '';
    functionunit.version:= '';
    functionunit.versionSet('0.52');

    inc(i);//err1
    functionunit.create_StringList();
    inc(i);//err2

    functionunit.mnu_Load();
    {$IFDEF Windows}
         inc(i);//err3
         mainform.Menu_Ansi.Checked:= true;
    {$ENDIF}
    {$IFDEF LINUX}
         inc(i);//err3
         mainform.Menu_UTF8.Checked:= true;
    {$ENDIF}
    {$IFDEF Darwin}
         inc(i);//err3
         mainform.Menu_UTF8.Checked:= true;
    {$ENDIF}
    inc(i);//err4
    functionunit.newwindow();
    functionunit.toolwindow_off;
    //functionunit.TitleSet('');
    //functionunit.new(false);
    functionunit.toolbar_start();
    try
      {$IFDEF Windows}
         functionunit.iniread('ini\');
      {$ENDIF}
      {$IFDEF LINUX}
         functionunit.iniread('ini/');
      {$ENDIF}
      {$IFDEF Darwin}
         functionunit.iniread('ini/');
      {$ENDIF}
     except
       //functionunit.frmpsnset;
       inc(i);//err5
      {$IFDEF Windows}
         functionunit.iniread('ini\');
         functionunit.iniwrite('ini\');
      {$ENDIF}
      {$IFDEF LINUX}
         functionunit.iniread('ini/');
         functionunit.iniwrite('ini/');
      {$ENDIF}
      {$IFDEF Darwin}
         functionunit.iniread('ini/');
         functionunit.iniwrite('ini/');
      {$ENDIF}
     end;
     editlist.Items[0].SynEdit1.Font.Name:= font_name;
     editlist.Items[0].SynEdit1.Font.Size:= font_size;
     //editlist.Items[0].Memo1.Font.Name:= font_name;
     //editlist.Items[0].Memo1.Font.Size:= font_size;


     functionunit.new;
     functionunit.TitleSet(functionunit.editlist.Items[mainform.PageControl1.PageIndex].filename);
     inc(i);//err6
     functionunit.setdialog;
     inc(i);//err7
     //ここでエラー
     functionunit.LngeMenu_copy;
     inc(i);//err8
     functionunit.load_mnu_set();
     inc(i);//err9

     {for i1 := 1 to ParamCount do begin
       functionunit.fileopen(ansitoutf8(Paramstr(i1)));
     end;}

  st1 := TStringList.Create;
  st2 := TStringList.Create;
  for i1 := 0 to 2 do begin
    st_ary1[i1] := TStringList.Create;
    st_ary1[i1].Clear;
    st_ary2[i1] := TStringList.Create;
    st_ary2[i1].Clear;
    st_ary3[i1] := TStringList.Create;
    st_ary3[i1].Clear;
    stwordtype:=TStringlist.Create;
    stwordtype.Clear;
    i_sw := 0;
    i_sw2:=1;
  end;
      {$IFDEF Windows}
         tmp := 'temp\';
      {$ENDIF}
      {$IFDEF LINUX}
         tmp := 'temp/';
      {$ENDIF}
      {$IFDEF Darwin}
         tmp := 'temp/';
      {$ENDIF}
  try
  st1.LoadFromFile(extractfilepath(paramstr(0)) + tmp + 'func_List.csv');
  for i1 := 0 to st1.Count -1 do begin
    st2.CommaText := st1[i1];
    st_ary1[0].Add(st2[0]);
    st_ary1[1].Add(st2[1]);
  end;
  except

  end;
  try
  st1.LoadFromFile(extractfilepath(paramstr(0)) +  tmp + 'hensu_List.csv');
  for i := 0 to st1.Count -1 do begin
    st2.CommaText := st1[i];
    st_ary2[0].Add(st2[0]);
    st_ary2[1].Add(st2[1]);
  end;
  except

  end;
  try
  st1.LoadFromFile(extractfilepath(paramstr(0)) +  tmp + 'List.csv');
  for i := 0 to st1.Count -1 do begin
    st2.CommaText := st1[i];
    st_ary3[0].Add(st2[0]);
    st_ary3[1].Add(st2[1]);
  end;
  except

  end;



  functionunit.true_boot := true;
  st:= TStringlist.Create;
  st.Clear;
  s:= TStringlist.Create;
  s.Clear;
  //showmessage(inttostr(ParamCount));
  for I := 0 to ParamCount do begin
      {$IFDEF Windows}
         functionunit.FileFindDir(ansitoutf8(ParamStr(i)),st);
      {$ENDIF}
      {$IFDEF LINUX}
         functionunit.FileFindDir((ParamStr(i)),st);
      {$ENDIF}
      {$IFDEF Darwin}
         functionunit.FileFindDir((ParamStr(i)),st);
      {$ENDIF}
  end;
  if st.Count > 0 then begin
    for i1 := 1 to st.count -1 do begin
      if (-1 = openfiletypeform.CheckGroup1.Items.IndexOf(extractfileext(st[i1]))) then begin
        openfiletypeform.CheckGroup1.Items.Add(extractfileext(st[i1]));
      end;
    end;
    if openfiletypeform.CheckGroup1.Items.Count > 0 then begin
      openfiletypeform.ShowModal;
      for i := 0 to openfiletypeform.CheckGroup1.Items.Count -1 do begin
          if openfiletypeform.CheckGroup1.Checked[i] then begin
            s.add( openfiletypeform.CheckGroup1.Items[i] );
          end;
      end;
      for i1 := 0 to st.Count -1 do begin
         if -1 <> s.IndexOf( extractfileext(st[i1]) ) then begin
           try
             functionunit.fileopen(st[i1]);
           except
           end;
         end;
      end;
    end else if ParamCount > 0 then begin
      for i1 := 1 to st.Count -1 do begin
        try
          functionunit.fileopen(st[i1]);
        except
        end;
      end;
    end;
  end;
  if (st.count = 2) and (st[1] <> null) then begin
      functionunit.fileopen( st[1] );
  end;
     inc(i);//err10
  except
    showmessage('起動に失敗しました。'+chr(13)+'エラーコード '+inttostr(i));
  end;
  s.Free;
  st.Free;

end;

function Tfunctionunit.newwindow():boolean;
var
  tabs:integer;
  page:integer;
  i:integer;
begin
  i:=0;

  tabs := editlist.Count;
  addnew_tab(false);
  mainform.PageControl1.AddTabSheet;
  //tabs := mainform.PageControl1.PageCount -1;
  editlist.add(Teditform);
  editlist.Items[tabs] := Teditform.Create(self);
  //editlist.Items[tabs].Visible:=false;
  editlist.Items[tabs].Caption:= 'newfile' + inttostr(edit_count);
  editlist.Items[tabs].tabNo:= edit_count;
  editlist.Items[tabs].filename_path := 'newfile' + inttostr(edit_count);
  editlist.Items[tabs].filename:= 'newfile' + inttostr(edit_count);
  editlist.Items[tabs].AllowDropFiles := true;

  editlist.Items[tabs].SynEdit1.Font.Name:= font_name;
  editlist.Items[tabs].SynEdit1.Font.Size:= font_size;

  //editlist.Items[tabs].Memo1.Font.Name:= font_name;
  //editlist.Items[tabs].Memo1.Font.Size:= font_size;

  mainform.PageControl1.Pages[tabs].Caption:= editlist.Items[tabs].Caption;
  if mainform.Menu_Ansi.Checked = true then begin
    editlist.Items[tabs].char_sets:= 'ANSI';
  end else if mainform.Menu_UTF8.Checked = true then begin
    editlist.Items[tabs].char_sets:= 'UTF8';
  end else if mainform.Menu_Utf16.Checked = true then begin
    editlist.Items[tabs].char_sets:= 'UTF16';
  end;
  editlist.Items[tabs].dock_sw:= false;
  //editlist.Items[tabs].Visible:= true;
  functionunit.TitleSet(
    editlist.Items[tabs].filename_path
  );
  window_off(tabs);
  with editlist.Items[tabs] do
  begin
    if functionunit.true_boot then begin
    functionunit.LoadHighLightColorPriSet(functionunit.LoadColorPriset);
    end;
    DragMode := dmAutomatic;
    visible := true;
    Show;
    editlist.Items[tabs].SynEdit1.ScrollBars:= ssBoth;

    addnew_tab(true);
    inc(edit_count);
    page := mainform.PageControl1.PageIndex;
    mainform.PageControl1.Pages[page].OnClick:= mainform.OnClick;
    mainform.PageControl1.Pages[page].OnUnDock:=mainform.OnUnDock;
    editlist.Items[tabs].SaveDialog1.Filter:= datamodule1.SaveDialog1.Filter;
  end;
end;

function Tfunctionunit.new():boolean;
var
  tabs:integer;
begin
    tabs := mainform.PageControl1.PageCount-1;
    //editlist.Items[tabs].Visible:= true;
    //window_off(tabs);
    //show;
    //functionunit.editlist.Items[tabs].SynEdit1.Font.Size := functionunit.LoadFontSizePriset;
    //functionunit.editlist.Items[tabs].SynEdit1.Color := functionunit.LoadColorPriset;
    //functionunit.editlist.Items[tabs].Memo1.Font.Size:= functionunit.LoadFontSizePriset;
    functionunit.LoadHighLightColorPriSet(functionunit.LoadColorPriset);
    //color_form.ComboBox7.ItemIndex:= functionunit.LoadColorPriset;
    //color_form.ComboBox7Change(owner);

end;

function Tfunctionunit.window_off(i:integer):boolean;
begin
   try
      with editlist.Items[i] do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        dockmode := true;
        mainform.PageControl1.TabIndex:= i;
        ManualDock(Mainform);
        ManualDock(Mainform.PageControl1);
        //mainform.PageControl1.ActivePageIndex := i;
        ManualDock(Mainform.PageControl1.Pages[i]);
        BorderStyle:= bsnone;
        Align := alclient;
        //functionunit.resizedocwindow;
        editlist.Items[i].dock_sw:= true;
        WindowState:= wsNormal;
        width := width +1;
        //Visible:=true;
      end;
   except
   end;
end;

function Tfunctionunit.window_on(i:integer):boolean;
var
  r1:TRect;
begin
   try
      with editlist.Items[i] do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        r1.Top:= mainform.Top;
        r1.Left:=mainform.Left;
        r1.Right:=mainform.Width;
        r1.Bottom:=mainform.Height;
        Align := alnone;
        ManualFloat(r1);
        Top:= mainform.Top;
        Left:=mainform.Left;
        width:=mainform.Width;
        height:=mainform.Height;

        editlist.Items[i].dock_sw:= false;
        WindowState:= wsNormal;
        width := width +1;
        Visible:=true;
      end;
   except
   end;
end;

function Tfunctionunit.addnew_tab(sw:boolean):boolean;
begin
  if sw then begin
    mainform.PageControl1.AddTabSheet;
    mainform.PageControl1.Page[mainform.PageControl1.PageCount-1].Caption:= 'ADD';
    mainform.PageControl1.ActivePageIndex := mainform.PageControl1.PageCount -2;
  end else begin
    if mainform.PageControl1.PageCount > 0 then begin
      if mainform.PageControl1.Pages[mainform.PageControl1.PageCount-1].Caption = 'ADD' then begin
        mainform.PageControl1.Pages[mainform.PageControl1.PageCount-1].Destroy;
      end;
    end;
  end;
end;

function Tfunctionunit.delete_edit_tab(tab:integer):boolean;
begin
  mainform.PageControl1.Pages[tab].Destroy;
  functionunit.editlist.Items[tab].Destroy;
  functionunit.editlist.Delete(tab);
end;

function Tfunctionunit.deleteAll_edittab():boolean;
var
  i,i2,count:integer;
begin
  addnew_tab(not true);
  count := mainform.pageControl1.PageCount-1;
  i2 := count;
  for i:=0 to count do begin
    delete_edit_tab(i2);
    dec(i2);
  end;
  newwindow();
end;


function Tfunctionunit.tab_dock(tab:integer):boolean;
begin
  if not functionunit.editlist.Items[tab].dock_sw then begin
    functionunit.window_off(Tab);
  end else begin
    functionunit.window_on(tab);
  end;
end;

function Tfunctionunit.tab_dock_on(tab:integer):boolean;
begin
    functionunit.window_on(tab);
    //mainform.PageControl1.ActivePageIndex:= functionunit.TabpageNo;
end;

function Tfunctionunit.tab_dock_off(tab:integer):boolean;
begin
    functionunit.window_off(tab);
end;

function Tfunctionunit.tool_dock:boolean;
begin
  if not toolwindow.dock_sw then begin
    functionunit.toolwindow_off;
  end else begin
    functionunit.toolwindow_on;
  end;
end;


function Tfunctionunit.windowmove:boolean;
var
  i:integer;
begin
  i := Mainform.PageControl1.pageIndex;
  functionunit.editlist.Items[i].Top := Mainform.Top + Mainform.Height;
  functionunit.editlist.Items[i].Left := Mainform.Left;
  functionunit.editlist.Items[i].Width:= Mainform.Width;
end;

function Tfunctionunit.windowmin(i:integer):boolean;
begin
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].WindowState := wsMinimized;
end;

function Tfunctionunit.windowmax(i:integer):boolean;
begin
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].WindowState := wsMaximized;
end;

function Tfunctionunit.windownormal(i:integer):boolean;
begin
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].WindowState := wsNormal;
end;

function Tfunctionunit.windowallset(i:integer):boolean;
var
  i1:integer;
begin
  for i1 := 0 to Mainform.PageControl1.PageCount -2 do begin
    case i of
      0: windowmin(i1);
      1: windowmax(i1);
      2: windownormal(i1);
    end;
  end;
end;

function Tfunctionunit.windowleft:boolean;
var
  i:integer;
begin
  i := Mainform.PageControl1.pageIndex;
  if Mainform.PageControl1.pageIndex = -1 then
    exit;
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].top := 0;//Mainform.Top +95;
  functionunit.editlist.Items[i].left := 0;//{screen.Width} Mainform.Left + Mainform.Width  div 2;

  functionunit.editlist.Items[i].width := screen.Width div 2;//{screen.Width}Mainform.Width  div 2;
  functionunit.editlist.Items[i].height := screen.Height;//Mainform.Width -20;{screen.Height};
end;

function Tfunctionunit.windowright:boolean;
var
  i:integer;
begin
  i := Mainform.PageControl1.pageIndex;
  if Mainform.PageControl1.pageIndex = -1 then
    exit;
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].top := 0;//Mainform.Top +95;
  functionunit.editlist.Items[i].left := screen.Width div 2;//{screen.Width} Mainform.Left + Mainform.Width  div 2;

  functionunit.editlist.Items[i].width := screen.Width div 2;//{screen.Width}Mainform.Width  div 2;
  functionunit.editlist.Items[i].height := screen.Height;//Mainform.Width -20;{screen.Height};

end;

function Tfunctionunit.windowup:boolean;
var
  i:integer;
begin
  i := Mainform.PageControl1.pageIndex;
  if Mainform.PageControl1.pageIndex= -1 then
    exit;
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].top := 0;//Mainform.Top + Mainform.height;
  functionunit.editlist.Items[i].left := 0;//Mainform.Left;

  functionunit.editlist.Items[i].width := screen.Width;//Mainform.Width;
  functionunit.editlist.Items[i].height := screen.Height div 2;

end;

function Tfunctionunit.windowdown:boolean;
var
  i:integer;
begin
  i := Mainform.PageControl1.pageIndex;
  if Mainform.PageControl1.pageIndex = -1 then
    exit;
  if functionunit.editlist[i].dock_sw then
    exit;
  functionunit.editlist.Items[i].top := screen.Height div 2;//Mainform.Top +95;
  functionunit.editlist.Items[i].left := 0;//{screen.Width} Mainform.Left + Mainform.Width  div 2;

  functionunit.editlist.Items[i].width := screen.Width;//{screen.Width}Mainform.Width  div 2;
  functionunit.editlist.Items[i].height := screen.Height div 2;//Mainform.Width -20;{screen.Height};
end;

function Tfunctionunit.toolwindow_off:boolean;
begin
   try
      with toolwindow do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        Mainform.toolpanel.Visible:= true;
        ManualDock(Mainform);
        ManualDock(Mainform.toolpanel);
        BorderStyle:= bsnone;
        Align := alclient;
        //functionunit.resizedocwindow;
        dock_sw:= true;
        WindowState:= wsNormal;
        width := width +1;
        Visible:=true;
      end;
   except
   end;
end;

function Tfunctionunit.toolwindow_on:boolean;
var
  r1:TRect;
begin
   try
      with toolwindow do begin
        DragMode := dmAutomatic;//dmManual;
        DragKind := dkDock;//dkDrag;
        r1.Top:= mainform.Top;
        r1.Left:=mainform.Left;
        r1.Right:=mainform.Width;//UndockWidth;
        r1.Bottom:=mainform.toolpanel.Height;//UndockHeight;
        ManualFloat(r1);
        width := UndockWidth;//mainform.Width;
        height := UndockHeight;//toolwindow.PageControl1.ActivePage.Height + PageControl1.Height;

        BorderStyle:= bsSizeable;
        Align := alnone;
        Mainform.toolpanel.Visible:= false;
        //functionunit.resizedocwindow;
        dock_sw:= false;
        WindowState:= wsNormal;
        width := width +1;
        Visible:=true;
      end;
   except
   end;
end;

function Tfunctionunit.toolbaraligin(s:string):string;
var
  i:integer;
begin
  mainform.toolpanel.AutoSize:= true;
  if s = 'left'  then begin
    mainform.toolpanel.Align := alleft;
    toolwindow.ToolBar2.Align:= alleft;
    toolwindow.PageControl1.Align:=alleft;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.TabPosition := tpLeft;// :=toolwindow.PageControl1.TabPosition.tpleft;
    mainform.PageControl1.TabPosition:=tpLeft;//:=mainform.PageControl1.TabPosition.tpleft;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      functionunit.ptoolbar[i].AutoSize:= true;
      functionunit.ptoolbar[i].Align:= alleft;
    end;
  end;
  if s = 'right'  then begin
    mainform.toolpanel.Align := alright;
    toolwindow.ToolBar2.Align:= alright;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=alright;
    toolwindow.PageControl1.TabPosition:=tpRight;//:=toolwindow.PageControl1.TabPosition.tpright;
    mainform.PageControl1.TabPosition:=tpRight;//:=mainform.PageControl1.TabPosition.tpright;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      functionunit.ptoolbar[i].AutoSize:= true;
      functionunit.ptoolbar[i].Align:= alright;
    end;
  end;
  if s = 'top'  then begin
    mainform.toolpanel.Align := altop;
    toolwindow.ToolBar2.Align:= altop;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=altop;
    toolwindow.PageControl1.TabPosition:=tpTop;//:=toolwindow.PageControl1.TabPosition.tptop;
    mainform.PageControl1.TabPosition:=tpTop;//:=mainform.PageControl1.TabPosition.tptop;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      functionunit.ptoolbar[i].AutoSize:= true;
      functionunit.ptoolbar[i].Align:= altop;
    end;
  end;
  if s = 'bottom'  then begin
    mainform.toolpanel.Align := albottom;
    toolwindow.ToolBar2.Align:= albottom;
    toolwindow.PageControl1.AutoSize:= true;
    toolwindow.PageControl1.Align:=albottom;
    toolwindow.PageControl1.TabPosition:=tpBottom;//:=toolwindow.PageControl1.TabPosition.tpbottom;
    mainform.PageControl1.TabPosition:=tpBottom;//:=mainform.PageControl1.TabPosition.tpbottom;
    for i := 0 to toolwindow.PageControl1.PageCount -1 do begin
      functionunit.ptoolbar[i].AutoSize:= true;
      functionunit.ptoolbar[i].Align:= albottom;
    end;
  end;
  if s = '' then begin
    if mainform.toolpanel.Align = alleft then
      toolbaraligin:=('left')
    else if mainform.toolpanel.Align = alright then
      toolbaraligin:=('right')
    else if mainform.toolpanel.Align = altop then
      toolbaraligin:=('top')
    else if mainform.toolpanel.Align = albottom then
      toolbaraligin:=('bottom');
  end;

  functionunit.resizedocwindow(mainform.PageControl1.ActivePageIndex);
end;

function Tfunctionunit.resizedocwindow(tabs:integer):boolean;
begin
  //if MainForm.count > 0 then
  begin
    //if not MainForm.Menu_MultWindow.Checked then
       begin
      with functionunit.editlist.Items[tabs] do begin
      Top:= 0;
      Left:=0;
      Width:= Mainform.Width;
      Height:=Mainform.Height;
      end;
    end;
  end;
end;

function Tfunctionunit.colordlgopen(typesw:integer):boolean;
begin
  if typesw = 1 then begin
    color_form.PageControl1.ActivePageIndex:= 0;
  end else  if typesw = 2 then begin
    color_form.PageControl1.ActivePageIndex:= 1;
  end else  if typesw = 3 then begin
    color_form.PageControl1.ActivePageIndex:= 2;
  end else  if typesw = 4 then begin
    color_form.PageControl1.ActivePageIndex:= 3;
  end else if typesw = 5 then begin
    color_form.PageControl1.ActivePageIndex:= 4;
  end;
  color_form.Show;
end;

function Tfunctionunit.pagenew(i:integer;Tabname:string):boolean;
begin
  //if functionunit.toolbar_deflut then
    //exit;
  try
  with functionunit do begin
    color_form.TabControl1.Tabs.Add(tabname);
    p[i] := TTabSheet.Create(self);
    p[i].Caption:= tabname;
    p[i].Name:= 'P' + inttostr(i);
    p[i].Parent := toolwindow.PageControl1;
    ptoolbar[i] := TToolBar.Create(self);
    ptoolbar[i].AutoSize:= true;
    ptoolbar[i].Caption:= 't' + inttostr(i);
    ptoolbar[i].Name:='t' + inttostr(i);
    ptoolbar[i].Parent := p[i];
    //ptoolbar[i].AutoSize:=true;
    p[i].AutoSize:= true;
  end;
  except
  end;
end;

function Tfunctionunit.pageout:boolean;
var
  i:integer;
begin
  color_form.TabControl1.Tabs.Clear;
  color_form.ComboBox5.Items.Clear;
  if color_form.CheckBox3.Checked then begin
    for i := 0 to toolwindow.PageControl1.ControlCount -1 do begin
      color_form.TabControl1.Tabs.Add(
        toolwindow.PageControl1.Page[i].Caption
      );

      color_form.ComboBox5.Items.Add(
        toolwindow.PageControl1.Page[i].Caption
      );
    end;
    color_form.ListBox1.Items.Clear;
    for i := 0 to functionunit.toolbarbuttoncount2.Count -1 do begin
      color_form.ListBox1.Items.Add(color_form.ListBox2.Items[strtoint(functionunit.toolbarbuttoncount2[i])]);
    end;
  end else begin
    color_form.ListBox1.Items.Clear;
    for i := 0 to functionunit.toolbarbuttoncount.Count -1 do begin
      if functionunit.toolbarbuttoncount[i] <> '' then begin
        color_form.ListBox1.Items.Add(color_form.ListBox2.Items[strtoint(functionunit.toolbarbuttoncount[i])]);
      end;
    end;
  end;
end;

function Tfunctionunit.SelectToolBarPreSet(i:integer):integer;
var
  s:TStringList;
  setfile:string;
begin
  s := TStringList.Create;;
  s.Clear;
  case i of
    0:begin
      SelectToolBarPreSet := 5;
    end;
    1:begin
     try
       setfile := inttostr(i)+'.ini';
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      except
      s.Text:=
      'toolbarbutton' + chr(13)
      + '13' + chr(13)
      + '0' + chr(13)
      + '2' + chr(13)
      + '4' + chr(13)
      + '6' + chr(13)
      + '9' + chr(13)
      + '16' + chr(13)
      + '17' + chr(13)
      + '20' + chr(13)
      + '21' + chr(13)
      + '23' + chr(13)
      + '24' + chr(13)
      + '25' + chr(13)
      + '26' + chr(13)
      + '27' + chr(13);
      s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      end;
    end;

    2:begin
     try
     setfile := inttostr(i)+'.ini';
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      except
     s.Text:=
     'toolbarbutton' + chr(13)
     + '10' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '9' + chr(13)
     + '12' + chr(13)
     + '13' + chr(13)
     + '14' + chr(13)
     + '16' + chr(13)
     + '17' + chr(13)
     + '19' + chr(13);
    s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      end;
    end;

    3:begin
     try
     setfile := inttostr(i)+'.ini';
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      except
     s.Text:=
     'toolbarbutton' + chr(13)
     + '21' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '7' + chr(13)
     + '9' + chr(13)
     + '10' + chr(13)
     + '12' + chr(13)
     + '13' + chr(13)
     + '14' + chr(13)
     + '16' + chr(13)
     + '17' + chr(13)
     + '20' + chr(13)
     + '21' + chr(13)
     + '23' + chr(13)
     + '24' + chr(13)
     + '25' + chr(13)
     + '26' + chr(13)
     + '27' + chr(13)
     + '31' + chr(13)
     + '32' + chr(13)
     + '33' + chr(13)
     + '35' + chr(13);
    s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      end;
    end;

    4:begin
     try
     setfile := inttostr(i)+'.ini';
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      except
     s.Text:=
     'toolbarbutton' + chr(13)
     + '22' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '6' + chr(13)
     + '12' + chr(13)
     + '13' + chr(13)
     + '14' + chr(13)
     + '16' + chr(13)
     + '40' + chr(13)
     + '41' + chr(13)
     + '44' + chr(13)
     + '45' + chr(13)
     + '46' + chr(13)
     + '47' + chr(13)
     + '48' + chr(13)
     + '49' + chr(13)
     + '50' + chr(13)
     + '51' + chr(13)
     + '52' + chr(13)
     + '53' + chr(13)
     + '54' + chr(13)
     + '55' + chr(13)
     + '56' + chr(13)
     + '57' + chr(13);
    s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      end;
    end;

    5:begin
     try
     setfile := inttostr(i)+'.ini';
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      except
     s.Text:=
          'toolbarbutton' + chr(13)
     + '28' + chr(13)
     + '0' + chr(13)
     + '2' + chr(13)
     + '4' + chr(13)
     + '6' + chr(13)
     + '7' + chr(13)
     + '12' + chr(13)
     + '13' + chr(13)
     + '14' + chr(13)
     + '20' + chr(13)
     + '21' + chr(13)
     + '23' + chr(13)
     + '24' + chr(13)
     + '25' + chr(13)
     + '26' + chr(13)
     + '27' + chr(13)
     + '32' + chr(13)
     + '33' + chr(13)
     + '65' + chr(13)
     + '66' + chr(13)
     + '67' + chr(13)
     + '68' + chr(13)
     + '69' + chr(13)
     + '111' + chr(13)
     + '112' + chr(13)
     + '113' + chr(13)
     + '114' + chr(13)
     + '117' + chr(13)
     + '118' + chr(13)
     + '119' + chr(13);
    s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile ))
        );
      end;
    end;
  end;
  setToolBarPreSet(S);
  s.Free;
end;

function Tfunctionunit.SelectToolBarPreSet2(i:integer):integer;
var
  s,s1,s2:TStringList;
  setfile,setfile2,setfile3:string;
  i1,i2:integer;
begin
  s := TStringList.Create;
  s.Clear;
  s1 := TStringList.Create;
  s1.Clear;
  s2 := TStringList.Create;
  s2.Clear;
  case i of
    0:begin
      SelectToolBarPreSet2 := 1;
    end;
    1:begin
     try
       setfile2 := inttostr(1)+'t.ini';
       setfile3 := inttostr(1)+'tt.ini' ;
        s.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile2 ))
        );
        s1.LoadFromFile(
         utf8tosys(systoutf8( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile3 ))
        );
      except
      s.Text:=
           'toolbarbutton2' + chr(13)
     + '83' + chr(13)
     + '0' + chr(13)
     + 't0' + chr(13)
     + '2' + chr(13)
     + 't0' + chr(13)
     + '4' + chr(13)
     + 't0' + chr(13)
     + '6' + chr(13)
     + 't0' + chr(13)
     + '9' + chr(13)
     + 't0' + chr(13)
     + '12' + chr(13)
     + 't0' + chr(13)
     + '13' + chr(13)
     + 't0' + chr(13)
     + '14' + chr(13)
     + 't0' + chr(13)
     + '16' + chr(13)
     + 't0' + chr(13)
     + '17' + chr(13)
     + 't0' + chr(13)
     + '19' + chr(13)
     + 't0' + chr(13)
     + '20' + chr(13)
     + 't1' + chr(13)
     + '21' + chr(13)
     + 't1' + chr(13)
     + '23' + chr(13)
     + 't1' + chr(13)
     + '24' + chr(13)
     + 't1' + chr(13)
     + '25' + chr(13)
     + 't1' + chr(13)
     + '26' + chr(13)
     + 't1' + chr(13)
     + '27' + chr(13)
     + 't1' + chr(13)
     + '29' + chr(13)
     + 't1' + chr(13)
     + '30' + chr(13)
     + 't1' + chr(13)
     + '31' + chr(13)
     + 't1' + chr(13)
     + '32' + chr(13)
     + 't1' + chr(13)
     + '33' + chr(13)
     + 't1' + chr(13)
     + '35' + chr(13)
     + 't1' + chr(13)
     + '40' + chr(13)
     + 't2' + chr(13)
     + '41' + chr(13)
     + 't2' + chr(13)
     + '42' + chr(13)
     + 't2' + chr(13)
     + '43' + chr(13)
     + 't2' + chr(13)
     + '44' + chr(13)
     + 't2' + chr(13)
     + '45' + chr(13)
     + 't2' + chr(13)
     + '46' + chr(13)
     + 't2' + chr(13)
     + '47' + chr(13)
     + 't2' + chr(13)
     + '48' + chr(13)
     + 't2' + chr(13)
     + '49' + chr(13)
     + 't2' + chr(13)
     + '50' + chr(13)
     + 't2' + chr(13)
     + '51' + chr(13)
     + 't2' + chr(13)
     + '52' + chr(13)
     + 't2' + chr(13)
     + '53' + chr(13)
     + 't2' + chr(13)
     + '54' + chr(13)
     + 't2' + chr(13)
     + '55' + chr(13)
     + 't2' + chr(13)
     + '56' + chr(13)
     + 't2' + chr(13)
     + '57' + chr(13)
     + 't2' + chr(13)
     + '65' + chr(13)
     + 't3' + chr(13)
     + '66' + chr(13)
     + 't3' + chr(13)
     + '67' + chr(13)
     + 't3' + chr(13)
     + '68' + chr(13)
     + 't3' + chr(13)
     + '69' + chr(13)
     + 't3' + chr(13)
     + '71' + chr(13)
     + 't3' + chr(13)
     + '72' + chr(13)
     + 't3' + chr(13)
     + '73' + chr(13)
     + 't3' + chr(13)
     + '74' + chr(13)
     + 't3' + chr(13)
     + '75' + chr(13)
     + 't3' + chr(13)
     + '76' + chr(13)
     + 't3' + chr(13)
     + '78' + chr(13)
     + 't3' + chr(13)
     + '79' + chr(13)
     + 't3' + chr(13)
     + '80' + chr(13)
     + 't3' + chr(13)
     + '81' + chr(13)
     + 't3' + chr(13)
     + '82' + chr(13)
     + 't3' + chr(13)
     + '83' + chr(13)
     + 't4' + chr(13)
     + '85' + chr(13)
     + 't4' + chr(13)
     + '87' + chr(13)
     + 't4' + chr(13)
     + '88' + chr(13)
     + 't4' + chr(13)
     + '89' + chr(13)
     + 't4' + chr(13)
     + '90' + chr(13)
     + 't5' + chr(13)
     + '92' + chr(13)
     + 't5' + chr(13)
     + '94' + chr(13)
     + 't5' + chr(13)
     + '95' + chr(13)
     + 't5' + chr(13)
     + '96' + chr(13)
     + 't5' + chr(13)
     + '98' + chr(13)
     + 't5' + chr(13)
     + '99' + chr(13)
     + 't5' + chr(13)
     + '102' + chr(13)
     + 't5' + chr(13)
     + '103' + chr(13)
     + 't5' + chr(13)
     + '104' + chr(13)
     + 't5' + chr(13)
     + '105' + chr(13)
     + 't5' + chr(13)
     + '108' + chr(13)
     + 't6' + chr(13)
     + '109' + chr(13)
     + 't6' + chr(13)
     + '111' + chr(13)
     + 't6' + chr(13)
     + '112' + chr(13)
     + 't6' + chr(13)
     + '113' + chr(13)
     + 't6' + chr(13)
     + '114' + chr(13)
     + 't6' + chr(13)
     + '117' + chr(13)
     + 't6' + chr(13)
     + '118' + chr(13)
     + 't6' + chr(13)
     + '119' + chr(13)
     + 't6' + chr(13);

      s.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile2 ))
        );



      s1.Text:=
      'toolpage' + chr(13)
     + '7' + chr(13)
     + 'ファイル' + chr(13)
     + '編集' + chr(13)
     + '強調表示' + chr(13)
     + 'オプション' + chr(13)
     + 'タブ' + chr(13)
     + 'ウインドウ' + chr(13)
     + 'マクロ' + chr(13);

      s1.SaveToFile(
         systoutf8(utf8tosys( ExtractFilePath( (Paramstr(0)) )  + 'ini\' + setfile3 ))
        );
      end;
    end;
  end;
  functionunit.tabtoolbarcount := 8;


  settoolbar(s1);
  setToolBarPreSet2(S);
  s.Free;
  s1.Free;
end;

function Tfunctionunit.toolbuttonset(i,i1:integer):boolean;
var
  i2,i3,i4:integer;
  //p1:TTabSheet;
  sw1:boolean;
begin
  //if functionunit.toolbar_deflut then
    //exit;
  with color_form do begin
    b[i] := tbutton.Create(self);
    b[i].Parent := toolwindow.ToolBar2;
    b[i].Left:= toolwindow.ToolBar2.Width;
    b[i].Caption:= ListBox2.Items[i1];
    b[i].AutoSize:= true;
    if not checkbox3.Checked then
      ListBox1.Items.Add(b[i].Caption);
    for i4 := 0 to i do begin
      if b[i4].Name= 'b' + inttostr(listbox1.Items.Count -1) then begin
        break;
      end else begin
        b[i].Name:= 'b' + inttostr(listbox1.Items.Count -1);
        break;
      end;
    end;
    b[i].Visible:= true;
    if toolwindow.PageControl1.PageCount > 0 then
      sw1 := true;
    for i2 := 0 to mainform.Menu.Items.Count -1 do begin
      if not sw1 then begin
        p1[i] := TTabSheet.Create(self);
        p1[i].Caption:= mainform.Menu.Items[i2].Caption;
        if -1 = toolwindow.PageControl1.IndexOf(p1[i]) then
          functionunit.pagenew2(i2,mainform.Menu.Items[i2].Caption);
        //p1.Free;
      end;
        //toolwindow.PageControl1.Add(MainForm.Menu.Items[i2].Caption);
      for i3 := 0 to mainform.Menu.Items.Items[i2].Count -1 do begin
        if mainform.Menu.Items[i2].Items[i3].Caption = b[i].Caption then
          b[i].OnClick:= mainform.Menu.Items[i2].Items[i3].OnClick;
      end;
    end;
  end;
end;

function Tfunctionunit.toolbuttonset2(i,i1,i2:integer):boolean;
var
  i3,i4:integer;
  sw:boolean;
  s:string;
  c:TComponent;
begin
  //if functionunit.toolbar_deflut then
    //exit;
  with color_form do begin
    tb[i] := tbutton.Create(self);
    tb[i].Parent := functionunit.ptoolbar[i2];
    tb[i].Left:= toolwindow.ToolBar2.Width;
    tb[i].Caption:= ListBox2.Items[i1];
    tb[i].AutoSize:= true;
    //tb[i].Align:= alLeft;
    sw := checkbox3.Checked;
    //checkbox3.Checked := true;
    if sw then
      ListBox1.Items.Add(tb[i].Caption);
    s := 'tb' + inttostr(i);
    c := owner.FindComponent(s);
    if c = nil then begin
      tb[i].Visible:= true;
          for i3 := 0 to mainform.Menu.Items.Count -1 do begin
            for i4 := 0 to mainform.Menu.Items.Items[i3].Count -1 do begin
              if mainform.Menu.Items[i3].Items[i4].Caption = tb[i].Caption then
                tb[i].OnClick:= mainform.Menu.Items[i3].Items[i4].OnClick;
            end;
          end;
      tb[i].Name:= s;
      functionunit.toolbarbuttonparnt2.Add(functionunit.tb[i].Parent.Name);
      exit;
    end;
     //tb[i].Name:= s;
    //showmessage(inttostr(i2));
    //functionunit.toolbarbuttonparnt2.Add(functionunit.tb[i].Parent.Name);

    //checkbox3.Checked := sw;
  end;
  //showmessage(functionunit.toolbarbuttonparnt2.text);
end;

function Tfunctionunit.mnu_custum(mnu_name1,mnu_name2,mnu_shortcut:TStringList):boolean;
var
  i3,i4:integer;
  sw:boolean;
  s,s2:string;
  c:Low(Word)..High(Word);
  key:TShiftState;
begin
         for i3 := 0 to mainform.Menu.Items.Count -1 do begin
            mnu_name1.Add(mainform.Menu.Items[i3].Caption);
            for i4 := 0 to mainform.Menu.Items.Items[i3].Count -1 do begin
              mnu_name2.Add(mainform.Menu.Items[i3].Items[i4].Caption);
                c := mainform.Menu.Items[i3].Items[i4].ShortCut;
                s := inttostr(c);
                case s[1] of
                  '0':begin
                     c:= 0;
                     s2 := '0';//non
                  end;
                  '1':begin
                     c:= c-16384;//ssCTRL
                     s2 := '2';
                  end;
                  '8':begin
                     c:= c-8192;//ssShift
                     s2 := '1';
                  end;
                  '2':begin
                     c:= c-24576;//ssCTRL+ssShift
                     s2 := '3'
                  end;
                end;
                mnu_shortcut.Add(inttostr(c)+','+s2);
            end;
          end;
 end;

function Tfunctionunit.mnu_custum_set(mnu_name1,mnu_name2,mnu_shortcut:TStringList):boolean;
var
  i3,i4,i5:integer;
  sw:boolean;
  s:TShiftState;
  s2,s3:string;
  c:Low(Word)..High(Word);
  function get_shortcut1(key:string):string;
  var
    i,count:integer;
    str:string;
  begin
    count := ansipos(',',key);
    str:='';
    for i := 1 to count-1 do begin
      str := str + key[i];
    end;
    get_shortcut1 := str;
  end;
  function get_shortcut2(key:string):string;
  var
    i,i1,count:integer;
    str:string;
  begin
    i1 := ansipos(',',key);
    count := length(key);
    str:='';
    for i := i1+1 to count do begin
      str := str + key[i];
    end;
    get_shortcut2 := str;
  end;
begin
      i5 := 0;
          for i3 := 0 to mainform.Menu.Items.Count -1 do begin
            mainform.Menu.Items[i3].Caption := mnu_name1[i3];
            for i4 := 0 to mainform.Menu.Items.Items[i3].Count -1 do begin
                s2 := get_shortcut1( mnu_shortcut[i5] );
                s3 := get_shortcut2( mnu_shortcut[i5] );
                s := [];
                case s3 of
                  '0':s:=[];
                  '2':s:=[ssCtrl];
                  '1':s:=[ssShift];
                  '3':s:=[ssCtrl] + [ssShift];
                end;
                mainform.Menu.Items[i3].Items[i4].Caption := mnu_name2[i5];
                if (s2 <> '') and (s3 <> '0') then begin
                  c := ShortCut(strtoint(s2), s);
                  mainform.Menu.Items[i3].Items[i4].ShortCut := c;
                end;
                inc(i5);
            end;
          end;
end;

function Tfunctionunit.toolbuttonset_autoset(i:integer):boolean;
var
  i2,i3,i4,i5:integer;
begin
  with color_form do begin
    //if functionunit.toolbar_compreat then
      //exit;
    i4 := 0;
    for i2 := 0 to mainform.Menu.Items.Count -1 do begin
      //if mainform.Menu.Items[i2].Name <> 'Menu_RootTAB' then begin
        p1[i] := TTabSheet.Create(self);
        p1[i].Caption:= mainform.Menu.Items[i2].Caption;
        ptoolbar[i2] := TToolbar.Create(self);
        ptoolbar[i2].Parent := p1[i];
     // end;

        //ptoolbar[i2].OnResize := mainform.ToolBar2.OnResize(self);
        //ptoolbar[i2].Align:= alClient;
        //p1[i].OnResize:= mainform.TabSheet1Resize(sender);
        //if mainform.Menu.Items[i2].Visible then begin
        if -1 = toolwindow.PageControl1.IndexOf(p1[i]) then
          functionunit.pagenew2(i2,mainform.Menu.Items[i2].Caption);

      //end;
      //p1.Free;
      for i3 := 0 to mainform.Menu.Items.Items[i2].Count -1 do begin
        if (mainform.Menu.Items[i2].Items[i3].Caption = '-') or
            ( not mainform.Menu.Items[i2].Items[i3].Visible ) then begin

        end else begin
          tb[i3] := tbutton.Create(self);
          tb[i3].Left:= toolwindow.ToolBar2.Width;
          tb[i3].AutoSize:= true;
          //tb[i3].Name:= 'tb' + inttostr(i4);
          tb[i3].Visible:= true;
          tb[i3].Parent :=  ptoolbar[i2];
          tb[i3].Caption:= mainform.Menu.Items[i2].Items[i3].Caption;
          tb[i3].OnClick:= mainform.Menu.Items[i2].Items[i3].OnClick;
          i5 := ListBox2.Items.IndexOf(mainform.Menu.Items[i2].Items[i3].Caption);
          functionunit.toolbarbuttoncount2.Add(inttostr(i5));
          functionunit.toolbarbuttonparnt2.Add(tb[i3].Parent.Name);
          //color_form.ListBox1.Items.Add(color_form.ListBox2.Items[i5]);
          inc(i4);
        end;
    end;
  end;

  end;
  functionunit.toolbar_compreat:= true;
end;

function Tfunctionunit.loadtoobutton:boolean;
var
  i:integer;
begin
  for i := 0 to functionunit.toolbarbuttoncount.Count -1 do begin
    if functionunit.toolbarbuttoncount[i] <> '' then begin
      toolbuttonset(i, strtoint(functionunit.toolbarbuttoncount[i]));
    end;
  end;
end;

function Tfunctionunit.loadtoobutton2(btn_count:integer):boolean;
var
  i,i1:integer;
  s,s1:string;
  st,st2,st3:TStringList;
begin
  st:=TStringList.Create;
  st.Clear;
  st2:=TStringList.Create;
  st2.Clear;
  st3:=TStringList.Create;
  st3.Clear;
  //showmessage(functionunit.toolbarbuttoncount2.Text);
  i1 := 0;
  color_form.CheckBox3.Checked:= true;
  //color_form.CheckBox3Change(color_form.CheckBox3);
  //functionunit.toolbarbuttonparnt2.Clear;
  //showmessage(inttostr(functionunit.toolbarbuttonparnt.Count) + ' ' + inttostr(functionunit.toolbarbuttoncount2.Count));
  for i := 0 to btn_count -1 do begin
   s:=functionunit.toolbarbuttonparnt[i];
   //s := s[2];
   s1 := functionunit.toolbarbuttoncount2[i];
   //showmessage(toolbarbuttonparnt.Text);
   //showmessage(s);
   //if not functionunit.boot then begin
   try
     if -1 = st.IndexOf(color_form.ListBox2.Items[strtoint(s1)]) then begin
       st.Add(color_form.ListBox2.Items[strtoint(s1)]);
       toolbuttonset2(i, strtoint(s1),
                     strtoint(s)
       );
     end;
   except
     //break;
     //ツールパレットの名前が重複している。そこでエラー。
   end;

   //end;
    i1 := i1 +2;
  end;
end;

function Tfunctionunit.save_mnu_set:boolean;
var
  i,i1:integer;
  s,s1:string;
  st,st2,st3:TStringList;
begin
  st:=TStringList.Create;
  st.Clear;
  st2:=TStringList.Create;
  st2.Clear;
  st3:=TStringList.Create;
  st3.Clear;
  //showmessage(functionunit.toolbarbuttoncount2.Text);
  i1 := 0;
  //color_form.CheckBox3.Checked:= true;
  //color_form.CheckBox3Change(color_form.CheckBox3);
  //functionunit.toolbarbuttonparnt2.Clear;
  //showmessage(inttostr(functionunit.toolbarbuttonparnt.Count) + ' ' + inttostr(functionunit.toolbarbuttoncount2.Count));
  //for i := 0 to btn_count -1 do begin
   s:=functionunit.toolbarbuttonparnt[i];
   //s := s[2];
   s1 := functionunit.toolbarbuttoncount2[i];
   //showmessage(toolbarbuttonparnt.Text);
   //showmessage(s);
   //if not functionunit.boot then begin
   try
     //if -1 = st.IndexOf(color_form.ListBox2.Items[strtoint(s1)]) then begin
      // st.Add(color_form.ListBox2.Items[strtoint(s1)]);
      // toolbuttonset2(i, strtoint(s1),
       //              strtoint(s)
      // );

       mnu_custum(
         st,st2,st3
       );
     //end;
   except
     //break;
     //ツールパレットの名前が重複している。そこでエラー。
   //end;

   //end;
    i1 := i1 +2;
  end;

  {$IFDEF Windows}
  st.SaveToFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_title.txt');
  st2.SaveToFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_caption.txt');
  st3.SaveToFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_shortcut.txt');
  {$ENDIF}
  {$IFDEF LINUX}
  st.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_title.txt');
  st2.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_caption.txt');
  st3.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_shortcut.txt');
  {$ENDIF}
  {$IFDEF Darwin}
  st.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_title.txt');
  st2.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_caption.txt');
  st3.SaveToFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_shortcut.txt');
  {$ENDIF}
end;

function Tfunctionunit.load_mnu_set:boolean;
var
  i,i1:integer;
  s,s1:string;
  st,st2,st3:TStringList;
begin
  st:=TStringList.Create;
  st.Clear;
  st2:=TStringList.Create;
  st2.Clear;
  st3:=TStringList.Create;
  st3.Clear;
  //showmessage(functionunit.toolbarbuttoncount2.Text);
  i1 := 0;
  //color_form.CheckBox3.Checked:= true;
  //color_form.CheckBox3Change(color_form.CheckBox3);
  //functionunit.toolbarbuttonparnt2.Clear;
  //showmessage(inttostr(functionunit.toolbarbuttonparnt.Count) + ' ' + inttostr(functionunit.toolbarbuttoncount2.Count));
  try
  {$IFDEF Windows}
  st.LoadFromFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_title.txt');
  st2.LoadFromFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_caption.txt');
  st3.LoadFromFile(extractfilepath(paramstr(0)) + 'ini\' + 'mnu_shortcut.txt');
  {$ENDIF}
  {$IFDEF LINUX}
  st.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_title.txt');
  st2.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_caption.txt');
  st3.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_shortcut.txt');
  {$ENDIF}
  {$IFDEF Darwin}
  st.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_title.txt');
  st2.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_caption.txt');
  st3.LoadFromFile(extractfilepath(paramstr(0)) + 'ini/' + 'mnu_shortcut.txt');
  {$ENDIF}
  finally
  //for i := 0 to btn_count -1 do begin
   s:=functionunit.toolbarbuttonparnt[i];
   //s := s[2];
   s1 := functionunit.toolbarbuttoncount2[i];
   //showmessage(toolbarbuttonparnt.Text);
   //showmessage(s);
   //if not functionunit.boot then begin
     try
     //if -1 = st.IndexOf(color_form.ListBox2.Items[strtoint(s1)]) then begin
      // st.Add(color_form.ListBox2.Items[strtoint(s1)]);
      // toolbuttonset2(i, strtoint(s1),
       //              strtoint(s)
      // );

       mnu_custum_set(
         st,st2,st3
       );
     //end;
     except
     //break;
     //ツールパレットの名前が重複している。そこでエラー。
     end;

   //end;
    i1 := i1 +2;
    //end;

  end;

end;

function Tfunctionunit.setToolBarPreSet(S:TstringList):boolean;
var
  i,i1:integer;
begin
  i := s.IndexOf('toolbarbutton');
   if -1 < i then begin
     for i1 := 0 to strtoint(s[i+1]) -1 do begin
        if s.Count -1 > i1 + 2 then begin
          functionunit.toolbarbuttoncount.Add(s[i1 +2]);
        end;
     end;
     functionunit.loadtoobutton;
   end;
end;

function Tfunctionunit.setToolBarPreSet2(St:TstringList):boolean;
var
  i,i1,i2,i3,i4:integer;
  s,s1:string;
begin

  functionunit.toolbarbuttonparnt2.Clear;
   i := st.IndexOf('toolbarbutton2');
   i4 := i;
   if -1 < i then begin
     for i1 := 0 to strtoint(st[i+1]) -1 do begin
       //This WIn32Code, Linux is ToolBar not runs
       {$IFDEF Windows}if not true_boot then begin{$ENDIF}
         inc(tabtoolbarcount);
       {$IFDEF Windows}end;{$ENDIF}
       functionunit.toolbarbuttoncount2.Add(st[i4 +2]);
       s := st[i4 + 3];
       s1 := '';
       i2 := length(s);
       //showmessage(s + ' ' + inttostr(i2));
       functionunit.toolbarbuttonparnt2.Add(S);
       for i3 := 2 to i2 do begin
         s1 := s1 + s[i3];
       end;
       functionunit.toolbarbuttonparnt.Add(s1);

       i4 := i4 + 2;
     end;
     //SHOWMESSAGE(functionunit.toolbarbuttonparnt2.Text);
     //functionunit.editlist.Items[0].SynEdit1.Text:=
     //functionunit.editlist.Items[0].SynEdit1.Text+functionunit.toolbarbuttonparnt2.Text + char(13)+ char(13)+
     //functionunit.toolbarbuttoncount2.Text;
     //SHOWMESSAGE(functionunit.toolbarbuttoncount2.Text);
     //SHOWMESSAGE(inttostr(functionunit.tabtoolbarcount));
     //tabtoolbarcount := tabtoolbarcount div 2;
     i4 := strtoint(st[i+1]);
     functionunit.loadtoobutton2(functionunit.tabtoolbarcount);
   end else begin
     functionunit.toolbar_deflut2 := true;
   end;

end;

function Tfunctionunit.settoolbar(S:TstringList):boolean;
var
  i,i1:integer;
  count,count2:integer;
begin
     count := s.IndexOf('toolpage');
     if -1 < count then begin
       //showmessage(s[count+1]);
       for count2 := 0 to strtoint(s[count+1]) -1 do begin
         //showmessage('t' + inttostr(count));
         pagenew(count2,s[count2 + count + 2]);
         //functionunit.toolbarbuttonparnt2.Add(functionunit.tb[count2].Parent.Name);
       end;
     end;
end;

function Tfunctionunit.pagenew2(i:integer;s:string):TComponent;
begin
  try
    with functionunit do begin
      p[i] := TTabSheet.Create(self);
      p[i].Caption:= s;
      p[i].Name:= 'p' + inttostr(i);
      p[i].Parent := toolwindow.PageControl1;
      ptoolbar[i] := TToolBar.Create(self);
      ptoolbar[i].AutoSize:= true;
      ptoolbar[i].Caption:= 't' + inttostr(color_form.TabControl1.Tabs.Count-1);
      ptoolbar[i].Name:='t' + inttostr(i);
      ptoolbar[i].Parent := p[i];
      //showmessage(ptoolbar[i].Name);
      ptoolbar[i].Align:=alclient;
      p[i].AutoSize:= true;
      //pagenew2 := p[i];
    end;
  except
  end;
end;

function Tfunctionunit.deletebutton():boolean;
var
  i:integer;
begin
  //if functionunit.toolbar_deflut then
    //exit;
  i:= color_form.ListBox1.ItemIndex;
  functionunit.B[i].Free;
  for i := color_form.ListBox1.ItemIndex to functionunit.toolbarbuttoncount.Count -1 do begin
    functionunit.b[i] := functionunit.b[i +1];
  end;
  i := color_form.ListBox1.ItemIndex;
  functionunit.toolbarbuttoncount.Delete(i);
  color_form.ListBox1.Items.Delete(i);
end;

function Tfunctionunit.deletebutton2():boolean;
var
  i,i1,i2:integer;
  s:string;
begin
  i:= color_form.ListBox1.ItemIndex;
  //functionunit.tB[i].Name:= 'a';
  functionunit.tB[i].Free;
  i1 := color_form.ListBox1.ItemIndex;
  i2 := functionunit.toolbarbuttoncount2.Count;

  for i := i1 to i2 -1 do begin
    functionunit.tb[i] := functionunit.tb[i +1];
  end;
  i := color_form.ListBox1.ItemIndex;
  color_form.ListBox1.Items[i];
  try
    if functionunit.toolbarbuttoncount2.Count -1> i then begin
      functionunit.toolbarbuttoncount2.Delete(i);
      functionunit.toolbarbuttonparnt.Delete(i);
    end;
  except
  end;
  color_form.ListBox1.Items.Delete(i);
end;

function Tfunctionunit.pagedelete(i:integer):boolean;
var
  c:TComponent;
begin
  c := FindComponent('t' + inttostr(i));
  if c <> nil then begin
    c.Free;
  end;
  c := FindComponent('p' + inttostr(i));
  if c <> nil then begin
    c.Free;
  end;
end;

function Tfunctionunit.tabseting1:boolean;
begin
  color_form.combobox5.Visible:= not color_form.combobox5.Visible;
  color_form.Button1.Visible:= not color_form.Button1.Visible;
  color_form.Button2.Visible:= not color_form.Button2.Visible;
  color_form.Button3.Visible:= not color_form.Button3.Visible;
end;

function Tfunctionunit.tabseting2:boolean;
begin
  if not mainform.Menu_ToolBarTAB.Checked then begin
    toolwindow.PageControl1.Visible:= true;
    toolwindow.ToolBar2.Visible:= false;
    mainform.Menu_ToolBarTAB.Checked:= true;
  end else begin
    toolwindow.PageControl1.Visible:= false;
    toolwindow.ToolBar2.Visible:= true;
    mainform.Menu_ToolBarTAB.Checked:= false;
  end;
end;

function setatticolor(s:string;fgcolor,bgcolor,frcolor:integer):boolean;
begin
    with functionunit do begin
      case s of
        'AsmAttri': begin
          if fgcolor <> -1 then
            asmForeground:=fgcolor;
          if bgcolor <> -1 then
            asmBackground:=bgcolor;
          if frcolor <> -1 then
            asmFrameColor:=frcolor;
      end;
        'CaseLabelAttri': begin
           if fgcolor <> -1 then
            caseForeground:=fgcolor;
           if bgcolor <> -1 then
            caseBackground:=bgcolor;
           if frcolor <> -1 then
            caseFrameColor:=frcolor;

        end;
        'CommentAttri': begin
           if fgcolor <> -1 then
            commentForeground:=fgcolor;
           if bgcolor <> -1 then
            commentBackground:=bgcolor;
           if frcolor <> -1 then
            commentFrameColor:=frcolor;

        end;
        'DirectiveAttri': begin
           if fgcolor <> -1 then
            DirectiveForeground:=fgcolor;
           if bgcolor <> -1 then
            DirectiveBackground:=bgcolor;
           if frcolor <> -1 then
            DirectiveFrameColor:=frcolor;

        end;
        'IDEDirectiveAttri': begin
           if fgcolor <> -1 then
            IDEDirectiveForeground:=fgcolor;
           if bgcolor <> -1 then
            IDEDirectiveBackground:=bgcolor;
           if frcolor <> -1 then
            IDEDirectiveFrameColor:=frcolor;

        end;
        'IdentifierAttri': begin
           if fgcolor <> -1 then
            IdentifierForeground:=fgcolor;
           if bgcolor <> -1 then
            IdentifierBackground:=bgcolor;
           if frcolor <> -1 then
            IdentifierFrameColor:=frcolor;

        end;
       'KeyAttri': begin
          if fgcolor <> -1 then
            KeyForeground:=fgcolor;
          if bgcolor <> -1 then
            KeyBackground:=bgcolor;
          if frcolor <> -1 then
            KeyFrameColor:=frcolor;

        end;
        'SpaceAttri': begin
           if fgcolor <> -1 then
            SpaceForeground:=fgcolor;
           if bgcolor <> -1 then
            SpaceBackground:=bgcolor;
           if frcolor <> -1 then
            SpaceFrameColor:=frcolor;

        end;
        'StringAttri': begin
          if fgcolor <> -1 then
            StringForeground:=fgcolor;
          if bgcolor <> -1 then
            StringBackground:=bgcolor;
          if frcolor <> -1 then
            StringFrameColor:=frcolor;

        end;
        'SymbolAttri': begin
           if fgcolor <> -1 then
            SymbolForeground:=fgcolor;
           if bgcolor <> -1 then
            SymbolBackground:=bgcolor;
           if frcolor <> -1 then
            SymbolFrameColor:=frcolor;

        end;
        'DocumentAttri': begin
           if fgcolor <> -1 then
            DocumentForeground:=fgcolor;
           if bgcolor <> -1 then
            DocumentBackground:=bgcolor;
           if frcolor <> -1 then
            DocumentFrameColor:=frcolor;

        end;
        'InvalidAttri': begin
           if fgcolor <> -1 then
            InvalidForeground:=fgcolor;
           if bgcolor <> -1 then
            InvalidBackground:=bgcolor;
           if frcolor <> -1 then
            InvalidFrameColor:=frcolor;

        end;
        'NumberAttri': begin
           if fgcolor <> -1 then
            NumberForeground:=fgcolor;
           if bgcolor <> -1 then
            NumberBackground:=bgcolor;
           if frcolor <> -1 then
            NumberFrameColor:=frcolor;

        end;
        'DirecAttri': begin
          if fgcolor <> -1 then
            DirecForeground:=fgcolor;
          if bgcolor <> -1 then
            DirecBackground:=bgcolor;
          if frcolor <> -1 then
            DirecFrameColor:=frcolor;

        end;
        'DefaultAttri': begin
           if fgcolor <> -1 then
            DefaultForeground:=fgcolor;
           if bgcolor <> -1 then
            DefaultBackground:=bgcolor;
           if frcolor <> -1 then
            DefaultFrameColor:=frcolor;

        end;
        'FunctionAttri': begin
          if fgcolor <> -1 then
            FunctionForeground:=fgcolor;
          if bgcolor <> -1 then
            FunctionBackground:=bgcolor;
          if frcolor <> -1 then
            FunctionFrameColor:=frcolor;

        end;
        'PLSQLAttri': begin
          if fgcolor <> -1 then
            PLSQLForeground:=fgcolor;
          if bgcolor <> -1 then
            PLSQLBackground:=bgcolor;
          if frcolor <> -1 then
            PLSQLFrameColor:=frcolor;

        end;
        'SQLPlusAttri': begin
           if fgcolor <> -1 then
            SQLPlusForeground:=fgcolor;
           if bgcolor <> -1 then
            SQLPlusBackground:=bgcolor;
           if frcolor <> -1 then
            SQLPlusFrameColor:=frcolor;

        end;
        'TableNameAttri': begin
           if fgcolor <> -1 then
            TableNameForeground:=fgcolor;
           if bgcolor <> -1 then
            TableNameBackground:=bgcolor;
           if frcolor <> -1 then
            TableNameFrameColor:=frcolor;

        end;
        'VariableAttri': begin
           if fgcolor <> -1 then
            VariableForeground:=fgcolor;
           if bgcolor <> -1 then
            VariableBackground:=bgcolor;
           if frcolor <> -1 then
            VariableFrameColor:=frcolor;

        end;
        'DocTypeAttri': begin
           if fgcolor <> -1 then
            DocTypeForeground:=fgcolor;
           if bgcolor <> -1 then
            DocTypeBackground:=bgcolor;
           if frcolor <> -1 then
            DocTypeFrameColor:=frcolor;

        end;
        'NamespaceAttributeAttri': begin
          if fgcolor <> -1 then
            NamespaceAttributeForeground:=fgcolor;
          if bgcolor <> -1 then
            NamespaceAttributeBackground:=bgcolor;
          if frcolor <> -1 then
            NamespaceAttributeFrameColor:=frcolor;

        end;
        'NamespaceAttributeValueAttri': begin
          if fgcolor <> -1 then
            NamespaceAttributeValueForeground:=fgcolor;
          if bgcolor <> -1 then
            NamespaceAttributeValueBackground:=bgcolor;
          if frcolor <> -1 then
            NamespaceAttributeValueFrameColor:=frcolor;

        end;
        'ElementAttri': begin
          if fgcolor <> -1 then
            ElementForeground:=fgcolor;
          if bgcolor <> -1 then
            ElementBackground:=bgcolor;
          if frcolor <> -1 then
            ElementFrameColor:=frcolor;

        end;
        'TextAttri': begin
           if fgcolor <> -1 then
            TextForeground:=fgcolor;
           if bgcolor <> -1 then
            TextBackground:=bgcolor;
           if frcolor <> -1 then
            TextFrameColor:=frcolor;

        end;
        'AndAttri': begin
           if fgcolor <> -1 then
            AndForeground:=fgcolor;
           if bgcolor <> -1 then
            AndBackground:=bgcolor;
           if frcolor <> -1 then
            AndFrameColor:=frcolor;

        end;
        'ASPAttri': begin
           if fgcolor <> -1 then
            ASPForeground:=fgcolor;
           if bgcolor <> -1 then
            ASPBackground:=bgcolor;
           if frcolor <> -1 then
            ASPFrameColor:=frcolor;

        end;
        'UndefKeyAttri': begin
           if fgcolor <> -1 then
            UndefKeyForeground:=fgcolor;
           if bgcolor <> -1 then
            UndefKeyBackground:=bgcolor;
           if frcolor <> -1 then
            UndefKeyFrameColor:=frcolor;

        end;
        'ValueAttri': begin
          if fgcolor <> -1 then
            ValueForeground:=fgcolor;
          if bgcolor <> -1 then
            ValueBackground:=bgcolor;
          if frcolor <> -1 then
            ValueFrameColor:=frcolor;

        end;
        'AttributeAttri': begin
          if fgcolor <> -1 then
            AttributeForeground:=fgcolor;
          if bgcolor <> -1 then
            AttributeBackground:=bgcolor;
          if frcolor <> -1 then
            AttributeFrameColor:=frcolor;

        end;
        'AttributeValueAttri': begin
           if fgcolor <> -1 then
            AttributeValueForeground:=fgcolor;
           if bgcolor <> -1 then
            AttributeValueBackground:=bgcolor;
           if frcolor <> -1 then
            AttributeValueFrameColor:=frcolor;

        end;
        'SectionAttri': begin
           if fgcolor <> -1 then
            SectionForeground:=fgcolor;
           if bgcolor <> -1 then
            SectionBackground:=bgcolor;
           if frcolor <> -1 then
            SectionFrameColor:=frcolor;

        end;
        'ConstantAttri': begin
           if fgcolor <> -1 then
            ConstantForeground:=fgcolor;
           if bgcolor <> -1 then
            ConstantBackground:=bgcolor;
           if frcolor <> -1 then
            ConstantFrameColor:=frcolor;

        end;
        'ObjectAttri': begin
           if fgcolor <> -1 then
            ObjectForeground:=fgcolor;
           if bgcolor <> -1 then
            ObjectBackground:=bgcolor;
           if frcolor <> -1 then
            ObjectFrameColor:=frcolor;

        end;
        'SecondKeyAttri': begin
          if fgcolor <> -1 then
            SecondKeyForeground:=fgcolor;
          if bgcolor <> -1 then
            SecondKeyBackground:=bgcolor;
          if frcolor <> -1 then
            SecondKeyFrameColor:=frcolor;

        end;
        'varAttri': begin
           if fgcolor <> -1 then
            varForeground:=fgcolor;
           if bgcolor <> -1 then
            varBackground:=bgcolor;
           if frcolor <> -1 then
            varFrameColor:=frcolor;

        end;

        'InvalidSymbolAttri': begin
          if fgcolor <> -1 then
            InvalidSymbolForeground:=fgcolor;
          if bgcolor <> -1 then
            InvalidSymbolBackground:=bgcolor;
          if frcolor <> -1 then
            InvalidSymbolFrameColor:=frcolor;

        end;

        'OperatorAttri': begin
          if fgcolor <> -1 then
            OperatorForeground:=fgcolor;
          if bgcolor <> -1 then
            OperatorBackground:=bgcolor;
          if frcolor <> -1 then
            OperatorFrameColor:=frcolor;

        end;

        'PragmaAttri': begin
          if fgcolor <> -1 then
            PragmaForeground:=fgcolor;
          if bgcolor <> -1 then
            PragmaBackground:=bgcolor;
          if frcolor <> -1 then
            PragmaFrameColor:=frcolor;

        end;

      end;
    end;
end;

function Tfunctionunit.pas(s:string):boolean;
begin
  with DataModule1.SynPasSyn1 do begin
    with functionunit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CaseLabelAttri': begin
          with CaseLabelAttri do begin
            Foreground:=CaseForeground;
            Background:=CaseBackground;
            FrameColor:=CaseFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'DirectiveAttri': begin
          with DirectiveAttri do begin
            Foreground:=DirectiveForeground;
            Background:=DirectiveBackground;
            FrameColor:=DirectiveFrameColor;
          end;
        end;
        'IDEDirectiveAttri': begin
          with IDEDirectiveAttri do begin
            Foreground:=IDEDirectiveForeground;
            Background:=IDEDirectiveBackground;
            FrameColor:=IDEDirectiveFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.fpas(s:string):boolean;
begin
  with DataModule1.SynFreePascalSyn1 do begin
     with functionunit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CaseLabelAttri': begin
          with CaseLabelAttri do begin
            Foreground:=CaseForeground;
            Background:=CaseBackground;
            FrameColor:=CaseFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'DirectiveAttri': begin
          with DirectiveAttri do begin
            Foreground:=DirectiveForeground;
            Background:=DirectiveBackground;
            FrameColor:=DirectiveFrameColor;
          end;
        end;
        'IDEDirectiveAttri': begin
          with IDEDirectiveAttri do begin
            Foreground:=IDEDirectiveForeground;
            Background:=IDEDirectiveBackground;
            FrameColor:=IDEDirectiveFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.cpp(s:string):boolean;
begin
  with DataModule1.SynCppSyn1 do begin
    with functionunit do begin
      case s of
        'AsmAttri': begin
          with AsmAttri do begin
            Foreground:=AsmForeground;
            Background:=AsmBackground;
            FrameColor:=AsmFrameColor;
          end;
        end;
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'DirecAttri': begin
          with DirecAttri do begin
            Foreground:=DirecForeground;
            Background:=DirecBackground;
            FrameColor:=DirecFrameColor;
          end;
        end;
        'InvalidAttri': begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.java(s:string):boolean;
begin
  with DataModule1.SynJavaSyn1 do begin
          with functionunit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'InvalidAttri': begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;
        'DocumentAttri': begin
          with DocumentAttri do begin
            Foreground:=DocumentForeground;
            Background:=DocumentBackground;
            FrameColor:=DocumentFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.sql(s:string):boolean;
begin
  with DataModule1.SynSQLSyn1 do begin
          with functionunit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'DefaultPackageAttri': begin
          with DefaultPackageAttri do begin
            Foreground:=DefaultPackageForeground;
            Background:=DefaultPackageBackground;
            FrameColor:=DefaultPackageFrameColor;
          end;
        end;
        'FunctionAttri': begin
          with FunctionAttri do begin
            Foreground:=FunctionForeground;
            Background:=FunctionBackground;
            FrameColor:=FunctionFrameColor;
          end;
        end;
        'PLSQLAttri': begin
          with PLSQLAttri do begin
            Foreground:=PLSQLForeground;
            Background:=PLSQLBackground;
            FrameColor:=PLSQLFrameColor;
          end;
        end;
        'SQLPlusAttri': begin
          with SQLPlusAttri do begin
            Foreground:=SQLPlusForeground;
            Background:=SQLPlusBackground;
            FrameColor:=SQLPlusFrameColor;
          end;
        end;
        'TableNameAttri': begin
          with TableNameAttri do begin
            Foreground:=TableNameForeground;
            Background:=TableNameBackground;
            FrameColor:=TableNameFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.xml(s:string):boolean;
begin
  with DataModule1.SynXMLSyn1 do begin
          with functionunit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
       'AttributeAttri': begin
          with AttributeAttri do begin
            Foreground:=AttributeForeground;
            Background:=AttributeBackground;
            FrameColor:=AttributeFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'AttributeValueAttri': begin
          with AttributeValueAttri do begin
            Foreground:=AttributeValueForeground;
            Background:=AttributeValueBackground;
            FrameColor:=AttributeValueFrameColor;
          end;
        end;
        'DocTypeAttri': begin
          with DocTypeAttri do begin
            Foreground:=DocTypeForeground;
            Background:=DocTypeBackground;
            FrameColor:=DocTypeFrameColor;
          end;
        end;
        'NamespaceAttributeAttri': begin
          with NamespaceAttributeAttri do begin
            Foreground:=NamespaceAttributeForeground;
            Background:=NamespaceAttributeBackground;
            FrameColor:=NamespaceAttributeFrameColor;
          end;
        end;
        'NamespaceAttributeValueAttri': begin
          with NamespaceAttributeValueAttri do begin
            Foreground:=NamespaceAttributeValueForeground;
            Background:=NamespaceAttributeValueBackground;
            FrameColor:=NamespaceAttributeValueFrameColor;
          end;
        end;
        'ElementAttri': begin
          with ElementAttri do begin
            Foreground:=ElementForeground;
            Background:=ElementBackground;
            FrameColor:=ElementFrameColor;
          end;
        end;
        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.html(s:string):boolean;
begin
  with DataModule1.SynHTMLSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
       'AndAttri': begin
          with AndAttri do begin
            Foreground:=AndForeground;
            Background:=AndBackground;
            FrameColor:=AndFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'ASPAttri': begin
          with ASPAttri do begin
            Foreground:=ASPForeground;
            Background:=ASPBackground;
            FrameColor:=ASPFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'UndefKeyAttri': begin
          with UndefKeyAttri do begin
            Foreground:=UndefKeyForeground;
            Background:=UndefKeyBackground;
            FrameColor:=UndefKeyFrameColor;
          end;
        end;
        'ValueAttri': begin
          with ValueAttri do begin
            Foreground:=ValueForeground;
            Background:=ValueBackground;
            FrameColor:=ValueFrameColor;
          end;
        end;

        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.css(s:string):boolean;
begin
  with DataModule1.SynCssSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

      end;
    end;
  end;
end;

function Tfunctionunit.vbs(s:string):boolean;
begin
  with DataModule1.SynVBSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.bat(s:string):boolean;
begin
  with DataModule1.SynBatSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.ini(s:string):boolean;
begin
  with DataModule1.SynIniSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SectionAttri': begin
          with SectionAttri do begin
            Foreground:=SectionForeground;
            Background:=SectionBackground;
            FrameColor:=SectionFrameColor;
          end;
        end;

        'TextAttri': begin
          with TextAttri do begin
            Foreground:=TextForeground;
            Background:=TextBackground;
            FrameColor:=TextFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.freeset(s:string):boolean;
begin
  with DataModule1.SynAnySyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'VariableAttri': begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'ConstantAttri': begin
          with ConstantAttri do begin
            Foreground:=ConstantForeground;
            Background:=ConstantBackground;
            FrameColor:=ConstantFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;

        'ObjectAttri': begin
          with ObjectAttri do begin
            Foreground:=ObjectForeground;
            Background:=ObjectBackground;
            FrameColor:=ObjectFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.unics(s:string):boolean;
begin
  with DataModule1.SynUNIXShellScriptSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'SecondKeyAttri': begin
          with SecondKeyAttri do begin
            Foreground:=SecondKeyForeground;
            Background:=SecondKeyBackground;
            FrameColor:=SecondKeyFrameColor;
          end;
        end;

        'VarAttri': begin
          with VarAttri do begin
            Foreground:=VarForeground;
            Background:=VarBackground;
            FrameColor:=VarFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.JS(s:string):boolean;
begin
  with DataModule1.SynJScriptSyn1 do begin
          with functionunit do begin
      case s of

        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;


        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'NumberAttri': begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;

        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;

        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;

        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        {'SecondKeyAttri': begin
          with SecondKeyAttri do begin
            Foreground:=SecondKeyForeground;
            Background:=SecondKeyBackground;
            FrameColor:=SecondKeyFrameColor;
          end;
        end;}

        {'VarAttri': begin
          with VarAttri do begin
            Foreground:=VarForeground;
            Background:=VarBackground;
            FrameColor:=VarFrameColor;
          end;
        end;}
      end;
    end;
  end;
end;

function Tfunctionunit.php(s:string):boolean;
begin
  with DataModule1.SynPHPSyn1 do begin
    with functionunit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;
        'InvalidSymbolAttri':  begin
          with InvalidSymbolAttri do begin
            Foreground:=InvalidSymbolForeground;
            Background:=InvalidSymbolBackground;
            FrameColor:=InvalidSymbolFrameColor;
          end;
        end;

        'VariableAttri':  begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
      end;
    end;
  end;
end;

function Tfunctionunit.perl(s:string):boolean;
begin
  with DataModule1.SynPerlSyn1 do begin
    with functionunit do begin
      case s of
        'CommentAttri': begin
          with CommentAttri do begin
            Foreground:=CommentForeground;
            Background:=CommentBackground;
            FrameColor:=CommentFrameColor;
          end;
        end;
        'IdentifierAttri': begin
          with IdentifierAttri do begin
            Foreground:=IdentifierForeground;
            Background:=IdentifierBackground;
            FrameColor:=IdentifierFrameColor;
          end;
        end;
        'KeyAttri': begin
          with KeyAttri do begin
            Foreground:=KeyForeground;
            Background:=KeyBackground;
            FrameColor:=KeyFrameColor;
          end;
        end;
        'SpaceAttri': begin
          with SpaceAttri do begin
            Foreground:=SpaceForeground;
            Background:=SpaceBackground;
            FrameColor:=SpaceFrameColor;
          end;
        end;
        'StringAttri': begin
          with StringAttri do begin
            Foreground:=StringForeground;
            Background:=StringBackground;
            FrameColor:=StringFrameColor;
          end;
        end;
        'SymbolAttri': begin
          with SymbolAttri do begin
            Foreground:=SymbolForeground;
            Background:=SymbolBackground;
            FrameColor:=SymbolFrameColor;
          end;
        end;
        'NumberAttri':  begin
          with NumberAttri do begin
            Foreground:=NumberForeground;
            Background:=NumberBackground;
            FrameColor:=NumberFrameColor;
          end;
        end;

        'VariableAttri':  begin
          with VariableAttri do begin
            Foreground:=VariableForeground;
            Background:=VariableBackground;
            FrameColor:=VariableFrameColor;
          end;
        end;
        'InvalidAttri':  begin
          with InvalidAttri do begin
            Foreground:=InvalidForeground;
            Background:=InvalidBackground;
            FrameColor:=InvalidFrameColor;
          end;
        end;

        'OperatorAttri':  begin
          with OperatorAttri do begin
            Foreground:=OperatorForeground;
            Background:=OperatorBackground;
            FrameColor:=OperatorFrameColor;
          end;
        end;

        'PragmaAttri':  begin
          with PragmaAttri do begin
            Foreground:=PragmaForeground;
            Background:=PragmaBackground;
            FrameColor:=PragmaFrameColor;
          end;
        end;

      end;
    end;
  end;
end;

function Tfunctionunit.highlitercolorset(fgcolor,bgcolor,frcolor:integer;s:string):boolean;
begin
  //s := color_form.ComboBox2.Text;
  setatticolor(s,fgcolor,bgcolor,frcolor);
  pas(s);
  fpas(s);
  cpp(s);
  java(s);
  sql(s);
  xml(s);
  html(s);
  css(s);
  vbs(s);
  bat(s);
  ini(s);
  freeset(s);
  unics(s);
  php(s);
  perl(s);
  js(s);
end;

function Tfunctionunit.editcolor(fcolor,bcolor:integer):boolean;
var
  i:integer;
begin
  i := mainform.PageControl1.ActivePageIndex;
  with functionunit.editlist.Items[i] do begin
    if PageControl1.ActivePage =  TabSheet1 then begin
      if fcolor <> -1 then
        synEdit1.font.color:= fcolor;
      if bcolor <> -1 then
        SynEdit1.Font.Color:= fcolor;
      SynEdit1.Color:= bcolor;
    end else if PageControl1.ActivePage =  TabSheet2 then begin
      if fcolor <> -1 then
        Memo1.Font.Color:= fcolor;
      if bcolor <> -1 then
        Memo1.Color:=bcolor;
    end;
  end;
end;

function Tfunctionunit.seteditcolor(fcolor,bcolor,fgcolor,bgcolor,frcolor:integer):boolean;
begin
  editcolor(fcolor,bcolor);
  highlitercolorset(fgcolor,bgcolor,frcolor,color_form.ComboBox2.Text);
end;

function Tfunctionunit.LoadHighLightColorPriSet(i:integer):integer;
var
  st:TStringLIst;
begin
  st := TStringList.Create;
  st.Clear;
  case i of
    0:begin
      LoadHighLightColorPriSet := 4;
    end;
    1:begin
      st.Text:=
      'editcolor' + chr(13)
      + '536870912' + chr(13)
      + '16777215' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '-2147483647' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16744448' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    2:begin
      st.Text:=
      'editcolor' + chr(13)
      + '16777215' + chr(13)
      + '32768' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '12632256' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    3:begin
      st.Text:=
      'editcolor' + chr(13)
      + '16777215' + chr(13)
      + '8388608' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '12632256' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13);
    end;
    4:begin
      st.Text:=
      'editcolor' + chr(13)
      + '65280' + chr(13)
      + '0' + chr(13)
      + 'syncolor' + chr(13)
      + 'CommentAttri' + chr(13)
      + '32768' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IDEDirectiveAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'IdentifierAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'KeyAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SpaceAttri' + chr(13)
      + '-2147483643' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'StringAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NumberAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AsmAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SymbolAttri' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'CaseLabelAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DirecAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'InvalidAttri' + chr(13)
      + '0' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocumentAttri' + chr(13)
      + '8421504' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DefaultPackageAttri' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + '0' + chr(13)
      + 'FunctionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'PLSQLAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SQLPlusAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TableNameAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'VariableAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'DocTypeAttri' + chr(13)
      + '16711680' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'NamespaceAttributeValueAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ElementAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'TextAttri' + chr(13)
      + '16777215' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AndAttri' + chr(13)
      + '65280' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ASPAttri' + chr(13)
      + '0' + chr(13)
      + '65535' + chr(13)
      + '536870911' + chr(13)
      + 'UndefKeyAttri' + chr(13)
      + '255' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ValueAttri' + chr(13)
      + '16776960' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'AttributeValueAttri' + chr(13)
      + '8388608' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SectionAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ConstantAttri' + chr(13)
      + '16711935' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'ObjectAttri' + chr(13)
      + '128' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'SecondKeyAttri' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
      + 'varAttri' + chr(13)
      + '8388736' + chr(13)
      + '536870911' + chr(13)
      + '536870911' + chr(13)
       + chr(13);
    end;
  end;
  functionunit.HighlintColorIndex := i;
  LoadEditColorPriset(st);
  HighLightColorPriSet(st);
  st.Free;
end;

function Tfunctionunit.LoadEditColorPriset(alist:TstringList):boolean;
var
  i:integer;
begin
  i := alist.IndexOf('editcolor');
  if -1 < i then begin
    try
      NewSet.add(alist[i]);
      NewSet.add(alist[i+1]);
      editcolorset((alist[i+1]),
                   (alist[i+2])
                   );
    except
    end;
  end;
end;

function Tfunctionunit.HighLightColorPriSet(alist:TStringList):boolean;
var
  i:integer;
begin
    i := alist.IndexOf('syncolor');
  if -1 < i then begin
    i := alist.IndexOf('CommentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IDEDirectiveAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('IdentifierAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('KeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SpaceAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('StringAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NumberAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AsmAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SymbolAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('CaseLabelAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DirecAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('InvalidAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocumentAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DefaultPackageAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('FunctionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('PLSQLAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SQLPlusAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TableNameAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('VariableAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('DocTypeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('NamespaceAttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ElementAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('TextAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AndAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ASPAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('UndefKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('AttributeValueAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SectionAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ConstantAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('ObjectAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('SecondKeyAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
    i := alist.IndexOf('varAttri');
    if -1 < i then begin
      highlitercolorset(strtoint(alist[i +1]),strtoint(alist[i +2]),strtoint(alist[i +3]),alist[i]);
    end;
  end;
end;

function Tfunctionunit.editcolorset(Fcolor,Bcolor:string):boolean;
var
  i,i1:integer;
begin
  fcolorset := fcolor;
  bcolorset := bcolor;
  if functionunit.true_boot then begin
    i1 :=1;
  end else begin
    i1 := 2;
  end;
  for i := 0 to mainform.PageControl1.PageCount -i1 do begin
    functionunit.editlist.Items[i].Synedit1.Color:= stringtocolor(bcolor);
    functionunit.editlist.Items[i].SynEdit1.Font.Color:= stringtocolor(fcolor);
  end;
  i := NewSet.IndexOf('editcolor');
  functionunit.NewSet[i] := fcolor;
  //functionunit.NewSet[i+2] := bcolor;
end;

function Tfunctionunit.heighligthcheck(i:integer;sw:boolean):string;
    begin
     { mainform.Menu_C.Checked := false;
      mainform.Menu_Delphi.Checked:= false;
      mainform.menu_css.Checked := false;
      mainform.Menu_Xml.Checked := false;
      mainform.Menu_html.Checked := false;
      //mainform.Menu_diff.Checked := false;
      mainform.Menu_pascal.Checked := false;
      mainform.Menu_java.Checked := false;
      mainform.Menu_SQL.Checked := false;
      mainform.Menu_perl.Checked := false;
      mainform.Menu_PHP.Checked := false;
      mainform.MenuI_UnixShell.Checked := false;
      mainform.Menu_VBScript.Checked := false;
      mainform.Menu_BAT.Checked := false;
      mainform.Menu_INI.Checked := false;
      mainform.Menu_FreeHeightLight.Checked := false;
      mainform.Menu_pyhton.Checked:= false;
      mainform.Menu_lazarus.Checked:= false;
      mainform.Menu_JS.Checked:= false;
      case i of
        0:mainform.Menu_C.Checked := sw;
        1:mainform.menu_css.Checked := sw;
        //6:mainform.Menu_diff.Checked := sw;
        3:mainform.Menu_pascal.Checked := sw;
        4:mainform.Menu_html.Checked := sw;
        5:mainform.Menu_java.Checked := sw;
        7:mainform.Menu_Delphi.Checked:= sw;
        8:mainform.Menu_perl.Checked := sw;
        9:mainform.Menu_PHP.Checked := sw;
        10:mainform.Menu_pyhton.Checked:= sw;
        11:mainform.Menu_SQL.Checked := sw;
        13:mainform.MenuI_UnixShell.Checked := sw;
        14:mainform.Menu_VBScript.Checked := sw;
        15:mainform.Menu_Xml.Checked := sw;
        16:mainform.Menu_BAT.Checked := sw;
        17:mainform.Menu_INI.Checked := sw;
        19:mainform.Menu_FreeHeightLight.Checked := sw;
        20:mainform.Menu_lazarus.Checked := sw;
        21:mainform.Menu_JS.Checked := sw;
        22:mainform.Menu_jsn.Checked := sw;
      end;
      case i of
        0:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        1:mainform.menu_css.Checked := sw;
        //6:mainform.Menu_diff.Checked := sw;
        3:begin
             functionunit.lngtype1:= '{';
             functionunit.lngtype2:= '}';
           end;
        4:mainform.Menu_html.Checked := sw;
        5:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        7:begin
             functionunit.lngtype1:= '{';
             functionunit.lngtype2:= '}';
           end;
        8:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        9:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        10:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        11:mainform.Menu_SQL.Checked := sw;
        13:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        14:begin
             functionunit.lngtype1:= '""';
             functionunit.lngtype2:= '""';
           end;
        15:mainform.Menu_Xml.Checked := sw;
        16:begin
             functionunit.lngtype1:= '@echo off';
             functionunit.lngtype2:= '@echo on';
           end;
        17:mainform.Menu_INI.Checked := sw;
        19:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        20:begin
             functionunit.lngtype1:= '{';
             functionunit.lngtype2:= '}';
           end;
        21:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
        22:begin
             functionunit.lngtype1:= '/*';
             functionunit.lngtype2:= '*/';
           end;
      end; }
end;

function Tfunctionunit.synchang(i:integer):boolean;
var
  i1,i2:integer;
  s:string;
begin
  i1 := mainform.PageControl1.ActivePageIndex;
  case i of
    0: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCppSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCppSyn1;
      end;
      for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        cpp(s);
      end;
      functionunit.editlist.Items[i1].edittype:= 'cpp';
    end;

    1: begin
      if not mainform.Menu_MultWindow.Checked then begin
        DataModule1.SynMultiSyn1.DefaultHighlighter := DataModule1.SynCssSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynCssSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'css';
    end;

    2: begin
       if not mainform.Menu_MultWindow.Checked then begin
         functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynDiffSyn1;
       end else begin
         functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynDiffSyn1;
       end;
       functionunit.editlist.Items[i1].edittype:= 'diff';
     end;

    3: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynFreePascalSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynFreePascalSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        fpas(s);
      end;
       functionunit.editlist.Items[i1].edittype:= 'fpas';
    end;

    4: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynHTMLSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynHTMLSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'html';
    end;

    5: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJavaSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJavaSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        java(s);
      end;
       functionunit.editlist.Items[i1].edittype:= 'java';
    end;

    6: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynLFMSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynLFMSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'lfm';
    end;

    7: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end;
       for i2 := 0 to color_form.ComboBox3.Items.Count -1 do begin
        s := color_form.ComboBox3.Items[i2];
        pas(s);
      end;
      functionunit.editlist.Items[i1].edittype:= 'pas';
    end;

    8: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPerlSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPerlSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'perl';
    end;

    9: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPHPSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPHPSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'php';
    end;

    10: begin
       if not mainform.Menu_MultWindow.Checked then begin
         functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPythonSyn1;
        end else begin
          functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPythonSyn1;
        end;
        functionunit.editlist.Items[i1].edittype:= 'python';
    end;

    11: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynSQLSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynSQLSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'sql';
    end;

    12: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynTeXSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynTeXSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'tex';
    end;

    13: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynUNIXShellScriptSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynUNIXShellScriptSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'shell';
    end;

    14: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynVBSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynVBSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'vbs';
    end;

    15: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynXMLSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynXMLSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'xml';
    end;

    16: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynBatSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynBatSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'bat';
    end;

    17: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynIniSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynIniSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'ini';
    end;

    18: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPoSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPoSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'po';
    end;

    19: begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynAnySyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynAnySyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'any';
    end;
    20:begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynPasSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'laz';
    end;
    21:begin
      if not mainform.Menu_MultWindow.Checked then begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJScriptSyn1;
      end else begin
        functionunit.editlist.Items[i1].SynEdit1.Highlighter := DataModule1.SynJScriptSyn1;
      end;
      functionunit.editlist.Items[i1].edittype:= 'js';
    end;
  end;
end;

function Tfunctionunit.macrosetup(i:integer):boolean;
var
  i3,i4:integer;
begin
  with functionunit do begin
    r[i]:= TMenuItem.Create(Mainform);
    if macro_form.Edit1.Text <> '' then begin
      r[i].Caption:= macro_form.edit1.Text;
    end else begin

    end;
    r[i].Name:= 'r' + inttostr(i);
    r[i].OnClick:= mainform.MenuItem90.OnClick;
    if macro_form.edit2.Text = 'コード補完読込' then begin
      //macro_comand[i] := ExtractFilePath( Paramstr(0) ) + 'listoutput.exe';
      //macro_param[i] := 'findtext.txt '
    end else if macro_form.edit2.Text = 'fEdit起動' then begin
      macro_comand[i] := Paramstr(0);
    end else begin;
      macro_comand[i] := macro_form.Edit2.Text;
    end;

    if macro_form.ComboBox1.Text = '' then begin
      macro_param[i] := '';
    end else if macro_form.ComboBox1.Text = 'カレントタブファイル' then begin
      macro_param[i] := 'CalnetTab';
    end else if macro_form.ComboBox1.Text = '次のタブファイル' then begin
      macro_param[i] := 'NextTab';
    end else if macro_form.ComboBox1.Text = '2NextTab' then begin
      macro_param[i] := '2NextTab';
    end else if macro_form.ComboBox1.Text = '3NextTab' then begin
      macro_param[i] := '3NextTab';
    end else if macro_form.ComboBox1.Text = '最初のタブファイル' then begin
      macro_param[i] := 'FirstTab';
    end else if macro_form.ComboBox1.Text = '最後のタブファイル' then begin
      macro_param[i] := 'LastTab';
    end else if macro_form.ComboBox1.Text = 'カレントタブフォルダ' then begin
      macro_param[i] := 'CalnetTab Folda';
    end else if macro_form.ComboBox1.Text = '次のタブフォルダ' then begin
      macro_param[i] := 'NextTab Folda';
    end else if macro_form.ComboBox1.Text = '2NextTab Folda' then begin
      macro_param[i] := '2NextTab Folda';
    end else if macro_form.ComboBox1.Text = '3NextTab Folda' then begin
      macro_param[i] := '3NextTab Folda';
    end else if macro_form.ComboBox1.Text = '最初のタブフォルダ' then begin
      macro_param[i] := 'FirstTab Folda';
    end else if macro_form.ComboBox1.Text = '最後のタブフォルダ' then begin
      macro_param[i] := 'LastTab Folda';
    end else if macro_form.ComboBox1.Text = 'ファイル選択ダイアログ' then begin
      macro_param[i] := 'file chice';
    end else begin
      macro_param[i] := macro_form.ComboBox1.Text;
    end;
    mainform.Menu_Custom.Add(r[i]);

    for i3 := 0 to mainform.Menu.Items.Count -1 do begin
     if mainform.Menu.Items[i3].Caption = mainform.Menu_Custom.Caption then begin
       for i4 := 0 to mainform.Menu.Items.Items[i3].Count -1 do begin
          if mainform.Menu.Items[i3].Items[i4].Caption = r[i].Caption then begin
            color_form.List_SubMnu.Items.Insert(i4,r[i].Caption);
            color_form.List_SubMnu2.Items.Insert(i4,'0');
          end;
       end;
     end;
    end;
    //inc(macrocount);
  end;
end;

function Tfunctionunit.macro(send:TObject):boolean;
var
  ad0,ad1,s:string;
  i,i1:integer;
  function openddilaog:string;
  begin
    if not DataModule1.OpenDialog1.Execute then
      exit;
    openddilaog := datamodule1.OpenDialog1.FileName;
  end;

begin
   with functionunit do begin
     for i := 0 to macrocount -1 do begin
       if r[i] = send then
         i1 := i;
     end;
     ad0 := macro_comand[i1];

     if macro_param[i1] = '' then begin
       ad1 := macro_param[i1];
     end else if macro_param[i1] = 'CalnetTab' then begin
       ad1 := functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path;
     end else if macro_param[i1] = 'NextTab' then begin
       ad1 := functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 1].filename_path;
     end else if macro_param[i1] = '2NextTab' then begin
       ad1 := functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 2].filename_path;
     end else if macro_param[i1] = '3NextTab' then begin
       ad1 := functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 3].filename_path;
     end else if macro_param[i1] = 'FirstTab' then begin
       ad1 := functionunit.editlist.Items[0].filename_path;
     end else if macro_param[i1] = 'LastTab' then begin
       ad1 := functionunit.editlist.Items[mainform.PageControl1.PageCount-2].filename_path;
     end else if macro_param[i1] = 'CalnetTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path);
     end else if macro_param[i1] = 'NextTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 1].filename_path);
     end else if macro_param[i1] = '2NextTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 2].filename_path);
     end else if macro_param[i1] = '3NextTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex+ 3].filename_path);
     end else if macro_param[i1] = 'FirstTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[0].filename_path);
     end else if macro_param[i1] = 'LastTab Folda' then begin
       ad1 := extractfiledir(functionunit.editlist.Items[mainform.PageControl1.PageCount-2].filename_path);
     end else if macro_param[i1] = 'file chice' then begin
       ad1 := openddilaog;
     end else begin
       ad1 := macro_param[i1];
     end;
     {$IFDEF Windows}
          if macro_comand[i1] = 'コード補完読込' then begin
            //functionunit.libopoen2(ad1);
          end else if macro_comand[i1] = 'fEdit起動' then begin
            ShellExecute(Handle, 'OPEN', pchar(Paramstr(0)),pchar(ad1),'', SW_SHOW);
          end else if macro_comand[i1] = 'エクスプローラ起動' then begin
            ShellExecute(Handle, 'OPEN', pchar('explorer.exe'),pchar(ad1),'', SW_SHOW);
          end else begin
            ShellExecute(Handle, 'OPEN', pchar(ad0),pchar(utf8toansi(ad1)),'', SW_SHOW);
          end;
     {$ENDIF}
     {$IFDEF LINUX}

     {$ENDIF}
     {$IFDEF Darwin}

     {$ENDIF}

   end;
end;

function insert_mark(i:integer;lng:string):boolean;
var
  comment:string;
  comment2:string;
begin
  case lng of
    'Bat':begin
       comment := '@echo';
       comment2 := '@echo off';
       functionunit.lngtype2 := 'echo on';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'JavaScript':begin
       comment := '//';
       comment2 := '<script type="text/javascript">';
       functionunit.lngtype2 := '</SCRIPT>';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'VBA':begin
       comment := '''';
       comment2 := '''';
       functionunit.lngtype2 := '''';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'PHP':begin
       comment := '//';
       comment2 := '<PHP?';
       functionunit.lngtype2 := '?>';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'Perl':begin
       comment := '#';
       comment2 := '{';
       functionunit.lngtype2 := '}';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'HTML':begin
       comment := '';
       comment2 := '<html><body><form>';
       functionunit.lngtype2 := '</form><body><html>';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'Delphi':begin
       comment := '//';
       comment2 := 'begin';
       functionunit.lngtype2 := 'end;';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

    'Lazarus':begin
       comment := '//';
       comment2 := 'begin';
       functionunit.lngtype2 := 'end;';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;


  'Java':begin
       comment := '//';
       comment2 := 'public class macro {' +char(13) + 'public static void main(String[] args){';
       functionunit.lngtype2 := '}}';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

  'UNIX Shell Script':begin
       comment := '{ #';
       comment2 := '#!/bin/sh';
       functionunit.lngtype2 := '};';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;

  'Python':begin
       comment := '#';
       comment2 := '    ';
       functionunit.lngtype2 := '#';
       functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype2 + chr(13)+ ' MacroEnd ' + lng + chr(13))
     end;
   end;
  functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY ,  chr(13));
  functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , comment + ' ここにマクロとして' + lng +'言語を記述します' + chr(13));
  functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , comment2 + chr(13));
  functionunit.editlist.Items[i].SynEdit1.Lines.Insert(functionunit.editlist.Items[i].SynEdit1.CaretY , functionunit.lngtype1 + chr(13)+ ' MacroStart ' + lng);

end;

function macro(sl1,sl2:TStringlist):string;
var
  i,i1,start_pos,end_pos:integer;
begin
  for i := 0 to sl1.Count -1 do begin
    start_pos := ansipos('MacroStart',sl1[i]);
    if start_pos > 0 then begin
      i1 := i;
      start_pos := i;
    end;
  end;
  for i := 0 to functionunit.lng_mnu_count -1 do begin
    start_pos := ansipos(functionunit.lng_mnu[i].Caption,sl1[i1]);
    if start_pos > 0 then begin
      macro := functionunit.lng_mnu[i].Caption;
      //break;
    end;
  end;
  for i := 0 to sl1.Count -1 do begin
    end_pos :=  ansipos('MacroEnd',sl1[i]);
    if end_pos <> 0 then begin
      end_pos := i;
      break;
    end;
  end;
  for i := i1 +1 to end_pos -1 do begin
    sl2.Add( sl1[i] );
  end;
end;

function codesave:String;
var
 sorcename,langege,dir:string;
 sl1,sl2:TStringList;
begin
  {$IFDEF Windows}
    dir := 'temp\';
  {$ENDIF}
  {$IFDEF LINUX}
   dir := 'temp/';
  {$ENDIF}
  {$IFDEF Darwin}
     dir := 'temp/';
  {$ENDIF}
  ForceDirectories( ExtractFilePath( (Paramstr(0)) )  + dir );
  sorcename := ExtractFilePath( systoutf8(Paramstr(0)))  + dir + 'test.';
  //ここに、切り取ったソースを保存するコードまたは関数を書く
  sl1 := TStringList.Create;
  sl2 := TStringList.Create;
  sl1.Text := functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.Text;
  sl2.Clear;
  functionunit.lun_macro := macro(sl1,sl2);
  langege := functionunit.lun_macro;
  if langege = '' then begin

  end else if langege = 'C' then begin
    sl2.SaveToFile(sorcename + 'c');
    sorcename := 'gcc ' + sorcename +';'+sorcename +'.out';
  end else if langege = 'Pascal' then begin
    sl2.SaveToFile(sorcename + 'pas');
    sorcename := 'ppc386 -h ' +sorcename +';'+sorcename + '.out';
  end else if langege = 'Lazarus' then begin
    sl2.SaveToFile(sorcename + 'pas');
    sorcename := 'ppc386 -h ' + sorcename +';'+sorcename + '.out';
  end else if langege = 'Delphi' then begin
    sorcename := utf8tosys(sorcename + 'pas');
    sl2.SaveToFile(sorcename);
  end else if langege = 'Java' then begin
    sorcename := sorcename + 'java';
    sl2.SaveToFile(sorcename);
    sorcename := 'javac ' + sorcename;
  end else if langege = 'JavaScript' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'html');
    sl2.SaveToFile(sorcename);
  end else if langege = 'SQL' then begin
    sorcename := sorcename + 'sql';
    sl2.SaveToFile(sorcename);
  end else if langege = 'XML' then begin
    sorcename := sorcename + 'xml';
    sl2.SaveToFile(sorcename);
  end else if langege = 'HTML' then begin
    sorcename := sorcename + 'html';
    sl2.SaveToFile(sorcename);
  end else if langege = 'Css' then begin
    sorcename := sorcename + 'css';
    sl2.SaveToFile(sorcename);
  end else if langege = 'perl' then begin
    sorcename := 'perl ' + sorcename + 'pl';
    sl2.SaveToFile(sorcename);
  end else if langege = 'PHP' then begin
    sorcename := sorcename + 'php';
    sl2.SaveToFile(sorcename);
  end else if langege = 'Python' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := 'Python '+(sorcename + 'py');
    sl2.SaveToFile(sorcename);
  end else if langege = 'VBA' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'vbs');
    sl2.SaveToFile(sorcename);
  end else if langege = 'UNIX Shell Script' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := (sorcename + 'sh');
    sl2.SaveToFile(sorcename);
  end else if langege = 'Bat' then begin
    sl2.Text:= utf8toansi(sl2.Text);
    sorcename := utf8tosys(sorcename + 'bat');
    sl2.SaveToFile(sorcename);
  end;
  sl1.Free;
  sl2.Free;
  codesave := sorcename;
end;

function Tfunctionunit.MacroInsart(i:integer;Lng:string):boolean;
begin
  try
    insert_mark(i,lng)
  except
    functionunit.editlist.Items[i].SynEdit1.Lines.Add(char(13));
    insert_mark(i,lng)
  end;
end;

function Tfunctionunit.CodeRun:boolean;
var
 url2,url3,url4:string;
begin
    url3 := functionunit.lun_macro;
    url2 := utf8toansi(codesave);
    url4 := utf8toansi('');
  {$IFDEF Windows}
    ShellExecute(Handle, 'OPEN', pchar(url2), '', '', SW_SHOW);
  functionunit.TempFIle_Clear3('tmp\','test.*');
  {$ENDIF}
  {$IFDEF LINUX}
    //Windows_unit.pross3(url2);
    functionunit.pross2(extractfilename(url2));
  functionunit.TempFIle_Clear3('tmp\','test.*');
  {$ENDIF}
  {$IFDEF Darwin}
     functionunit.pross3(url2);
  functionunit.TempFIle_Clear3('tmp/','test.*');
  {$ENDIF}

end;

function Tfunctionunit.macro_run(file_name:string):boolean;
var
 url:string;
begin
  {$IFDEF Windows}
    url := utf8toansi(file_name);
    ShellExecute(Handle, 'OPEN', pchar(url), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}
     functionunit.pross2(file_name);
  {$ENDIF}
  {$IFDEF Darwin}
     functionunit.pross3(file_name);
  {$ENDIF}
end;

function Tfunctionunit.macro_runex(file_name:string):boolean;
var
 url:string;
 {$IFDEF Windows}ShellEx: TShellExecuteInfo;{$ENDIF}
begin
  {$IFDEF Windows}
    url := utf8toansi(file_name);

  with ShellEx do begin
    cbSize := SizeOf( ShellEx);
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd :=  GetFocus;
    lpVerb := 'open';
    lpFile := PChar(url);
    lpParameters := Nil;
    lpDirectory := Nil;
    nShow := SW_SHOW;
  end;
  ShellExecute(Handle, 'OPEN', pchar(url), '', '', SW_SHOW);
  while WaitForSingleObject( handle, 0) = WAIT_TIMEOUT do begin
    Application.ProcessMessages;
  end;
  {$ENDIF}
  {$IFDEF LINUX}
     functionunit.pross2(file_name);
  {$ENDIF}
  {$IFDEF Darwin}
     functionunit.pross3(file_name);
  {$ENDIF}
end;

function Tfunctionunit.macro_run2(file_name:string):boolean;
var
 url:string;
begin
  {$IFDEF Windows}
    url := utf8toansi(file_name);
    //ShellExecute(Handle, 'open', 'cmd', pchar(url), '', SW_SHOW);
    //if ShellExecute(0,nil, 'open', PChar(url),nil,1) =0 then;
    SysUtils.ExecuteProcess(utf8toansi('C:windwoscmd'), utf8toansi(file_name), [])
  {$ENDIF}
  {$IFDEF LINUX}

  {$ENDIF}
  {$IFDEF Darwin}

  {$ENDIF}
end;

function Tfunctionunit.pross(set_name,set_name2:string):boolean;
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

function Tfunctionunit.pross2(command:string):boolean;
var
  sv: TProcess;
  ps,ps2:string;
  st:TStringList;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;


    ps := extractfileext(command);
    if ps = '.sh' then begin
      st := TStringlist.Create;
      st.Clear;
      ps2 := extractfilepath(paramstr(0));
      st.LoadFromFile(ps2+command);
      //ChDir('/bin/');
      ps2 := '"' + ps2 + '"';
      sv.Options:=[poWaitOnExit, poUsePipes, poStderrToOutPut];
      sv.CommandLine:= 'xdg-open ' +command;
      //sv.Parameters.Add('-c');
      //sv.Parameters.Add('cd '+ps2+';');
      //sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open chmod 755 '+ command );
    end else begin
      sv.Executable:= '/bin/sh';
      sv.Parameters.Add('-c');
      sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open '+ command );
    end;
    sv.Execute;
    sv.Free;
end;

function Tfunctionunit.pross3(command:string):boolean;
var
  sv: TProcess;
  ps:string;
begin
    sv := TProcess.Create(nil);
    //ps := form1.password;
    sv.Options:=[poWaitOnExit, poUsePipes, poStderrToOutPut];
    sv.Executable:= '/usr/bin/open';
    //sv.Parameters.Add('-n');
    sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +} command );
    sv.Execute;
    sv.Free;
end;

function Tfunctionunit.Mcrocheck(send:TObject;sw:boolean):boolean;
var
  i1:integer;
begin
      for i1 := 0 to functionunit.lng_mnu_count -1 do begin
        if functionunit.lng_mnu[i1] = send then begin
          functionunit.lng_mnu[i1].Checked:= sw;
          functionunit.macro_lng := functionunit.lng_mnu[i1].Caption;
        end else begin
          functionunit.lng_mnu[i1].Checked:= false;
        end;
      end;
end;

function Tfunctionunit.LngeMenu_copy:boolean;
var
  i2,i3:integer;
begin
  functionunit.lng_mnu_count := 0;
  with color_form do begin
     for i2 := 0 to mainform.Menu.Items.Count -1 do begin
      for i3 := 0 to mainform.Menu.Items.Items[i2].Count -1 do begin
        if (mainform.Menu.Items[i2].Items[i3].Caption = '-') or
            ( not mainform.Menu.Items[i2].Items[i3].Visible ) or
             ( mainform.Menu.Items[i2].Items[i3].Caption = '自由設定' ) or
             ( mainform.Menu.Items[i2].Items[i3].Caption = '補完ライブラリ指定' ) then begin

      end else if mainform.Menu.Items[i2].Caption = 'Edit設定' then begin
          functionunit.lng_mnu[i3] := TMenuItem.Create(self);
          functionunit.lng_mnu[i3].Name:= 'Lng_m' + inttostr(i3);
          functionunit.lng_mnu[i3].Caption:= mainform.Menu.Items[i2].Items[i3].Caption;
          functionunit.lng_mnu[i3].OnClick:= mainform.MenuC_chackmnu.OnClick;
          inc(functionunit.lng_mnu_count);
          mainform.MenuItem4.Add(functionunit.lng_mnu[i3]);
        end;
      end;
    end;
  end;
  functionunit.macro_lng := functionunit.lng_mnu[0].Caption;
  functionunit.lng_mnu[0].Checked:= true;
end;

function Tfunctionunit.get_code_list(sorce:TStringList):boolean;
var
  c1,c2:pchar;
  sw:boolean;
  i1,i2,i3:integer;
  sta,stb,st,st0,st1,st2,st3,st4,st5,st6:TStringList;
begin
  st := TStringList.Create;
  st.Clear;
  sta := TStringList.Create;
  sta.Clear;
  stb := TStringList.Create;
  stb.Clear;
  st0 := TStringList.Create;
  st0.Clear;
  st1 := TStringList.Create;
  st1.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  st3 := TStringList.Create;
  st3.Clear;
  st4 := TStringList.Create;
  st4.Clear;
  st5 := TStringList.Create;
  st5.Clear;
  st6 := TStringList.Create;
  st6.Clear;
  {try
    st.LoadFromFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\List.csv' );
  except

  end;
  //st3.LoadFromFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\List.csv' );
  try
    st4.LoadFromFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\func_List.csv' );
  except

  end;
  try
    st5.LoadFromFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\hensu_List.csv' );
  except

  end; }

  sta.Text := sorce.Text;
  st1.Text:= sorce.Text;
  //showmessage(sorce.Text);

  bunkatu(sta,stb);
  sta.Clear;
  for i3 := 0 to stb.Count -1 do begin;
    sta.Clear;
    bunkatu2(stb[i3],sta);
    for i1 := 0 to sta.Count -1 do begin
      if -1 = st6.IndexOf(sta[i1]) then begin
         st6.Add(sta[i1]);
         st.CommaText := sta[i1];
         st_ary3[0].Add(st[0]);
         st_ary3[1].Add(st[1]);
      end;
    end;
  end;
  //st.SaveToFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\List.csv' );


  st2.Clear;
  st6.Clear;
  //st1.LoadFromFile(s);
  bunkatu3(st1,st2,st3);
  st0.Clear;
  for i3 := 0 to st2.Count -1 do begin;
    st0.Clear;
    bunkatu4(st2[i3],st0);
    for i1 := 0 to st0.Count -1 do begin
      if -1 = st6.IndexOf(st0[i1]) then begin
         st6.Add(st0[i1]);
         st.CommaText := st0[i1];
         st_ary1[0].Add(st[0]);
         st_ary1[1].Add(st[1]);
      end;
    end;
  end;

  bunkatu5(st3 ,st5);
  //showmessage(st5.Text);
  st6.Clear;
  for i1 := 0 to st5.Count -1 do begin
      if -1 = st6.IndexOf(st5[i1]) then begin
        //showmessage(st5[i1]);
         st6.Add(st5[i1]);
         st.CommaText := st5[i1];
         st_ary2[0].Add(st[0]);
         st_ary2[1].Add(st[1]);
      end;
  end;

  //st4.SaveToFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\func_List.csv' );
  //st5.SaveToFile( ExtractFilePath( ParamStr( 0 ) ) + 'temp\hensu_List.csv' );
  sta.Free;
  stb.Free;
  st.free;
  st0.Free;
  st1.Free;
  st2.Free;
  st3.Free;
  st4.Free;
  st5.Free;
  st6.Free;
end;

function TFunctionunit.All_save():boolean;
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -1 do begin;
    functionunit.filesave(i);
  end;
end;

function TFunctionunit.All_saveAs():boolean;
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -1 do begin;
    functionunit.saveas(i);
  end;
end;

function Tfunctionunit.memoload(i:integer;s:string):boolean;
begin

        {$IFDEF Windows}
            functionunit.winload(i,s);
        {$ENDIF}
        {$IFDEF LINUX}
           //CopyFile(s,s1);
           functionunit.Linuxload(i,s);
        {$ENDIF}
        {$IFDEF Darwin}
           //CopyFile(s,s1);
           functionunit.macload(i,s);
        {$ENDIF}
end;

function Tfunctionunit.memosave(i:integer;s:widestring;memo:TStringList):boolean;
var
  s1:string;
begin
        //s1 := extractfilepath(paramstr(0))+ 'tmp0.txt';
        //CopyFile(s,s1);
        {$IFDEF Windows}
             //functionunit.Run(functionunit.memosave(i,s,memo));
             functionunit.winsave(i,s,memo);
        {$ENDIF}
        {$IFDEF LINUX}
           functionunit.linuxsave(i,s);
        {$ENDIF}
        {$IFDEF Darwin}
           functionunit.macsave(i,s);
        {$ENDIF}
end;

function Tfunctionunit.exitAPP():boolean;
var
  i:integer;
begin
  i:=0;
  exitAPP := false;
  try

    inc(i);
    {$IFDEF Windows}
         functionunit.iniwrite('ini\');
         TempFIle_Clear1('Backupfile\','.ba');
         TempFIle_Clear2('Backupfile\','temp3.txt');
         functionunit.save('Backupfile\','temp3.txt','.ba');
         functionunit.TempFIle_Clear3('temp\','test.*');
         functionunit.save_codeList('temp\');
    {$ENDIF}
    {$IFDEF LINUX}
         functionunit.iniwrite('ini/');
         TempFIle_Clear1('Backupfile/','.ba');
         TempFIle_Clear2('Backupfile/','temp3.txt');
         functionunit.save('Backupfile/','temp3.txt','.ba');
         functionunit.TempFIle_Clear3('temp/','test.*');
         functionunit.save_codeList('temp/');
    {$ENDIF}
    {$IFDEF Darwin}
         functionunit.iniwrite('ini/');
         TempFIle_Clear1('Backupfile/','.ba');
         TempFIle_Clear2('Backupfile/','temp3.txt');
         functionunit.save('Backupfile/','temp3.txt','.ba');
         functionunit.TempFIle_Clear3('temp/','test.*');
         functionunit.save_codeList('temp/');
    {$ENDIF}
    inc(i);
    functionunit.addnew_tab(false);
    functionunit.deleteAll_edittab();
    //
  except
    showmessage('終了に失敗しました。'+chr(13)+'エラーコード '+inttostr(i));
  end;
  exitAPP := true;
end;

function Tfunctionunit.save_codeList(path:string):boolean;
var
 i:integer;
 st:TStringList;
begin
  st := TStringList.create;
  st.clear;
  for i := 0 to st_ary1[0].count -1 do begin
    st.add( st_ary1[0][i] + ',"' +  st_ary1[1][i] + '"' );
  end;
  try
    st.savetofile(ExtractFilePath(ParamStr(0))+path + 'func_List.csv');
  except

  end;
  st.clear;
  for i := 0 to st_ary2[0].count -1 do begin
    st.add( st_ary2[0][i] + ',' +  st_ary2[1][i] );
  end;
  try
    st.savetofile(ExtractFilePath(ParamStr(0))+path + 'hensu_List.csv');
  except

  end;
  st.clear;
  for i := 0 to st_ary3[0].count -1 do begin
    st.add( st_ary3[0][i] + ',' +  st_ary3[1][i] );
  end;
  try
    st.savetofile(ExtractFilePath(ParamStr(0))+path + 'List.csv');
  except

  end;

end;

function Tfunctionunit.TitleSet(fname:string):boolean;
begin
  TitleSet := false;
  try
    functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename:= fname;
    functionunit.mainTitle := 'fEdit ' + functionunit.version + '[' + fname + ']';
    mainform.Caption:= functionunit.mainTitle;
  except

  end;
  TitleSet := true;
end;

function Tfunctionunit.fileopen(FileNames: String):boolean;
var
  i2:integer;

  function opfiles(i,i1:integer):boolean;
  var
    s,s1,s2:string;
    st,st2:Tstringlist;
    i3:integer;
    {function loadSorce:ThreadFunc;
    begin
      st:=TStringlist.Create;
      st.LoadFromFile(functionunit.editlist.Items[i].filename_path);
    end; }

  begin
    try
      functionunit.newwindow();
      i := mainform.PageControl1.ActivePageIndex;
      functionunit.editlist.Items[i].filename_path:= DataModule1.OpenDialog1.Files[i1];
      functionunit.editlist.Items[i].OpenDialog1.FileName:= DataModule1.OpenDialog1.Files[i1];
      //functionunit.editlist.Items[i].nameing_complate:= true;
      mainform.PageControl1.ActivePage.Caption:= extractfilename(DataModule1.OpenDialog1.Files[i1]);
      functionunit.TitleSet(
        DataModule1.OpenDialog1.Files[i1]
      );

      s := extractfileext(DataModule1.OpenDialog1.Files[i1]);
      s1 := extractfilename(DataModule1.OpenDialog1.Files[i1]);
      //showmessage(DataModule1.OpenDialog1.Files[i1]);
      case s of
        '.txt':;
        '.html':mainform.Menu_HTMLClick(mainform.Menu_HTML);
        '.htm':mainform.Menu_HTMLClick(mainform.Menu_HTML);
        '.js':mainform.Menu_JSClick(mainform.Menu_JS);
        '.json':mainform.Menu_JsnClick(mainform.Menu_jsn);
        '.xml':mainform.Menu_XMLClick(mainform.Menu_XML);
        '.pas':mainform.Menu_DelphiClick(mainform.Menu_Delphi);
        '.c':mainform.Menu_CClick(mainform.Menu_C);
        '.h':mainform.Menu_CClick(mainform.Menu_C);
        '.cpp':mainform.Menu_CClick(mainform.Menu_C);
        '.sql':mainform.Menu_SQLClick(mainform.Menu_SQL);
        '.css':mainform.Menu_CssClick(mainform.Menu_Css);
        '.parl':mainform.Menu_PerlClick(mainform.Menu_Perl);
        '.php':mainform.Menu_PHPClick(mainform.Menu_PHP);
        '.vb':mainform.Menu_VBScriptClick(mainform.Menu_VBScript);
        '.bat':mainform.Menu_BATClick(mainform.Menu_BAT);
        '.ini':mainform.Menu_INIClick(mainform.Menu_INI);
        '.java':mainform.Menu_JavaClick(mainform.Menu_Java);
        '.sh':mainform.MenuI_UnixShellClick(mainform.MenuI_UnixShell);
        {'.db3':begin
            s2 := '';
            for i3 := 1 to length(s1) -4 do begin;
                s2 := s2 + s1[i3];
            end;
            //functionunit.Run(functionunit.set_SQLtoStringGrid(s2,'SELECT * FROM '+S2,functionunit.editlist.Items[i].StringGrid1));
            functionunit.editlist.Items[i].SynEdit1.Lines.Text:= 'SELECT * FROM '+S2;
            functionunit.editlist.Items[i].PageControl1.ActivePageIndex:=2;
            functionunit.editlist.Items[i].Panel1.Visible:=TRUE;
         end;}
      end;
    finally


      begin
      try
      //showmessage(DataModule1.OpenDialog1.Files[i1]);
      //showmessage(functionunit.editlist.Items[i].filename_path);
      functionunit.memoload(i,functionunit.editlist.Items[i].filename_path);

      //functionunit.Run(loadSorce);
      st2:=TStringlist.Create;
      st2.Clear;
      //functionunit.Run(functionunit.bunkatu2(st,st2));


      with functionunit.editlist.Items[i] do begin
        //code_suport.Text:= st2.Text;
        //st.Free;
        //st2.Free;
        if PageControl1.ActivePage =  TabSheet1 then begin
          SynEdit1.Lines.Text := edit.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          Memo1.Lines.Text:= edit.Text;
        end;
      end;

    except
      showmessage('ファイル 「' +
        functionunit.editlist.Items[i].filename_path +
        '」を開けませんでした。'
      );
      fileopen := false;
    end;
    end;
  end;

  end;

begin
  if FileNames = '' then begin
    fileopen := false;
    if not DataModule1.OpenDialog1.Execute then
      exit;
    for i2 := 0 to DataModule1.OpenDialog1.Files.Count -1 do begin;
      opfiles(mainform.PageControl1.ActivePageIndex+1,i2);
    end;
  end else begin
    DataModule1.OpenDialog1.Files.Clear;
    DataModule1.OpenDialog1.Files.Add(FileNames);
    opfiles(mainform.PageControl1.ActivePageIndex+1,0);
    //functionunit.count_window;
  end;

  fileopen := true;
end;

function Tfunctionunit.reopen(Tabs:integer):boolean;
var
  i:integer;
begin
  reopen := false;
  try
    try
      i := Tabs;
      with functionunit.editlist.Items[i] do begin
        functionunit.TitleSet(functionunit.editlist.Items[i].filename_path);

        functionunit.memoload(i,functionunit.editlist.Items[i].filename_path);

        if PageControl1.ActivePage =  TabSheet1 then begin
          SynEdit1.Lines.Text := edit.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          Memo1.Lines.Text:= edit.Text;
        end;
      end;
    except
    showmessage('ファイル 「' +
      functionunit.editlist.Items[i].filename_path +
      '」を開けませんでした。'
    );
      reopen := false;
    end;
  finally
    reopen := true;
  end;
end;

function Tfunctionunit.filesave(Tabs:integer):boolean;
var
  i:integer;
  st,st2:TStringlist;
begin
  filesave := false;
  try
      i := Tabs;

      with functionunit.editlist.Items[i] do begin
        if (not nameing_complate) {and (not save_complate)} then begin
          saveas(i);
          exit;
        end;
        //if save_complate then
          //exit;
        if PageControl1.ActivePage =  TabSheet1 then begin
          edit.Text := SynEdit1.Lines.Text;
        end else if PageControl1.ActivePage = TabSheet2 then begin
          edit.Text := Memo1.Lines.Text;
        end;
        functionunit.TitleSet(functionunit.editlist.Items[i].filename_path);

        functionunit.memosave(i,functionunit.editlist.Items[i].filename_path,functionunit.editlist.Items[i].Edit);

        st:=TStringlist.Create;
        st.LoadFromFile(functionunit.editlist.Items[i].filename_path);
        st2:=TStringlist.Create;
        st2.Clear;
        //functionunit.bunkatu(st,st2);

        //functionunit.editlist.Items[i].code_suport.Text:= st2.text;

        st.Free;
        st2.Free;

        save_complate := true;
      end;
  except
    showmessage('ファイル 「' +
      functionunit.editlist.Items[i].filename_path +
      '」を保存できませんでした。'
      );
  end;
  functionunit.editlist.Items[i].save_complate := true;
  filesave := true;
end;

function Tfunctionunit.saveas(Tabs:integer):boolean;
var
  i:integer;
  sw:boolean;
  ext:string;
begin
  saveas := false;
  i := tabs;
  sw :=  not true;//trueで実験開始用フラグ
  if not sw then begin
  functionunit.editlist.Items[i].SaveDialog1.FileName:= functionunit.editlist.Items[i].filename_path;
  try
    try
      if not functionunit.editlist.Items[i].SaveDialog1.Execute then
        exit;
    except

    end;
  finally

  end;
  //if functionunit.editlist.Items[i].save_complate then
  //  exit;
  end;
       ext := '';
      {$IFDEF Linux}
        ext := functionunit.editlist.Items[i].SaveDialog1.DefaultExt;
      {$ENDIF}
  functionunit.editlist.Items[i].filename_path:= functionunit.editlist.Items[i].SaveDialog1.Filename +ext;
  functionunit.editlist.Items[i].SaveDialog1.FileName:= functionunit.editlist.Items[i].SaveDialog1.Filename+ext;
  mainform.PageControl1.ActivePage.Caption:= extractfilename(functionunit.editlist.Items[i].SaveDialog1.Filename);
  functionunit.TitleSet(functionunit.editlist.Items[i].filename_path);
  with functionunit.editlist.Items[i] do begin
    try
      if PageControl1.ActivePage =  TabSheet1 then begin
        edit.Text := SynEdit1.Lines.Text;
      end else if PageControl1.ActivePage = TabSheet2 then begin
        edit.Text := Memo1.Lines.Text;
      end;

      functionunit.memosave(i,functionunit.editlist.Items[i].SaveDialog1.Filename,functionunit.editlist.Items[i].Edit);

      nameing_complate := true;
      save_complate := true;
    except
      showmessage('ファイル 「' +
      functionunit.editlist.Items[i].SaveDialog1.Filename +
      '」を保存できませんでした。'
      );
    end;
  end;
  functionunit.editlist.Items[i].save_complate := true;
  saveas := true;
end;

function Tfunctionunit.allsaveas():boolean;
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
    if 0 < i -2 then begin
      saveas(i);
    end;
  end;
end;

function Tfunctionunit.allsave():boolean;
var
  i:integer;
begin
  for i := 0 to mainform.PageControl1.PageCount -2 do begin
    filesave(i);
  end;
end;

function Tfunctionunit.char_set(SetTab:integer;char_type:string):boolean;
var
  i:integer;
begin
  i := SetTab;
      if char_type = 'ANSI' then begin
        mainform.Menu_UTF8.Checked:= false;
        mainform.Menu_UTF16.Checked:= false;
        mainform.Menu_Ansi.Checked:= true;
        functionunit.str_charsets(i,char_type);
      end else if char_type = 'UTF8' then begin
        mainform.Menu_UTF8.Checked:= true;
        mainform.Menu_UTF16.Checked:= false;
        mainform.Menu_Ansi.Checked:= false;
        functionunit.str_charsets(i,char_type);
      end else if char_type = 'UTF16' then begin
        mainform.Menu_UTF8.Checked:= false;
        mainform.Menu_UTF16.Checked:= true;
        mainform.Menu_Ansi.Checked:= false;
        functionunit.str_charsets(i,char_type);
      end;
end;

function Tfunctionunit.str_charsets(i:integer;s:string):string;
begin
  if s = '?' then
    str_charsets := editlist.Items[i].char_sets
  else
    editlist.Items[i].char_sets:= s;
end;

function Tfunctionunit.versionSet(ver:string):boolean;
begin
  versionSet := false;
  try
    functionunit.version:= ver;
    functionunit.mainTitle := 'fEdit ' + functionunit.version + '[]';
    mainform.Caption:= functionunit.mainTitle;
  except

  end;
  versionSet := true;
end;


{$IFDEF Windows}

function Tfunctionunit.winload(i:integer;s:string):boolean;
  function load_stream(st1:string;st2:TStringList):boolean;
  var
    tf : TextFile;
    s:string;
  begin
    try
      try
        AssignFile(tf, st1);
        Reset(tf);
        while not Eof(tf) do begin
          Readln(tf, s);
          st2.Add(s);
        end;
      finally
        CloseFile(tf);
      end
    except
    end;
  end;
  function encode_charset(i:integer;s:string):boolean;
  var
    s1:ansistring;
    s2:widestring;
    s4,s3:string;
    p,pst:pchar;
    st,st1,st2,st3:TStringList;
    i1:integer;
    function pross(pram:string):boolean;
    var Pros:TProcess;
    begin
      Pros := TProcess.Create(nil);
      Pros.Options := [poWaitOnExit, poUsePipes];
      Pros.CommandLine:= pram;
      Pros.Execute;
      Pros.Free;
    end;
  begin
    if MainForm.Menu_Utf16.Checked then begin
      //s1 := memo.text;
      //s2 := utf8toansi(s1);
      st := TStringList.Create;
      st1 := TStringList.Create;
      st2 := TStringList.Create;
      st3 := TStringList.Create;
      st.Clear;
      st2.Clear;
      s1 := s;
      encod_unicode(pchar(s1));
      //st1.Text:= 'CMD /u /C  ^(CMD /a /C chcp 65001 ^& TYPE "' +s +'")>' +extractfilepath(paramstr(0))+'tmp.txt';
      //load_text(st,st1);
      //st.SaveToFile(extractfilepath(paramstr(0))+'set.bat');
      st2.Clear;
      st3.Clear;
      //pross('cmd /u /c  chcp 6501 ^& copy /N /Y "' +s +'" ' +extractfilepath(paramstr(0))+'set.txt');
      //pross('CMD /U /C chcp 65001 ^& ^(CMD /C TYPE "' +s +'" ) >' +extractfilepath(paramstr(0))+'tmp.txt');
      //pross(extractfilepath(paramstr(0))+'set.bat');
      st2.LoadFromFile(extractfilepath(paramstr(0))+'tmp.txt');
      st2.Delete(0);
      //load_text(st3,st2);
      get_code_list(st2);
      functionunit.editlist.Items[i].Edit.Text := ((st2.Text));
      //st.Free;
      //st2.Free;

      deletefile(pchar(extractfilepath(paramstr(0))+'tmp.txt'));
      deletefile(pchar(extractfilepath(paramstr(0))+'set.bat'));
      encode_charset := true;
    end else if MainForm.Menu_Ansi.Checked then begin
      //memo.LoadFromFile((ansitoutf8(s)));
      st := TStringList.Create;
      st2 := TStringList.Create;
      st.Clear;
      st2.Clear;
      //functionunit.editlist.Items[i].Edit.Text := ((memo.Text));
      {st.Text:= 'chcp 65001|(echo ' + memo.Lines[0] + '';
      for i1 := 1 to memo.Lines.Count -1 do begin
        if memo.Lines[i1] <> '' then begin
           st.Text := st.Text + 'echo ' + memo.Lines[i1] + '';
        end else begin
           st.Text := st.Text + 'echo.'
        end;
      end;
      st.Text:=st.Text+')>' +extractfilepath(paramstr(0))+'tmp.txt';}
      //st.Text:= 'chcp 65001|type "' +s +'">' +extractfilepath(paramstr(0))+'tmp.txt';
      //st.SaveToFile(extractfilepath(paramstr(0))+'set.bat');
      //pross('cmd /u /c chcp 65001|type "' +s +'">' +extractfilepath(paramstr(0))+'tmp.txt');
      //pross(extractfilepath(paramstr(0))+'set.bat');
      //functionunit.macro_run(extractfilepath(paramstr(0))+'set.vbs');
      //s1 := s;
      //encod_ansi(pchar(s1));
      //st2.LoadFromFile(extractfilepath(paramstr(0))+'tmp.txt');
      //st2.Delete(0);
      //load_text(st3,st2);
      //functionunit.editlist.Items[i].Edit.Text := ((st3.Text));
       //st.Text := memo.Lines.Text;
       {for i1 := 0 to st.Count -1 do begin
         st2.Add(string(load_text(pchar(st[i1]))));
       end;}
       //showmessage(s);
       load_text(pchar(s));
       load_stream(ExtractFilePath( ParamStr( 0 ) ) + 'tmp.txt' ,st);
       //st2.Text:= string(pst);
       //st.LoadFromFile(extractfilepath(paramstr(0))+'tmp.txt');
       get_code_list(st);
      functionunit.editlist.Items[i].Edit.Text := ((st.Text));
      deletefile(pchar(extractfilepath(paramstr(0))+'tmp.txt'));
      st2.Free;
      st.Free;
      {s := st[0];
      for i1 := 4 to length(s)-1 do begin
        s3 := s3 + s[i1];
      end;
      st[0] := s3;
      st.SaveToFile(extractfilepath(paramstr(0))+'tmp.txt');
      functionunit.editlist.Items[i].Edit.LoadFromFile(extractfilepath(paramstr(0))+'tmp.txt');
      deletefile(pchar(extractfilepath(paramstr(0))+'tmp.txt'));
      deletefile(pchar(extractfilepath(paramstr(0))+'set.vbs'));}
      encode_charset := true;
    end else if MainForm.Menu_UTF8.Checked then begin
       //memo.LoadFromFile(((s)));
       st := TStringList.Create;
       st.Clear;
       load_stream(s,st);
       get_code_list(st);
       functionunit.editlist.Items[i].Edit.Text := st.Text;
       st.Free;
       encode_charset := true;
    end;
    functionunit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      //edt := TMemo.Create(owner);
      //edt.Parent := functionunit;
      //edt.Enabled:= true;
      //edt.Lines.LoadFromFile(s);
      encode_charset(i,s);
      //edt.Free;
    finally

    end;
end;

function Tfunctionunit.winsave(i:integer;s:widestring;memo:TStringList):boolean;
  function encode_charset(i:integer;memo:TStringList):boolean;
  var
    st:TStringList;
    s1:ansistring;
    i1:integer;
    Pros:TProcess;
  begin
    if functionunit.editlist.Items[i].char_sets = 'UTF16' then begin
      //memo.Text:= ((memo.Text));
      memo.SaveToFile(extractfilepath(paramstr(0))+'tmp.txt');
      s1 := s;
      decoed_unicode(pchar(s1));
      encode_charset := true;
    end else if functionunit.editlist.Items[i].char_sets = 'ANSI' then begin
    st := TStringList.Create;
    st.Text:= memo.Text;
    memo.Clear;
    //save_text(memo,st);
       for i1 := 0 to st.Count -1 do begin
         memo.Add(string(save_text(pchar(st[i1]))));
       end;
    try
        memo.SaveToFile(((s)));
    finally

    end;
      //memo.SaveToFile(s);
      {memo.Text:= (utf8toansi(memo.Text));
      try
        memo.SaveToFile(utf8toansi(extractfilepath(paramstr(0))+'set.txt'));
      finally

      end;
      st := TStringList.Create;
      st.text :=
      'set s = CreateObject("ADODB.Stream")' + chr(13)
      + 'dim data' + chr(13)
      + 's.Open' + chr(13)
      + 's.Charset = "_autodetect_all"' + chr(13)
      + 's.LoadFromFile("'+extractfilepath(paramstr(0))+'set.txt'+'")' + chr(13)
      + 'data = s.ReadText' + chr(13)
      + 'Dim fso'+ chr(13)
      + 'Set fso = WScript.CreateObject("Scripting.FileSystemObject")'+ chr(13)
      + 'Dim inputFile' + chr(13)
      + 'Set inputFile = fso.OpenTextFile("'+extractfilepath(paramstr(0))+'set.txt", 1, False, -2)' + chr(13)
      + chr(13)

      //+ 'End With' + chr(13)

      + 'Dim outputFile' + chr(13)
      + 'Set outputFile = fso.OpenTextFile("'+s+'", 2, True)' + chr(13)
      + chr(13)
      + 'Do Until inputFile.AtEndOfStream' + chr(13)
      + '  Dim lineStr' + chr(13)
      + '  lineStr = inputFile.ReadLine' + chr(13)
      + '  outputFile.WriteLine lineStr' + chr(13)
      + 'Loop' + chr(13)
      + 'outputFile.Close' + chr(13)
      + 'inputFile.Close' + chr(13)
      + 's.Close' + chr(13)
      + chr(13);
      st.SaveToFile(extractfilepath(paramstr(0))+'set.vbs');
      //st.Text:= 'start /min cmd /u / c ' + extractfilepath(paramstr(0))+'set.vbs';
      //st.SaveToFile(extractfilepath(paramstr(0))+'set.bat');
      Pros := TProcess.Create(nil);
      Pros.Options := [poWaitOnExit, poUsePipes];
      Pros.CommandLine:= 'cmd /u /c ' + extractfilepath(paramstr(0))+'set.vbs';
      Pros.Execute;
      Pros.Free;
      deletefile(pchar(extractfilepath(paramstr(0))+'set.txt'));
      deletefile(pchar(extractfilepath(paramstr(0))+'set.vbs'));}


      encode_charset := true;

    end else if functionunit.editlist.Items[i].char_sets = 'UTF8' then begin
      memo.Text:= memo.Text;
      encode_charset := true;
      try
        memo.SaveToFile(((s)));
      finally

      end;
    end;
    //showmessage(functionunit.editlist.Items[i].char_sets);
  end;

begin
    encode_charset(i,memo);
end;

function Tfunctionunit.get_window(h:handle):boolean;
begin
  BringWindowtotop(h);
end;

function Tfunctionunit.activeWindow(h:handle):boolean;
begin
  setActiveWindow(h);
end;

{$ENDIF}

{$IFDEF LINUX}
function Tfunctionunit.linuxload(i:integer;s:string):boolean;
var
  sw:boolean;
  s1:string;
  function load_stream(st1:string;st2:TStringList):boolean;
  var
    tf : TextFile;
    s:string;
  begin
    try
      try
        AssignFile(tf, st1);
        Reset(tf);
        while not Eof(tf) do begin
          Readln(tf, s);
          st2.Add(s);
        end;
      finally
        CloseFile(tf);
      end
    except
    end;
  end;
  function encode_charset(i:integer;s:widestring):boolean;
  var
    Process:TProcess;
    setFile: string;
  begin
    try
    if mainform.Menu_Utf16.Checked then begin
      //functionunit.editlist.Items[i].Edit.LoadFromFile((s));
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      //sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open '+ command );
      Process.Parameters.Add('iconv -f utf16le -t utf8 "'+(s)+'"  > "'+ extractfilename(setfile)+'"');
      functionunit.editlist.Items[0].synedit1.Lines.Text:= 'iconv -f utf16le -t utf8 "'+(s)+'"  > "'+ extractfilename(setfile)+'"';
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      load_stream( setfile ,
      functionunit.editlist.Items[i].Edit{.LoadFromFile(}  );
      Process.Free;
      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process := TProcess.Create(nil);
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      Process.Parameters.Add('rm ' + (setfile));
      Process.Parameters.Add('rm ' + extractfilename(s));
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_Ansi.Checked then begin
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      //sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open '+ command );
      Process.Parameters.Add('iconv -f sjis -t utf8 "'+(s)+'"  > "'+ extractfilename(setfile)+'"');
      //functionunit.editlist.Items[0].synedit1.Lines.Text:= 'iconv -f sjis -t utf8 '+extractfilename(s)+'  > '+ extractfilename(setfile);
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      load_stream( setfile ,
      functionunit.editlist.Items[i].Edit{.LoadFromFile(}  );

      Process.Free;
      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process := TProcess.Create(nil);
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      Process.Parameters.Add('rm ' + (setfile));
      Process.Parameters.Add('rm ' + extractfilename(s));
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_UTF8.Checked then begin
       load_stream( s ,
       functionunit.editlist.Items[i].Edit{.LoadFromFile(}  );
       //functionunit.editlist.Items[i].Edit.LoadFromFile((s));
       encode_charset := true;
    end;
  finally

  end;
    //functionunit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      encode_charset(i,s);
    finally

    end;

end;

function Tfunctionunit.linuxsave(i:integer;s:string):boolean;
var
  sw:boolean;
  s1:string;
  function encode_charset(i:integer;s:widestring):boolean;
  var
    Process:TProcess;
    setFile: string;
  begin
    try
    if mainform.Menu_Utf16.Checked then begin
      //functionunit.editlist.Items[i].Edit.SaveToFile((s));
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      functionunit.editlist.Items[i].Edit.SaveToFile( setfile );
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      //sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open '+ command );
      Process.Parameters.Add('iconv -f utf8 -t utf16le '+'tmp.txt'+'  > "'+ S+'"');

      //functionunit.editlist.Items[0].synedit1.Lines.Text:= 'iconv -f sjis -t utf8 '+extractfilename(s)+'  > '+ extractfilename(setfile);
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      //functionunit.editlist.Items[i].Edit.sa( setfile );
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_Ansi.Checked then begin
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      functionunit.editlist.Items[i].Edit.SaveToFile( setfile );
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      //sv.Parameters.Add({'echo ' +ps+ ' | sudo -S ' +}'xdg-open '+ command );
      Process.Parameters.Add('iconv -f utf8 -t sjis '+'tmp.txt'+'  > "'+ S+'"');
      //functionunit.editlist.Items[0].synedit1.Lines.Text:= 'iconv -f sjis -t utf8 '+extractfilename(s)+'  > '+ extractfilename(setfile);
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      //functionunit.editlist.Items[i].Edit.sa( setfile );
      Process.Free;
      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      {Process := TProcess.Create(nil);
      Process.Executable:= '/bin/sh';
      Process.Parameters.Add('-c');
      Process.Parameters.Add('rm ' + (setfile));
      CopyFile(extractfilepath(paramstr(0))+'tmp_s.txt',s,false);
      //Process.Parameters.Add('rm ' + extractfilename(s));
      Process.Execute;
      functionunit.editlist.Items[i].SynEdit1.Lines.Text:= s;
      //プロセスを解放する
      Process.Free;}
      encode_charset := true;
    end else if mainform.Menu_UTF8.Checked then begin
       functionunit.editlist.Items[i].Edit.SaveToFile((s));
       encode_charset := true;
    end;
  finally

  end;
    //functionunit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      encode_charset(i,s);
    finally

    end;

end;
{$ENDIF}

{$IFDEF Darwin}
function Tfunctionunit.macOpen(s:string):boolean;
var
  i:integer;
  s1:string;
begin
    //ファイルパスから、パッケージファイル名だけを取得し、変数sに格納する。
    s1 := ExtractFileName(paramstr(0));
    //取得したパッケージファイル名(*.app)を加工して、末尾のappを除去する。
    for i := Length(s1) -3 to Length(s1) do begin
      //拡張子部分の文字列がなかったかのように文字列末尾を加工する。
      s1[i] := char(0);
    end;
    //取得したパスに、パッケージの中身のフォルダ名と、加工したファイル名を継ぎ足して表示。
    ShowMessage( s1 + '/Contents/MacOS/' + s );
end;

function Tfunctionunit.macload(i:integer;s:string):boolean;
var
  sw:boolean;
  s1:string;
  function encode_charset(i:integer;s:widestring):boolean;
  var
    Process:TProcess;
    setFile: string;
  begin
    try
    if mainform.Menu_Utf16.Checked then begin
      //functionunit.editlist.Items[i].Edit.LoadFromFile((s));
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Commandline := 'sh -c "piconv -f utf16le -t utf8 ' + s + ' > ' + setfile + '"';
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      functionunit.editlist.Items[i].Edit.LoadFromFile( setfile );

      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process.Commandline := 'sh -c "rm ' + setfile + '"';
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
      encode_charset := true;
    end else if mainform.Menu_Ansi.Checked then begin
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Commandline := 'sh -c "piconv -f sjis -t utf8 ' + s + ' > ' + setfile + '"';
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む
      functionunit.editlist.Items[i].Edit.LoadFromFile( setfile );

      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process.Commandline := 'sh -c "rm ' + setfile + '"';
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_UTF8.Checked then begin
       functionunit.editlist.Items[i].Edit.LoadFromFile((s));
       encode_charset := true;
    end;
  finally

  end;
    //functionunit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      encode_charset(i,s);
    finally

    end;

end;

function Tfunctionunit.macsave(i:integer;s:string):boolean;
var
  sw:boolean;
  s1:string;
  function encode_charset(i:integer;s:widestring):boolean;
  var
    Process:TProcess;
    setFile: string;
  begin
    try
    if mainform.Menu_Utf16.Checked then begin
      //functionunit.editlist.Items[i].Edit.SaveToFile((s));
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      functionunit.editlist.Items[i].Edit.SaveToFile( setfile );
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Commandline := 'sh -c "piconv -f utf8 -t utf16le ' + setfile + ' > ' + s + '"';
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む


      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process.Commandline := 'sh -c "rm ' + setfile + '"';
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_Ansi.Checked then begin
      setfile := ExtractFilePath( Paramstr(0) ) + 'tmp.txt';
      functionunit.editlist.Items[i].Edit.SaveToFile( setfile );
      //TProcessを宣言
      Process := TProcess.Create(nil);
      //オプションを指定して、パイプライン処理とファイル出力を有効にする
      Process.Options := [poUsePipes, poWaitOnExit, poStderrToOutPut];
      //コマンドラインを指定し、シェルコマンドのpiconvを呼び出し、sjisファイルを、utf8に変換させる。
      //オプションを指定し、入力ファイルを設定、パイプ処理を行い、ファイルを出力させる
      Process.Commandline := 'sh -c "piconv -f utf8 -t sjis ' + setfile + ' > ' + s + '"';
      //プロセスを実行
      Process.Execute;
      //ファイルを読み込む


      //作業フォルダが汚れない様に、読み込んだ一時ファイルを削除する
      Process.Commandline := 'sh -c "rm ' + setfile + '"';
      Process.Execute;
      //プロセスを解放する
      Process.Free;
      encode_charset := true;
    end else if mainform.Menu_UTF8.Checked then begin
       functionunit.editlist.Items[i].Edit.SaveToFile((s));
       encode_charset := true;
    end;
  finally

  end;
    //functionunit.editlist.Items[i].save_complate := true;
  end;
begin
    try
      encode_charset(i,s);
    finally

    end;

end;
{$ENDIF}

function Tfunctionunit.undo():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.Undo;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.Undo;
    end;

  end;
end;

function Tfunctionunit.redo():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.Redo;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.Undo;
    end;

  end;
end;

function Tfunctionunit.cut():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.CutToClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.CutToClipboard;
    end;

  end;
end;

function Tfunctionunit.copy():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.CopyToClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.CopyToClipboard;
    end;

  end;
end;

function Tfunctionunit.past():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.PasteFromClipboard;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.PasteFromClipboard;
    end;

  end;
end;

function Tfunctionunit.selectAll():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.SelectAll;
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.SelectAll;
    end;

  end;
end;

function Tfunctionunit.delete():boolean;
begin
  with functionunit.editlist.Items[mainform.PageControl1.PageIndex] do begin
    if  PageControl1.ActivePage =  TabSheet1 then begin
        SynEdit1.SelText:= '';
    end else if  PageControl1.ActivePage =  TabSheet2 then begin
       Memo1.SelText:= '';
    end;

  end;
end;

function Tfunctionunit.Calendar(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  if not Datamodule1.CalendarDialog1.Execute then
    exit;
  Datamodule1.CalendarDialog1.date := now;

  functionunit.insert_text(i,datetostr(Datamodule1.CalendarDialog1.Date));


end;

function Tfunctionunit.Time(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  functionunit.insert_text(i,Timetostr(now));

end;

function Tfunctionunit.Calac(Tabs:integer):boolean;
var
  i:integer;
begin
  i := tabs;
  if not Datamodule1.CalculatorDialog1.Execute then
    exit;

    functionunit.insert_text(i,floattostr(Datamodule1.CalculatorDialog1.Value));

end;

function Tfunctionunit.insert_text(Tabs:integer;data:string):boolean;
var
  i,i1:integer;
begin
  i := Tabs;
  if functionunit.editlist.Items[i].PageControl1.ActivePageIndex = 0 then begin;
    i1 := functionunit.editlist.Items[i].SynEdit1.CaretY -1;
    functionunit.editlist.Items[i].SynEdit1.SelStart:= i1;
    functionunit.editlist.Items[i].SynEdit1.SelText := data;
  end else if functionunit.editlist.Items[i].PageControl1.ActivePageIndex = 1 then begin
    {$IFDEF Windows}
    i1 := SendMessage(functionunit.editlist.Items[i].Memo1.Handle, EM_LINEFROMCHAR, functionunit.editlist.Items[i].Memo1.SelStart, 0);
    functionunit.editlist.Items[i].Memo1.SelStart:= i1;
    functionunit.editlist.Items[i].Memo1.SelText := data;
    {$ENDIF}
    {$IFDEF Darwin}
    i1 := functionunit.editlist.Items[i].Memo1.CaretPos.Y-1;
    functionunit.editlist.Items[i].Memo1.SelStart:= i1;
    functionunit.editlist.Items[i].Memo1.SelText := data;
    {$ENDIF}

  end;
end;

function Tfunctionunit.findwindow():boolean;
var
  f : Tfind_form;
begin
  f := Tfind_form.Create(functionunit);
  f.Show;
end;

function TextCheng(i,x,y:integer;find1,find2,reprace1,reprace2:string):boolean;
var
  st,st1,st2,st3,st4:TStringList;
  i1,i2,i3,i4:integer;
  s,s1,s2:string;
begin
  with functionunit.editlist.Items[i].SynEdit1 do begin
    //y := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
    //x := SelStart - SendMessage(Handle, EM_LINEINDEX, y, 0);
    //form1.caption := inttostr(y + 1)+ '行' + inttostr(x)+ '列';

    //if key = 13 then begin
      {if Lines.Text = '' then begin
        Lines[y] :=  Lines[y] + 'chr(13) + ';
        exit;
      end;}
      {if Lines[y -1] = 'chr(13) + ' then begin
        Lines[y] := 'chr(13) ';
        exit;
      end;}
      if Lines[y] <> '' then begin
       // if 0 > (y -1) then begin
          st := tstringlist.Create;
          st.Clear;
          st1 := tstringlist.Create;
          st1.Clear;
          st2 := TStringlist.Create;
          st2.Clear;
          st3 := TStringlist.Create;
          st3.Clear;
          st4 := TStringlist.Create;
          st4.Clear;
          st.Text:= lines[y];
          if find1 <> '' then
            functionunit.findtext(find1,st,st1,x)
          else
            functionunit.findtext(find2,st,st1,x);
          //showmessage(st1.Text);
          s := st.Text;
          if st1.Text <> '' then begin
            if find1 <> '' then begin
              s :=  StringReplace(Lines[y],find1,reprace1,[{rfReplaceAll}]);
              {for i2 := strtoint(st1[0]) to strtoint(st1[0]) + length(find1) do begin
                s[i2] := char(0);
              end;}
            end;
            lines[y] := s;
            if find2 <> '' then begin
              st2.Add(lines[y]);
              //検索して、最後尾の検索結果を置き抱える。
              for i1 := 0 to length(lines[y]) do begin
                functionunit.findtext(find2,st2,st4,i1);
                s2 := st4.text;
                if null <> s2 then
                  st3.Add(s2);
              end;
              //showmessage(st3.Text);
              if Lines[y] <> '' then begin
                        s := '';
                        s2 := '';
                        i4 := strtoint(st3[st3.Count-1]);
                        s1 := lines[y];
                        //i2 := ansipos(find2,s1);
                        for i1 := 1 to i4 -1 do begin
                          s2 := s2 + s1[i1];
                        end;
                       // showmessage(s2 + 'e'+ s1 + inttostr(i4));
                        for i1 := i4 to length(s1) do begin
                          s := s + s1[i1];
                        end;
                       // showmessage(s2 + ' ' + s);
                        s := StringReplace(s,find2,reprace2,[{rfReplaceAll}]);
                        //s2 := s2 + s;
                        lines[y] := s2 + s;

                        //showmessage(lines[y]);
                    end;
            end;
          end;



          if (st1.Text <> '') then
            exit;
            //Lines[y] := reprace1 + Lines[y] + reprace2;

          if (reprace1 <> '') or (reprace2 <> '') then
            if ( find1 = '') and ( find2 = '') then
              Lines[y] := reprace1 + Lines[y] + reprace2;

          st.Free;
          st1.Free;
          st2.Free;
          st3.Free;
          st4.Free;
          //exit;
       // end;
        {Lines[y] := '+ ''' + Lines[y] + ''' + chr(13)';
        exit;}
      end;
      //Lines[y] :=  Lines[y] + ' + chr(13)';
    end;
  //end;
end;

function TextCheng2(i,x,y:integer;find,reprace,msg:string):integer;
var
  s,s1,s2,s3:string;
  i1,i2:integer;
begin
  with functionunit.editlist.Items[i].SynEdit1 do begin
      if Lines[y-1] <> '' then begin
          s := '';
          s2 := '';
          s1 := lines[y-1];
          i2 := ansipos(find,s1);
          for i1 := 1 to x -1 do begin
            s2 := s2 + s1[i1];
          end;
          for i1 := x to length(s1) do begin
            s := s + s1[i1];
          end;
          //showmessage(s2 + ' ' + s);
          if msg = '中間' then
            s :=  StringReplace(s,find,reprace,[{rfReplaceAll}]);
          if (msg = '指定行') or (msg = '全列全行') then
            s :=  StringReplace(s,find,reprace,[rfReplaceAll]);
          //s2 := s2 + s;
          lines[y-1] := s2 + s;
      end;
    end;
  TextCheng2 := i2;
end;

function Tfunctionunit.findtext(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
    end
    else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;
      for i3 := i5 to i1 -1 do begin
        {$IFDEF Windows}
        i4 := i4 + length(s[i3]) + 2;
        {$ENDIF}
        {$IFDEF Darwin}
        i4 := i4 + length(s[i3]) + 1;
        {$ENDIF}
        {$IFDEF Linux}
        i4 := i4 + length(s[i3]) + 1;
        {$ENDIF}
      end;
      i4 := i4 + i;
      getText.Add(inttostr(i4));
      findword := true;
    end;
    //getText.Add(s2);
  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := functionunit;
  //functionunit.Show;
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

function Tfunctionunit.findtext_test1(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1,s2:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
      s2 := '0';
    end else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;
      for i3 := i5 to i1 -1 do begin
        i4 := i4 + length(s[i3]) + 2;
      end;
      //i4 := i4 + i;
      //getText.Add(inttostr(i3));
      //s2 := inttostr(i5);
      findword := true;
    end;
    //getText.Add(s2);
  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  s2 := '0';
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := functionunit;
  //functionunit.Show;
  memo.Text := settext.Text;
  //getText := TStringList.Create;
  //getText.Clear;
  s.Text:=settext.Text;

  i := -1;
  i1 := 0;
  for i1 := 0 to s.Count -1 do begin;
    if findword then begin
      s1 := s[i1];
      i2 := ansipos(ftext,s1);
      s[i1] := s1;
      s2 := inttostr(i2);
      gettext.Add(s2);
    end;
  end;

  memo.Free;
  s.Free;
end;

function Tfunctionunit.findtext_test2(fText:string;setText,getText:TStringList;X:integer):boolean;
var
  s:Tstringlist;
  s1,s2:string;
  i,i1,i2,i4,i5:integer;
  memo:Tmemo;
  function findword:boolean;
  var
    i3:integer;
  begin
    i := ansipos(ftext,s[i1]);
    if i = 0 then begin
      findword := false;
      s2 := '0';
    end
    else begin
      i4 := 0;
      if (x <> 0) then begin
        i5 := x;
        if i5 > i3 then begin
          i5 := i3;
        end;
      end else begin
        i5 := 0;
      end;



      s2 := inttostr(i1);
      getText.Add(s2);
      findword := true;
    end;

  end;
begin
  //findtext.Free;
  //時間を見て、X（列）指定検索に対応させる
  s:=TStringlist.Create;
  s.Clear;
  memo:=Tmemo.Create(owner);
  memo.Visible := false;
  memo.Parent := functionunit;
  //functionunit.Show;
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


function Tfunctionunit.findsearch:string;
var
  i:integer;
begin
  i := mainform.PageControl1.ActivePageIndex;
  with functionunit.editlist.Items[i] do begin
    {if mainform.mnu_SelectORline.Checked then begin
      if PageControl1.ActivePage =  TabSheet1 then begin
        findsearch := SynEdit1.SelText;
      end else begin
        findsearch := Memo1.SelText;
      end;
    end else }begin
      if PageControl1.ActivePage =  TabSheet2 then begin
        findsearch := SynEdit1.Lines[SynEdit1.CaretY -1];
      end else begin
        with Memo1 do begin
          //SelStart := SendMessage(RichEdit1.Handle, EM_LINEINDEX, StrToInt(1) - 1, 0);
                  {$IFDEF Windows}
                     findsearch := Lines[SendMessage(Handle, EM_LINEINDEX, SelStart, 0)];
                  {$ENDIF}
                  {$IFDEF LINUX}
                      findsearch := Lines[memo1.CaretPos.Y];
                  {$ENDIF}
                  {$IFDEF Darwin}
                      findsearch := Lines[memo1.CaretPos.Y];
                  {$ENDIF}

        end;
      end;
    end;
  end;
end;

function Tfunctionunit.reprace_selselect(pos:integer;find:string): boolean;
var
  findpos:integer;
  i:integer;
begin
  i := mainform.PageControl1.ActivePageIndex;
  //mainform.findpage := StrToInt(color_form.Memo1.Lines[tabset1.TabIndex]);
  findpos := pos;

  if mainform.PageControl1.ActivePageIndex = 0 then begin
      functionunit.editlist.Items[i].SynEdit1.SelStart := findpos;
      functionunit.editlist.Items[i].SynEdit1.selend := findpos + length(find);
    end else if mainform.PageControl1.ActivePageIndex = 1 then begin
      functionunit.editlist.Items[i].memo1.SelStart := findpos -1;
      functionunit.editlist.Items[i].memo1.SelLength := length(find) +1;
    end;
end;


function Tfunctionunit.reprace_macro(s,find,reprace:string;count:integer):boolean;
var
  i,pos:integer;
  msg:string;
  i1,i2,i3:integer;
  st:TStringList;
begin
  i2 := 0;
  if s = '先頭' then begin
    while i2 < count do begin
      TextCheng(mainform.PageControl1.ActivePageIndex,0,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY + i2 ,find,'',reprace,'');
      inc(i2);
    end;
  end;

  if s = '中間' then begin
    while i2 < count do begin
      {i3 := TextCheng2(mainform.PageControl1.ActivePageIndex,
                 functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX,
                 functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                 find,reprace,
                 s);}
      while i2 < count do begin
        TextCheng(mainform.PageControl1.ActivePageIndex,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY + i2 ,find,'',reprace,'');
        inc(i2);
      end;
      inc(i2);
    end;
    //showmessage(inttostr(i3));
    //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX := i3 + 1;
   // functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].synEdit1.CaretX:= i3 + 1;
  end;

  if s = '行末' then begin
    while i2 < count do begin
      TextCheng(mainform.PageControl1.ActivePageIndex,0,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY + i2 ,'',find,'',reprace);
      inc(i2);
    end;
  end;

  if s = '指定行' then begin
      TextCheng2(mainform.PageControl1.ActivePageIndex,
                 functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX,
                 functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY ,
                 find,reprace,
                 s);
  end;

  if s = '全列全行' then begin
      while i2 < functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].synEdit1.Lines.Count -1 do begin
        TextCheng2(mainform.PageControl1.ActivePageIndex,
                   functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX,
                   functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                   find,reprace,
                   s);
        inc(i2);
      end;
    end;

  if s = '指定列' then begin
      while i2 < functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].synEdit1.Lines.Count -1 do begin
        i3 := TextCheng2(mainform.PageControl1.ActivePageIndex,
                   functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX,
                   functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretY+ i2 ,
                   find,reprace,
                   s);
        inc(i2);
      end;
      functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].editCaretX := i3 + 1;
      functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].synEdit1.CaretX:= i3 + 1;
    end;

  {if s = '' then begin
  i1 := mainform.TabControl1.TabIndex;
  msg  := '文字列を置き換えます' + chr($d) + chr($a) + 'よろしいですか？';
  st := TStringLIst.Create;
  st.Clear;
  pos := 0;
  while 0 <> count do begin
    //find_form.listbox1.ItemIndex := i;
    functionunit.reprace_selselect(pos,find);
    if messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = mrok then begin
      if not mainform.Menu_MemoMode.Checked then begin
          editfrm[i1].SynMemo1.SelText:= reprace;
        end else begin
          editfrm[i1].Memo.SelText:= reprace;
        end;
        findtext2(find,i1,st);
        if st.Text <> '' then
          pos := strtoint(st[0]);
      end else if  messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = 1 then begin

      end else if messagedlg(msg, mtinformation, [mbOk,mbNo,mbCancel], 0) = 2 then begin
        st.Free;
        break;
      end;
  end;
  st.Free;
  end;}
end;

function Tfunctionunit.findweb(word,helpword:string):boolean;
var
 url1,url2,url3,url4:string;
begin
  url2 := utf8toansi('');
  url4 := utf8toansi('');
  if helpword <> 'url' then begin
  if mainform.Menu_C.Checked then
    url3 := mainform.Menu_C.Caption
  else if mainform.Menu_Delphi.Checked then
    url3 := mainform.Menu_Delphi.Caption
  else if mainform.Menu_Pascal.Checked then
    url3 := mainform.Menu_Pascal.Caption
  else if mainform.Menu_Java.Checked then
    url3 := mainform.Menu_Java.Caption
  else if mainform.Menu_SQL.Checked then
    url3 := mainform.Menu_SQL.Caption
  else if mainform.Menu_XML.Checked then
    url3 := mainform.Menu_XML.Caption
  else if mainform.Menu_HTML.Checked then
    url3 := mainform.Menu_HTML.Caption
  else if mainform.Menu_Css.Checked then
    url3 := mainform.Menu_Css.Caption
  else if mainform.Menu_Perl.Checked then
    url3 := mainform.Menu_Perl.Caption
  else if mainform.Menu_PHP.Checked then
    url3 := mainform.Menu_PHP.Caption
  else if mainform.Menu_pyhton.Checked then
    url3 := mainform.Menu_pyhton.Caption
  else if mainform.MenuI_UnixShell.Checked then
    url3 := mainform.MenuI_UnixShell.Caption
  else if mainform.Menu_VBScript.Checked then
    url3 := mainform.Menu_VBScript.Caption
  else if mainform.Menu_BAT.Checked then
    url3 := mainform.Menu_BAT.Caption
  else if mainform.MenuItem38.Checked then
    url3 := mainform.MenuItem38.Caption
  else if mainform.MenuItem42.Checked then
    url3 := mainform.MenuItem42.Caption
  else if mainform.MenuItem20.Checked then
    url3 := mainform.MenuItem20.Caption
  else if mainform.MenuItem12.Checked then
    url3 := mainform.MenuItem12.Caption
  else if mainform.Menu_FreeHeightLight.Checked then
    url3 := ''
  else if mainform.Menu_lazarus.Checked then
    url3 := mainform.Menu_lazarus.Caption
  else
    url3 := '';
  url2 := utf8toansi(functionunit.findsearch);
  url4 := utf8toansi(' ' + helpword);
  end;
  url1 := utf8toansi(word);
  if functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].PageControl1.PageIndex = 1 then
    url3 := '';
  {$IFDEF Windows}
     ShellExecute(Handle, 'OPEN', pchar(url1 + url2 + ' ' + url3 + url4), '', '', SW_SHOW);
  {$ENDIF}
  {$IFDEF LINUX}
     functionunit.pross2(url1 + url2 + ' ' + url3 + url4);
  {$ENDIF}
  {$IFDEF Darwin}
     functionunit.pross3(url1 + url2 + ' ' + url3 + url4);
  {$ENDIF}
end;

function TFunctionunit.TempFIle_Clear1(dir,s:string):boolean;
var
  i:integer;
  filename:string;
begin
  i := 0;
  filename := extractfilepath(paramstr(0)) + dir + inttostr(i) + s;
  while FileExists(filename) do begin
      SysUtils.DeleteFile(filename);
      //showmessage(filename);
      inc(i);
      filename := extractfilepath(paramstr(0)) + dir + inttostr(i) + s;

  end;
end;

function TFunctionunit.TempFIle_Clear2(dir,s:string):boolean;
var
  i:integer;
  filename:string;
begin
  filename := extractfilepath(paramstr(0)) + dir +  s;
  if FileExists(filename) then begin
      SysUtils.DeleteFile(filename);
  end;
end;

function find_file(dir:string;st:TStringList):boolean;
var
  F: TSearchRec;
begin
  if FindFirst(extractfilepath(paramstr(0)) + dir + '*.*', faAnyFile, F) = 0 then begin
    repeat
      if (F.Attr and faAnyFile) = F.Attr then begin
        st.Add(F.Name);
      end
    until FindNext(F) <> 0;
    //FindClose( F );
  end;
end;

function TFunctionunit.TempFIle_Clear3(dir,s:string):boolean;
var
  i:integer;
  filename:string;
  WildCard:TMask;
  st:TStringList;
begin
  st :=TStringList.create;
  st.Clear;
  WildCard := TMask.Create(s);
  find_file(dir,st);
  for i := 0 to st.count -1 do begin
    FileName := ExtractFilepath(paramstr(0)) + dir + st[i];
    if WildCard.Matches(st[i]) then begin
      SysUtils.DeleteFile(filename);
    end;
  end;
end;

//フォルダ再帰検索ファイル一覧取得関数
function Tfunctionunit.FileFindDir(Dir: string;st:TstringList):boolean;
var
  Rec: TSearchRec;
  function add(d,f:string;st1:TStringList):boolean;
  begin
     if (f <> null) and (-1 = st1.IndexOf(d + f)) then  begin
       if  (f = '.') or (f = '..') then
         exit
       else begin
         st1.Add(d + f);
       end;
     end
  end;
begin
  if DirectoryExists(Dir) then begin
    Dir :=IncludeTrailingPathDelimiter(Dir);
    if FindFirst(Dir + '*.*', faAnyFile, Rec) = 0 then begin
    try
      repeat
       if (rec.Name <> '.') or (rec.Name <> '.') then begin
        add(dir,rec.Name,st);
       end;
       //showmessage(rec.Name);
         if Rec.Attr and faDirectory <> 0 then begin
           if (Rec.Name='.') or (Rec.Name='..') then
              Continue;
              Result :=FileFindDir(Dir + Rec.Name,st);
         end else begin
            add(dir,rec.Name,st);
         end;
          Application.ProcessMessages;
        until (FindNext(Rec) <> 0)
      finally
        //FindClose(Rec.FindHandle);
      end;

    end;
  end else begin
    st.Add(Dir);
  end
end;




//HTMLビルド関連ファンクション
function Tfunctionunit.EditHtml(EditType:string;sorce,sorce2:TStringList):string;
var
  i:integer;
begin
  for i := 0 to sorce.Count -1 do begin
    if sorce[i] = EditType then begin
      EditHtml := sorce2[i];
    end;
  end;
end;

function Tfunctionunit.BuildHTML(HTMLtext:TStringList):string;
begin
  HTMLtext.Insert(0, '<form>');
  HTMLtext.Add('</form>');
  BuildHTML := HTMLtext.Text;
end;

function Tfunctionunit.setHtmlForm(HTMLtext,Sorse:TStringList;LineNo:integer):boolean;
var
  i,j:integer;
begin
  setHtmlForm := false;
  try
    j:=0;
    for i := LineNo to HTMLtext.count + LineNo -1 do begin
      sorse.Insert(i,HTMLtext[j]);
      inc(j);
    end;
  finally
    setHtmlForm := true;
  end;
end;

function Tfunctionunit.SetHTMLPropathy(HTMLtext,GetProp,SetProp:string):string;
var
  s:string;
  GetPOS:integer;
begin
  s := HTMLtext;
  GetPOS := ansipos(GetProp,s);
  try
    if GetPOS > 0 then begin
      //置き換える
      s := StringReplace(s, GetProp, SetProp, [rfReplaceAll]);
      SetHTMLPropathy:= s;
      //showmessage(SetHTMLPropathy);
    end;
  except
    SetHTMLPropathy := 'false';
  end;
end;


function Tfunctionunit.GetReplaceKeyWord(HTMLtext:string):string;
var
  i,GetPOS1,GetPOS2:integer;
  s,s2:string;
begin
  GetPOS1 := ansipos('''+',HTMLtext);
  GetPOS2 := ansipos('+''',HTMLtext);
  s := '';
  s2 := '';
  if {length(html) > 0}(GetPOS1 <> 0) and (GetPOS2 <> 0) then begin
    for i := GetPOS1 to GetPOS2 + Length('+''')-1 do begin
      s := s + HTMLtext[i];
    end;
    for i := GetPOS1 to Length(HTMLtext)-1 do begin
      s2 := s2 + HTMLtext[i];
    end;
  end;
  GetReplaceKeyWord := s;
  HTMLtext := s2;
end;

function Tfunctionunit.GetHTMLPropathy(HTMLtext:string;GetKeyWord:TStringList):string;
  function SetHtmlItem(HTML:String):string;
  var
    s,SetProp,GetProp:string;
    st:TStringList;
    i:integer;
    function returnKeyWord(s:TStringList;X:string):string;
    var
      ans,set_s:string;
    begin
      ans := GetReplaceKeyWord(x);
      if ans <> '' then begin
        set_s := StringReplace(x, ans, '___', [rfReplaceAll]);
        s.Add(ans);
        Result := returnKeyWord(s,set_s);
      end else begin
        Result := '';
      end;
    end;
  begin
    try
           st := TStringList.Create;
           st.Clear;
           s := HTML;
           returnKeyWord(st,s);
           for i := 0 to st.Count -1 do begin
             GetProp := st[i];
             GetKeyWord.Add(GetProp);
           end;
           SetHtmlItem := s;
    except
      SetHtmlItem := 'false';
    end;
  end;
begin
  try
    GetHTMLPropathy := SetHtmlItem(HTMLtext);;
  except
    GetHTMLPropathy := 'false';
  end;
end;

function Tfunctionunit.RepraceHTMLPropathy(HTMLtext:string;SetKeyWord:array of TEdit):string;
  function SetHtmlItem(HTML:String):string;
  var
    s,SetProp,GetProp:string;
    st:TStringList;
    i:integer;
    function returnKeyWord(s:TStringList;X:string):string;
    var
      ans,set_s:string;
    begin
      ans := GetReplaceKeyWord(x);
      if ans <> '' then begin
        set_s := StringReplace(x, ans, '___', [rfReplaceAll]);
        s.Add(ans);
        Result := returnKeyWord(s,set_s);
      end else begin
        Result := '';
      end;
    end;
  begin
    try
           st := TStringList.Create;
           st.Clear;
           s := HTML;
           returnKeyWord(st,s);
           for i := 0 to st.Count -1 do begin
             GetProp := st[i];
             SetProp := SetKeyWord[i].Text;
             s := SetHTMLPropathy(s,GetProp,SetProp);
             if s = 'False' then begin
               showmessage('設定に失敗しました');
               close;
             end;
           end;
           SetHtmlItem := s;
    except
      SetHtmlItem := 'false';
    end;
  end;
begin
  try
     RepraceHTMLPropathy := SetHtmlItem(HTMLtext);
  except
    RepraceHTMLPropathy := 'false';
  end;
end;


function Tfunctionunit.Set_Label(No:integer;SetLabel:string;ParentComp:TWinControl):TLabel;
begin
  Set_Label := TLabel.Create(ParentComp);
  Set_Label.Parent :=ParentComp;
  Set_Label.Name:= 'L' + inttostr(No);
  Set_label.Caption:= SetLabel;
  Set_Label.Top:= 10 + (No * 45 );
  Set_Label.Left:=50;
end;


function Tfunctionunit.Set_Edit(No:integer;SetEdit:string;ParentComp:TWinControl):TEdit;
begin
  Set_Edit := TEdit.Create(ParentComp);
  Set_Edit.Parent :=ParentComp;
  Set_Edit.Name:= 'E' + inttostr(No);
  Set_Edit.Text:= SetEdit;
  Set_Edit.Top:= 25 + (No * 45 );
  Set_Edit.Left:=50;
end;

function Tfunctionunit.Set_Coomp(HtmlParts:string;EditParts:TStringList;comp:TWinControl):boolean;
var
  i:integer;
  function CutLeftAndRightStr(Str:String):string;
  var
    i:integer;
    s:string;
  begin
    for i := 3 to length(Str)-2 do begin
      s := s + Str[i];
    end;
    CutLeftAndRightStr := s;
  end;
begin
  Set_Label(0,HtmlParts,comp);
  for i := 0 to EditParts.Count -1 do begin
    Set_Label(i+1,CutLeftAndRightStr(EditParts[i]),comp);
    Edit_arry[i] := Set_Edit(i+1,CutLeftAndRightStr(EditParts[i]),comp);
  end;
end;

function Tfunctionunit.openSQLBuilder(i:integer):boolean;
var
  f : Tform2;
  i1:integer;
begin
  f := Tform2.Create(functionunit);
  f.Show;
  //function_unit.editlist.Items[i].SynEdit1.Lines.Text:=
  //function_unit.editlist.Items[i].SynEdit1.Lines.Text +
  //form2.Memo1.Lines.Text;
  if not f.cancel_sw then begin
    f.form3 := Tsqlprop.Create(owner);
    f.Set_Coomp(form2.sql_title,form2.sql_word[0],form2.sql_word[2],form2.form3.ScrollBox1);
    f.form3.ShowModal;
    f.form3.Free;
     for i1 := 0 to 3 do begin
       f.sql_word[i1].Clear;
     end;
   end;
end;


function Tfunctionunit.JsonParse(ST,st2:TStringlist;findword:string):boolean;
var
  J: TJSONData;
begin
  try
    // Parse JSON Data to TJSONData
    J:=GetJSON(st.Text);
    // Get the value for the path in edtPath
    st2.Text:=J.FindPath(findword).AsString;
  except
    on E: Exception do ShowMessage('Error finding path!');
  end;
end;

function Tfunctionunit.json_Keword_parse(st,st1:TStringList):boolean;
var
  st2,st3,st4,st5:Tstringlist;
  i,i1,i2:integer;
  sw:boolean;
  memo1:TMemo;
begin
  st2 := TStringlist.Create;
  st2.Clear;

  st3 := TStringlist.Create;
  st3.Clear;

  st4 := TStringlist.Create;
  st4.Clear;

  st5 := TStringlist.Create;
  st5.Clear;

  memo1 := TMemo.Create(functionunit);
  memo1.ScrollBars:= ssboth;
  memo1.Parent := functionunit;

  functionunit.findtext('"',st,st2,0);
  functionunit.findtext('":',st,st3,0);
  i1 := 0;
  sw := true;
  for i := 0 to st3.count -1 do begin
    sw := true;
    while sw do begin
      if (i1 < st2.Count -1) then begin
        if (strtoint(st2[i1]) > strtoint(st3[i])) then begin
          i2 := i1 -1;
          inc(i1);
          //showmessage(strtoint(st2[i2]);
          st4.Add(st2[i2]);
          sw := false;
        end else begin
          inc(i1);
        end;
      end else begin
        sw := false;
      end;
    end;
  end;
  memo1.Text:= st.Text;
  for i := 0 to st4.Count -1 do begin
    memo1.SelStart:= strtoint(st4[i]);
    memo1.SelLength:= strtoint(st3[i]) -strtoint(st4[i])-1;
    //showmessage(memo1.SelText);
    if -1 = st1.IndexOf(memo1.SelText) then
      st1.Add(memo1.SelText);
  end;
  memo1.Free;
  st2.Free;
  st3.Free;
  st4.Free;
  st5.Free;
end;



{
function Tfunctionunit.bunkatu(st,st2:TStringList):boolean;
var
  i:integer;
  st3:TStringList;
  s:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  s:= ';:=''"!$%&+-*`@~^\|/><?()[]{},  ';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  for i := 0 to length(s) -1 do begin
    st.Text := StringReplace(st.Text, s[i] , char(13), [rfReplaceAll]);
  end;
  for i := 0 to st.Count -1 do begin
    if 0 < ansipos('.',' ' + st[i]) then begin
      if -1 = st3.IndexOf(st[i]) then begin
        st3.Add(st[i]);
      end;
    end;
  end;
  st2.text := st3.Text;
  st3.Free;
end;

function Tfunctionunit.bunkatu2(st:string;st2:TStringList):boolean;
var
  i,i1:integer;
  st3:TStringList;
  s:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  s:= '.';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  //for i := 0 to length(s) -1 do begin
    st3.Text := StringReplace(st, s , char(13), [rfReplaceAll]);
  //end;
  i1 := 0;
  for i := 0 to st3.Count -1 do begin
    if st3[i] <> '' then begin
      if i1 = 0 then begin
        if st3.Count -1 > i then
        if st3[i+1] <> '' then begin
          st2.Add(st3[i]+',');
          inc(i1);
        end;
      end else begin
        st2[st2.Count -1] := st2[st2.Count -1] + st3[i];
        i1 := 0;
      end;
    end;
  end;
  st3.Free;
end;
}

function Tfunctionunit.bunkatu(st,st2:TStringList):boolean;
var
  i:integer;
  st3:TStringList;
  s:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  s:= ';:=''"!$%&+-*`@~^\|/><?()[]{},  ';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  for i := 0 to length(s) -1 do begin
    st.Text := StringReplace(st.Text, s[i] , char(13), [rfReplaceAll]);
  end;
  for i := 0 to st.Count -1 do begin
    if 0 < ansipos('.',' ' + st[i]) then begin
      if -1 = st3.IndexOf(st[i]) then begin
        st3.Add(st[i]);
      end;
    end;
  end;
  st2.text := st3.Text;
  st3.Free;
end;

function Tfunctionunit.bunkatu2(st:string;st2:TStringList):boolean;
var
  i,i1:integer;
  st3:TStringList;
  s:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  s:= '.';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  //for i := 0 to length(s) -1 do begin
    st3.Text := StringReplace(st, s , char(13), [rfReplaceAll]);
  //end;
  i1 := 0;
  for i := 0 to st3.Count -1 do begin
    if st3[i] <> '' then begin
      if i1 = 0 then begin
        if st3.Count -1 > i then
        if st3[i+1] <> '' then begin
          st2.Add(st3[i]+',');
          inc(i1);
        end;
      end else begin
        st2[st2.Count -1] := st2[st2.Count -1] + st3[i];
        i1 := 0;
      end;
    end;
  end;
  st3.Free;
end;

function Tfunctionunit.bunkatu3(st,st1,st2:TStringList):boolean;
var
  i,i1:integer;
  st3,st4:TStringList;
  s,s1:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  st4 := TStringList.Create;
  st4.Clear;
  s:= '''"!$%&+-*`@~^\|/><?{}';
  //s1:='  ';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  for i := 0 to length(s) -1 do begin
    st.Text := StringReplace(st.Text, s[i] , char(13), [rfReplaceAll]);
  end;
  for i := 0 to st.Count -1 do begin
    st[i] := Trim(st[i]); //:= StringReplace(st.Text, s1[i] , '', [rfReplaceAll]);
  end;
  for i := 0 to st.Count -1 do begin
    if ((0 < ansipos(':',' ' + st[i])) and (0 = ansipos('=',' ' + st[i]))) and
      ( (0 < ansipos('function',' ' + st[i])) or (0 < ansipos('procedure',' ' + st[i])) ) then begin
      if not (St[i][1] in ['0'..'9']) then begin
        if -1 = st3.IndexOf(st[i]) then begin
           st3.Add(st[i]);
        end;
      end;
    end else if ( (0 = ansipos('function',' ' + st[i])) or (0 = ansipos('procedure',' ' + st[i]))  or (0 = ansipos('property',' ' + st[i])) ) then begin
        if (0 < ansipos(':', ' ' +st[i])) then begin
          if (0 = ansipos('=', ' ' +st[i])) then begin
            if not (St[i][1] in [':']) then begin
              if not (St[i][1] in ['0'..'9']) then begin
                if -1 = st4.IndexOf(st[i]) then begin
                  st4.Add(st[i]);
                end;
              end;
            end;
          end;
        end;
    end;
  end;
  st1.text := st3.Text;
  st3.Free;
  st2.Text := st4.Text;
  st4.Free;
end;


function Tfunctionunit.bunkatu4(st:string;st2:TStringList):boolean;
var
  i,i1:integer;
  st3,st4:TStringList;
  s,s1:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  st3.Text := st;
  st4 := TStringList.Create;
  st4.Clear;
  s:= '  (';
  //st.Text := StringReplace(st.Text, ',', char(13), [rfReplaceAll]);
  for i := 0 to length(s) do begin
    st3.Text := ( StringReplace(st3.Text, s[i] , char(13), [rfReplaceAll]) );
  end;
  s:= ')[],.:;';
  for i := 0 to st3.Count -1 do begin
    for i1 := 0 to length(s) do begin
      st3[i] := StringReplace(st3[i], s[i1] , '\', [rfReplaceAll]);
    end;
    if 0 = ansipos('\',' '+st3[i]) then begin
      st4.Add(st3[i]);// StringReplace(st, s[i] , char(13), [rfReplaceAll]);
    end;
  end;

  st3.Clear;
  for i := 0 to st4.Count -1 do begin
    st4[i] := StringReplace(st4[i], 'function' , '\', [rfReplaceAll]);
    st4[i] := StringReplace(st4[i], 'procedure' , '\', [rfReplaceAll]);
    st4[i] := StringReplace(st4[i], 'var' , '\', [rfReplaceAll]);
    st4[i] := StringReplace(st4[i], 'const' , '\', [rfReplaceAll]);
    if ( (0 = ansipos('\',' ' + st4[i])) ) then begin
      st3.Add( st4[i] + ',' +'"'+ st+'"');
    end;
  end;

  st2.Text := st3.Text;
  st3.Free;
  st4.Free;
end;


function Tfunctionunit.bunkatu5(st,st2:TStringList):boolean;
var
  i,i1:integer;
  st3,st4:TStringList;
  s:string;
begin
  st3 := TStringList.Create;
  st3.Clear;
  st4 := TStringList.Create;
  st4.Clear;
  s:= ';';
  st.Text := StringReplace(st.Text, s , '', [rfReplaceAll]);
  s := ':';
  st.Text := StringReplace(st.Text, s , char(13) + ':' , [rfReplaceAll]);

  i := st.Count -1;
  while i > 0 do begin
    if 0 < ansipos(':',' ' + st[i]) then begin
       s := StringReplace(st[i], ':' , ',' , [rfReplaceAll]);
      if 0 = ansipos(',',st[i-1]) then begin
        st3.Add(st[i-1] + s );
      end else begin
        st4.Text := StringReplace(st[i-1], ',' , char(13) , [rfReplaceAll]);
        for i1 := 0 to st4.Count -1 do begin
          if s <> '' then begin
            if -1 = st3.IndexOf( st4[i1] + s ) then begin
              st3.Add( st4[i1] + s );
            end;
          end;
        end;
      end;
    end;
    dec(i)
  end;
  for i := 0 to st3.Count -1 do begin
    //showmessage(st3[i]);
    if -1 = st2.IndexOf(st3[i]) then
      st2.Add(st3[i]);
  end;
  st3.Free;
end;


function Tfunctionunit.get_code:boolean;
var
  i,i1,i2,pos1:integer;
  st,st1,st2:TStringList;
  s:string;
begin
  st := TStringList.Create;
  st.Clear;
  st1 := TStringList.Create;
  st1.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  //mainform.Caption := wordlist;
  if not code_supportList_sw then begin
    i1 := 0;
    i2 := 1;
  end else begin
    i1 := 1;
    i2 := 0;
  end;

  for i := 0 to st_ary3[i1].Count -1 do begin
    if  code_auto_support.code_type.Count  > 0 then begin
      if 0 < ansipos(wordlist, ' ' + st_ary3[i1][i]) then begin
        if code_auto_support.select_code_type = st_ary3[i2][i] then begin
          if -1 = st.IndexOf(st_ary3[i1][i]) then begin
            st.Add(st_ary3[i1][i]);
          end;
        end;
      end;
    end else begin
      if 0 < ansipos(wordlist, ' ' + st_ary3[i1][i]) then begin
        if -1 = st.IndexOf(st_ary3[i1][i]) then begin
          st.Add(st_ary3[i1][i]);
        end;
      end;
    end;
  end;
  code_auto_support.ListBox1.Items.Text := st.Text;
  st.Free;
end;

function Tfunctionunit.get_code2:boolean;
var
  i,i1,i2,pos1:integer;
  st,st1,st2:TStringList;
  s:string;
begin
  st := TStringList.Create;
  st.Clear;
  st1 := TStringList.Create;
  st1.Clear;
  st2 := TStringList.Create;
  st2.Clear;

  for i := 0 to st_ary2[0].Count -1 do begin
    if 0 < ansipos(wordlist, ' ' + st_ary2[0][i]) then
      if -1 = st1.IndexOf(st_ary2[1][i]) then begin
        st.Add(st_ary2[0][i]);
        st1.Add(st_ary2[1][i]);
      end;
  end;
  for i := 0 to st.Count -1 do begin
    for i1 := 0 to st_ary3[0].Count -1 do begin
      if st[i] = st_ary3[0][i1] then begin
        if -1 = st2.IndexOf(st_ary3[1][i1]) then begin
          st2.Add(st_ary3[1][i1]);
        end;
      end;
    end;
  end;
  code_auto_support.ListBox1.Items.Text := st2.Text;
  //code_auto_support.code_type.Text := st.Text;

  wordlist := '';

  st.Free;
  st1.Free;
  st2.Free;
end;

function Tfunctionunit.popupwin(c:char;edt:TsynEdit):boolean;
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

 { if functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count = 0 then begin
    //code_auto_support.ListBox1.Items.Text:=functionunit.editlist.Items[mainform.PageControl1.PageIndex].code_suport.Text;
  end else begin
    //code_auto_support.ListBox1.Items.Text:= functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text;
    functionunit.editlist.Items[mainform.PageControl1.PageIndex].code_suport.Text :=
     functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text;
    code_auto_support.ListBox1.Items.Text:= functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text;
  end;}
  if (not code_auto_support.Visible) and (code_auto_support.ListBox1.Items.Count > 1) then begin
      code_auto_support.Visible:= true;

  end else if (c <> ' ') or ((word(c) > 65) and (word(c) < 102)) then begin
     //functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.SetFocus;
     //functionunit.get_window(mainform.Handle);
     //wordlist := wordlist + LowerCase(c);
    //get_code(c);
    //if code_auto_support.ListBox1.Items.Count > 0 then begin
    //end;

    //code_auto_support.code_supoert_string:=code_auto_support.code_supoert_string + c;
    st:=TStringlist.Create;
    //if functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count = 0 then begin
      //functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text := code_auto_support.ListBox1.Items.Text;

   // end;
    //i2 := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count-1;
    //st.Text:=code_auto_support.ListBox1.Items.Text;

    //functionunit.findcodeset(code_auto_support.code_supoert_string);
    {for i := 0 to st.Count-1 do begin
      s := st[i];
      //showmessage(inttostr(length(s)));
      if length(s) > 0 then begin
        //showmessage((s[length(s)-1]));
      indexs := ansipos(code_auto_support.code_supoert_string,st[i]);
      if (indexs > 0 ) or (code_auto_support.code_supoert_string[indexs] = st[i]) or
        (0 < ansipos(code_auto_support.code_supoert_string,s[length(s)-1])) then begin
        try
          if functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.IndexOf(st[i]) = -1 then begin
            functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Add(st[i]);
          end;
        except

        end;
      end else begin
        {try
          for i3 := 0 to functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count-1 do begin;
            indexs2 := ansipos(functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset[i3],code_auto_support.code_supoert_string);
            if (indexs2 = 0) or
              (functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset[i3] <> code_auto_support.code_supoert_string) then begin
                //functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Delete(i3);
            end;
          end;
        except
          //showmessage(inttostr(functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count) );
          //showmessage(inttostr(i3) );
        end;}
      end;
      end;
      //dec(i2);
    end;}
    //showmessage(st.Text);
    {if functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count <= 0 then begin
       code_auto_support.Visible:= not true;
    end; }
    //code_auto_support.ListBox1.Items.Text := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text;
    st.Free;
  end else begin
    code_auto_support.Visible:= not true;
    code_auto_support.code_supoert_string := '';
    wordlist := '';
    functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text:= '';
  end;
end;

function TFunctionunit.findcodeset(key:string):boolean;
var
  i,i1,i2,i3,i4,i5,i6:integer;
  s,s1,s2,s3:string;
begin
   if length(key) > 0 then
     if key[length(key)] = char(40) then
       exit;
    //s := ExtractFilePath(Paramstr(0)) + 'codelist.txt';
    //functionunit.findcode.LoadFromFile((s));
    //補完リスト読み込み
    i := 0;
    i4 := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count -1;
    i5 := 0;
    for i2 := 0 to i4 -1 do begin
      s1 := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset[i2 + i5];
      if length(s1) < length(code_auto_support.code_supoert_string) then begin
        functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Delete(i2 + i5);
        i4 := i4 -1;
        dec(i5);
      end;
    end;
    functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text :=
    StringReplace(functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text,' ',chr(0),[rfReplaceAll]);
    i5 := 0;
    i4 := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Count;
    for i2 := 0 to i4 -1 do begin
      s1 := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset[i2 +i5];
      if s1 <> '' then begin
           if code_auto_support.code_supoert_string <> '' then begin
              s2 := ''; s3 := '';
                s2 := '';
                for i6 := 0 to length(key)  do begin
                  s2 := s2 + functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset[i2+i5][i6];
                end;
                if 0 = ansipos(upcase(key),upcase(s2)) then begin

                      if i2 + i5 >= 0 then begin
                      functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Delete(i2 + i5);
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
    functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text :=
      StringReplace(functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset.Text,' ',chr(0),[rfReplaceAll]);

    code_auto_support.ListBox1.Items := functionunit.editlist.Items[mainform.PageControl1.PageIndex].temp_codeset;



end;



//スレッド関連ファンクション
function Tfunctionunit.set_function(f:ThreadFunc):boolean;
var
  s:TMyFunctionArray;
begin
  s[0] := f;
end;

procedure TisThread.Execute;
  function run_method:boolean;
  begin
    run_method := true;
    try
      functionunit.set_function(functionunit.func_set);
    except
     run_method := false;
    end;
  end;

begin
  run_method;
  if Application.Terminated then begin

  end;
end;

function Tfunctionunit.Run(f:ThreadFunc):boolean;
begin
  try
    functionunit.func_set:= f;
    if functionunit.isThread=nil then begin
      functionunit.isThread:=TisThread.Create(true);
      functionunit.isThread.Start;
    end;
  finally

  end;
  exit;
end;

procedure Tfunctionunit.FormCreate(Sender: TObject);
begin
  editList := TeditList.Create;
  editList.Clear;
  edit_count := 0;
end;

end.

