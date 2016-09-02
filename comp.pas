unit comp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynCompletion, SynMacroRecorder, SynExportHTML,
  SynPluginSyncroEdit, SynHighlighterPas, SynHighlighterCpp, SynHighlighterJava,
  SynHighlighterJScript, SynHighlighterPerl, SynHighlighterHTML,
  SynHighlighterXML, SynHighlighterLFM, SynHighlighterDiff,
  synhighlighterunixshellscript, SynHighlighterCss, SynHighlighterPHP,
  SynHighlighterSQL, SynHighlighterPython, SynHighlighterVB, SynHighlighterAny,
  SynHighlighterMulti, SynHighlighterBat, SynHighlighterIni, SynHighlighterPo,
  SynHighlighterTeX, RTTICtrls, IDEWindowIntf, PrintersDlgs, XMLPropStorage,
  IniPropStorage, Dialogs, ExtDlgs, ExtCtrls, uPSComponent,
  uPSComponent_Default, uPSComponent_COM, uPSComponent_DB, uPSComponent_Forms,
  uPSComponent_Controls, uPSComponent_StdCtrls;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    CalculatorDialog1: TCalculatorDialog;
    CalendarDialog1: TCalendarDialog;
    ColorDialog1: TColorDialog;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    IDEDialogLayoutStorage1: TIDEDialogLayoutStorage;
    IniPropStorage1: TIniPropStorage;
    MultiPropertyLink1: TMultiPropertyLink;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PSCustomPlugin1: TPSCustomPlugin;
    PSDllPlugin1: TPSDllPlugin;
    PSImport_Classes1: TPSImport_Classes;
    PSImport_ComObj1: TPSImport_ComObj;
    PSImport_Controls1: TPSImport_Controls;
    PSImport_DateUtils1: TPSImport_DateUtils;
    PSImport_DB1: TPSImport_DB;
    PSImport_Forms1: TPSImport_Forms;
    PSImport_StdCtrls1: TPSImport_StdCtrls;
    PSScript1: TPSScript;
    PSScriptDebugger1: TPSScriptDebugger;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SynAnySyn1: TSynAnySyn;
    SynAutoComplete1: TSynAutoComplete;
    SynBatSyn1: TSynBatSyn;
    SynCompletion1: TSynCompletion;
    SynCppSyn1: TSynCppSyn;
    SynCssSyn1: TSynCssSyn;
    SynDiffSyn1: TSynDiffSyn;
    SynExporterHTML1: TSynExporterHTML;
    SynFreePascalSyn1: TSynFreePascalSyn;
    SynHTMLSyn1: TSynHTMLSyn;
    SynIniSyn1: TSynIniSyn;
    SynJavaSyn1: TSynJavaSyn;
    SynJScriptSyn1: TSynJScriptSyn;
    SynLFMSyn1: TSynLFMSyn;
    SynMacroRecorder1: TSynMacroRecorder;
    SynMultiSyn1: TSynMultiSyn;
    SynPasSyn1: TSynPasSyn;
    SynPerlSyn1: TSynPerlSyn;
    SynPHPSyn1: TSynPHPSyn;
    SynPHPSyn2: TSynPHPSyn;
    SynPluginSyncroEdit1: TSynPluginSyncroEdit;
    SynPoSyn1: TSynPoSyn;
    SynPythonSyn1: TSynPythonSyn;
    SynSQLSyn1: TSynSQLSyn;
    SynTeXSyn1: TSynTeXSyn;
    SynUNIXShellScriptSyn1: TSynUNIXShellScriptSyn;
    SynVBSyn1: TSynVBSyn;
    SynXMLSyn1: TSynXMLSyn;
    TrayIcon1: TTrayIcon;
    XMLPropStorage1: TXMLPropStorage;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

