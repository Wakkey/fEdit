unit Jsonparse;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, fpjson, jsonparser;

type

  { TJson_pars }

  TJson_pars = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
    J: TJSONData;
    JJ:TJsonstring;
  public
    { public declarations }
    FRoot : TJSONData;
    FSortObjectMembers,
    FStrict,
    FNewObject,
    FModified,
    obj_sw2,
    ary_sw: Boolean;
    FFileName:string;
    set_parnt:string;
    JSONfile:string;
    alpaca_json:string;
    S_title,S_description:string;
    i_short,i_long:string;
    json_s_count,obj_sw_count:integer;
    enum,example,set_obj_type:string;
    save_filePHPname:string;
    enum_st,example_st,st_i_short,st_i_long,S_PD,P_Name,set_comp,set_obj:TStringList;
    get_sw:boolean;
    set_caption,set_comp_name,st_temp:TStringlist;
    htmobj_count:integer;
    set_JsonTitle,set_JsonData,JSON_output,JSON_start:TStringlist;
    obj_sw:array[0..255] of boolean;
    json_s:array[0..255] of string;
    procedure ShowJSONData(AParent : TTreeNode; Data : TJSONData);
    procedure ShowJSONDocument0;
    procedure ShowJSONDocument;
    procedure ShowJSONDocument2;
    procedure OpenFile(Const AFileName : String);
    procedure OpenReader(Const AFileName : String);
    procedure Openalpaca(Const AFileName : String);
    function Jsondate_to_htmlobj(no:integer;value,types,path:string):string;
  end;

var
  Json_pars: TJson_pars;

implementation

uses function_unit, main;

Const
  ImageTypeMap : Array[TJSONtype] of Integer =
//      jtUnknown, jtNumber, jtString, jtBoolean, jtNull, jtArray, jtObject
     (-1,8,9,7,6,5,4);
  JSONTypeNames : Array[TJSONtype] of string =
     ('Unknown','Number','String','Boolean','Null','Array','Object');

{$R *.lfm}

{ TJson_pars }


procedure TJson_pars.OpenFile(Const AFileName : String);

Var
  S : TFileStream;
  P : TJSONParser;
  D : TJSONData;
begin


     S:=TFileStream.Create(AFileName,fmOpenRead);
  //functionunit..new();
  try
    P:=TJSONParser.Create(S);
    try
      P.Strict:=FStrict;
      D:=P.Parse;
    finally
      P.Free;
    end;
  finally
    S.Free;
  end;
  FFileName:=AFileName;
  //SetCaption;
  FreeAndNil(FRoot);
  FRoot:=D;
  ShowJSONDocument;
  ShowJSONDocument0;
  functionunit.newwindow();
  functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.Lines.Text :=
        functionunit.editlist.Items[mainform.PageControl1.PageIndex].SynEdit1.Lines.Text + (

        '<?php                                                             ' + chr(13)
        + 'writeData();                                                      ' + chr(13)
        + 'readData();                                                       ' + chr(13)
        + 'function readData(){                                              ' + chr(13)
        + '    $JSON_file = ''ankert.json'';                                   ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    $fp = fopen($JSON_file, ''rb'');                                ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    if ($fp){                                                     ' + chr(13)
        + '        if (flock($fp, LOCK_SH)){                                 ' + chr(13)
        + '            while (!feof($fp)) {                                  ' + chr(13)
        + '                $buffer = fgets($fp);                             ' + chr(13)
        + '                print($buffer);                                   ' + chr(13)
        + '            }                                                     ' + chr(13)
        + '                                                                  ' + chr(13)
        + '            flock($fp, LOCK_UN);                                  ' + chr(13)
        + '        }else{                                                    ' + chr(13)
        + '            print(''ファイルロックに失敗しました'');                ' + chr(13)
        + '        }                                                         ' + chr(13)
        + '    }                                                             ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    fclose($fp);                                                  ' + chr(13)
        + '}                                                                 ' + chr(13)
        + '                                                                  ' + chr(13)
        + 'function writeData(){                                             ' + chr(13)
        + '    $contents = $_POST[''contents''];                               ' + chr(13)
        + '    $data = $data.$contents;                                      ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    $JSON_file = ''ankert.json'';                                   ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    $fp = fopen($JSON_file, ''ab'');                                ' + chr(13)
        + '   if (filesize($JSON_file) != 0 ){                     ' + chr(13)
        + '     $set_data = substr_replace($data, '','', 0, 0);      ' + chr(13)
        + '   } else {                                             ' + chr(13)
        + '     $set_data = $data;                                 ' + chr(13)
        + '   }                                                           ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    if ($fp){                                                     ' + chr(13)
        + '        if (flock($fp, LOCK_EX)){                                 ' + chr(13)
        + '            if (fwrite($fp,  $set_data) === FALSE){                   ' + chr(13)
        + '                print(''ファイル書き込みに失敗しました'');          ' + chr(13)
        + '            }                                                     ' + chr(13)
        + '                                                                  ' + chr(13)
        + '            flock($fp, LOCK_UN);                                  ' + chr(13)
        + '        }else{                                                    ' + chr(13)
        + '            print(''ファイルロックに失敗しました'');                ' + chr(13)
        + '        }                                                         ' + chr(13)
        + '    }                                                             ' + chr(13)
        + '                                                                  ' + chr(13)
        + '    fclose($fp);                                                  ' + chr(13)
        + '}                                                                 ' + chr(13)
        + '                                                                  ' + chr(13)
        + '?>                                                                ' + chr(13)
   );
  functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].save_complate := false;
  functionunit.editlist.Items[mainform.PageControl1.PageIndex].SaveDialog1.FileName:= 'sanksform.php';
  functionunit.editlist.Items[mainform.PageControl1.PageIndex].SaveDialog1.DefaultExt:= '.php';
    try
      functionunit.saveas(mainform.PageControl1.ActivePageIndex);
      save_filePHPname := extractfilename(functionunit.editlist.Items[mainform.PageControl1.PageIndex].filename_path);
    except

    end;
end;

procedure TJson_pars.OpenReader(Const AFileName : String);

Var
  S : TFileStream;
  P : TJSONParser;
  D : TJSONData;
begin
     S:=TFileStream.Create(AFileName,fmOpenRead);
  //functionunit..new();
  try
    P:=TJSONParser.Create(S);
    try
      P.Strict:=FStrict;
      D:=P.Parse;
    finally
      P.Free;
    end;
  finally
    S.Free;
  end;
  FFileName:=AFileName;
  //SetCaption;
  FreeAndNil(FRoot);
  FRoot:=D;
  ShowJSONDocument0;

end;


procedure TJson_pars.Openalpaca(Const AFileName : String);

Var
  S : TFileStream;
  P : TJSONParser;
  D : TJSONData;
begin
  S:=TFileStream.Create(AFileName,fmOpenRead);
  //functionunit..new();
  try
    P:=TJSONParser.Create(S);
    try
      P.Strict:=FStrict;
      D:=P.Parse;
    finally
      P.Free;
    end;
  finally
    S.Free;
  end;
  FFileName:=AFileName;
  //SetCaption;
  FreeAndNil(FRoot);
  FRoot:=D;
  ShowJSONDocument2;

