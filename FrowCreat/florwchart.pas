unit FlorwChart;

{$MODE Delphi}

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, FileUtil, Process,
  lclintf, Menus;

type
  TCompList = class(TList)
  private
    function Get(Index: Integer): TControl;
    procedure Put(Index: Integer; const Value: TControl);
  public
    property Items[Index: Integer]: TControl read Get write Put; default;
     destructor Destroy; override;
  end;

  TFC_Comp = class(TPanel)
    TLB:TLabel;
    TIM:TImage;
    TMem:TMemo;
    TBtn:Tbutton;
  private
    st:TStringlist;
  public
    img_No:integer;
  end;


  { TFCFM }

  TFCFM = class(TForm)
   Button1: TButton;
   Button11: TButton;
   Button12: TButton;
   Button13: TButton;
   Button2: TButton;
   Button3: TButton;
   Button5: TButton;
   Button7: TButton;
   ComboBox1: TComboBox;
   ComboBox10: TComboBox;
   ComboBox2: TComboBox;
   ComboBox3: TComboBox;
   ComboBox4: TComboBox;
   ComboBox5: TComboBox;
   ComboBox6: TComboBox;
   ComboBox7: TComboBox;
   ComboBox8: TComboBox;
   ComboBox9: TComboBox;
   Edit1: TEdit;
   GroupBox1: TGroupBox;
   GroupBox2: TGroupBox;
   GroupBox3: TGroupBox;
   GroupBox8: TGroupBox;
   Image1: TImage;
   Image2: TImage;
   Label1: TLabel;
   Label2: TLabel;
   Label3: TLabel;
   Label4: TLabel;
   Label5: TLabel;
   Label6: TLabel;
   Label7: TLabel;
   Label8: TLabel;
   ListBox1: TListBox;
   MeisiForm: TPanel;
   MeisiPIc: TImage;
   Memo1: TMemo;
   MenuItem1: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Panel8: TPanel;
    PopupMenu1: TPopupMenu;
    ScrollBox1: TScrollBox;
    setCompIMG: TGroupBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    OpenDialog1: TOpenDialog;
    FontDialog1: TFontDialog;
    UpDown: TUpDown;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    waku: TPanel;
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure GroupBox4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5DblClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MeisiFormClick(Sender: TObject);
    procedure MeisiPIcPaint(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown4Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown3Changing(Sender: TObject; var AllowChange: Boolean);
    procedure setCompIMGMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure setCompIMGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure setCompIMGMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure wakuMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure print2Click(Sender: TObject);
 private
    { Private 宣言 }
    QRMemo1 : TMemo;
    savedir,loadfile:string;
    crentDir,SearchDir:String;
    waku_move_sw:boolean;
    waku_sizeY_sw,waku_sizeX_sw:boolean;
    dwncount:integer;
    ptX,ptY:integer;
    count:integer;
    bmp_base,meisi_base:TBitmap;
    editNo_tmp:integer;
    dir:string;
  public
    { Public 宣言 }
    compset:TLabel;
    tempmemo:string;
    comp,qrcomp:TCompList;
    setprjdir,setdir:String;
    qrimg:array [0..30] of Timage;
    QRLabel:array [0..30] of TMemo;
    QRMemo:array [0..30] of TMemo;
    QRImg2:array [0..30] of Timage;

    imgtext:array[0..15] of TMemo;
    img2:array[0..15] of TImage;
    Edit14:Tedit;
    loadprj:boolean;
    nmlsize_W,nmlsize_H:integer;
    prtimg:TImage;
    imgset:integer;
    setwidth,setheight:integer;

    ary_TFC_Comp:array [0..255] of TFC_Comp;
    count_tec_comp:integer;
    //function printPIC(pagenum:integer;filename:string):boolean;
    function resetprot:boolean;
  end;

var
  FCFM: TFCFM;

implementation

{$R *.lfm}

function TCompList.Get(Index: Integer): TControl;
begin
  try
    Result :=  TControl( inherited Get(Index) );
  except
  end;
end;

function resetcomp:boolean;
var
  i:integer;
begin
 with FCFM do begin
  combobox6.Items.Clear;
  combobox6.Text := '';
  for i := 0 to 255 do begin
     try
       if FCFM.ary_TFC_Comp[i] <> nil then begin
       FCFM.ary_TFC_Comp[i].TBtn := nil;
       FCFM.ary_TFC_Comp[i].TIM := nil;
       FCFM.ary_TFC_Comp[i].TLB := nil;
       FCFM.ary_TFC_Comp[i].TMem := nil;
       end;
       FCFM.ary_TFC_Comp[i].free;
       //FCFM.ary_TFC_Comp[i] := nil;
     except end;
     try
       //FCFM.ary_TFC_Comp[i].Destroy;
     except end;
  end;
  for i := 0 to comp.Count -1 do begin
     try
         comp.Items[0] := nil;
         comp.Items[0].Free;
     except end;
     try
       comp.Delete(0);
     except end;
  end;
 end;
end;

function EnumFileFromDir(SearchDir: string): boolean;
var
  Rec: TSearchRec;
begin
  begin
    //指定ディレクトリのすべての種類のファイルを列挙
    if FindFirstUTF8(SearchDir + '*.*',faAnyFile,Rec) { *Converted from FindFirst* } = 0 then
    try
      repeat
         if ((Rec.Attr and faDirectory > 0)) and
               (Rec.Name <> '.') and (Rec.Name <> '..') then
           begin
             //見つかったフォルダを追加
             if (ExtractFIleExt(Rec.Name) = '.csv') then begin
               FCFM.ListBox1.Items.Add(Rec.Name);
             end;
           end;
       until (FindNextUTF8(Rec) { *Converted from FindNext* } <> 0);
       Result :=true;
    finally
      FindCloseUTF8(Rec); { *Converted from FindClose* }
    end;
  end;
end;

function setfilename(st:TStringList;c:TControl):boolean;
  var
    s2,s3:String;
    i2,i3,i4:integer;
  begin
    st.Clear;
    s2 := c.hint;
    i2 := 1;
    i4 := 0;
    s3 := '';
    if 0 = ansipos(';',s2) then begin
        st.Text := s2;
        //showmessage(st.Text);
      end else begin
        //s2 := s2 + ';';
        while i2 >= 1 do begin
          i2 := ansipos(';',s2);
          //showmessage(s2);
          st.Text:= s2;
          for i3 := i4 to i2 -1 do begin
            s3 := s3 + s2[i3];
          end;
          //showmessage(s2);
          s2[i2] := chr(13);

          i4 := i2 -1;
          //showmessage('aaa' + st.Text);
          st.Add(s3);

          s3 := '';

        end;
      end;
  end;

function setcomb(Top,Left,Height,Width:integer):boolean;
var
  i,Max:integer;
  function setMax(i,i2:integer):integer;
  begin
    if i < i2 then
      i := i2;
    setMax := i
  end;
begin
  Max := Top;
  Max := setMax(Max,Left);
  Max := setMax(Max,Height);
  Max := setMax(Max,Width);
  with FCFM do begin
    for i := 0 to Max * 2 do begin
      combobox7.Items.Add(inttostr(i));
      combobox8.Items.Add(inttostr(i));
      if i <= Top then
        combobox2.Items.Add(inttostr(i));
      if i <= Left then
        combobox3.Items.Add(inttostr(i));
      if i <= Height then
        combobox4.Items.Add(inttostr(i));
      if i <= Width then
        combobox5.Items.Add(inttostr(i));
    end;
  end;
end;

function setSizeCombo:boolean;
begin
  with FCFM do begin
    updown1.Position := 50;
    updown2.Position := 50;
    updown3.Position := 50;
    updown4.Position := 50;
  end;
end;

function setMeisiSize:boolean;
begin
  with FCFM.MeisiForm do begin
    FCFM.TrackBar1.Max := Height;
    FCFM.TrackBar2.Max := Width;
    FCFM.TrackBar3.Max := Height;
    FCFM.TrackBar4.Max := Width;

    FCFM.UpDown1.Max := Height;
    FCFM.UpDown2.Max := Width;
    FCFM.UpDown3.Max := Height;
    FCFM.UpDown4.Max := Width;
    setcomb(Top,Left,Height,Width);
  end;
end;

function setMoveCompSet(tp,lf,ht,wd:integer):boolean;
var
  i,i1:integer;
  R:TRect;
  B:TBitmap;
begin
  {B := TBitMap.Create;
  B.Width := wd;
  B.Height := ht;
  R := Rect(10,10,20, 30);
  B.Canvas.Pen.Color := clBlack;
  //B.Canvas; //(10,10,20,20,40,40,50,50);
  //B.Canvas.Pen.Style := pssolid;
  //B.Canvas.Brush.Style:= bssolid;
  //B.Canvas.Brush.Color := clblack;
  //B.Canvas.Rectangle(R.Left,R.Top,R.Right,R.Bottom);
  FCFM.setcompIMG.Picture.Bitmap := (B);
  }
  with FCFM.setcompIMG do begin
    top := tp;
    Left := lf ;
    Width := wd+ 4;
    Height := ht +8;
  end;
  with FCFM.waku do begin
    Width := wd-6;
    Height := ht-8;
  end;

  //B.Free;
end;

function changupdown:boolean;
begin
  with FCFM do begin
    TrackBar1.Position := updown1.Position;
    TrackBar2.Position := updown2.Position;
    TrackBar3.Position := updown3.Position;
    combobox4.Text := inttostr(trackbar3.position);
    TrackBar4.Position := updown4.Position;
    setMoveCompSet(
      updown1.Position,
      updown2.Position,
      updown3.Position,
      updown4.Position
    );

  end;
end;

function changtrackbar:boolean;
begin
  with FCFM do begin
    updown1.Position := TrackBar1.Position;
    updown2.Position := TrackBar2.Position;
    combobox3.Text := inttostr(TrackBar2.Position);
    updown3.Position := TrackBar3.Position;
    updown4.Position := TrackBar4.Position;
    setMoveCompSet(
        TrackBar1.Position,
        TrackBar2.Position,
        TrackBar3.Position,
        TrackBar4.Position
    );
  end;
end;

function changcombobox:boolean;
begin
  with FCFM do begin
    try
      TrackBar1.Position := strtoint(combobox2.text);
    except
    end;
    try
      TrackBar2.Position := strtoint(combobox3.text);
    except
    end;
    try
      TrackBar3.Position := strtoint(combobox4.text);
      updown3.Position := strtoint(combobox4.text);
    except
    end;
    try
      TrackBar4.Position := strtoint(combobox5.text);
    except
    end;
    setMoveCompSet(
       strtoint(combobox2.text),
       strtoint(combobox3.text),
       strtoint(combobox4.text),
       strtoint(combobox5.text)
    );
  end;
end;

function set_compSize:boolean;
begin
  changcombobox;
  changupdown;
  changtrackbar;
end;

function set_editcomp(i:integer;cmp:Tcontrol):boolean;
var
  c:Tcontrol;
  s1,s2,s3,s4:string;
begin
    with FCFM.comp.Items[i] do begin
      c := FCFM.comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      cmp.Hint := c.Hint;
      FCFM.ComboBox2.Text := inttostr(Top);
      FCFM.ComboBox3.Text := InttoStr(left);
      FCFM.ComboBox4.Text := IntToStr(Height);
      FCFM.ComboBox5.Text := IntToStr(Width);
      s1 := (FCFM.ComboBox2.Text);
      s2 := (FCFM.ComboBox3.Text);
      s3 := (FCFM.ComboBox4.Text);
      s4 := (FCFM.ComboBox5.Text);
      //showmessage(s);
      changcombobox;
      with FCFM do begin
        setMoveCompSet(
          strtoint(s1),
          strtoint(s2),
          strtoint(s3),
          strtoint(s4)
        );
        FCFM.TrackBar1.Position := strtoint(s1);
        FCFM.TrackBar2.Position := strtoint(s2);
        FCFM.TrackBar3.Position := strtoint(s3);
        FCFM.TrackBar4.Position := strtoint(s4);
    end;
  end;
end;





function create_memo(savefile:string;i:integer;memo,m:TLabel;sw:boolean):boolean;
var
  s:string;
  t:TfontStyles;
  i1:integer;
  st:TStringList;
begin
  with FCFM do begin
    {for i1 := 0 to memo.Lines.Count -1 do begin
      memo.Lines[i1] := memo.Lines[i1] + ' ';
    end;}
    m.Caption := memo.Caption;
    m.Font := memo.Font;
    m.WordWrap:= true;
    m.AutoSize := false;
    //showmessage(m.Lines.text);
    if sw then begin
      st := TStringList.Create;
      st.Text:= memo.Caption;
      st.SaveToFile( {ExtractFileName}utf8toansi( savefile) );
      st.Free;
    end;
    with comp.Items[i] do begin
      Hint := savefile;
      m.top := FCFM.UpDown1.Position;
      m.Left := FCFM.UpDown2.Position;
      m.Height := FCFM.UpDown3.Position;
      m.Width := FCFM.UpDown4.Position;
      m.Visible := true;
      m.Parent := Parent;
      m.OnClick:= FCFM.Label5.OnClick;
      //m.ReadOnly:= true;
      //m.BorderStyle:= bsnone;
      //m.onChange := FCFM.Memo1Change;
    end;
    try
      comp.Items[i].free;
    except end;
    comp.Items[i] := m;
    comp.Items[i].Tag := 2;
    //t := m.Font.Style;
    //showmessage(t);
    if m.Font.Style = [fsBold] then begin
     // s := styletostr();//'fsBold';
    end;
    if m.Font.Style = [fsItalic] then begin
      s :=  s + ';fsItalic';
    end;

    if m.Font.Style = [fsUnderline] then begin
      s := s + ';fsUnderline';
    end;
    if m.Font.Style = [fsStrikeOut] then begin
      s := s + ';fsStrikeOut';
    end;
    comp.Items[i].hint := FCFM.setdir + ExtractFileName(savefile) + ';' + m.Font.Name + ';' + inttostr(m.Font.Size) + ';' + inttostr(m.Font.Color) + ';' + s;
    //showmessage(comp.Items[i].Hint);
  end;
end;

function create_pic(savefile:string;i:integer;img:TImage;loadPIC:boolean):boolean;
var
  J:TJPegImage;
  B:TBitmap;
begin
  with FCFM do begin
    //image2.Picture.Clear;
    if loadPIC then begin
      if not opendialog1.Execute then
        exit;
      B := TBitmap.Create;
      J :=TJpegImage.Create;
      J.LoadFromFile(opendialog1.filename);
      J.SaveToFile( savefile );
      B.Assign(J);
      img.Picture.Assign(B);
      img.OnClick:= FCFM.Image1.OnClick;
      //FCFM.Image2.Picture.Assign(B);
      B.Free;
      J.Free;

    end else begin
      if img = nil then begin
        with FCFM.comp.Items[i] do begin
             Hint := FCFM.setdir +ExtractFileName(savefile);
             top := FCFM.TrackBar1.Position;
             Left := FCFM.TrackBar2.Position;
             Width := FCFM.TrackBar4.Position;
             Height := FCFM.TrackBar3.Position;
             Visible := true;
             Parent := Parent;
             //Stretch := true;
         end;
        exit;
      end;


      B := TBitmap.Create;
      J :=TJpegImage.Create;
      J.LoadFromFile(savefile);
      //J.SaveToFile( savefile );
      B.Assign(J);
      img.Picture.Assign(B);
      img.OnClick:= FCFM.Image1.OnClick;
      //FCFM.Image2.Picture.Assign(B);
      B.Free;
      J.Free;

    end;
  end;

  with FCFM.comp.Items[i] do begin
      Hint := FCFM.setdir + FCFM.dir + savefile;
      img.top := FCFM.TrackBar1.Position;
      img.Left := FCFM.TrackBar2.Position;
      img.Width := FCFM.TrackBar4.Position;
      img.Height := FCFM.TrackBar3.Position;
      img.Visible := true;
      img.Parent := Parent;
      img.Stretch := true;
  end;
  //if loadPIC then begin
    try
      FCFM.comp.Items[i].Visible:= false;
    except end;

    //FCFM.comp.Items[i].Create(FCFM);
    FCFM.comp.Items[i] := img;
    FCFM.comp.Items[i].Visible:= true;
    //showmessage(FCFM.setdir +ExtractFileName(savefile));
   // showmessage(FCFM.comp.Items[i].hint);

    FCFM.comp.Items[i].hint := FCFM.setdir +ExtractFileName(savefile);
    FCFM.comp.Items[i].Tag := 1;
 // end;
end;

function create_TFC_Comp(savefile:string;i:integer;pnl:TFC_Comp):boolean;
begin
  with FCFM.comp.Items[i] do begin
      Hint := FCFM.setdir + FCFM.dir + savefile;
      pnl.top := FCFM.TrackBar1.Position;
      pnl.Left := FCFM.TrackBar2.Position;
      pnl.Width := FCFM.TrackBar4.Position;
      pnl.Height := FCFM.TrackBar3.Position;
      pnl.Visible := true;
      pnl.Parent := Parent;
  end;
  //if loadPIC then begin
    try
        FCFM.comp.Items[i].Visible:= false;

        pnl.TIM:= Timage.Create(pnl);
        pnl.TIM.Parent := pnl;
        pnl.TIM.Name:= 'i' + inttostr(i+1);
        pnl.TIM.Align:= alleft;
        pnl.img_No:=0;
        pnl.TIM.Width:= 60;
        pnl.TIM.Canvas.Brush.Color:= clWhite;
        pnl.TIM.Canvas.Clear;
        pnl.TIM.Canvas.Rectangle(0,0,pnl.TIM.Width,pnl.TIM.Height);
        pnl.TIM.Canvas.Pen.Color:= clblack;
        pnl.TIM.Canvas.Pen.Width:=2;
        pnl.TIM.Canvas.TextOut(2,2,'処理');
        pnl.TIM.Canvas.Rectangle(5,pnl.TIM.Height div 2,45,(pnl.TIM.Height div 2)+20);
        pnl.TIM.OnClick:= FCFM.Image1.OnClick;
        pnl.TIM.OndblClick:= FCFM.Image1.OndblClick;
        FCFM.comp.Add(pnl.TIM);

        pnl.TLB:= TLabel.Create(pnl);
        pnl.TLB.Parent := pnl;
        pnl.TLB.Name:= 'l' + inttostr(i+2);
        pnl.TLB.Align:= alClient;
        pnl.TLB.WordWrap:= True;
        pnl.TLB.Caption:= FCFM.Memo1.Lines.Text;
        pnl.TLB.OnClick:= FCFM.Image1.OnClick;
        pnl.TLB.OndblClick:= FCFM.Image1.OndblClick;
        FCFM.comp.Add(pnl.TLB);

            pnl.TBtn := TButton.Create(FCFM);
            pnl.TBtn.Parent := pnl;
            pnl.TBtn.Align:= alTop;
            pnl.TBtn.Visible := not true;
            pnl.TBtn.Caption:= '保存';
            pnl.TBtn.OnClick := FCFM.Button1Click;

            pnl.TMem := TMemo.Create(FCFM);
            pnl.TMem.Parent := pnl;
            pnl.TMem.Align:= alclient;
            try
              pnl.TMem.Lines.LoadFromFile( FCFM.setprjdir + inttostr(i div 3) + 'm');
              pnl.TLB.Caption:= pnl.TMem.Lines.Text;
            except

            end;
            pnl.TMem.Visible := not true;

        try
          pnl.st := TStringList.Create;
          pnl.st.LoadFromFile(FCFM.setprjdir + inttostr(i div 3)+ '_No');
          pnl.img_No:= strtoint(pnl.st[0]);
          pnl.st.Free;
          //FCFM.Image1DblClick( pnl.TIM );
            pnl.TIM.Canvas.Brush.Color:= clWhite;
            pnl.TIM.Canvas.Clear;
            pnl.TIM.Canvas.Rectangle(0,0,pnl.TIM.Width,pnl.TIM.Height);
            pnl.TIM.Canvas.Pen.Color:= clblack;
            pnl.TIM.Canvas.Pen.Width:=2;
            case pnl.img_No of
               0: begin
                  pnl.TIM.Canvas.Rectangle(5,pnl.TIM.Height div 2,45,(pnl.TIM.Height div 2)+20);
                  pnl.TIM.Canvas.TextOut(2,2,'処理');
               end;
               1: begin
                    pnl.TIM.Canvas.TextOut(2,2,'判断');
                    with pnl.TIM.Canvas do begin
                         MoveTo(15,(pnl.TIM.Height div 2)+5);
                         LineTo(5,(pnl.TIM.Height div 2)+15);
                         LineTo(15,(pnl.TIM.Height div 2)+25);
                         LineTo(25,(pnl.TIM.Height div 2)+15);
                         LineTo(15,(pnl.TIM.Height div 2)+5);
                   end;
               end;
               2: begin
                   pnl.TIM.Canvas.TextOut(2,2,'定義済');
                   pnl.TIM.Canvas.TextOut(2,20,'処理');
                   pnl.TIM.Canvas.Rectangle(5,pnl.TIM.Height div 2,45,(pnl.TIM.Height div 2)+20);
                   pnl.TIM.Canvas.Rectangle(15,pnl.TIM.Height div 2,35,(pnl.TIM.Height div 2)+20);
               end;
               3: begin
                   pnl.TIM.Canvas.TextOut(2,2,'手作業');
                   with pnl.TIM.Canvas do begin
                       MoveTo(5,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(30,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+5);
                   end;
               end;
               4: begin
                   pnl.TIM.Canvas.TextOut(2,2,'組合わせ');
                   with pnl.TIM.Canvas do begin
                       MoveTo(5,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+5);
                   end;
               end;
               5: begin
                   pnl.TIM.Canvas.TextOut(2,2,'抜出');
                   with pnl.TIM.Canvas do begin
                       MoveTo(25,(pnl.TIM.Height div 2)+5);
                       LineTo(25,(pnl.TIM.Height div 2)+5);
                       LineTo(40,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+15);
                       LineTo(25,(pnl.TIM.Height div 2)+5);
                   end;
               end;
               6: begin
                   pnl.TIM.Canvas.TextOut(2,2,'照合');
                   with pnl.TIM.Canvas do begin
                       MoveTo(5,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+5);

                       MoveTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                       LineTo(35,(pnl.TIM.Height div 2)+25);
                       LineTo(5,(pnl.TIM.Height div 2)+25);
                       LineTo(20,(pnl.TIM.Height div 2)+15);
                   end;
               end;
              7: begin
                   pnl.TIM.Canvas.TextOut(2,2,'分類');
                   with pnl.TIM.Canvas do begin
                       MoveTo(20,(pnl.TIM.Height div 2)+5);
                       LineTo(20,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+15);
                       LineTo(20,(pnl.TIM.Height div 2)+5);

                       MoveTo(5,(pnl.TIM.Height div 2)+15);
                       LineTo(35,(pnl.TIM.Height div 2)+15);
                       LineTo(20,(pnl.TIM.Height div 2)+25);
                       LineTo(20,(pnl.TIM.Height div 2)+25);
                       LineTo(5,(pnl.TIM.Height div 2)+15);
                   end;
               end;
               8: begin
                   pnl.TIM.Canvas.TextOut(2,2,'手操作');
                   pnl.TIM.Canvas.TextOut(2,20,'入力');
                   with pnl.TIM.Canvas do begin
                       MoveTo(5,(pnl.TIM.Height div 2)+8);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+8);
                   end;
               end;
               9: begin
                   pnl.TIM.Canvas.TextOut(2,2,'入出力');
                   with pnl.TIM.Canvas do begin
                       MoveTo(10,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(30,(pnl.TIM.Height div 2)+15);
                       LineTo(5,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+5);
                   end;
               end;
              10: begin
                   pnl.TIM.Canvas.TextOut(2,2,'オンライン');
                   pnl.TIM.Canvas.TextOut(2,20,'記録');
                   with pnl.TIM.Canvas do begin
                       MoveTo(15,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(30,(pnl.TIM.Height div 2)+10);
                       LineTo(35,(pnl.TIM.Height div 2)+15);
                       LineTo(15,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+10);
                       LineTo(15,(pnl.TIM.Height div 2)+5);
                   end;
               end;
              11: begin
                   pnl.TIM.Canvas.TextOut(2,2,'書類');
                   with pnl.TIM.Canvas do begin
                       MoveTo(10,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+10);
                       LineTo(30,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+5);
                   end;
               end;
              12: begin
                   pnl.TIM.Canvas.TextOut(2,2,'紙カード');
                   with pnl.TIM.Canvas do begin
                       MoveTo(15,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+5);
                       LineTo(35,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+15);
                       LineTo(10,(pnl.TIM.Height div 2)+10);
                       LineTo(15,(pnl.TIM.Height div 2)+5);
                   end;
               end;
              13: begin
                   pnl.TIM.Canvas.TextOut(2,2,'磁気ディスク');
                   with pnl.TIM.Canvas do begin
                       pnl.TIM.Canvas.Brush.Color:= clblack;
                       //Arc(5, (pnl.TIM.Height div 2), 50, (pnl.TIM.Height div 2)+10,300,10,300,20);
                       Ellipse(5, (pnl.TIM.Height div 2)+10, 50, (pnl.TIM.Height div 2)+20);
                       Ellipse(5, (pnl.TIM.Height div 2)+5, 50, (pnl.TIM.Height div 2)+15);
                       pnl.TIM.Canvas.Brush.Color:= clwhite;
                       Ellipse(5, (pnl.TIM.Height div 2), 50, (pnl.TIM.Height div 2)+10);
                   end;
               end;
               14: begin
                   pnl.img_No := -1;
               end;
            end;
        except

        end;

        pnl.Parent := FCFM.MeisiForm;
        pnl.Visible:= true;
    except end;

        FCFM.ary_TFC_Comp[FCFM.count_tec_comp] := pnl;
        inc(FCFM.count_tec_comp);

    //FCFM.comp.Items[i].Create(FCFM);
    FCFM.comp.Items[i] := pnl;
    FCFM.comp.Items[i].Visible:= true;
    //showmessage(FCFM.setdir +ExtractFileName(savefile));
   // showmessage(FCFM.comp.Items[i].hint);

    FCFM.comp.Items[i].hint := FCFM.setdir +ExtractFileName(savefile);
    FCFM.comp.Items[i].Tag := 1;
    //create_panel := pnl;
 // end;
end;

function create_memo2(savefile:string;i:integer;pnl:TMemo;s:string;sw:boolean):TMemo;
var
  tags:integer;
begin
  with FCFM.comp.Items[i] do begin
      //showmessage(savefile);
      Hint := {FCFM.setdir + FCFM.dir +} savefile;
      name := 'y' + inttostr(i);
      {pnl.top := FCFM.TrackBar1.Position;
      pnl.Left := FCFM.TrackBar2.Position;
      pnl.Width := FCFM.TrackBar4.Position;
      pnl.Height := FCFM.TrackBar3.Position;}
      pnl.Visible := not true;
      pnl.Parent := Parent;
      tags := tag;
  end;
  //if loadPIC then begin
  FCFM.comp.Items[i].Visible:= false;
  pnl.hint := {FCFM.setdir +ExtractFileName}(savefile);
  //showmessage(pnl.Hint);
    try

      if sw then begin
         pnl.Lines.Add(s+Inttostr(FCFM.combobox1.ItemIndex)+'→'+ Inttostr(FCFM.combobox9.ItemIndex));
         pnl.Lines.Add(FCFM.ComboBox1.Text);
         pnl.Lines.Add(FCFM.ComboBox9.Text);
         pnl.Lines.SaveToFile(FCFM.comp.Items[i].hint);
      end else begin
         pnl.Lines.LoadFromFile(FCFM.comp.Items[i].hint);
      end;
    except end;

    //FCFM.comp.Items[i].Create(FCFM);
    FCFM.comp.Items[i] := pnl;
    //showmessage(FCFM.comp.Items[i].Hint);
    //FCFM.comp.Items[i].Align:= alLeft;
    //FCFM.comp.Items[i].Visible:= true;
    //showmessage(FCFM.setdir +ExtractFileName(savefile));
   // showmessage(FCFM.comp.Items[i].hint);



    FCFM.comp.Items[i].Tag := tags;
    create_Memo2 := pnl;
 // end;
end;


function create_comp(cmp:TControl;p:TWinControl;i,tp,lf,dt,ht:integer):boolean;
begin
  with cmp do begin;
    Parent := p;
    top    := tp;
    Left   := lf;
    width  := dt;
    height := ht;
    if cmp = TFC_comp.Create(FCFM) then
      Name := 'm' + inttostr(i);
    if cmp = TMemo.Create(FCFM) then
      Name := 'y' + inttostr(i);
    Hint := '';
    Tag := i;
    Enabled := true;
    Visible:= true;
  end;
  FCFM.comp.Add(cmp);
end;

function create_qrcomp1(bmp:Tbitmap;cmp:TMemo;p:TControl;i,tp,lf,dt,ht:integer):boolean;
var
  Rect1:TRect;
begin
  with bmp.Canvas do begin;
    with Rect1 do begin
      begin//ここでコピー先の位置を決める
        Top:=tp;Left:=lf;
        Right:=dt;Bottom:=ht;
      end;
      font := cmp.Font;
      pen.Color := cmp.Font.Color;

      //TextRect(Rect1,lf,tp,'aaaaaa');
      Rectangle(Rect1);
      TextRect(Rect1,lf,tp,cmp.Lines.Text);
         // stretchDraw(Rect1,);
    end;
  end;
end;

function create_qrcomp2(bmp:Tbitmap;cmp:TImage;p:TControl;i,tp,lf,dt,ht:integer):boolean;
var
  Rect1:TRect;
begin
  with bmp.Canvas do begin;
    with Rect1 do begin
      begin//ここでコピー先の位置を決める
        Top:=tp;Left:=lf;
        Right:=dt;Bottom:=ht;
      end;
      Rectangle(Rect1);
      stretchDraw(Rect1,cmp.Picture.Bitmap);
    end;
  end;

end;

function select_comp(s,dir2:string;tp,lf,ht,dt:integer):boolean;
begin
  if s = '流れ図' then begin
    create_comp(TFC_comp.Create(FCFM),FCFM.MeisiForm,1,tp,lf,dt,ht);
    create_TFC_comp(dir2 + inttostr(FCFM.comp.count div 3),FCFM.comp.Count -1,TFC_comp.Create(FCFM));
    FCFM.ComboBox6.Items.Add(inttostr(FCFM.comp.count div 3) + s);
    FCFM.ComboBox1.Items.Add(inttostr(FCFM.comp.count div 3) + s);
    FCFM.ComboBox9.Items.Add(inttostr(FCFM.comp.count div 3) + s);
  end else if s = '青矢印' then begin
    create_comp(TMemo.Create(FCFM),FCFM.MeisiForm,2,tp,lf,dt,ht);
    create_memo2( {FCFM.setdir + }dir2 + inttostr(FCFM.ComboBox6.Items.Count +1),FCFM.comp.Count -1,TMemo.Create(FCFM),s,true);
    FCFM.ComboBox6.Items.Add(inttostr(FCFM.ComboBox6.Items.Count+1) + s);
  end else if s = '赤矢印' then begin
    create_comp(TMemo.Create(FCFM),FCFM.MeisiForm,3,tp,lf,dt,ht);
    create_memo2( {FCFM.setdir + }dir2 + inttostr(FCFM.ComboBox6.Items.Count +1),FCFM.comp.Count -1,TMemo.Create(FCFM),s,true);
    FCFM.ComboBox6.Items.Add(inttostr(FCFM.ComboBox6.Items.Count+1) + s);
  end;
end;


function loadSeting(s:string):boolean;
var
  i,i1,i2,i3,i4,i5,count:integer;
  SL:TStringList;
  cmpname:string;
  M:Tlabel;
  s1,s2,s3,ss:string;
  st,st2:TStringList;
  img:TImage;
  J:TJPegImage;
  B:TBitmap;
begin
  SL := TStringList.Create;
  SL.Clear;
  SL.LoadFromFile(utf8toansi(s));
  //showmessage(utf8toansi(s));
  sl.Text:= ansitoutf8(sl.Text);
  M := TLabel.Create(FCFM);
  m.Parent := FCFM;
  m.visible := false;
  m.Caption:= '';
  st := TStringList.Create;
  st.Clear;
  //showmessage(sl.Text);

  B := TBitmap.Create;
  J :=TJpegImage.Create;
  try
    //J.LoadFromFile(FCFM.setdir + 'haikei');
    //B.Assign(J);
    //FCFM.MeisiPIC.Picture.Assign(B);

    FCFM.MeisiForm.Width:= strtoint(sl[0]);
    FCFM.MeisiForm.Height:= strtoint(sl[1]);
    count := strtoint(sl[2]) +1;
    B.Canvas.Create;
    B.Width := FCFM.MeisiPIc.Width;
    B.Height := FCFM.MeisiPIc.Height;
    B.Canvas.Brush.Color:= clWhite;
    B.Canvas.Rectangle(0,0,B.Width,B.Height);
    FCFM.MeisiPIC.Picture.Assign(B);
    J.Assign( FCFM.MeisiPIC.Picture.Bitmap );
    J.SaveToFile(FCFM.setdir + 'haikei');
  except

  end;
  B.Free;
  J.Free;

  i := 0;
  i1 := 0;
  //showmessage(sl.Text);

  while i < Count  do begin
    //showmessage(sl[i+5] +','+ sl[i+6]+','+ sl[i+7] +','+ sl[i+8]);
    if SL[i+3] = '1' then begin
      try
        create_comp(TFC_comp.Create(FCFM),FCFM.MeisiForm,1,strtoint(SL[i+5]),strtoint(SL[i+6]),strtoint(SL[i+7]),strtoint(SL[i+8]));
        create_TFC_comp({extractfilepath(paramstr(0))+}sl[i+2],FCFM.comp.Count -1,TFC_comp.Create(FCFM));
        FCFM.ComboBox6.Items.Add( inttostr((i1 div 3)+1) + '流れ図');
        FCFM.ComboBox1.Items.Add( inttostr((i1 div 3)+1) + '流れ図');
        FCFM.ComboBox9.Items.Add( inttostr((i1 div 3)+1) + '流れ図');
      except end;
      cmpname := '流れ図';

    end else if SL[i+3] = '2' then begin
      try
        create_comp(TMemo.Create(FCFM),FCFM.MeisiForm,2,strtoint(SL[i+5]),strtoint(SL[i+6]),strtoint(SL[i+7]),strtoint(SL[i+8]));
        create_memo2(sl[i+4],FCFM.comp.Count -1,TMemo.Create(FCFM),'青矢印',false);
        FCFM.ComboBox6.Items.Add( inttostr((i1 div 3)+1) + '青矢印');
      except end;
      cmpname := '青矢印';
    end else if SL[i+3] = '3' then begin
      try
        create_comp(TMemo.Create(FCFM),FCFM.MeisiForm,3,strtoint(SL[i+5]),strtoint(SL[i+6]),strtoint(SL[i+7]),strtoint(SL[i+8]));
        create_memo2(sl[i+4],FCFM.comp.Count -1,TMemo.Create(FCFM), '赤矢印',false);
        FCFM.ComboBox6.Items.Add( inttostr((i1 div 3)+1) + '赤矢印');
      except end;
      cmpname := '赤矢印';
    end;


    with FCFM.comp.Items[i1] do begin
      s1 := sl[i+3];
//      showmessage(s1);
      //tag := strtoint(SL[i+3]);
      //hint := SL[i+3];
      //setfilename(st,FCFM.comp.Items[i1]);
      //showmessage(st.Text + ' ' + s2);
      if cmpname = '写真' then begin
        img := TImage.Create(FCFM);
        if st.Count > 0 then begin
          B := TBitmap.Create;
          J :=TJpegImage.Create;
          try
            J.LoadFromFile(st[0]);
            B.Assign(J);
          except end;
          img.Picture.Assign(B);
        end;
        create_pic(hint,FCFM.comp.Count-1,img,false);
        B.Free;
        J.Free;
      end;
      if cmpname = '流れ図' then begin

      end else if  cmpname = 'メモ' then begin
        if st.Count > 0 then begin
          try
            //if st[0] = null then
            //showmessage(ansitoutf8(st[0]));
            //showmessage((st.Text));
            st2 := TStringLIst.Create;
            st2.LoadFromFile(utf8toansi(st[0]));
            m.Caption:= st2.Text;
            st2.Free;
          except end;
          m.Font.Name := st[1];
          m.Font.Size := strtoint(st[2]);
          m.Font.Color := strtoint(st[3]);

          if st.Count >= 5 then begin
            i5 := 1;
          end else begin
            i5 := 0;
          end;
          if st[3] = 'fsBold' then begin
            m.Font.Style := [fsBold];
            i5 := i5 + 1;
          end;
          if st[3 + i5] = 'fsItalic' then begin
            m.Font.Style := [fsItalic];
            i5 := i5 + 1;
          end;
          if st[3 + i5] = 'fsUnderline' then begin
            m.Font.Style := [fsUnderline];
            i5 := i5 + 1;
          end;
          if st[3 + i5] = 'fsStrikeOut' then begin
            m.Font.Style := [fsStrikeOut];
          end;
        end;
        //showmessage(hint);
        //showmessage(st.Text);
        //create_TFC_comp({extractfilepath(paramstr(0))+}st[0],FCFM.comp.Count -1,TFC_comp.Create(FCFM));//(st[0],FCFM.comp.Count-1,M,TFC_comp.Create(FCFM));
      end;
      i := i + 6;
      inc(i1);
      //showmessage(s1);
    end;
  end;
  i := 0;
  i1 := 0;
  while i < Count -1 do begin
    with FCFM.comp.Items[i1] do begin
      //tag := strtoint(SL[i+3]);
      //hint := SL[i+4];
      //showmessage(sl.Text);
      //showmessage(sl[i+5] +','+ sl[i+6]+','+ sl[i+7] +','+ sl[i+8]);
      TOP := strtoint(SL[i+5]);
      LEFT := strtoint(SL[i+6]);
      Height := strtoint(SL[i+7]);
      Width := strtoint(SL[i+8]);
      i := i + 6;
      inc(i1);
    end;
  end;
  M.free;
  SL.Free;
end;

function saveSeting(s:string):boolean;
var
  i:integer;
  SL:TStringList;
  B:Tbitmap;
  J:TJPegImage;
begin
  SL := TStringList.Create;
  SL.Clear;
  i := 0;
  sl.add(inttostr(FCFM.MeisiForm.Width));
  sl.add(inttostr(FCFM.MeisiForm.Height));
  sl.Add(inttostr((FCFM.comp.Count -1) * 6));
  while i < FCFM.comp.Count do begin
    with FCFM.comp.Items[i] do begin
      //SL.add((Name));
      SL.add(inttostr(tag));
      SL.add( {FCFM.savedir +} utf8toansi(hint));

      SL.add(inttostr(TOP));
      SL.add(inttostr(LEFT));
      SL.add(inttostr(Height));
      SL.add(inttostr(Width));
      inc(i);
    end;
  end;

  //showmessage(sl.Text);
  SL.SaveToFile((s));
  SL.Free;
end;

















function Priset1:boolean;
var
  st:TStringList;
  searchdir:string;
begin
  if FCFM.ListBox1.Items.Count = 0 then begin
    //CreateDirUTF8(ansitoutf8(ExtractFilePath( Paramstr(0) )) + 'サンプル.Label'); { *Converted from CreateDir* }
    {st := TStringList.Create;
    st.Text :=
    '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;9' + chr(13)
    + '20' + chr(13)
    + '68' + chr(13)
    + '36' + chr(13)
    + '261' + chr(13)
    + '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;14' + chr(13)
    + '63' + chr(13)
    + '68' + chr(13)
    + '36' + chr(13)
    + '261' + chr(13)
    + '2' + chr(13)
    + '0;ＭＳ Ｐゴシック;10' + chr(13)
    + '108' + chr(13)
    + '9' + chr(13)
    + '94' + chr(13)
    + '321' + chr(13)
    + '1' + chr(13)
    + '0' + chr(13)
    + '27' + chr(13)
    + '9' + chr(13)
    + '62' + chr(13)
    + '53' + chr(13);
    //showmessage(ansitoutf8(ExtractFilePath( Paramstr(0) )) + '名刺サンプル' + '\Meisi.mpr');
    st.SaveToFile((ExtractFilePath( Paramstr(0)) + utf8toansi('サンプル.Label' + '\Meisi.mpr')));
    st.Free;
    {FCFM.setprjdir := ExtractFilePath( Paramstr(0) ) + '名刺サンプル' + dir;
    loadseting(ExtractFilePath( Paramstr(0) ) + '名刺サンプル' + '\Meisi.mpr');}
    SearchDir := ansitoutf8(ExtractFilePath( Paramstr(0) ));
    EnumFileFromDir(SearchDir);
    //FCFM.ListBox1.ItemIndex := 0;
    //FCFM.ListBox1DblClick(FCFM.ListBox1);
  end;
end;

procedure TCompList.Put(Index: Integer; const Value: TControl);
begin
  inherited Put( Index, Value );
end;

destructor TCompList.Destroy;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Free;
  inherited Destroy;
end;


procedure TFCFM.Button10Click(Sender: TObject);
begin

end;

procedure TFCFM.Button12Click(Sender: TObject);
var
  s:string;
begin
  s := ( FCFM.setprjdir + 'ForwCreate.csv');
  saveSeting(utf8toansi(s));
end;

procedure TFCFM.Button2Click(Sender: TObject);
var
  s:string;
begin
      s := combobox10.Text;
      select_comp(s,
                  FCFM.setprjdir,
                  strtoint(combobox2.Text),
                  strtoint(combobox3.Text),
                  strtoint(combobox4.Text),
                  strtoint(combobox5.Text));

      FCFM.ComboBox6.ItemIndex := FCFM.ComboBox6.Items.Count -1;
      MeisiPIcPaint(Sender);
end;

procedure TFCFM.Button5Click(Sender: TObject);
var
  i:integer;
  m:TMemo;
begin
    i := combobox6.ItemIndex;
   if i = -1 then begin
     showmessage('項目が選択されていません');
     exit;
   end;
    try
      m :=TMemo.Create(owner);
    //showmessage(FCFM.comp.Items[(i*2)+1].Hint+ ';'+ FCFM.comp.Items[(i*3)+1].Hint);
      m.Lines.LoadFromFile(extractfilepath(paramstr(0))+(FCFM.comp.Items[(i*3)+1].Hint));
      //showmessage(m.Lines.Text);
      m.lines.clear;
      m.Lines.SaveToFile(extractfilepath(paramstr(0))+(FCFM.comp.Items[(i*3)+1].Hint));
      m.Free;
    except end;

   try
     comp.Items[i*3].free;
   except end;
   try
    comp.Delete(i*3);
   except end;
   combobox6.Items.delete(i);
   combobox6.text := '';
end;

procedure TFCFM.Button6Click(Sender: TObject);
begin

end;

procedure TFCFM.Button7Click(Sender: TObject);
var
  m:TMemo;
  i:integer;
begin
  i := combobox6.ItemIndex;
   if i = -1 then begin
     showmessage('項目が選択されていません');
     exit;
   end;
    savedir := FCFM.setprjdir;
  if 0 < ansipos('流れ図',combobox6.Text) then begin
    try
      FCFM.ary_TFC_Comp[i].Top:= FCFM.setCompIMG.Top;
      FCFM.ary_TFC_Comp[i].Left:= FCFM.setCompIMG.Left;
      FCFM.ary_TFC_Comp[i].Width:= FCFM.setCompIMG.Width;
      FCFM.ary_TFC_Comp[i].Height:= FCFM.setCompIMG.Height;
    except end;
  end else if 0 < ansipos('矢印',combobox6.Text) then begin
    try

      if (combobox1.Text ='') or (combobox9.Text ='') or (combobox10.Text ='') then begin
        showmessage('必要項目のいずれかが入力されていません');
        exit;
      end;
      m :=TMemo.Create(owner);
    //showmessage(FCFM.comp.Items[(i*2)+1].Hint+ ';'+ FCFM.comp.Items[(i*3)+1].Hint);
      m.Lines.LoadFromFile(extractfilepath(paramstr(0))+(FCFM.comp.Items[(i*3)+1].Hint));
      //showmessage(m.Lines.Text);
      m.Clear;
      m.lines.add( combobox10.Text+Inttostr(FCFM.combobox1.ItemIndex)+'→'+ Inttostr(FCFM.combobox9.ItemIndex));
      m.lines.add( combobox1.Text );
      m.lines.add( combobox9.Text );
      m.Lines.SaveToFile(extractfilepath(paramstr(0))+(FCFM.comp.Items[(i*3)+1].Hint));
      m.Free;
    except end;
  end;
end;

procedure TFCFM.Button8Click(Sender: TObject);
begin

end;

function print_meisi(size:real):TBitmap;
var
  i,i1,i2,x,y,w,h:integer;
  s:string;
  st,st2:TStringList;
  b,b1:Tbitmap;
  J:TJpegImage;
  Rect,Rect1:Trect;

  function set_editcomp(i:integer;cmp:Tcontrol):TRect;
  var
    c:Tcontrol;
  begin
    with FCFM.comp.Items[i] do begin
      c := FCFM.comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      cmp.Hint := c.Hint;
      set_editcomp.Top := Top;
      set_editcomp.left := left;
      set_editcomp.Bottom := top + Height;
      set_editcomp.Right := left + Width;
    end;
  end;
begin

  B := TBitmap.Create;
  J := TJpegImage.Create;
  st := TStringList.Create;
  st.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  FCFM.meisi_base:= TBitmap.Create;
  rect.Top := 0;
  rect.Left := 0;
  rect.Right := trunc(FCFM.MeisiPic.Width * (size));
  rect.Bottom := trunc(FCFM.MeisiPic.Height * (size));

  FCFM.meisi_base := FCFM.MeisiPic.Picture.Bitmap;

  FCFM.meisi_base.Width := rect.Right;
  FCFM.meisi_base.Height := rect.Bottom;

  //FCFM.meisi_base.Canvas.StretchDraw(rect, FCFM.MeisiPIc.Picture.Bitmap);


  for i := 0 to FCFM.comp.count - 1 do begin

    y := trunc(FCFM.comp.Items[i].Top * size);
    x := trunc(FCFM.comp.Items[i].Left * size);
    h := trunc(FCFM.comp.Items[i].Height * size);
    w := trunc(FCFM.comp.Items[i].Width * size);

    //Y := y *2;
   // x := x * 2;
    //h := h * 2;
    //w := w * 2;

    setfilename(st,FCFM.comp.Items[i]);
    Rect1 := set_editcomp(i,FCFM.comp.Items[i]);

    rect := rect1;

    Rect1.Top := trunc(Rect1.Top * size);
    Rect1.Left := trunc(Rect1.Left * size);
    rect1.Right := trunc(rect1.Right* size);
    Rect1.Bottom := trunc(Rect1.Bottom * size);

    Rect.Top := trunc(Rect1.Top * size-0.5);
    Rect.Left := trunc(Rect1.Left * size-0.5);
    rect.Right := trunc(rect1.Right* size-0.5);
    Rect.Bottom := trunc(Rect1.Bottom * size-0.5);

    SetCurrentDirUTF8(ansitoutf8(ExtractFilePath( Paramstr(0) ))); { *Converted from SetCurrentDir* }


    if FCFM.comp.Items[i].Tag = 2 then begin
      with FCFM.meisi_base.Canvas do begin
        st2.LoadFromFile(st[0]);
        font.Name := st[1];
        font.Size := trunc(strtoint(st[2])*size);
        pen.Color := strtoint(st[3]);
        brush.Style := bsClear;
        i2 :=0;
        for I1 := 0 to st2.Count - 1 do begin
          TextRect(Rect1,x,y+ i2 ,st2[i1]);
          i2 := i2 + TextHeight(st2[i1]);
        end;
      end;
    end;
    if FCFM.comp.Items[i].Tag = 1 then begin
      j.LoadFromFile(FCFM.comp.Items[i].hint);
      b.Assign(j);
      B1 := TBitmap.Create;
      b1.Width := rect1.Right;
      b1.Height := rect1.Bottom;
      b1.Canvas.StretchDraw(rect1,b);


      //FCFM.meisi_base.Canvas.Rectangle(Rect1);
      FCFM.meisi_base.Canvas.StretchDraw(Rect1,b);
      b1.Free;
    end;
  end;
  print_meisi := FCFM.meisi_base;

end;


function view_meisi():boolean;
var
  i,i1,i2,x,y,w,h:integer;
  s,set_name:string;
  st,st2:TStringList;
  b:Tbitmap;
  J:TJpegImage;
  Rect1:Trect;

  function set_editcomp(i:integer;cmp:Tcontrol):TRect;
  var
    c:Tcontrol;
  begin
    with FCFM.comp.Items[i] do begin
      c := FCFM.comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      //showmessage(inttostr(cmp.Tag));
      cmp.Hint := c.Hint;
      set_editcomp.Top := Top;
      set_editcomp.left := left;
      set_editcomp.Bottom := top + Height;
      set_editcomp.Right := left + Width;
    end;
  end;
begin
  FCFM.bmp_base := TBitmap.Create;
  FCFM.bmp_base.Canvas.Brush.Color := clBlack;
  FCFM.bmp_base.Width := FCFM.MeisiPIc.Width*4;
  FCFM.bmp_base.Height := FCFM.MeisiPIc.Height*4;
  FCFM.bmp_base.Canvas.Create;
  FCFM.bmp_base.Canvas.Brush.Color := clwhite;
  FCFM.bmp_base.Canvas.pen.Color := clBlack;

  B := TBitmap.Create;
  J := TJpegImage.Create;
  st := TStringList.Create;
  st.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  FCFM.meisi_base:= TBitmap.Create;
  FCFM.meisi_base := FCFM.MeisiPIc.Picture.Bitmap;


  for i := 0 to FCFM.comp.count - 1 do begin

    y := FCFM.comp.Items[i].Top;
    x := FCFM.comp.Items[i].Left;
    h := FCFM.comp.Items[i].Height * 4;
    w := FCFM.comp.Items[i].Width * 4;
    //showmessage(st.Text);
    setfilename(st,FCFM.comp.Items[i]);
    Rect1 := set_editcomp(i,FCFM.comp.Items[i]);
    //st.Text:= utf8toansi(st.Text);
    //showmessage(st.Text);
    SetCurrentDirUTF8(utf8toansi(ExtractFilePath( Paramstr(0) ))); { *Converted from SetCurrentDir* }
    //showmessage(inttostr(FCFM.comp.Items[i].Tag));
    if FCFM.comp.Items[i].Tag = 2 then begin
      with FCFM.meisi_base.Canvas do begin
        set_name := {ansitoutf8(ExtractFilePath( Paramstr(0) )) +} (utf8toansi(st[0]));
        //showmessage(utf8toansi(set_name));
        //showmessage(ansitoutf8(set_name));
        //showmessage(ansitoutf8(ExtractFilePath( Paramstr(0) ) + (utf8toansi(st[0]))));
        //showmessage((ExtractFilePath( Paramstr(0) ) + utf8toansi(st[0])));
        //showmessage((ExtractFilePath( Paramstr(0) ) + utf8toansi(st[0])));


        st2.LoadFromFile(utf8toansi(set_name));
        //showmessage(st2.Text + st[0]);
        font.Name := st[1];
        font.Size := strtoint(st[2]);
        pen.Color := strtoint(st[3]);
        brush.Style := bsClear;
        i2 :=0;
        for I1 := 0 to st2.Count - 1 do begin
          TextRect(Rect1,x,y+ i2 ,st2[i1]);
          i2 := i2 + TextHeight(st2[i1]);
        end;
      end;
    end else if FCFM.comp.Items[i].Tag = 1 then begin
      j.LoadFromFile(utf8toansi(FCFM.comp.Items[i].hint));
      b.Assign(j);
      FCFM.meisi_base.Canvas.Rectangle(Rect1);
      FCFM.meisi_base.Canvas.StretchDraw(Rect1,b);
    end;
  end;
  FCFM.bmp_base.Canvas.Draw(0,0,FCFM.meisi_base);
end;



procedure TFCFM.ComboBox1Click(Sender: TObject);
begin
  select_comp('メモ',
              FCFM.setprjdir,
              strtoint(combobox2.Text),
              strtoint(combobox3.Text),
              strtoint(combobox4.Text),
              strtoint(combobox5.Text));

  FCFM.ComboBox6.ItemIndex := FCFM.ComboBox6.Items.Count -1;
  FCFM.ComboBox6Change(Sender);
end;

procedure TFCFM.ComboBox2Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TFCFM.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin

end;

procedure TFCFM.ComboBox3Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TFCFM.ComboBox4Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TFCFM.Memo2DblClick(Sender: TObject);
begin

end;

procedure TFCFM.MenuItem1Click(Sender: TObject);
var
  path:string;
 begin
      path := ansitoutf8(ExtractFilePath( Paramstr(0) )) + listbox1.Items[listbox1.itemindex];
      try
        DeleteDirectory(path, false);
        listbox1.Update;
      except
      end;
end;

procedure TFCFM.Panel8Click(Sender: TObject);
begin

end;

procedure TFCFM.ComboBox5Change(Sender: TObject);
begin
  changcombobox;
end;

procedure TFCFM.ComboBox6Change(Sender: TObject);
var
  J:TJPegImage;
  B:TBitmap;
  ST:TStringList;
begin
  if 0 < ansipos('矢印',combobox6.Text) then begin

  end else if 0 < ansipos('メモ',combobox6.Text) then begin
    try
      set_editcomp(combobox6.itemIndex,memo1);
      try
        if image1.Visible then
          image1.Visible := not true;
        if image2.Visible then
          image2.Visible := not true;
      except

      end;
      ST := TStringList.Create;

      setfilename(st,memo1);
      if st.Count > 0 then begin
        try
          //showmessage(st[0]);
          //showmessage(ansitoutf8(st[0]));
          //showmessage(utf8toansi(st[0]));
          //showmessage(utf8decode(st[0]));

          memo1.Lines.LoadFromFile((st[0]));
          //memo1.Text:= (memo1.Text);
        except end;
        memo1.Font.Name := st[1];
        //memo1.ReadOnly:= not true;
        //showmessage(st[0]+st[1]+st[2]);
        memo1.Font.Size := strtoint(st[2]);
      end;
      memo1.Visible := true;
      FCFM.Label5.Visible:= true;
   //   showmessage(FCFM.Memo1.Font.Name);
     // showmessage(FCFM.Label5.Font.Name);

      FCFM.Label5.Font := FCFM.Memo1.Font;
     // FCFM.Label5.Font.Size := FCFM.Memo1.Font.Size;
     //  FCFM.Label5.Font.Style := FCFM.Memo1.Font.Style;
      //FCFM.Label5.AutoSize:= false;
      //FCFM.Label5.WordWrap:=true;
      FCFM.Label5.Caption:= FCFM.Memo1.Text;
      st.Free;
    except

    end;
  end else if 0 < ansipos('流れ図',combobox6.Text) then begin
    try
      //set_editcomp(combobox6.itemIndex,memo1);


      ST := TStringList.Create;

      setfilename(st,memo1);
      if st.Count > 0 then begin
        try
          //showmessage(st[0]);
          //showmessage(ansitoutf8(st[0]));
          //showmessage(utf8toansi(st[0]));
          //showmessage(utf8decode(st[0]));

          memo1.Lines.LoadFromFile((st[0]));
          //memo1.Text:= (memo1.Text);
        except end;
        memo1.Font.Name := st[1];
        //memo1.ReadOnly:= not true;
        //showmessage(st[0]+st[1]+st[2]);
        memo1.Font.Size := strtoint(st[2]);
      end;
      memo1.Visible := true;
      FCFM.Label5.Visible:= true;
   //   showmessage(FCFM.Memo1.Font.Name);
     // showmessage(FCFM.Label5.Font.Name);

      FCFM.Label5.Font := FCFM.Memo1.Font;
     // FCFM.Label5.Font.Size := FCFM.Memo1.Font.Size;
     //  FCFM.Label5.Font.Style := FCFM.Memo1.Font.Style;
      //FCFM.Label5.AutoSize:= false;
      //FCFM.Label5.WordWrap:=true;
      FCFM.Label5.Caption:= FCFM.Memo1.Text;
      st.Free;
    except

    end;
  end;

end;

procedure TFCFM.FormCreate(Sender: TObject);
begin
 //createmeomo;
  {$IFDEF Windows}
    dir := '\';
  {$ENDIF}
  {$IFDEF LINUX}
   dir := '/';
  {$ENDIF}
  {$IFDEF Darwin}
     dir := '/';
  {$ENDIF}
  dwncount := 0;
  comp := TCompList.Create;
  comp.clear;
  QrComp := TCompList.Create;
  QrComp.clear;
  setMeisiSize;
  setSizeCombo;
  count_tec_comp := 0;
    //FCFM.setcompIMG := Timage.Create(FCFM);
  with FCFM.setcompIMG do begin
    parent := FCFM.MeisiForm;
    visible := true;
  end;
  setMoveCompSet(
    50,
    50,
    50,
    50
  );
  combobox7.ItemIndex := combobox7.Items.count div 2;
  combobox8.ItemIndex := combobox7.Items.count div 2;

  FCFM.crentdir := ExtractFilePath( Paramstr(0) );
  SearchDir := ExtractFilePath( Paramstr(0) );
  EnumFileFromDir(SearchDir);
  Priset1;
end;

procedure TFCFM.ListBox1DblClick(Sender: TObject);
var
  s,s1:string;
  i:integer;
begin
  if FCFM.ListBox1.ItemIndex = -1 then
    exit;
  FCFM.ComboBox6.Items.Clear;
  //resetcomp;

  FCFM.MeisiForm.Visible := true;
  loadfile := ansitoutf8(ExtractFilePath( Paramstr(0) )) + listbox1.Items[listbox1.itemindex] + dir +'ForwCreate.csv';
   FCFM.setprjdir := ansitoutf8(ExtractFilePath( Paramstr(0) )) + listbox1.Items[listbox1.itemindex] + dir;
   s := FCFM.setprjdir;
     s1 := '';
     for i := 0 to length(s)-1 do begin
       s1 := s1 + s[i]
     end;
     //showmessage(s1);
    s := ExtractFileExt(s1);
   FCFM.Image1.Picture.Clear;
   FCFM.Image2.Picture.Clear;
   memo1.Lines.Clear;
   label5.Caption:= '';
   setMeisiSize;
   FCFM.setdir := {ExtractFilePath( Paramstr(0) ) +} listbox1.Items[listbox1.itemindex] + dir;
   loadSeting(loadfile);
   button3.Enabled:= true;
   listbox1.Enabled:= false;
   //view_meisi();
  //showmessage('aaa');
end;

procedure TFCFM.Memo1Change(Sender: TObject);
var
  i:integer;
  cmpmemo:TComponent;
begin
  //ここに、メモ保存処理を記述する。
  for i := 0 to comp.Count -1 do begin
    if sender = comp.Items[i] then begin
      //cmpmemo := FindComponent('m' + inttostr(i));

      create_memo( FCFM.setprjdir + inttostr(i),i,compset,TLabel.Create(FCFM),true);
    end;
  end;
end;

procedure TFCFM.ComboBox1Change(Sender: TObject);
begin
  combobox9.Enabled:= true;
end;

procedure TFCFM.ComboBox9Change(Sender: TObject);
begin
  button2.Enabled:=true;
end;

procedure TFCFM.GroupBox4Click(Sender: TObject);
begin

end;

procedure TFCFM.Image1Click(Sender: TObject);
var
  i:integer;
begin
  for i := 0 to FCFM.comp.Count -1 do begin
    if FCFM.comp[i] = sender then begin
     // showmessage(FCFM.comp[i].Name + char(13)+ inttostr(i));
      if FCFM.comp[i].Name = 'i' + inttostr(i) then begin
        //showmessage(inttostr(i div 2));
        FCFM.ComboBox6.ItemIndex:= i div 2;
      end else if FCFM.comp[i].Name = 'l' + inttostr(i) then begin
        //showmessage(inttostr(i div 3));
        FCFM.ComboBox6.ItemIndex:= i div 3;
      end;
      //FCFM.Memo2.Visible:=false;
      setMoveCompSet(
          FCFM.comp[i].Parent.Top,
          FCFM.comp[i].Parent.Left,
          FCFM.comp[i].Parent.Height,
          FCFM.comp[i].Parent.Width
      );
      FCFM.ComboBox6Change(FCFM.ComboBox6);

    end;
  end;

end;

procedure TFCFM.Image1DblClick(Sender: TObject);
    var
      i,i1:integer;
    begin
      for i := 0 to FCFM.comp.Count -1 do begin
        if FCFM.comp[i] = sender then begin
         // showmessage(FCFM.comp[i].Name + char(13)+ inttostr(i));
          if FCFM.comp[i].Name = 'l' + inttostr(i) then begin
            FCFM.ComboBox6.ItemIndex:= i div 2;
            i1 := (i div 3);
            editNo_tmp := i1;
            ary_TFC_Comp[i1].TBtn.Visible:=true;
            ary_TFC_Comp[i1].TMem.Visible:=true;
          end;
          if FCFM.comp[i].Name = 'i' + inttostr(i) then begin
            //showmessage(inttostr(i div 2));
            FCFM.ComboBox6.ItemIndex:= i div 2;
            i1 := (i div 3);
            ary_TFC_Comp[i1].TIM.Canvas.Brush.Color:= clWhite;
            ary_TFC_Comp[i1].TIM.Canvas.Clear;
            ary_TFC_Comp[i1].TIM.Canvas.Rectangle(0,0,ary_TFC_Comp[i1].TIM.Width,ary_TFC_Comp[i1].TIM.Height);
            ary_TFC_Comp[i1].TIM.Canvas.Pen.Color:= clblack;
            ary_TFC_Comp[i1].TIM.Canvas.Pen.Width:=2;
            case ary_TFC_Comp[i1].img_No of
               0: begin
                  ary_TFC_Comp[i1].TIM.Canvas.Rectangle(5,ary_TFC_Comp[i1].TIM.Height div 2,45,(ary_TFC_Comp[i1].TIM.Height div 2)+20);
                  ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'処理');
               end;
               1: begin
                    ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'判断');
                    with ary_TFC_Comp[i1].TIM.Canvas do begin
                         MoveTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                         LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                         LineTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+25);
                         LineTo(25,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                         LineTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
               2: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'定義済');
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,20,'処理');
                   ary_TFC_Comp[i1].TIM.Canvas.Rectangle(5,ary_TFC_Comp[i1].TIM.Height div 2,45,(ary_TFC_Comp[i1].TIM.Height div 2)+20);
                   ary_TFC_Comp[i1].TIM.Canvas.Rectangle(15,ary_TFC_Comp[i1].TIM.Height div 2,35,(ary_TFC_Comp[i1].TIM.Height div 2)+20);
               end;
               3: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'手作業');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(30,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
               4: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'組合わせ');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
               5: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'抜出');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(25,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(25,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(40,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(25,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
               6: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'照合');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+5);

                       MoveTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+25);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+25);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                   end;
               end;
              7: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'分類');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+5);

                       MoveTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+25);
                       LineTo(20,(ary_TFC_Comp[i1].TIM.Height div 2)+25);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                   end;
               end;
               8: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'手操作');
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,20,'入力');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+8);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+8);
                   end;
               end;
               9: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'入出力');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(30,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(5,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
              10: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'オンライン');
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,20,'記録');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(30,(ary_TFC_Comp[i1].TIM.Height div 2)+10);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+10);
                       LineTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
              11: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'書類');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+10);
                       LineTo(30,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
              12: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'紙カード');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       MoveTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                       LineTo(35,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       LineTo(10,(ary_TFC_Comp[i1].TIM.Height div 2)+10);
                       LineTo(15,(ary_TFC_Comp[i1].TIM.Height div 2)+5);
                   end;
               end;
              13: begin
                   ary_TFC_Comp[i1].TIM.Canvas.TextOut(2,2,'磁気ディスク');
                   with ary_TFC_Comp[i1].TIM.Canvas do begin
                       ary_TFC_Comp[i1].TIM.Canvas.Brush.Color:= clblack;
                       //Arc(5, (ary_TFC_Comp[i1].TIM.Height div 2), 50, (ary_TFC_Comp[i1].TIM.Height div 2)+10,300,10,300,20);
                       Ellipse(5, (ary_TFC_Comp[i1].TIM.Height div 2)+10, 50, (ary_TFC_Comp[i1].TIM.Height div 2)+20);
                       Ellipse(5, (ary_TFC_Comp[i1].TIM.Height div 2)+5, 50, (ary_TFC_Comp[i1].TIM.Height div 2)+15);
                       ary_TFC_Comp[i1].TIM.Canvas.Brush.Color:= clwhite;
                       Ellipse(5, (ary_TFC_Comp[i1].TIM.Height div 2), 50, (ary_TFC_Comp[i1].TIM.Height div 2)+10);
                   end;
               end;
               14: begin
                   ary_TFC_Comp[i1].img_No := -1;
               end;
            end;
            try
            ary_TFC_Comp[i1].st := TStringlist.Create;
            ary_TFC_Comp[i1].st.Clear;
            ary_TFC_Comp[i1].st.Add(inttostr(ary_TFC_Comp[i1].img_No));
            ary_TFC_Comp[i1].st.SaveToFile(FCFM.setprjdir + inttostr(i1)+'_No');
            ary_TFC_Comp[i1].st.Free;
            inc(ary_TFC_Comp[i1].img_No);
            except

            end;
          end else if FCFM.comp[i].Name = 'l' + inttostr(i) then begin
            //showmessage(inttostr(i div 3));
            FCFM.ComboBox6.ItemIndex:= i div 3;
          end;
          //FCFM.Memo2.Visible:=false;
          setMoveCompSet(
              FCFM.comp[i].Parent.Top,
              FCFM.comp[i].Parent.Left,
              FCFM.comp[i].Parent.Height,
              FCFM.comp[i].Parent.Width
          );
          FCFM.ComboBox6Change(FCFM.ComboBox6);

        end;
      end;

end;

procedure TFCFM.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFCFM.Image2Click(Sender: TObject);
begin

end;

procedure TFCFM.Image2DblClick(Sender: TObject);
begin
  Button6Click(Sender);
end;

procedure TFCFM.Label5Click(Sender: TObject);
begin

end;

procedure TFCFM.Label5DblClick(Sender: TObject);
begin



end;



procedure TFCFM.ListBox1Click(Sender: TObject);
begin

end;

procedure TFCFM.MeisiFormClick(Sender: TObject);
begin

end;

procedure TFCFM.MeisiPIcPaint(Sender: TObject);
var
  i,i1,i2:integer;
  m:TMemo;
begin
  m :=TMemo.Create(FCFM);
  m.Lines.Clear;
  for i := 0 to FCFM.comp.Count -1 do begin
    if FCFM.comp.Items[i].IsControl then
      exit;
    try
      if 1 < length(FCFM.comp.Items[i].Hint) then begin

       //caption := FCFM.comp.Items[i].Hint;
        //showmessage(ExtractFilePath(Paramstr(0))+(FCFM.comp.Items[i].Hint));
        //showmessage((FCFM.comp.Items[i].Hint));
        m.Lines.LoadFromFile((FCFM.comp.Items[i].Hint));
        //showmessage(m.Lines.Text);
        if (-1 = FCFM.ComboBox6.Items.IndexOf( m.Lines[1] ) )
        or (-1 = FCFM.ComboBox6.Items.IndexOf( m.Lines[2] ) )
        then begin
          exit;
        end;
        i1 := FCFM.ComboBox6.Items.IndexOf( m.Lines[1] );
        if -1 < i1 then begin

          if 0 < ansipos('青矢印',' ' + m.Lines[0]) then begin
            FCFM.MeisiPIc.Canvas.Pen.Color:= clblue;
          end else if 0 < ansipos('赤矢印',' ' + m.Lines[0]) then begin
            FCFM.MeisiPIc.Canvas.Pen.Color:= clred;
          end;
          FCFM.MeisiPIc.Canvas.Pen.Width:= 4;
          FCFM.MeisiPIc.Canvas.MoveTo(FCFM.ary_TFC_Comp[i1].Left + (FCFM.ary_TFC_Comp[i1].Width div 2),
                                       (FCFM.ary_TFC_Comp[i1].Top + (FCFM.ary_TFC_Comp[i1].Height div 2)));
          //showmessage(inttostr(FCFM.ary_TFC_Comp[i1].Left + (FCFM.ary_TFC_Comp[i1].Width div 2)) + ' ' + inttostr(FCFM.ary_TFC_Comp[i1].Top + (FCFM.ary_TFC_Comp[i1].Height div 2)));
          i2 := FCFM.ComboBox6.Items.IndexOf( m.Lines[2] );

          if -1 < i2 then begin


            FCFM.MeisiPIc.Canvas.LineTo(FCFM.ary_TFC_Comp[i2].Left + (FCFM.ary_TFC_Comp[i2].Width div 2),
                                       (FCFM.ary_TFC_Comp[i2].Top + (FCFM.ary_TFC_Comp[i2].Height div 2)));
            //showmessage(inttostr(FCFM.ary_TFC_Comp[i2].Left + (FCFM.ary_TFC_Comp[i2].Width div 2)) + ' ' + inttostr(FCFM.ary_TFC_Comp[i2].Top + (FCFM.ary_TFC_Comp[i2].Height div 2)));

          end;
         end;
        end;
      except
      end

  end;
  m.Free;
end;


function  print():boolean;
var
  i,i1,i2,x,y,w,h:integer;
  s,set_name:string;
  st,st2:TStringList;
  b:Tbitmap;
  J:TJpegImage;
  Rect1,rect2:Trect;
  bx,bx2:integer;
  function set_editcomp(i:integer;cmp:Tcontrol):TRect;
  var
    c:Tcontrol;
  begin
    with FCFM.comp.Items[i] do begin
      //showmessage(FCFM.comp.Items[i].Hint);
      //showmessage(utf8toansi(FCFM.comp.Items[i].Hint));
      //showmessage(ansitoutf8(FCFM.comp.Items[i].Hint));
      c := FCFM.comp.Items[i];
      cmp.Width := c.Width;
      cmp.Height := c.Height;
      cmp.Tag := c.Tag;
      //showmessage(inttostr(cmp.Tag));
      cmp.Hint := (c.Hint);
      set_editcomp.Top := Top * bx;
      set_editcomp.left := left * bx;
      set_editcomp.Bottom := (top * bx) + (Height * bx);
      set_editcomp.Right := (left * bx) + (Width * bx);
    end;
  end;
begin
  bx := 3;
  bx2 := bx * bx;
  FCFM.bmp_base := TBitmap.Create;
  FCFM.bmp_base.Canvas.Brush.Color := clBlack;
  FCFM.bmp_base.Width := FCFM.MeisiPIc.Width*bx2;
  FCFM.bmp_base.Height := FCFM.MeisiPIc.Height*bx2;
  FCFM.bmp_base.Canvas.Create;
  FCFM.bmp_base.Canvas.Brush.Color:= clWhite;
  FCFM.bmp_base.Canvas.Rectangle(0,0,FCFM.bmp_base.Width,FCFM.bmp_base.Height);
  FCFM.bmp_base.Canvas.Brush.Color := clwhite;
  FCFM.bmp_base.Canvas.pen.Color := clBlack;

  B := TBitmap.Create;
  J := TJpegImage.Create;
  st := TStringList.Create;
  st.Clear;
  st2 := TStringList.Create;
  st2.Clear;
  FCFM.meisi_base:= TBitmap.Create;
  FCFM.meisi_base := FCFM.MeisiPIc.Picture.Bitmap;


  for i := 0 to FCFM.comp.count - 1 do begin

    y := FCFM.comp.Items[i].Top;
    x := FCFM.comp.Items[i].Left;
    h := FCFM.comp.Items[i].Height;
    w := FCFM.comp.Items[i].Width;
    //showmessage(st.Text);
    setfilename(st,FCFM.comp.Items[i]);
    Rect1 := set_editcomp(i,FCFM.comp.Items[i]);
    rect2 := rect1;
    rect2.Top:= rect2.Top * bx;
    rect2.Left:= rect2.Left * bx;
    rect2.Right:= rect2.Right * bx;
    rect2.Bottom:= rect2.Bottom * bx;

    //st.Text:= utf8toansi(st.Text);
    //showmessage(st.Text);
    SetCurrentDirUTF8(utf8toansi(ExtractFilePath( Paramstr(0) ))); { *Converted from SetCurrentDir* }
    //showmessage(inttostr(FCFM.comp.Items[i].Tag));
    if FCFM.comp.Items[i].Tag = 2 then begin
      with FCFM.bmp_base.Canvas do begin
       //showmessage(st.Text);
       set_name :=  (utf8toansi(st[0]));
       //showmessage(utf8toansi(set_name));
        st2.LoadFromFile((set_name));

        font.Name := st[1];
        font.Size := strtoint(st[2]) * bx2;
        pen.Color := strtoint(st[3]);
        brush.Style := bsClear;
        i2 :=0;
        for I1 := 0 to st2.Count - 1 do begin
          TextRect(Rect2,x*bx2,y*bx2+ i2 ,st2[i1]);
          i2 := i2 + TextHeight(st2[i1]);
        end;
      end;
    end else if FCFM.comp.Items[i].Tag = 1 then begin
      j.LoadFromFile((FCFM.comp.Items[i].hint));
      b.Assign(j);
      //FCFM.meisi_base.Canvas.Rectangle(Rect1);
      //FCFM.meisi_base.Canvas.StretchDraw(Rect1,b);
      FCFM.bmp_base.Canvas.StretchDraw(rect2,b);
    end;
  end;
  //FCFM.bmp_base.Canvas.Draw(0,0,FCFM.meisi_base);
  //form2.Image1.Width:= FCFM.bmp_base.Width;
  //form2.Image1.Height:=FCFM.bmp_base.Height;
  //form2.Image1.Picture.Graphic := FCFM.bmp_base;
end;

function pross(set_name,set_name2:string):boolean;
var
  sd,prss,sv: TProcess;
  ps:String;
begin
  sd := TProcess.Create(nil);
  sv := TProcess.Create(nil);
   { prss := TProcess.Create(nil);
    prss.CommandLine := 'sh -c "cat ' + set_name + ' > ' +
    extractfilepath(Paramstr(0))
    + set_name2 + '"';
    prss.Options := [poWaitOnExit, poUsePipes, poStderrToOutPut];
   }

    sd.CommandLine := 'sudo';
    sd.Execute;
    sd.Options := [poWaitOnExit, poUsePipes];
    sd.CommandLine := set_name + ' ' + extractfilepath(Paramstr(0))  +set_name2;
    //prss.Execute;
    sd.Execute;

  {
    ps := FCFM.password;

    sv.Executable:= '/bin/sh';
    sv.Parameters.Add('-c');
    sv.Parameters.Add('echo ' +ps+ ' | sudo -S cp -f ' + ExtractFilePath(Paramstr(0)) + set_name2 + ' ' + set_name);
    sv.Execute;
  }

  sd.Free;
  prss.Free;
  sv.Free;
end;

procedure TFCFM.Button9Click(Sender: TObject);
begin

end;

procedure TFCFM.Button1Click(Sender: TObject);
var
  i1:integer;
begin
         i1 := editNo_tmp;
         // showmessage(FCFM.comp[i].Name + char(13)+ inttostr(i));

            FCFM.ComboBox6.ItemIndex:= i1;

            //showmessage(inttostr(i1));
            ary_TFC_Comp[i1].TLB.Caption:= ary_TFC_Comp[i1].TMem.Lines.Text;
            ary_TFC_Comp[i1].TMem.Lines.SaveToFile( FCFM.setprjdir + inttostr(i1) + 'm');
            ary_TFC_Comp[i1].TMem.Visible:=false;
            ary_TFC_Comp[i1].TBtn.Visible:= false;

end;

procedure TFCFM.Button11Click(Sender: TObject);
var
  s:string;
begin
  s := '流れ図';
  select_comp(s,
              FCFM.setprjdir,
              strtoint(combobox2.Text),
              strtoint(combobox3.Text),
              strtoint(combobox4.Text),
              strtoint(combobox5.Text));

  FCFM.ComboBox6.ItemIndex := FCFM.ComboBox6.Items.Count -1;
  FCFM.ComboBox6Change(Sender);
end;

procedure TFCFM.Button13Click(Sender: TObject);
begin
  combobox1.Enabled := true;
end;

procedure TFCFM.Button3Click(Sender: TObject);
var
  s1:string;
begin
  resetcomp;
  FCFM.MeisiForm.Visible := true;
  listbox1.Enabled:= true;
  button3.Enabled:= false;
  if -1 = FCFM.ListBox1.Items.IndexOf(edit1.Text) then begin
  {$IFDEF Windows}
    s1 := ansitoutf8(ExtractFilePath( Paramstr(0) )) + edit1.Text + '.csv';
    FCFM.setprjdir := (s1 + dir);
    FCFM.setdir := ExtractFileName( s1 ) + dir;
    SearchDir := ansitoutf8(ExtractFilePath( Paramstr(0) ));
  {$ENDIF}
  {$IFDEF LINUX}
    s1 := (ExtractFilePath( Paramstr(0) )) + edit1.Text + '.csv';
    FCFM.setprjdir := (s1 + dir);
    FCFM.setdir := ExtractFileName( s1 ) + dir;
    SearchDir := (ExtractFilePath( Paramstr(0) ));
  {$ENDIF}
  {$IFDEF Darwin}
    s1 := (ExtractFilePath( Paramstr(0) )) + edit1.Text + '.csv';
    FCFM.setprjdir := (s1 + dir);
    FCFM.setdir := ExtractFileName( s1 ) + dir;
    SearchDir := (ExtractFilePath( Paramstr(0) ));
  {$ENDIF}

    CreateDirUTF8((s1));{ *Converted from CreateDir* }
    FCFM.MeisiForm.Width:= strtoint(combobox7.Text);
    FCFM.MeisiForm.Height:=strtoint(combobox8.Text);
    setMeisiSize;
    listbox1.Items.Clear;
    EnumFileFromDir(SearchDir);
    FCFM.comp.Free;
    FCFM.comp := TcompList.Create;
    FCFM.comp.Clear;
    FCFM.qrcomp.Free;
    FCFM.qrcomp := TcompList.Create;
    FCFM.qrcomp.Clear;
  {$IFDEF Windows}
    saveseting((FCFM.setprjdir + 'Meisi.mpr'));
  {$ENDIF}
  {$IFDEF LINUX}
   saveseting((FCFM.setprjdir + 'Meisi.mpr'));
  {$ENDIF}
  {$IFDEF Darwin}
     saveseting((FCFM.setprjdir + 'Meisi.mpr'));
  {$ENDIF}
  end;
end;

procedure TFCFM.Button4Click(Sender: TObject);
begin

end;

procedure TFCFM.print2Click(Sender: TObject);
begin

end;

function TFCFM.resetprot:boolean;
var
  i:integer;
begin
 with FCFM do begin

  for i := 0 to 30 do begin
    qrimg[i].free;
    QRLabel[i].free;
    QRMemo[i].free;
    QRImg2[i].free;
  end;
 end;
end;




procedure TFCFM.setCompIMGMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //if ( Y > 12 ) and ( X > 4 ) then begin
    FCFM.setCompIMG.ShowHint := true;
    if ( X > FCFM.setcompimg.width -15 ) and ( Y > FCFM.setcompimg.Height -25 ) then begin
      waku_sizeY_sw := true;
      waku_sizeX_sw := true;
    end else if X > FCFM.setcompimg.width -15 then begin
      waku_sizeY_sw := true;
    end else if Y > FCFM.setcompimg.Height -25 then begin
      waku_sizeX_sw := true;
    end;
    {waku_move_sw := true;
    ptY := Y;
    ptX := X;}
  //end
end;

procedure TFCFM.setCompIMGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  setX,setY:integer;
begin
  if waku_sizeY_sw then begin
    FCFM.setCompIMG.Hint := 'SizeX:' + inttostr(FCFM.setCompIMG.Width) + ' SizeY:' + inttostr(FCFM.setCompIMG.Height);
    if FCFM.setCompIMG.Width > 20 then begin
      with FCFM.setCompIMG do begin
        setX :=  X;
        width := setX
      end;
      with FCFM.waku do begin
        setX :=  X -10;
        width := setX
      end;
      FCFM.TrackBar4.Position := setX;
      FCFM.ComboBox5.Text := inttostr(setX);
      FCFM.UpDown4.Position := setX;
      if FCFM.setCompIMG.Width < 20 then begin
        FCFM.setCompIMG.Width := 30;
        FCFM.waku.Width:= 20;
        FCFM.TrackBar4.Position := 30;
        FCFM.ComboBox5.Text := inttostr(30);
        FCFM.UpDown4.Position := 30
      end;
    end else begin
     FCFM.setCompIMG.Width := 30;
     FCFM.waku.Width:= 20;
     FCFM.TrackBar4.Position := 30;
     FCFM.ComboBox5.Text := inttostr(30);
     FCFM.UpDown4.Position := 30
    end;
  end;
  if waku_sizeX_sw then begin
    if FCFM.setCompIMG.Height > 20 then begin
      with FCFM.setCompIMG do begin
        setY :=  Y;
        Height := setY
      end;
      with FCFM.waku do begin
        setY := Y-10;
        Height := setY
      end;
      FCFM.TrackBar3.Position := setY;
      FCFM.ComboBox4.Text := inttostr(setY);
      FCFM.UpDown3.Position := setY;
      if FCFM.setCompIMG.Height < 20 then begin
        FCFM.setCompIMG.Height := 30;
        FCFM.waku.Height:= 20;
        FCFM.TrackBar3.Position := 30;
        FCFM.ComboBox4.Text := inttostr(30);
        FCFM.UpDown3.Position := 30
      end;
    end else begin
     FCFM.setCompIMG.Height := 30;
     FCFM.waku.Height:= 20;
     FCFM.TrackBar3.Position := 30;
     FCFM.ComboBox4.Text := inttostr(30);
     FCFM.UpDown3.Position := 30
    end;
  end;
end;

procedure TFCFM.setCompIMGMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_sizeY_sw := not true;
  waku_sizeX_sw := not true;
  changtrackbar;
  FCFM.setCompIMG.ShowHint := not true;
end;

procedure TFCFM.TrackBar1Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TFCFM.TrackBar2Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TFCFM.TrackBar3Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TFCFM.TrackBar4Change(Sender: TObject);
begin
  changtrackbar;
end;

procedure TFCFM.UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TFCFM.UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TFCFM.UpDown3Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TFCFM.UpDown4Changing(Sender: TObject; var AllowChange: Boolean);
begin
  changupdown;
end;

procedure TFCFM.wakuMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_move_sw := true;
  FCFM.waku.ShowHint := true;
  ptY := Y;
  ptX := X;
end;

procedure TFCFM.wakuMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  setx,sety:integer;
begin
  if waku_move_sw then begin
    FCFM.waku.Hint := 'X:' + inttostr(FCFM.waku.Top) + ' Y:' + inttostr(FCFM.waku.Left);
    with FCFM.setCompIMG do begin
      setY := top + Y - ptY ;//FCFM.SpinEdit1.Value;
      setX := left + x - ptX ;//FCFM.SpinEdit2.Value;
      top := setY;
      left := setX;
    end;
    FCFM.TrackBar1.Position := setY;
    FCFM.TrackBar2.Position := setX;
    FCFM.ComboBox2.Text := inttostr(setY);
    FCFM.ComboBox3.Text := inttostr(setX);
    FCFM.UpDown1.Position := setY;
    FCFM.UpDown2.Position := setX;
  end;
end;

procedure TFCFM.wakuMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  waku_move_sw := not true;
  FCFM.waku.ShowHint := not true;
  changtrackbar;
end;

end.
