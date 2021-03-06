unit comp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, memds, sqldb, FileUtil, SynExportHTML,
  SynPluginSyncroEdit, SynHighlighterPas, SynHighlighterCpp, SynHighlighterJava,
  SynHighlighterJScript, SynHighlighterPerl, SynHighlighterHTML,
  SynHighlighterXML, SynHighlighterLFM, SynHighlighterDiff,
  synhighlighterunixshellscript, SynHighlighterCss, SynHighlighterPHP,
  SynHighlighterTeX, SynHighlighterSQL, SynHighlighterPython, SynHighlighterVB,
  SynHighlighterAny, SynHighlighterMulti, SynHighlighterBat, SynHighlighterIni,
  SynHighlighterPo, PrintersDlgs, Forms, Controls, Graphics, Dialogs, ExtDlgs;

type

  { TDataModule1 }

  TDataModule1 = class(TForm)
    CalculatorDialog1: TCalculatorDialog;
    CalendarDialog1: TCalendarDialog;
    DataSource1: TDataSource;
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MemDataset1: TMemDataset;
    OpenDialog1: TOpenDialog;
    PageSetupDialog1: TPageSetupDialog;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SQLQuery1: TSQLQuery;
    SynAnySyn1: TSynAnySyn;
    SynBatSyn1: TSynBatSyn;
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
    SynMultiSyn1: TSynMultiSyn;
    SynPasSyn1: TSynPasSyn;
    SynPerlSyn1: TSynPerlSyn;
    SynPHPSyn1: TSynPHPSyn;
    SynPluginSyncroEdit1: TSynPluginSyncroEdit;
    SynPoSyn1: TSynPoSyn;
    SynPythonSyn1: TSynPythonSyn;
    SynSQLSyn1: TSynSQLSyn;
    SynTeXSyn1: TSynTeXSyn;
    SynUNIXShellScriptSyn1: TSynUNIXShellScriptSyn;
    SynVBSyn1: TSynVBSyn;
    SynXMLSyn1: TSynXMLSyn;
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