end;

procedure TJson_pars.ShowJSONDocument0;
var
  val,s,s1,s2:string;
  i,i1:integer;
  st:Tstringlist;
begin
  st:= TStringlist.Create;
  st.Clear;
  With functionunit.editlist.Items[mainform.PageControl1.PageIndex] do //.Items do
    begin
    TreeView1.BeginUpdate;
    with Json_write do begin
      try
        TreeView1.Items.Clear;
        Clear;
        add(
        '<?php                                                                                                ' + chr(13)
        + 'function readData(){                                                                                 ' + chr(13)
        + '    $JSON_file = ''ankert.json'';                                                                      ' + chr(13)
        + '                                                                                                     ' + chr(13)
        + '    $fp = fopen($JSON_file, ''rb'');                                                                   ' + chr(13)
        + '                                                                                                     ' + chr(13)
        + '    if ($fp){                                                                                        ' + chr(13)
        + '        if (flock($fp, LOCK_SH)){                                                                    ' + chr(13)
        + '            while (!feof($fp)) {                                                                     ' + chr(13)
        + '                $buffer = fgets($fp);                                                                ' + chr(13)
        + '                print($buffer);                                                                      ' + chr(13)
        + '            }                                                                                        ' + chr(13)
        + '                                                                                                     ' + chr(13)
        + '            flock($fp, LOCK_UN);                                                                     ' + chr(13)
        + '        }else{                                                                                       ' + chr(13)
        + '            print(''ファイルロックに失敗しました'');                                                   ' + chr(13)
        + '        }                                                                                            ' + chr(13)
        + '    }                                                                                                ' + chr(13)
        + '                                                                                                     ' + chr(13)
        + '    fclose($fp);                                                                                     ' + chr(13)
        + '}                                                                                                    ' + chr(13)
        + '?>                                                                                                   ' + chr(13)
        + '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"                                       ' + chr(13)
        + '"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">                                           ' + chr(13)
        + '<html ng-app="myApp" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">                   ' + chr(13)
        + '<head>                                                                                               ' + chr(13)
        + '<meta charset="utf-8">                                                                               ' + chr(13)
        + '<title>Jsonリーダ</title>                                                                            ' + chr(13)
        + '<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>         ' + chr(13)
        + '<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.8/angular-resource.min.js"></script>' + chr(13)
        + '</head>                                                                                              ' + chr(13)
        + '<body  ng-controller="MyController">                                                                 ' + chr(13)
        + '<form id="JF" name="JSONForm">                                                                       ' + chr(13)
        + '        <label></label>                                                                              ' + chr(13)
        + '        <input type="text" name="find" ng-model="find">                                              ' + chr(13)
        + '     <p>{{data.length}}件のデータ</p>                                                               ' + chr(13)
        + '    <ul>                                                                                             ' + chr(13)
        + '    <li ng-repeat="data in data | filter:find">                                                     ' + chr(13)
        );
        //showmessage(set_caption.Text);
        //showmessage(set_comp_name.Text);

        for i := 0 to set_comp_name.Count -1 do begin
          if -1 = st.IndexOf(set_caption[i] + '：{{data.' + set_comp_name[i] + '}}<br>') then begin
            st.Add(set_caption[i] + '：{{data.' + set_comp_name[i] + '}}<br>');
          end;
        end;
        //showmessage(st.Text);
        add(st.Text);
        add(
         '    <br>                                                                                             ' + chr(13)
        + '    </li>                                                                                            ' + chr(13)
        + '    </ul>                                                                                            ' + chr(13)
        + '</form>                                                                                              ' + chr(13)
        + '</body>                                                                                              ' + chr(13)
        + '                                                                                                     ' + chr(13)
        + '<script type="text/javascript">                                                                      ' + chr(13)
        + '        angular.module("myApp", [])                                                                  ' + chr(13)
        + '          .controller("MyController", ["$scope", function($scope) {                                  ' + chr(13)
        + '             	$scope.data = [                                                                     ' + chr(13)
        + '                       <?php readData(); ?>                                                          ' + chr(13)
        + '             	];                                                                                   ' + chr(13)
        + '          }]);                                                                                       ' + chr(13)
        + '</script>                                                                                            ' + chr(13)
        );

        s1 := extractfilepath( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );
        s2 := ( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );

        i1 := ansipos( '.' , s2);
        for i := 0 to i1 -1 do begin
          s := s + s2[i];
        end;
        s2 := s2 + 'form.php';
        SaveToFile(s2);
        functionunit.macro_run(s2);

        With functionunit.editlist.Items[mainform.PageControl1.PageIndex].TreeView1 do begin
          If (Items.Count>0) and Assigned(Items[0]) then
          begin
            Items[0].Expand(False);
            Selected:=Items[0];
          end;
        end;
      finally
        TreeView1.EndUpdate;
      end;
    end;
  end;
  st.Free;
end;

procedure TJson_pars.ShowJSONDocument;
var
  val,s,s1,s2:string;
  i,i1:integer;
begin
  With functionunit.editlist.Items[mainform.PageControl1.PageIndex] do //.Items do
    begin
    TreeView1.BeginUpdate;
    with Json_write do begin
      try
        TreeView1.Items.Clear;
        Clear;
        Add('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" ');
        Add('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">');
        Add('<html ng-app="myApp" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">');
        Add('<head>');
        Add('<meta charset="utf-8">');
        Add('<title>JsonForm</title>');
        add('<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>');
        add('<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>');
        add('<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.7/angular.min.js"></script>');
        add('<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.8/angular-resource.min.js"></script>');
        Add('</head>');

        Add('<body  ng-controller="MyController">');
        add('<script type="text/javascript">');
        Add('$(function(){                                                           ');
        Add('	$("#tgl_menu dt").on("click", function() {                 ');
        Add('	        $(this).next().toggle();           ');
        Add('		$(this).toggleClass("active"); //ddの表示を切り替える ');
        Add('	});                                                                  ');

        val := inttostr(functionunit.editlist.Items[mainform.PageControl1.PageIndex].Json_write.Count);
      //  Add('   	$("#btn2").live("click", function() {                 ');
      //  add('                var selectNo0 =   $(this).val(); //alert(selectNo);                   ');
      //  add('                var selectNo1 = ''c'' + $(this).val() ; //alert(selectNo1);                   ');
      //  add('                var selectNo = ''#s'' + $(this).val() ; //alert(selectNo);                   ');
      //  add('                var selectNo2 = $(''#''+selectNo1).val(); //alert(selectNo2);                   ');
      //  add('                var selectNo3 = ''id'' + $(this).val() ; //alert(selectNo1);                   ');
      //  add('                var ans = Math.floor(Math.random()*100+1); //alert(ans);                   ');
      //  add('                                   ');


      //  Add('                if (selectNo2 == "string"){                    ');
      //  Add('                        var $input = $(''<div/>'').html(selectNo0).val(selectNo0);');
      //  Add('                   $(selectNo).append("<input type=''text'' value='+'><br>");');
      //  Add('                }                                                  ');
      //  Add('                if (selectNo2 == "integer"){                        ');
      //  Add('                        var $input = $(''<div/>'').html(selectNo).val(selectNo);');
      //  Add('                   $(selectNo).append("<input type=''number'' value='+'><br>");');
      //  Add('                }                                                    ');
      //  Add('                if (selectNo2 == "boolean"){                          ');
      //  Add('                        var $input = $(''<div/>'').html(selectNo0).val(selectNo0);');
      //  Add('                   $(selectNo).append("<select><option value=''true'' selcted >true</option><option value=''false''>false</option></select><br>");');
      //  Add('                }                                                                                                                     ');
      //  Add('                if (selectNo2 == "array"){                                                                                              ');
       // Add('                   $(selectNo).append("<div id=btn5><fieldset><dl id=''tgl_menu''><div id=''btn''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select></div><button value='+val+' id=''btn2''>add arry</button><br></dl></fieldset></div>");');

        { Add('                        var $input = $(''<select/>'').attr(selectNo3,selectNo1);     ');
        Add('                        $input.append($(''<option>'').html(''string'').val(''string''));    ');
        Add('                        $input.append($(''<option>'').html(''integer'').val(''integer''));   ');
        Add('                        $input.append($(''<option>'').html(''boolean'').val(''boolean''));   ');
        //Add('                        $input.append($(''<option>'').html(''array'').val(''array'');     ');
        Add('                        $input.append($(''<button>'').html(''add array'').val(''selectNo''));   ');

        Add('                        $input.append($(''<option>'').html(''object'').val(''object''));    ');
        add('                        $(''selectNo'').html($input);');
           }
     //   Add('                }                                                                                                                                                                                                                                                                   ');

     //   Add('                if (selectNo2 == "object"){                                                                                                                                                                                                                                          ');
        //Add('                   $(selectNo).append("<div id=btn5><fieldset><dl id=''tgl_menu''><select id=''ddm2''></select></div><button value='+val+' id=''btn2''>add objct</button><br></dl></fieldset></div>");');
    //    Add('                   $(selectNo).append("<div id=btn5><fieldset><dl id=''tgl_menu''><div id=''btn''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select></div><button value='+val+' id=''btn2''>add object</button><br></dl></fieldset></div>");');

        {  Add('                        var $input = $(''<select/>'').attr(selectNo3,selectNo1);     ');
        Add('                        $input.append($(''<div/>'').html(''c''+ans).val(selectNo));');
        Add('                        $input.append($(''<option>'').html(''string'').val(''string''));    ');
        Add('                        $input.append($(''<option>'').html(''integer'').val(''integer''));   ');
        Add('                        $input.append($(''<option>'').html(''boolean'').val(''boolean''));   ');
        //Add('                        $input.append($(''<option>'').html(''array'').val(''array'');     ');
        Add('                        $input.append($(''<option>'').html(''object'').val(''object''));    ');
        //Add('                        var $input2 = $(''<button/>'').html(''add object'').val(''btn4'').attr(''selectNo'',''selectNo'');    ');
        add('                        $(selectNo).append($input);');
        //add('                        $(selectNo).append($input2);');
        Add('                   $(selectNo).append("<button value="+selectNo0+" id=''btn4''>add objct</button><br>");');
        }
   //     Add('                }                                     ');
     //   Add('        });');



       // Add('                if ($(selectNo2 + " option:selected").val() == "string"){                    ');
       // Add('                   $(selectNo).append("<input type=''text'' value='+'><br>");');
       // Add('                }                                                  ');
       // Add('                if ($(selectNo2 + "  option:selected").val() == "integer"){                        ');
       // Add('                   $(selectNo).append("<input type=''number'' value='+'><br>");');
       // Add('                }                                                    ');
       // Add('                if ($(selectNo2 + " option:selected").val() == "boolean"){                          ');
       // Add('                   $(selectNo).append("<select><option value=''true'' selcted >true</option><option value=''false''>false</option></select><br>");');
       // Add('                }                                                                                                                     ');
       // Add('                if ($(selectNo2 + "  option:selected").val() == "array"){                                                                                              ');
       // Add('                   $(selectNo).append("<fieldset><div id=''s'+val+''' >'''+val+'''<dl id=''tgl_menu''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select><button value='''+val+''' id=''btn4''>add arry</button><br></dl></div></fieldset>");');
       // Add('                }                                                                                                                                                                                                                                                                   ');
       // Add('                if ($(selectNo2 + "  option:selected").val() == "object"){                                                                                                                                                                                                                                          ');
       // Add('                   $(selectNo).append("<fieldset><div id=''s'+val+''' >'''+val+'''<dl id=''tgl_menu''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select><button value='''+val+''' id=''btn4''>add objct</button><br></dl></div></fieldset>");');
       // Add('                }                                     ');
       // Add('        });');

       {
        Add('   	$("#btn2").on("click", function() {                 ');
        Add('                if ($("#ddm option:selected").val() == "string"){                    ');
        Add('                   $("#mnu2").append("<input type=''text'' value='+'><br>");');
        Add('                }                                                  ');
        Add('                if ($("#ddm option:selected").val() == "integer"){                        ');
        Add('                   $("#mnu2").append("<input type=''number'' value='+'><br>");');
        Add('                }                                                    ');
        Add('                if ($("#ddm option:selected").val() == "boolean"){                          ');
        Add('                   $("#mnu2").append("<select><option value=''true'' selcted >true</option><option value=''false''>false</option></select><br>");');
        Add('                }                                                                                                                     ');
        Add('                if ($("#ddm option:selected").val() == "array"){                                                                                              ');
        Add('                   $("#mnu2").append("<div id=mnu2><fieldset><dl id=''tgl_menu''><div id=''btn3''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select></div><button id=''btn4''>add arry</button><br></dl></fieldset></div>");');
        Add('                }                                                                                                                                                                                                                                                                   ');
        Add('                if ($("#ddm option:selected").val() == "object"){                                                                                                                                                                                                                                          ');
        Add('                   $("#mnu2").append("<div id=mnu2><fieldset><dl id=''tgl_menu''><div id=''btn3''><select id=''ddm2''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select></div><button id=''btn4''>add objct</button><br></dl></fieldset></div>");');
        Add('                }                                     ');
        Add('            });');
        }
        //val := inttostr(functionunit.editlist.Items[mainform.PageControl1.PageIndex].Json_write.Count);

        add('        var sel_idx;                               ');
        add('        var select_bt = "string";                             ');
        add('        var cur_idx;                               ');


        add('      	  	$(''.aaa'').live("click",  function(){   ');
        add('           sel_idx = $(this).attr(''id'') ;               ');
        add('            //alert(sel_idx);                           ');
        add('         //alert($(''#''+sel_idx).attr(''value''));         ');
        add('          select_bt = $(''#''+sel_idx).attr(''value'');     ');
        add('          });                                           ');


        add('      	$(''.btnInfo'').live(''click''  ,function(){       ');
        add('          cur_idx = $(this).attr(''id'') ;                ');
        add('      	});                                          ');



        add('  $(document).on("click", ".btnInfo", (function(){    ');
        add('                var selectNo = ''#s'' + cur_idx;//$(''this'').val(); //alert(selectNo);                   ');
        add('                var selectNo1 = ''c'' + $(this).val(); //alert(selectNo1);                   ');
        //add('                var selectNo = ''#s'' + $(this).val(); //alert(selectNo);                   ');
        add('                var selectNo2 = $(''#''+selectNo1).val(); //alert(selectNo2);                   ');
        add('                var selectNo3 = ''id'' + $(this).val(); //alert(selectNo1);                   ');
        add('                var ans = Math.floor(Math.random()*100+1); //alert(ans);                   ');
        add('                var selectNo4 = ''c'' + $(this).val(); //alert(selectNo1);                   ');
        add('                var selectNo5 =  $(this).val(); //alert(selectNo1);                   ');

        Add('                if (select_bt == "string") {                    ');
        Add('                   $(selectNo).append("<input type=''text'' value='+'><br>");');
        Add('                }                                                  ');
        Add('                if (select_bt == "integer"){                        ');
        Add('                   $(selectNo).append("<input type=''number'' value='+'><br>");');
        Add('                }                                                    ');
        Add('                if (select_bt == "boolean"){                          ');
        Add('                   $(selectNo).append("<select><option value=''true'' selcted >true</option><option value=''false''>false</option></select><br>");');
        Add('                }                                                                                                                     ');
        Add('                if (select_bt == "array"){                                                                                              ');
        Add('                    $(selectNo).append("<fieldset id=''btn''><dl id=''tgl_menu''><div id=''s"+ans+"''><select class=''aaa'' id=''sel"+ans+"''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select><button  class=''btnInfo'' id="+ans+">add arry</button><br></div></dl></fieldset>");');
       { Add('                        var $input = $(''<select/>'').attr(selectNo3,selectNo4);     ');
        Add('                        $input.append($(''<option>'').html(''string'').val(''string''));    ');
        Add('                        $input.append($(''<option>'').html(''integer'').val(''integer''));   ');
        Add('                        $input.append($(''<option>'').html(''boolean'').val(''boolean''));   ');
        //Add('                        $input.append($(''<option>'').html(''array'').val(''array'');     ');
        Add('                        $input.append($(''<button>'').html(''add array'').val(selectNo3));   ');

        Add('                        $input.append($(''<option>'').html(''object'').val(''object''));    ');
        add('                        $(''selectNo'').append($input);');
           }
        Add('                }                                                                                                                                                                                                                                                                   ');
        Add('                if (select_bt == "object"){                                                                                                                                                                                                                                          ');
        Add('                    $(selectNo).append("<fieldset id=''btn''><dl id=''tgl_menu''><div id=''s"+ans+"''><select  class=''aaa'' id=''sel"+ans+"''><option value =''string''>string</option><option value =''integer''>integer</option><option value =''boolean''>boolean</option><option value =''array''>array</option><option value =''object''>object</option></select><button class=''btnInfo'' id="+ans+">add objct</button><br></div></dl></fieldset>");');
       { Add('                        var $input = $(''<select/>'').attr(selectNo3,selectNo4);     ');
        add('                          $input.append($(''<fieldset/>'').id(''btn'');');
        add('                          $input.append($(''<dl/>'').id(''tgl_menu'');'  );
        Add('                        $input.append($(''<option>'').html(''string'').val(''string''));    ');
        Add('                        $input.append($(''<option>'').html(''integer'').val(''integer''));   ');
        Add('                        $input.append($(''<option>'').html(''boolean'').val(''boolean''));   ');
        //Add('                        $input.append($(''<option>'').html(''array'').val(''array'');     ');
        Add('                        $input.append($(''<option>'').html(''object'').val(''object''));    ');
        add('                        $(selectNo).append($input);');
        Add('                   $(selectNo).append("<button value="+selectNo5+" id=''btn4''>add objct</button><br>");');
          }
        Add('                }                                     ');
        Add('        select_bt = "string";                                        ');
        Add('        }));');

        //Json_write.Add('var Schema = ');
        //Json_write.Text := Json_write.Text + st_temp.Text;


        Add('});');








        add('</script>');

        add('<form id="JF" name="JSONForm" action="newfile2.php" method="post">');

        SHowJSONData(Nil,FRoot);

        Add('</p>');
        //Add('<input type="button" value="reset" ng-click="onclick()"  />');
        Add('</p> ');

        add('        <textarea name="contents" rows="8" cols="40">{{ '+JSON_output[0]+' | json : 8 }}</textarea>  ');
        add('        <input type="submit" ng-disabled="JSONForm.$invalid">                                                                  ');

        add('</form>');

        add('<script type="text/javascript">');
       // json_pars.JSON_output.Add( '$scope.' + S_Title.Text + '.'+ JSON_pars.P_Name[JSON_pars.P_Name.Count-1] + ' = ""'{' = $scope.' + S_Title.Text + '.' + JSON_pars.P_Name});

        Add('        angular.module("myApp", [])                                 ');
        Add('          .controller("MyController", ["$scope", function($scope) { ');
//        Add('        $scope.onclick = function() {	');
       // Add('            $scope.obj = {                                          ');
//        json_pars.JSON_start.Add( '$scope.'+JSON_output[0]+' = {};');
//        Json_write.Text := Json_write.Text + JSON_start.Text;

//        for i := 1 to JSON_output.Count -1 do begin
//          try
//            Json_write.add( '$scope.' + JSON_output[0] + '.'+ JSON_output[i-1] + ' = "' + example[i-1] + '"');
//          except

//          end;
//        end;


        //Add('            };                                                      ');
       // Add('            }                                                      ');
        Add('          }]);                                                      ');
        add('</script>');


        Add('</body>');
        Add('</html>');

        s1 := extractfilepath( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );
        s2 := ( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );

        i1 := ansipos( '.' , s2 );
        for i := 0 to i1 -1 do begin
          s := s + s2[i];
        end;
        s2 := s2 + 'form.html';
        SaveToFile(s2);
        functionunit.macro_run(s2);

        With functionunit.editlist.Items[mainform.PageControl1.PageIndex].TreeView1 do begin
          If (Items.Count>0) and Assigned(Items[0]) then
          begin
            Items[0].Expand(False);
            Selected:=Items[0];
          end;
        end;
      finally
        TreeView1.EndUpdate;
      end;
    end;
  end;
end;


procedure TJson_pars.ShowJSONDocument2;
var
  val,s,s1,s2:string;
  i,i1:integer;
begin
  With functionunit.editlist.Items[mainform.PageControl1.PageIndex] do //.Items do
    begin
    TreeView1.BeginUpdate;
    with Json_write do begin
      try
        TreeView1.Items.Clear;
        Clear;
        Add('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" ');
        Add('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">');
        Add('<html ng-app="myApp" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">');
        Add('<head>');
        Add('<meta charset="utf-8">');
        Add('<title>JsonForm</title>');
        add('<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>');
        add('<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>');
        add(
        '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>             ' + chr(13)
        + '<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.3/handlebars.min.js"></script> ' + chr(13)
        + '<link type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet"/>       ' + chr(13)
        + '<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>          ' + chr(13)
        + '<link type="text/css" href="http://code.cloudcms.com/alpaca/1.5.14/bootstrap/alpaca.min.css" rel="stylesheet"/>            ' + chr(13)
        + '<script type="text/javascript" src="http://code.cloudcms.com/alpaca/1.5.14/bootstrap/alpaca.min.js"></script>              ' + chr(13)
        );
        Add('</head>');

        Add('<body>');

        add('<form id="JF" name="JSONForm">');

        Add(
        '<script type="text/javascript">  ' + chr(13)
        + '$("#JF").alpaca({             ' + chr(13)
        + '    "schema":                   '
        + alpaca_json + chr(13)
        + '});                              ' + chr(13)
        + '</script>                        ' + chr(13)
        );


        Add('</p>');
        //Add('<input type="button" value="reset" ng-click="onclick()"  />');
        Add('</p> ');

        add('</form>');


        Add('</body>');
        Add('</html>');

        s1 := extractfilepath( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );
        s2 := ( functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path );

        i1 := ansipos( s2 , '.' );
        for i := 0 to i1 -1 do begin
          s := s + s2[i];
        end;
        s2 := s2 + 'form.html';
        SaveToFile(s2);
        functionunit.macro_run(s2);

        With functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].TreeView1 do begin
          If (Items.Count>0) and Assigned(Items[0]) then
          begin
            Items[0].Expand(False);
            Selected:=Items[0];
          end;
        end;
      finally
        TreeView1.EndUpdate;
      end;
    end;
  end;
end;


procedure TJson_pars.ShowJSONData(AParent : TTreeNode; Data : TJSONData);

Var
  N,N2 : TTreeNode;
  I : Integer;
  D : TJSONData;
  C : String;
  S : TStringList;
  SObject,SArray,SNull,s1:string;
  val:string;
begin
  N:=Nil;
  if Assigned(Data) then begin
    Case Data.JSONType of
      jtArray,
      jtObject:begin
        If (Data.JSONType=jtArray) then begin
          C:=SArray;//?
         end else begin
           C:=SObject;//?
         end;
         //ツリー構造の記述
        //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(
        //'<fieldset  id="btn">'+
        //'<dl id="tgl_menu">'
       // );
        //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add('<dt id='+AParent.GetTextPath+' for="'+AParent.GetTextPath+'"><button type="button">'+AParent.GetTextPath+'</button></dt>');
        //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].SynEdit1.Lines.Add('<legend>'+ Data.AsString +'</legend>');
        N:=functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].TreeView1.Items.AddChild(AParent,Format(C,[Data.Count]));
        S:=TstringList.Create;
        try
          For I:=0 to Data.Count-1 do begin
            If Data.JSONtype=jtArray then begin
              S.AddObject(IntToStr(I),Data.items[i]);
            end else begin
              S.AddObject(TJSONObject(Data).Names[i],Data.items[i]);
            end;
          end;
          If FSortObjectMembers and (Data.JSONType=jtObject) then begin
            S.Sort;
          end;
          //Forによる再帰表現
          For I:=0 to S.Count-1 do begin
            //ルート部分枝表示
            N2:=functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].TreeView1.Items.AddChild(N,S[i]);
            D:=TJSONData(S.Objects[i]);
            N2.ImageIndex:=ImageTypeMap[D.JSONType];
            N2.SelectedIndex:=ImageTypeMap[D.JSONType];
            try
              //showmessage(Jsondate_to_htmlobj(ImageTypeMap[D.JSONType],d.AsString,ExtractFileName(D.AsString),AParent.GetTextPath));
            except

            end;
            //再帰
            ShowJSONData(N2,D);
            try
              s1 := Jsondate_to_htmlobj(ImageTypeMap[D.JSONType],d.AsString,ExtractFileName(D.AsString),AParent.GetTextPath);
              //showmessage(s1);
              functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(s1);
            except

            end;
          end
        finally
          S.Free;
        end;



        //ツリー構造記述の終了
        val := inttostr(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Count);
       { if Json_pars.ary_sw then begin
          functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(
          '<div id="s'+val+'"><select  class="aaa"  id="c'+val+'"><option value ="string">string</option><option value ="integer">integer</option><option value ="boolean">boolean</option><option value ="array">array</option><option value ="object">object</option></select><button class=''btnInfo'' id='+val+'>add arry</button><br></div>'
          );
          functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(
          '</fieldset><br>'
          );
          Json_pars.ary_sw := false;
        end; }
        val := inttostr(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Count);
       { if Json_pars.obj_sw2 then begin
          functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(
          '<div id="s'+val+'"><select  class="aaa"  id="c'+val+'"><option value ="string">string</option><option value ="integer">integer</option><option value ="boolean">boolean</option><option value ="array">array</option><option value ="object">object</option></select><button class=''btnInfo'' id='+val+'>add object</button><br></div>'
          );
          functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(
          '</dl>'+
          '</fieldset><br>'
          );
          Json_pars.obj_sw2 := false;
        end;}
       // functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add('</fieldset>');
        //showmessage(AParent.GetTextPath);
        if -1 < set_JsonTitle.IndexOf(AParent.GetTextPath) then begin
          //showmessage(set_JsonData.Text);
        end;
        functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(Jsondate_to_htmlobj(ImageTypeMap[Data.JSONType],'','',''));

      end;
      jtNull:begin
        N:=functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].TreeView1.Items.AddChild(AParent,SNull);
        //showmessage(AParent.ToString);
        functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(AParent.ToString);
      end
      else begin
        //値表示
        //showmessage(Extractfiledir(AParent.GetTextPath));
        //showmessage(AParent.GetTextPath);
        //タイトルリストの取得
        if {(get_sw) and }(-1 = set_JsonTitle.IndexOf(AParent.GetTextPath)) then begin
          set_JsonTitle.Add(AParent.GetTextPath);
          //if -1 = set_JsonTitle.IndexOf(AParent.GetTextPath) then
          set_JsonData.add(AParent.GetTextPath);
          set_JsonData.add(Data.AsString);
            //showmessage(set_JsonData.Text);
        end;
            try
              if 0 < ansipos('title',AParent.GetTextPath) then
                JSON_output.Add(data.AsString);
              //if 0 < ansipos('example',AParent.GetTextPath) then
                //example.Add(data.AsString);
            except

            end;
        //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add('<dt id='+AParent.GetTextPath+' for="'+AParent.GetTextPath+'"><button type="button">'+AParent.GetTextPath+'</button></dt>');
        Json_pars.set_parnt := AParent.GetTextPath;
        functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Add(Jsondate_to_htmlobj(ImageTypeMap[Data.JSONType],data.AsString,ExtractFileName(Data.AsString),AParent.GetTextPath));
        N:=functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].TreeView1.Items.AddChild(AParent,Data.AsString);
      end;
    end;
    If Assigned(N) then begin
      //functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].SynEdit1.Lines.Add(Jsondate_to_htmlobj(ImageTypeMap[Data.JSONType],data.AsString));

      //showmessage(inttostr(ImageTypeMap[Data.JSONType]) + char(13) + Data.AsString);
      N.ImageIndex:=ImageTypeMap[Data.JSONType];
      N.SelectedIndex:=ImageTypeMap[Data.JSONType];
      N.Data:=Data;
    end;
  end;
end;

function TJson_pars.Jsondate_to_htmlobj(no:integer;value,types,path:string):string;
var
  i,i1,i2,n,n1:integer;
  s,s1,s2,a,a1:string;
begin
  //case no of
    {7:{Boolean}
      begin
        if value = 'true' then begin
          Jsondate_to_htmlobj := '<dd><select><option value="true" selcted >true</option><option value="false">false</option></select></dd><br>';
        end else if value = 'false' then begin
          Jsondate_to_htmlobj := '<dd><select><option value="true">true</option><option value="false" selcted >false</option></select></dd><br>';
        end;
      end;
    8:{Integer}
      begin
        Jsondate_to_htmlobj := '<dd><input type="number" value='+value+'></dd><br>'
      end;}
    //9:{String}
      begin
        {if 0 < ansipos('/',value) then begin
          if types = '/id' then begin
            Jsondate_to_htmlobj := '<dd><input type="label" value='+value+'></dd><br>';
          end;
          if types = '/$ref' then begin
            //ここに階層構造を表すコードを書く

            //Jsondate_to_htmlobj := '<dd><input type="label" value='+value+'></dd><br>';
          end;

          //showmessage(types + ' _ ' +value);
        end;}
       // showmessage( types +' _ '+ value + ' _ ' + path );
       for n1 := 0 to set_obj.Count -1 do begin
        if 0 < ansipos('title',path) then begin
          S_title := types;
        end;
        if 0 < ansipos('description',path) then begin
          S_description := types;
        end;

        if 0 < ansipos('example',path) then begin
          example := types;
          if (example <> '') and (-1 = example_st.IndexOf(example)) then begin
            example_st.Add(example);
          end;
        end;
        if 0 < ansipos('enum',path) then begin
          enum := types;
          if (enum <> '') and (-1 = enum_st.IndexOf(enum)) then begin
            enum_st.Add(enum);
          end;
        end;

        if 0 < ansipos('minimum',path) then begin
          i_short :=  types;
        end;
        if 0 < ansipos('maximum',path) then begin
          i_long :=  types;
        end;

        if 0 < ansipos(set_obj[n1],types) then begin
          set_obj_type := set_obj[n1];
          //showmessage('');
        end;

        for n := 0 to set_comp.Count -1 do begin
        //showmessage(P_name[n]);
          if {(0 < ansipos(P_name[n],types)) and} (set_comp[n] = types) then begin
                 case set_comp[n] of
                  'エディタ':begin
                        //Jsondate_to_htmlobj := '<dd>';
                             if set_obj_type = 'string' then begin
                              if i_short <> '' then begin
                                i_short := 'ng-minlength="' + i_short + '"';
                              end; if i_long <> '' then begin
                                i_long := 'ng-maxlength="' + i_long + '"';
                              end;
                              inc(htmobj_count);
                              a1 := set_obj_type + inttostr(htmobj_count);
                                s2 := '<dd><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><p><input type="text" name="'+a1+'" ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required '+i_short+' '+i_long+'"><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span><br><span ng-show="JSONForm.'+a1+'.$error.minlength">too short</span><span ng-show="JSONForm.'+a1+'.$error.maxlength">too long</span></p></dd>';
                                if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text)) then begin
                                  set_comp_name.Add(a1);
                                  set_caption.Add(S_title);
                                  //showmessage(s2);
                                  Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                               end;
                              end;
                              if ( example_st.Count > 0 ) and (set_obj_type = 'integer') or (set_obj_type = 'number') then begin
                                if i_short <> '' then begin
                                  i_short := 'ng-min=' + i_short;
                                end; if i_long <> '' then begin
                                  i_long := 'ng-max=' + i_long;
                                end;
                                inc(htmobj_count);
                                a1 := set_obj_type + inttostr(htmobj_count);
                                s2 := '<dd><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><p><input type="number" name="'+a1+'" ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required '+i_short+' '+i_long+'><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span><br><span ng-show="JSONForm.'+a1+'.$error.min">too short</span><span ng-show="JSONForm.'+a1+'.$error.max">too long</span></p></dd>';
                                 if 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) then begin
                                   set_comp_name.Add(a1);
                                   set_caption.Add(S_title);
                                   Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                              end;
                            end;
                        //Jsondate_to_htmlobj := Jsondate_to_htmlobj + '</dd>';
                        example_st.Clear;
                        enum_st.Clear;
                  end;
              'コンボボックス':begin
                        if set_obj_type = 'string' then begin
                           if i_short <> '' then begin
                             i_short := 'ng-minlength="' + i_short + '"';
                           end; if i_long <> '' then begin
                             i_long := 'ng-maxlength="' + i_long + '"';
                           end;
                          inc(htmobj_count);
                          a1 := set_obj_type + inttostr(htmobj_count);
                         s2 := '<dd><label>'+S_title+'<br>'+S_description+'</label><input name="'+a1+'" type="text" class="textField" id="'+a1+'" ng-model="'+JSON_output[0]+'.'+a1+'" list="c'+a1+'"required '+i_short+' '+i_long+'><datalist id="c'+a1+'">';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            set_comp_name.Add(a1);
                            set_caption.Add(S_title);
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                            //showmessage('start');
                          end;
                        end;
                        if set_obj_type = 'integer' then begin
                          if i_short <> '' then begin
                            i_short := 'ng-min=' + i_short;
                          end; if i_long <> '' then begin
                            i_long := 'ng-max=' + i_long;
                          end;
                          inc(htmobj_count);
                          a1 := set_obj_type + inttostr(htmobj_count);
                         s2 := '<dd><label>'+S_title+'<br>'+S_description+'</label><input name="'+a1+'" type="number" class="textField" id="'+a1+'" ng-model="'+JSON_output[0]+'.'+a1+'" list="c'+a1+'" required '+i_short+' '+i_long+'><datalist id="c'+a1+'">';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            set_comp_name.Add(a1);
                            set_caption.Add(S_title);
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                          end;
                        end;

                        for i := 0 to enum_st.Count -1 do begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj +
                            '<option value="'+enum_st[i]+'">'+enum_st[i]+'</option>';
                           //showmessage(example_st[i]);
                        end;

                        if set_obj_type = 'string' then begin
                          s2 := '</datalist><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span><span ng-show="JSONForm.'+a1+'.$error.minlength">too short</span><span ng-show="JSONForm.'+a1+'.$error.maxlength">too long</span></dd>';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                          end;
                         // showmessage('end');
                          example_st.Clear;
                        end;
                        if set_obj_type = 'integer' then begin
                          s2 := '</datalist><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span><span ng-show="JSONForm.'+a1+'.$error.min">too short</span><span ng-show="JSONForm.'+a1+'.$error.max">too long</span></dd>';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                          end;
                        end;
                        example_st.Clear;
                        enum_st.Clear;
                      end;
                      'メモ':begin
                        inc(htmobj_count);
                                if i_short <> '' then begin
                                  i_short := 'ng-minlength="' + i_short + '"';
                                end; if i_long <> '' then begin
                                  i_long := 'ng-maxlength="' + i_long + '"';
                                end;
                        a1 := set_obj_type + inttostr(htmobj_count);
                       for i := 0 to enum_st.Count -1 do begin
                          if i = 0 then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + '<dd><div ng-init="'+JSON_output[0]+'.'+a1+' = ''';
                          end;
                          Jsondate_to_htmlobj := Jsondate_to_htmlobj + enum_st[i] + '&#13;';
                          if i = enum_st.Count -1 then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj +'''">'
                          end;
                        end;
                        s2 := '<label>'+S_title+'<br>'+S_description+'</label><textarea name="'+a1+'" cols"10",rows="'+inttostr(example_st.Count)+'" ng-model="'+JSON_output[0]+'.'+a1+'" required '+i_short+' '+i_long+'>';
                        if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                          set_comp_name.Add(a1);
                          set_caption.Add(S_title);
                          Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                        end;
                        s2 := '</textarea><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span><br><span ng-show="JSONForm.'+a1+'.$error.minlength">too short</span><span ng-show="JSONForm.'+a1+'.$error.maxlength">too long</span></p></dd>';
                        if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                          Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                          example_st.Clear;
                          enum_st.Clear;
                        end;
                      end;
                      'リスト':begin
                          inc(htmobj_count);
                          a1 := set_obj_type + inttostr(htmobj_count);
                         s2 := '<dd><label>'+S_title+'<br>'+S_description+'</label><select name="'+a1+'"  id="'+a1+'" ng-model="'+JSON_output[0]+'.'+a1+'"  >';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            set_comp_name.Add(a1);
                            set_caption.Add(S_title);
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                          end;


                          for i := 0 to enum_st.Count -1 do begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj +
                            '<option value="'+enum_st[i]+'">'+enum_st[i]+'</option>';
                          end;


                          s2 := '</select><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span>';
                          if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                             example_st.Clear;
                             enum_st.Clear;
                          end;
                      end;
                      'チェックボックス':begin
                        inc(htmobj_count);
                        a1 := set_obj_type + inttostr(htmobj_count);
                        if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                            Jsondate_to_htmlobj := Jsondate_to_htmlobj + '<dd><label>'+S_title+'<br>'+S_description+'</label><br>';
                          end;
                          for i := 0 to example_st.Count -1 do begin
                            //if 0 < ansipos(example_st[i],functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) then begin
                            set_comp_name.Add(a1);
                            set_caption.Add(S_title);

                             Jsondate_to_htmlobj := Jsondate_to_htmlobj +
                                '<input type="checkbox"  name="'+a1 +'"  id="'+value+'" ng-model="'+JSON_output[0]+'.'+a1+ inttostr(i) +'" value="'+example_st[i]+'">'+example_st[i] + '<br>';
                           // end;
                          end;
                          example_st.Clear;
                      end;
                      'ラジオボタン':begin
                        inc(htmobj_count);
                        a1 := set_obj_type + inttostr(htmobj_count);
                        if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                          Jsondate_to_htmlobj := Jsondate_to_htmlobj + '<dd><label>'+S_title+'<br>'+S_description+'</label><br>';
                          set_comp_name.Add(a1);
                          set_caption.Add(S_title);

                        end;
                        for i := 0 to enum_st.Count -1 do begin
                          Jsondate_to_htmlobj := Jsondate_to_htmlobj +
                            '<input type="radio"  name="'+a1+'"  id="'+value+'" ng-model="'+JSON_output[0]+'.'+a1+'" value="'+enum_st[i]+'">'+enum_st[i]+'<br>';
                        end;
                        example_st.Clear;
                        enum_st.Clear;
                      end;
                      'カラー':begin
                                                  inc(htmobj_count);
                                                  a1 := set_obj_type + inttostr(htmobj_count);
                                                  s2 := '<dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="color" name="'+a1+'"  ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p></dd>';
                                                  if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                    set_comp_name.Add(a1);
                                                    set_caption.Add(S_title);

                                                    Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                  end;
                                                  example_st.Clear;
                                                  enum_st.Clear;
                       end;
                      '日付':begin
                                                inc(htmobj_count);
                                                  if i_short <> '' then begin
                                                    i_short := 'min=' + i_short;
                                                  end; if i_long <> '' then begin
                                                    i_long := 'max=' + i_long;
                                                  end;

                                                a1 := set_obj_type + inttostr(htmobj_count);
                                                s2 := '<dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="date" name="'+a1+'"  ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" '+ i_short + ' ' + i_long  +' required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p></dd>';
                                                if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                  set_comp_name.Add(a1);
                                                  set_caption.Add(S_title);

                                                  Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                end;
                                                example_st.Clear;
                                                enum_st.Clear;
                       end;
                      '時間':begin
                                                inc(htmobj_count);
                                                if i_short <> '' then begin
                                                  i_short := 'min=' + i_short;
                                                end; if i_long <> '' then begin
                                                  i_long := 'max=' + i_long;
                                                end;

                                                a1 := set_obj_type + inttostr(htmobj_count);
                                                s2 := '<p><dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+StringReplace(example, '-', ':', [rfReplaceAll])+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="time" name="'+a1+'"  ng-init="'+StringReplace(example, '-', ':', [rfReplaceAll])+'" ng-model="'+JSON_output[0]+'.'+a1+'" '+ StringReplace(i_short, '-', ':', [rfReplaceAll]) + ' ' +StringReplace(i_long, '-', ':', [rfReplaceAll])  +'" required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p>';
                                                if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                   Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                   set_comp_name.Add(a1);
                                                   set_caption.Add(S_title);

                                                end;
                                                example_st.Clear;
                                                enum_st.Clear;
                               end;
                      'メールアドレス':begin
                                                  inc(htmobj_count);
                                                  a1 := set_obj_type + inttostr(htmobj_count);
                                                  s2 := '<dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="eMail" name="'+a1+'"  ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p></dd>';
                                                  if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                    set_comp_name.Add(a1);
                                                    set_caption.Add(S_title);

                                                    Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                  end;
                                                  example_st.Clear;
                                                  enum_st.Clear;
                       end;
                      'URL':begin
                                                  inc(htmobj_count);
                                                  a1 := set_obj_type + inttostr(htmobj_count);
                                                  s2 := '<dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="url" name="'+a1+'"  ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p></dd>';
                                                  if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                    set_comp_name.Add(a1);
                                                    set_caption.Add(S_title);

                                                    Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                  end;
                                                  example_st.Clear;
                                                  enum_st.Clear;
                       end;
                      '電話番号':begin
                                                  inc(htmobj_count);
                                                  a1 := set_obj_type + inttostr(htmobj_count);
                                                  s2 := '<dd><p><div ng-init="'+JSON_output[0]+'.'+a1+' = '''+example+'''"><label>'+S_title+'<br>'+S_description+'</label><input type="tel" name="'+a1+'"  ng-init="'+example+'" ng-model="'+JSON_output[0]+'.'+a1+'" required ><br><span ng-show="JSONForm.'+a1+'.$error.required">required</span></p></dd>';
                                                  if ( example_st.Count > 0 ) and ( 0 = ansipos(S_title,functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].Json_write.Text) ) then begin
                                                    set_comp_name.Add(a1);
                                                    set_caption.Add(S_title);

                                                    Jsondate_to_htmlobj := Jsondate_to_htmlobj + s2;
                                                  end;
                                                  example_st.Clear;
                                                  enum_st.Clear;
                       end;



                      end;
            end;
        end;
     end;
        //Jsondate_to_htmlobj := '<dd><input type="label" value='+value+'></dd><br>';
        {showmessage(types+ ' ' + value);
        if types = 'description' then begin
          //showmessage(value);
        end;}
      end;
   //{case no of}  end;
end;




function json_create2(st:TStringList):string;
var
  i,i1,j:integer;
  s2:string;
  st1:TStringList;
  {function parse_word(s:string):boolean;
  var
    s1:string;
  begin
      parse_word := false;
      try
        try
          s1 := s;
        except
        end;
      finally
        if (not parse_word) and (s1 <> '') then begin
          st1.Add(s1);
          if (s1 = 'object'){ or (s1 = '')} then
            parse_word := true;

        end;
      end;
    end;}
    function parse_word1():boolean;
    var
      z:integer;
    begin
      for z := 0 to st.count -1 do begin
        try
        st1.Add(Json_pars.J.FindPath(st[z]).AsString);
        except
          //showmessage('1_' + inttostr(z));
        end;
      end;
    end;
    function parse_word2(c:integer):boolean;
    var
      z:integer;
    begin
      for z := 0 to st.count -1 do begin
        try
          st1.Add(Json_pars.J.Items[c].FindPath(st[i]+'.'+st[z]).AsString);
        except
          //showmessage('2_' + inttostr(z));
        end;
      end;
    end;
begin
  st1:=TStringList.Create;
  st1.Clear;
  //st1.Add('{"'+s+'":');
  //st1.Add('{');
  st1.Add('');
  //s2 := st[0];
  for i := 0 to st.count -1 do begin
    s2 := st[i];
    //if parse_word(Json_pars.J.FindPath(s2).AsString) then begin
      //s2 := st[i];
      for i1 := 0 to Json_pars.J.Count-1 do begin
        //showmessage(inttostr(Json_pars.J.Count));
        //parse_word(Json_pars.J.FindPath(s2).AsString);
        //st1.Add(Json_pars.J.FindPath(Json_pars.J.FindPath(s2).AsString).AsString);
          parse_word1();
          for j := 0 to Json_pars.J.Items[i1].Count -1 do begin
          //s2 := s2 + st[j] + '.' + st[i1];
          //showmessage(s2);
          //parse_word(Json_pars.J.Items[i1].FindPath(s2).AsString);
          //st1.Add(Json_pars.J.FindPath(Json_pars.J.Items[i1].FindPath(s2).AsString).AsString);
          //
              parse_word2(j);
          //showmessage(inttostr(Json_pars.J.Items[i1].Count));
        end;
      end;
    //end;
  end;
  st1[st1.Count-1] := StringReplace(st1[st1.Count-1],',','', [rfReplaceAll]);
  //st1.Add('}');
  //st1.Add('}');
  json_create2 := st1.Text;
end;


procedure TJson_pars.Button1Click(Sender: TObject);
var
  st,st2:TStringlist;
begin
  st := TStringlist.Create;
  st.Text:= functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].SynEdit1.Text;

  st2 := TStringlist.Create;
  st2.Clear;
  functionunit.JsonParse(st,st2,edit1.Text);
  memo1.Text:= st2.Text;

  st.Free;
  st2.Free;
end;

procedure TJson_pars.Button2Click(Sender: TObject);
var
  st,st2,st3:TStringlist;
begin
  st := TStringlist.Create;
  st.Text:= functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].SynEdit1.Text;
  st2 := TStringlist.Create;
  st2.Clear;
  st3 := TStringlist.Create;
  st3.Clear;
  Json_pars.J:=GetJSON(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].SynEdit1.Text);
   functionunit.json_Keword_parse(st,st2);
   //showmessage(st2.Text);
   st3.text := json_create2(st2);
   //showmessage(st3.Text);
end;

procedure TJson_pars.Button3Click(Sender: TObject);
begin
  Json_pars.OpenFile(functionunit.editlist.Items[mainform.PageControl1.ActivePageIndex].filename_path);
end;

procedure TJson_pars.FormCreate(Sender: TObject);
begin
  set_JsonTitle := TStringList.Create;
  set_JsonTitle.Create;
  set_JsonData := TStringList.Create;
  set_JsonData.Clear;
  get_sw := false;
  JSON_output := TStringList.Create;
  JSON_output.Clear;
  JSON_start := TStringList.Create;
  JSON_start.Clear;
  st_temp := TStringlist.Create;
  st_temp.Clear;
  S_PD := TStringList.Create;
  S_PD.Clear;
  P_Name := TStringList.Create;
  P_Name.Clear;
  st_i_short := TStringList.Create;
  st_i_short.Clear;
  st_i_long := TStringList.Create;
  st_i_long.Clear;
  example_st := TStringList.Create;
  example_st.Clear;
  enum_st := TStringList.Create;
  enum_st.Clear;
  set_comp_name:= TStringList.Create;
  set_comp_name.Clear;
  set_caption:= TStringList.Create;
  set_caption.Clear;

  json_s_count :=0;
  obj_sw_count := 0;
  htmobj_count := 0;

  set_comp := TStringList.Create;
  set_comp.Clear;
  set_comp.Add('エディタ');
  set_comp.Add('メモ');
  set_comp.Add('コンボボックス');
  set_comp.Add('チェックボックス');
  set_comp.Add('リスト');
  set_comp.Add('ラジオボタン');
  set_comp.Add('日付');
  set_comp.Add('時間');
  set_comp.Add('カラー');
  set_comp.Add('');
  set_comp.Add('');

  set_obj := TStringList.Create;
  set_obj.Clear;
  set_obj.Add('string');
  set_obj.Add('integer');
  set_obj.Add('number');
  set_obj.Add('null');
  set_obj.Add('boolean');
  set_obj.Add('date');
  set_obj.Add('time');
  set_obj.Add('color');
  set_obj.Add('object');
  set_obj.Add('array');
end;

procedure TJson_pars.FormShow(Sender: TObject);
begin

end;

end.

