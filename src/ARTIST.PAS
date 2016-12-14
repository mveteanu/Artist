{$DEFINE shareware}


{$A+,B-,D-,F-,G+,I+,L-,O-,P-,Q-,R-,S-,T-,V-,X-,Y-}
{$M 16384,0,655360}

{$IFDEF CPU87} {$N+,E-} {$ELSE} {$N+,E+} {$ENDIF}

{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ                 Aceast program este realizat de:               บ
     บ                      Marian Adrian Veteanu                     บ
     บ                Liceul Nicolae Balcescu -  Pitesti              บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}


program Artist_Mouse;

uses graph,crt,printer,mouse,dos,
     fonturi1,fonturi2,fonturi3;

{----------------------------------------------------------------------------}

type  dimbuton = record lungime,latime,inaltime : byte;
                        spatiuint,spatiuext     : byte;
                 End;
      culbuton = record interior,contur:word;End;

{----------------------------------------------------------------------------}

const
  Versiune : string[4] = '1.0';

  model:array[0..11] of string = (
  '($AA, $55, $AA, $55, $AA, $55, $AA, $55);'#13#10,
  '($33, $33, $CC, $CC, $33, $33, $CC, $CC);'#13#10,
  '($F0, $F0, $F0, $F0, $0F, $0F, $0F, $0F);'#13#10,
  '($00, $10, $28, $44, $28, $10, $00, $00);'#13#10,
  '($00, $A0, $A0, $AA, $4E, $0A, $0A, $00);'#13#10,
  '($00, $00, $00, $18, $18, $00, $00, $00);'#13#10,
  '($00, $00, $3C, $3C, $3C, $3C, $00, $00);'#13#10,
  '($00, $7E, $7E, $7E, $7E, $7E, $7E, $00);'#13#10,
  '($02, $02, $FF, $20, $20, $20, $FF, $02);'#13#10,
  '($FF, $7E, $3C, $18, $18, $3C, $7E, $FF);'#13#10,
  '($00, $10, $10, $7C, $10, $10, $00, $00);'#13#10,
  '($00, $42, $24, $18, $18, $24, $42, $00);'#13#10);

  Patterns : array[0..11] of FillPatternType = (
  ($AA, $55, $AA, $55, $AA, $55, $AA, $55),
  ($33, $33, $CC, $CC, $33, $33, $CC, $CC),
  ($F0, $F0, $F0, $F0, $F, $F, $F, $F),
  (0, $10, $28, $44, $28, $10, 0, 0),
  (0,$A0,$A0,$AA,$4E,$0A,$0A,0),
  (0, 0, 0, $18, $18, 0, 0, 0),
  (0, 0, $3C, $3C, $3C, $3C, 0, 0),
  (0, $7E, $7E, $7E, $7E, $7E, $7E, 0),
  ($02,$02,$FF,$20,$20,$20,$FF,$02),
  ($FF, $7E, $3C, $18, $18, $3C, $7E, $FF),
  (0, $10, $10, $7C, $10, $10, 0, 0),
  (0, $42, $24, $18, $18, $24, $42, 0));


      wtg     : boolean = false;
      stpl    : boolean = false;
      efg     : byte=0;
      efs     : byte=0;
      marimef : word = 0;
      stilf   : word = 0;
      butu    : word = 2;
      nume    : string = '';
      rasp    : byte = 0;
      culu    : word = 15;
      dbut    : dimbuton = (lungime  : 40 ;  latime   : 40 ;inaltime : 3;
                          spatiuint: 20 ; spatiuext : 20);
      cbut    : culbuton = (interior : red; contur    : black);
      nrbut   : byte = 0;
      sprm    : byte = 30;sprc : byte =0;
      tipb    : boolean = false;
      mods    : array [0..11] of byte = (0,0,0,0,0,0,0,0,0,0,0,0);
      sirs    : array [0..14] of byte = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      sird    : array [0..14] of byte = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
      consti  : boolean = false;
      spri    : boolean = false;
      spric   : boolean = false;
      modlin  : array [1..04] of word = ($C3,$3,$FFF0,$FFFE);
      nrajuns : byte = 1;
      contprog: word = $133;
      procprog: word = $133;
      Culs    : array [0..15] of string[12] =( 'Black','Blue','Green','Cyan',
                 'Red','Magenta','Brown','LightGray','DarkGray','LightBlue',
                 'LightGreen','LightCyan','LightRed','LightMagenta'  ,
                 'Yellow','White');
      FillStyles : array[0..11] of string[14] =('EmptyFill', 'SolidFill',
                 'LineFill', 'LtSlashFill', 'SlashFill','BkSlashFill',
                 'LtBkSlashFill', 'HatchFill', 'XHatchFill','InterleaveFill',
                 'WideDotFill', 'CloseDotFill');
      LineStyles : array[0..4] of string[9] =('SolidLn', 'DottedLn',
                 'CenterLn', 'DashedLn', 'UserBitLn');
      Grosimi    : array[0..1] of string[10]=('NormWidth','ThickWidth');
      Stiluri    : array[0..10] of string[21] =('DefaultFont', 'TriplexFont',
                  'SmallFont', 'SansSerifFont', 'GothicFont','5 {ScriptFont}',
                  '6 {SimplexFont}', '7 {TriplexScriptFont}', '8 {ComplexFont}',
                  '9 {EuropeanFont}', '10 {BoldFont}');

{----------------------------------------------------------------------------}

var
    mute      : boolean;
    cursorales: boolean;
    heap      : pointer;
    x,y,dr,mo : integer;
    sir       : string;
    fis       : text;
    cl        : byte;
    act       : boolean;
    com,but   : byte;
    coml      : byte;
    linst     : Linesettingstype;
    cul,culo  : word;
    textst    : textsettingstype;
    OldPattern: FillPatternType;
    pm,pmf    : pointer;
    pm2       : pointer;
    sircom    : array [1..24] of Procedure;
    sirbut    : array [1..24] of string [10];
    coord     : array [1..24] of record cx,cy,cz,ct:integer;End;
    lun       : word;
    lin       : boolean;
    tri       : byte;
    FillInfo  : FillSettingsType;
    dircurent : dirstr;


{----------------------------------------------------------------------------}

{$IFDEF shareware} {$I sharewar.inc} {$ENDIF}

{----------------------------------------------------------------------------}

function stri(x:integer):string;
var strt:string;
  Begin
    str(x,strt);
    stri:=strt;
  End;

{----------------------------------------------------------------------------}

function strw(x:word):string;
var strt:string;
  Begin
    str(x,strt);
    strw:=strt;
  End;

{----------------------------------------------------------------------------}

function existimprim:boolean;
  Begin
    existimprim:=true;
    {$I-}
    write(lst,' ');
    {$I+}
    If ioresult<>0 then existimprim:=false;
  End;

{----------------------------------------------------------------------------}

Procedure printscr;
var
   viewport:viewporttype;
   palette:palettetype;
   init_y,final_y,bk_color,len_x,len_y:integer;
   bit:byte;
   Line:array[0..639] of byte;
   exit_f,is_Line:boolean;
   x,y:integer;
Procedure pxtodot;
   Begin
      If getpixel(x,y)<>bk_color then Begin Line[x]:=Line[x] or bit;
      is_Line:=true;End;End;

Procedure setcr;
Begin
writeln(lst);write(lst,#$1b+'A'#$08);End;

Procedure putLine;
var i:integer;
Begin
If is_Line then Begin write(lst,#$1b,+'*'#$01);write(lst,#128#2);
for i:=0 to 639 do write (lst,chr(Line[i]));End;
writeln(lst);is_Line:=false;
End;

Begin
getpalette(palette);bk_color:=palette.colors[getbkcolor];
getviewsettings(viewport);
with viewport do Begin len_x:=x2-x1;len_y:=y2-y1;End;
init_y:=0;final_y:=7;exit_f:=false;is_Line:=false;
setcr;
repeat
 for x:=0 to 639 do Line[x]:=bk_color;
 for x:=0 to 639 do Begin bit:=$80;
 for y:=init_y to final_y do Begin
     pxtodot;
     bit:=bit shr 1;
                             End;
                    End;
 putLine;init_y:=final_y+1;
 If init_y> len_y then exit_f:=true else Begin final_y:=init_y+7;
 If final_y>len_y then final_y:=len_y;   End;
until exit_f;
End;

{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ     Aici incep procedurile necesare construirii meniurilor     บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}

Procedure bell;
  Begin
    if not mute then
                  begin
                     sound(500);
                     delay(10);
                     nosound;
                  end;
  End;

Procedure MemoAtribute(a:boolean);
Begin
Case a of
 False : Begin
           GetFillSettings(FillInfo);
           GetLineSettings(Linst);
           Cul:=GetColor;
           GetTextSettings(Textst);
           GetFillPattern(OldPattern);
         End;
 True  : Begin
           SetFillPattern(OldPattern,FillInfo.Color);
           with FillInfo do SetFillStyle(Pattern, Color);
           with Linst do SetLineStyle(LineStyle, Pattern, Thickness);
           SetColor(Cul);
           with Textst do Begin SetTextJustify(Horiz, Vert);
                                SetTextStyle(Font, Direction, CharSize);
                          End;
         End;
End;End;

{----------------------------------------------------------------------------}

Procedure memofer(xpr,ypr,zpr,tpr:integer;ppr:pointer);
Begin
HideMouse;
lun:=imagesize(xpr,ypr,zpr,tpr);
getmem(ppr,lun);getimage(xpr,ypr,zpr,tpr,ppr^);
ShowMouse;
End;

{----------------------------------------------------------------------------}

Procedure refafer(x,y:integer;p:pointer;a:word);
  Begin
    HideMouse;
    putimage(x,y,p^,a);
    ShowMouse;
    freemem(p,lun);
  End;

{----------------------------------------------------------------------------}

Procedure Panou(x,y,x3,x4:integer;tip:byte);
Begin
 Case tip of
1: Begin SetColor(lightgray);setLinestyle(0,0,3);
         setfillstyle(solidfill,darkgray);
         bar(x,y,x3,x4);
         moveto(x+2,y+2);SetColor(lightgray);
         Lineto(x3-2,y+2);Lineto(x3-2,x4-2);
         SetColor(black);Lineto(x+2,x4-2);
         Lineto(x+2,y+2);
   End;
2: Begin SetColor(black);setfillstyle(solidfill,white);
         setLinestyle(0,0,3);
         bar(x,y,x3,x4);Rectangle(x+2,y+2,x3-2,x4-2);
   End;
 End;
End;

{----------------------------------------------------------------------------}

Procedure aftext(xp,yp,zp,tp:integer;mesj:string;zona:boolean);
var co2:integer;
Begin
settextstyle(smallfont,horizdir,4);
Case zona of
  false : co2:=round((yp+tp-textheight(mesj))/2);
  true  : co2:=tp-textheight('A')-8;
End;
HideMouse;
outtextxy(round((xp+zp-textwidth(mesj))/2),co2,mesj);
ShowMouse;
End;

{----------------------------------------------------------------------------}

procedure cursor(s:string);
begin
if cursorales=false then
                 begin
                   selectcursor(s);
                   cursorales:=true;
                 end;
end;

{----------------------------------------------------------------------------}

Procedure help(st:string);
var lun1:word;pm1:pointer;
Begin
dr:=mousex;mo:=mousey;
MemoAtribute(false);
   lun1:=imagesize(210,390,430,430);
   getmem(pm1,lun1);
   getimage(210,390,430,430,pm1^);
Panou(210,390,430,430,1);
aftext(210,390,430,430,st,false);
repeat until ((mousex<>dr) or (mousey<>mo));
refafer(210,390,pm1,copyput);
MemoAtribute(true);com:=0;
End;

{----------------------------------------------------------------------------}

Procedure textbuton(x,y:integer;mes:string;aliniat:boolean);
var x3,x4:integer;
Begin
 setusercharsize(1,1,1,1);
 x3:=textwidth(mes);x4:=textheight(mes);
 setusercharsize(dbut.lungime,x3,dbut.latime,x4);
 setcolor(black);outtextxy(x+3,y-3,mes);
 setusercharsize(1,1,1,1);
End;

{----------------------------------------------------------------------------}

Procedure marcbuton;
var xp,yp,zp,tp:integer;
Begin
hidemouse;
MemoAtribute(false);SetViewPort(0, 0, GetMaxX, GetMaxY, True);
setlinestyle(0,0,0);
yp:=432;if com=17 then yp:=453;
xp:=((dr+40) div 40-1)*40+1;zp:=xp+37;tp:=yp+17;
setcolor(black);line(xp,yp,zp,yp);line(zp,yp,zp,tp);
setcolor(white);line(zp,tp,xp,tp);line(xp,tp,xp,yp);
delay(150); {repeat until not leftpressed;}
setcolor(white);line(xp,yp,zp,yp);line(zp,yp,zp,tp);
setcolor(black);line(zp,tp,xp,tp);line(xp,tp,xp,yp);
MemoAtribute(true);setviewport(0,0,638,429,clipon);
showmouse;
End;

{----------------------------------------------------------------------------}

Procedure Apasa;
Procedure apasabuton(xp,yp,zp,tp:integer);
var pmp:pointer;lu:word;
Begin
hidemouse;
setlinestyle(0,0,0);
lu:=imagesize(xp+1,yp+1,zp-1,tp-1);getmem(pmp,lu);getimage(xp+1,yp+1,zp-1,tp-1,pmp^);
putimage(xp+2,yp+2,pmp^,copyput);
setcolor(darkgray);line(xp,tp,xp,yp);line(xp,yp,zp,yp);setcolor(black);line(xp+1,tp+1,xp+1,yp+1);line(xp+1,yp+1,zp+1,yp+1);
setcolor(darkgray);line(zp,tp,xp,tp);line(zp,yp,zp,tp);setcolor(white);line(zp-1,tp,xp,tp);line(zp,yp+1,zp,tp);
repeat until not leftpressed;
putimage(xp+1,yp+1,pmp^,copyput);freemem(pmp,lu);
setcolor(white);line(xp,tp,xp,yp);line(xp,yp,zp,yp);setcolor(lightgray);line(xp+1,tp+1,xp+1,yp+1);line(xp+1,yp+1,zp+1,yp+1);
setcolor(black);line(zp,tp,xp,tp);line(zp,yp+1,zp,tp);setcolor(darkgray);line(zp,tp+1,xp+1,tp+1);line(zp+1,yp+1,zp+1,tp+1);
showmouse;
End;
begin
 apasabuton(coord[but].cx+1,coord[but].cy+2,coord[but].cz,coord[but].ct);
end;

{----------------------------------------------------------------------------}

Procedure Buton3D(xb,yb,zb,tb:integer);
 Begin
  setfillstyle(solidfill,lightgray);
  bar(xb+1,yb+2,zb,tb);
  SetColor(black);Line(zb,yb+2,zb,tb);Line(zb,tb,xb+1,tb);
  Setcolor(white);Line(xb+1,tb,xb+1,yb+2);Line(xb+1,yb+2,zb,yb+2);
 End;

{----------------------------------------------------------------------------}

Procedure ferbut (x,y:integer;nb:byte;anunt:string;fer:boolean);
var f:byte;x1,x2,x3,x4,mx,my,n:integer;sb:string[6];
Begin
MemoAtribute(false);
HideMouse;
SetColor(lightgray);setLinestyle(0,0,3);setfillstyle(solidfill,darkgray);
x3:=x+nb*(dbut.lungime+dbut.spatiuint)+dbut.spatiuint;
x4:=y+dbut.latime+2*dbut.spatiuint;
lun:=imagesize(x,y,x3,x4);getmem(pmf,lun);getimage(x,y,x3,x4,pmf^);
If fer then Panou(x,y,x3,x4,1);
 SetColor(black);Lineto(x+2,x4-2);Lineto(x+2,y+2);
setfillstyle(solidfill,cbut.interior);setLinestyle(0,0,0);
settextstyle(smallfont,horizdir,4);
x1:=round((x3+x-textwidth(anunt))/2);
outtextxy(x1,x4-textheight(anunt)-8,anunt);SetColor(cbut.contur);
for f:=1 to nb do Begin
 x1:=x+f*(dbut.spatiuint+dbut.lungime)-dbut.lungime;x2:=y+dbut.spatiuint;
 x3:=x1+dbut.lungime;x4:=x2+dbut.latime;
 bar3d(x1,x2,x3,x4,3,topon);{buton3d(x1,x2,x3,x4);}
 textbuton(x1,x2,sirbut[f],true);
End;
MemoAtribute(true);ShowMouse;but:=0;
repeat If LeftPressed1 then Begin mx:=mousex;my:=mousey;
   If (my>y+dbut.spatiuint) and (my<y+dbut.spatiuint+dbut.latime)
      then for n:=1 to nb do Begin
   If (mx>=x+n*(dbut.lungime+dbut.spatiuint)-dbut.lungime) and
   (mx<=x+n*(dbut.lungime+dbut.spatiuint)) then but:=n;End;End;
until but<>0;
sircom[but];
End;

{----------------------------------------------------------------------------}


Procedure punebuton(x,y:integer;mesaj:string);
Begin
inc(nrbut);
coord[nrbut].cx:=x;
coord[nrbut].cy:=y;
coord[nrbut].cz:=x+dbut.lungime;
coord[nrbut].ct:=y+dbut.latime;
setfillstyle(solidfill,cbut.interior);SetColor(cbut.contur);
buton3d(x,y,x+dbut.lungime,y+dbut.latime);
textbuton(x,y,mesaj,true);
End;

{----------------------------------------------------------------------------}

Procedure fiebuton(x,y,z,t:integer);
Begin
inc(nrbut);
coord[nrbut].cx:=x;
coord[nrbut].cy:=y;
coord[nrbut].cz:=z;
coord[nrbut].ct:=t;
End;

{----------------------------------------------------------------------------}

Procedure testbuton(cmn:boolean);
var f:byte;mx,my:integer;
Begin
but:=0;
repeat If LeftPressed1 then Begin mx:=mousex;my:=mousey;
 for f:=1 to nrbut do Begin If (mx>coord[f].cx) and (mx<coord[f].cx+dbut.lungime)
 and (my>coord[f].cy) and (my<coord[f].cy+dbut.latime) then Begin but:=f;break;End;End;End;
until but<>0;nrbut:=0;If cmn then sircom[but];
End;


{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ       Aici incep procedurile necesare inserarii in fisier      บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}


Procedure insfis(zona:byte;s:string);
var a,p:word;n:char;g:text;
    lun1i:word;pm1:pointer;
    f:integer;
    bufer : array[1..10000] of char;
Begin
MemoAtribute(false);HideMouse;
    lun1i:=imagesize(300,240,500,290);
    getmem(pm1,lun1i);
    getimage(300,240,500,290,pm1^);
Panou(300,240,500,290,1);ShowMouse;
aftext(300,240,500,290,'Asteptati putin !',false);
 Case zona of
     0:p:=contprog;
     1:p:=200;
     2:p:=contprog+22;
 End;
assign(g,'~temp~.tmp');SetTextBuf(g, Bufer);
rewrite(g);reset(fis);
for a:=1 to p do Begin
                   read(fis,n);
                   write(g,n);
                 End;write(g,s);
while not eof(fis) do Begin read(fis,n);write(g,n);End;
inc(contprog,length(s));inc(procprog,length(s));
close(fis);close(g);erase(fis);rename(g,dircurent+'\'+nume);append(fis);
HideMouse;putimage(300,240,pm1^,copyput);ShowMouse;freemem(pm1,lun1i);
MemoAtribute(true);
End;

{----------------------------------------------------------------------------}

procedure insproc(fil:string);
label l10;
var a,p,l : word;
    g,h   : text;
    h1    : file;
    n     : char;
    lun1i : word;
    pm1   : pointer;

begin
    MemoAtribute(false);HideMouse;
    lun1i:=imagesize(300,240,500,290);getmem(pm1,lun1i);getimage(300,240,500,290,pm1^);
    Panou(300,240,500,290,1);ShowMouse;
    aftext(300,240,500,290,'Asteptati putin !',false);
    p:=procprog+22;
    assign(h1,fil);{$i-}reset(h1,1){$i+};
    if ioresult<>0 then begin
       bell;delay(100);bell;delay(100);bell;
       hidemouse;Panou(300,240,500,290,1);ShowMouse;
       aftext(300,240,500,290,'Eroare : Fisier inexistent !',false);ShowMouse;
       repeat until leftpressed1;
       goto L10;
                         end;
    l:=filesize(h1);close(h1);
    assign(h,fil);assign(g,'~temp~.tmp');
    rewrite(g);reset(h);reset(fis);
    for a:=1 to p do Begin read(fis,n);write(g,n);End;
    for a:=1 to l do Begin read(  h,n);write(g,n);End;
    while not eof(fis) do Begin read(fis,n);write(g,n);End;inc(procprog,l);
    close(fis);close(g);close(h);erase(fis);rename(g,dircurent+'\'+nume);append(fis);
    L10:HideMouse;putimage(300,240,pm1^,copyput);ShowMouse;
    freemem(pm1,lun1i);MemoAtribute(true);
end;


{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ         Aceasta este procedura pentru afisarea ceasului        บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}


procedure FereastraCuCeas;
var mx,my:integer;
procedure ceas(centrux,centruy:integer;razac,culceas,culfond:word);
var
  ora1, ora2,
  ox, oy,
  rx, ry,
  kisrx, nagyrx, mprx,
  kisry, nagyry, mpry,
  x, y,
  kisx, kisy,
  nagyx, nagyy,
  mpx, mpy                                         : real;
  systemyear, systemmonth, systemday, dayofweek,
  hour, minute,
  systemhour, systemminute, systemsecond, sec100,
  proghour, progminute, progsecond : word;
  sec60, min60                                     : boolean;
  jelzes1, jelzes2, jelzes3,
  dateposx, timeposx, sor1, sor2, sor3             : word;
  xasp, yasp                                       : word;
  ratio                                            : real;


function fnX(i : real) : real;
begin
  fnx := rx * sin(-i) + ox;
end;

function fnY(i : real) : real;
begin
  fny := ry * cos(-i) + oy;
end;

function fnKisX(i : real) : real;
begin
  fnKisx := kisrx * sin(-i) + ox;
end;

function fnKisY(i : real) : real;
begin
  fnkisy := kisry * cos(-i) + oy;
end;

function fnNagyX(i : real) : real;
begin
  fnNagyx := Nagyrx * sin(-i) + ox;
end;

function fnNagyY(i : real) : real;
begin
  fnNagyy := Nagyry * cos(-i) + oy;
end;

function fnMpX(i : real) : real;
begin
  fnMpx := Mprx * sin(-i) + ox;
end;

function fnMpY(i : real) : real;
begin
  fnMpy := Mpry * cos(-i) + oy;
end;

procedure MyLine(x1,y1,x2,y2 : real);
begin
  hidemouse;
  line(round(x1),round(y1),round(x2),round(y2));
  showmouse;
end;


function TimeToStr(hour, minute, second : word) : string;
var
  s1, s2, s3 : string;
begin
  str(hour:2,s1);
  str(minute:2,s2);
  str(second:2,s3);
  timetostr := s1 + ':' + s2 + ':' + s3;
end;

procedure CeasAnalogic(culu,cul:word);
begin
  if progsecond <> 0 then sec60 := false;
  if progminute <> 0 then min60 := false;
  ora2 := hour + (minute / 100) * 1.6667;
  if progSecond <> systemSecond then
  begin
    progSecond := SystemSecond;
    x := mpx;
    y := mpy;
    setcolor(cul);
    setlinestyle(solidln,0,normwidth);
    myline(ox,oy,x,y);
    mpx := fnmpx((progSecond+90)/9.55);
    mpy := fnmpy((progSecond+90)/9.55);
    setcolor(culu);
    myline(ox,oy,mpx,mpy);
    setlinestyle(solidln,0,thickwidth);
    myline(ox,oy,nagyx,nagyy);
    myline(ox,oy,kisx,kisy);
    setfillstyle(solidfill,cul);
    settextstyle(10,0,2);
    hidemouse;
    bar(250,310,400,360);
    outtextxy(250,310,TimeToStr(proghour,progminute,progsecond));
    showmouse;
  end;
  if (progminute <> minute) then
  begin
    minute := progminute;
    x := nagyx;
    y := nagyy;
    setcolor(cul);
    setlinestyle(solidln,0,thickwidth);
    myline(ox,oy,x,y);
    nagyx := fnnagyx((progminute+90)/9.55);
    nagyy := fnnagyy((progminute+90)/9.55);
    setcolor(culu);
    myline(ox,oy,nagyx,nagyy);
    myline(ox,oy,kisx,kisy);
  end;
  if progsecond = 0 then
  begin
    if not(sec60) then
    begin
      inc(progminute);
      if progminute > 59 then progminute := 0;
      sec60 := true;
      x := nagyx;
      y := nagyy;
      setcolor(cul);
      setlinestyle(solidln,0,thickwidth);
      myline(ox,oy,x,y);
      nagyx := fnnagyx((progminute+90)/9.55);
      nagyy := fnnagyy((progminute+90)/9.55);
      setcolor(culu);
      myline(ox,oy,nagyx,nagyy);
      myline(ox,oy,kisx,kisy);
    end;
  end
  else
  begin
    sec60 := false;
  end;
  ora1 := proghour + (progminute / 100) * 1.6667;
  if (ora1 <> ora2) then
  begin
    hour := proghour;
    x := kisx;
    y := kisy;
    setcolor(cul);
    setlinestyle(solidln,0,thickwidth);
    myline(ox,oy,x,y);
    kisx := fnkisx((ora1+90)/1.91);
    kisy := fnkisy((ora1+90)/1.91);
    setcolor(culu);
    myline(ox,oy,kisx,kisy);
  end;
  if progminute = 0 then
  begin
    if not(min60) then
    begin
      inc(proghour);
      if proghour > 23 then proghour := 0;
      min60 := true;
      x := kisx;
      y := kisy;
      setcolor(cul);
      setlinestyle(solidln,0,thickwidth);
      myline(ox,oy,x,y);
      ora2 := proghour + (progminute / 100) * 1.6667;
      kisx := fnkisx((ora2+90)/1.91);
      kisy := fnkisy((ora2+90)/1.91);
      setcolor(culu);
      myline(ox,oy,kisx,kisy);
    end;
  end
  else
  begin
    min60 := false;
  end;
end;

procedure SystemDateTime;
begin
  GetDate(systemyear,systemmonth,systemday,dayofweek);
  GetTime(SystemHour,SystemMinute,SystemSecond,sec100);
end;

procedure preinit;
begin
  GetDate(SystemYear,SystemMonth,SystemDay,DayOfWeek);
  GetTime(SystemHour,SystemMinute,SystemSecond,sec100);
  if progsecond = 0 then sec60 := true
                    else sec60 := false;
  if progminute = 0 then min60 := true
                    else min60 := false;
  proghour := systemhour;
  progminute := systemminute;
  progsecond := systemsecond;
end;


procedure InitCeas(cx,cy,cr:integer);
var
  i        : integer;
begin
  getaspectratio(xasp,yasp);
  ratio := yasp / xasp;

  ox := cx;
  oy := cy;

  ry := cr;
  nagyry := ry * 80 / 100;
  kisry := ry / 2;
  mpry := ry * 90 / 100;
  rx := ry * ratio;
  nagyrx := nagyry * ratio;
  kisrx := kisry * ratio;
  mprx := mpry * ratio;
  for i := 0 to 11 do
  begin
    x := fnX((5*i+90)/9.55);
    y := fnY((5*i+90)/9.55);
    mpx := fnmpX((5*i+90)/9.55);
    mpy := fnmpY((5*i+90)/9.55);
    myline(x,y,mpx,mpy);
  end;

  preinit;

  mpx := fnmpx((progSecond+90)/9.55);
  mpy := fnmpy((progSecond+90)/9.55);
  nagyx := fnnagyx((progminute+90)/9.55);
  nagyy := fnnagyy((progminute+90)/9.55);
  ora1 := proghour + (progminute / 100) * 1.6667;
  kisx := fnkisx((ora1+90)/1.91);
  kisy := fnkisy((ora1+90)/1.91);


end;
begin
     InitCeas(centrux,centruy,razac);
     repeat
        systemdatetime;
        CeasAnalogic(culceas,culfond);
      until (leftpressed1) or (rightpressed1);
end;

begin
if rightpressed1 then if mousey<430 then begin memoatribute(false);
   bell;mx:=mousex;my:=mousey;hidemouse;
   lun:=imagesize(190,70,450,370);getmem(pm,lun);
   getimage(190,70,450,370,pm^);
   panou(190,70,450,370,1);
   showmouse;ceas(320,200,100,white,darkgray);
   hidemouse;refafer(190,70,pm,copyput);showmouse;memoatribute(true);end;
end;

{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ     Aici incep procedurile pt desenarea obiectelor grafice     บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}



{----------------------------------------------------------------------------}

Procedure drag;
    Begin
    cursor('semn.cur');
    If LeftPressed then Begin
          HideMouse;
          moveto(mousex,mousey);
          sir:='  MoveTo ('+stri(mousex)+','+stri(mousey)+');';writeln(fis,sir);
          ShowMouse;
          while LeftPressed do Begin x:=mousex;y:=mousey;
          If (x<>mousex) or (y<>mousey) then Begin HideMouse;
          Lineto(mousex,mousey);sir:='  LineTo('+stri(mousex)+','+stri(mousey)+');';
          writeln(fis,sir);ShowMouse; End;End;
         End;End;

{----------------------------------------------------------------------------}

Procedure umple;
   var mx,my:integer;
   Begin
    cursor('umple.cur');
    If mousey<430 then Begin
    If LeftPressed1 then Begin
           mx:=mousex;my:=mousey;
           HideMouse;floodfill(mx,my,(GetColor));ShowMouse;
           sir:='  FloodFill ('+stri(mx)+','+stri(my)+','+culs[GetColor]+');';
           writeln(fis,sir);
                         End;
                       End;
   End;

{----------------------------------------------------------------------------}

Procedure linie;
var h,v,x0,y0,x1,y1:integer;
Begin
cursor('semn.cur');
If mousey<430 then Begin
x1:=mousex;y1:=mousey;setwritemode(xorput);
If LeftPressed1 then If (lin=false) and (mousey<430) then
 Begin MemoAtribute(false);setLinestyle(1,0,0);SetColor(white);
       bell;x0:=mousex;y0:=mousey;lin:=true;End;
while lin=true do Begin
 If LeftPressed1 then Begin lin:=false;
                 HideMouse;Line(x0,y0,x1,y1);ShowMouse;
                 MemoAtribute(true);setwritemode(copyput);
                 HideMouse;Line(x0,y0,x1,y1);ShowMouse;
                 sir:='  Line ('+stri(x0)+','+stri(y0)+','+stri(x1)+','+stri(y1)+');';
                 writeln(fis,sir);
                      End;
 If (mousex<>x1) or (mousey<>y1) then Begin
   HideMouse;Line(x0,y0,x1,y1);x1:=mousex;y1:=mousey;
   Line(x0,y0,x1,y1);ShowMouse;
   End;End;lin:=false;
End;End;

{----------------------------------------------------------------------------}

Procedure triunghi;
var h,v,x0,y0,x1,y1,x2,y2:integer;

procedure elastic;
begin
If (mousex<>x2) or (mousey<>y2) then Begin
   HideMouse;
     Line(x1,y1,x2,y2);
     if tri=2 then Line(x2,y2,x0,y0);
     x2:=mousex;y2:=mousey;
     Line(x1,y1,x2,y2);
     if tri=2 then Line(x2,y2,x0,y0);ShowMouse;
   End;
end;

Begin
     cursor('semn.cur');
     memoatribute(false);
     setLinestyle(1,0,0);
     SetColor(white);
     setwritemode(xorput);

If LeftPressed1 then If (tri=0) and (mousey<430) then
   Begin x2:=mousex;y2:=mousey;
         x0:=mousex;y0:=mousey;
         x1:=mousex;y1:=mousey;
         bell;tri:=1;
         repeat elastic until leftpressed1;
         bell;tri:=2;x1:=mousex;y1:=mousey;
         hidemouse;line(x0,y0,x1,y1);showmouse;
         repeat elastic until leftpressed1;
         bell;tri:=0;
         hidemouse;line(x0,y0,x1,y1);line(x1,y1,x2,y2);line(x2,y2,x0,y0);
         memoatribute(true);setwritemode(copyput);
         line(x0,y0,x1,y1);line(x1,y1,x2,y2);line(x2,y2,x0,y0);showmouse;
{
 if tipb then
            begin
              sir:='  SetLineStyle (SolidLn, 0,'+grosimi[linst.Thickness div 3]+');';
              writeln(fis,sir);
            end;
}
         sir:='  Line('+stri(x0)+','+stri(y0)+','+stri(x1)+','+stri(y1)+');'+
                'Line('+stri(x1)+','+stri(y1)+','+stri(x2)+','+stri(y2)+');'+
                'Line('+stri(x2)+','+stri(y2)+','+stri(x0)+','+stri(y0)+');';
         writeln(fis,sir);

   End;
         memoatribute(true);
         setwritemode(copyput);
end;

{----------------------------------------------------------------------------}

Procedure paralelogram;
var h,v,x0,y0,x1,y1,x2,y2:integer;

procedure elastic;
begin
If (mousex<>x2) or (mousey<>y2) then Begin
   HideMouse;
     Line(x1,y1,x2,y2);
     if tri=2 then Line(x2,y2,x2+x0-x1,y2+y0-y1);
     if tri=2 then Line(x2+x0-x1,y2+y0-y1,x0,y0);
     x2:=mousex;y2:=mousey;
     Line(x1,y1,x2,y2);
     if tri=2 then Line(x2,y2,x2+x0-x1,y2+y0-y1);
     if tri=2 then Line(x2+x0-x1,y2+y0-y1,x0,y0);
     ShowMouse;
   End;
end;

Begin
     cursor('semn.cur');
     memoatribute(false);
     setLinestyle(1,0,0);
     SetColor(white);
     setwritemode(xorput);

If LeftPressed1 then If (tri=0) and (mousey<430) then
   Begin x2:=mousex;y2:=mousey;
         x0:=mousex;y0:=mousey;
         x1:=mousex;y1:=mousey;
         bell;tri:=1;
         repeat elastic until leftpressed1;
         bell;tri:=2;x1:=mousex;y1:=mousey;
         hidemouse;line(x0,y0,x1,y1);showmouse;
         repeat elastic until leftpressed1;
         bell;tri:=0;
         hidemouse;line(x0,y0,x1,y1);line(x1,y1,x2,y2);
         line(x2,y2,x2+x0-x1,y2+y0-y1);line(x2+x0-x1,y2+y0-y1,x0,y0);
         memoatribute(true);setwritemode(copyput);
         line(x0,y0,x1,y1);line(x1,y1,x2,y2);line(x2,y2,x2+x0-x1,y2+y0-y1);
         line(x2+x0-x1,y2+y0-y1,x0,y0);showmouse;
         sir:='  Line('+stri(x0)+','+stri(y0)+','+stri(x1)+','+stri(y1)+');'+
                'Line('+stri(x1)+','+stri(y1)+','+stri(x2)+','+stri(y2)+');'+
                'Line('+stri(x2)+','+stri(y2)+','+stri(x2+x0-x1)+','+stri(y2+y0-y1)+');'+
                'Line('+stri(x2+x0-x1)+','+stri(y2+y0-y1)+','+stri(x0)+','+stri(y0)+');';
         writeln(fis,sir);

   End;
         memoatribute(true);
         setwritemode(copyput);
end;

{----------------------------------------------------------------------------}

Procedure bara;
var h,v,x0,y0,x1,y1:integer;ins:string[14];
Begin
 cursor('semn.cur');
 MemoAtribute(false);
 If mousey<430 then Begin
x1:=mousex;y1:=mousey;setwritemode(xorput);
If LeftPressed1 then If (lin=false) and (mousey<430) then
 Begin setLinestyle(1,0,0);SetColor(white);
       bell;x0:=mousex;y0:=mousey;lin:=true;End;
while lin=true do Begin
 If LeftPressed1 then Begin lin:=false;HideMouse;Rectangle(x0,y0,x1,y1);ShowMouse;
   setwritemode(copyput);HideMouse;MemoAtribute(true);
   Case tipb of false:Begin Rectangle(x0,y0,x1,y1);ins:='  Rectangle (';End;
                true :Begin bar(x0,y0,x1,y1);ins:='  Bar (';End;End;
                         ShowMouse;MemoAtribute(false);
   sir:=ins+stri(x0)+','+stri(y0)+','+stri(x1)+','+stri(y1)+');';
   writeln(fis,sir);End;
 If (mousex<>x1) or (mousey<>y1) then Begin
   HideMouse;Rectangle(x0,y0,x1,y1);
   x1:=mousex;y1:=mousey;Rectangle(x0,y0,x1,y1);ShowMouse;
   End;End;lin:=false;
End;MemoAtribute(true);
End;



{----------------------------------------------------------------------------}

Procedure figuri;
begin
   cursor('mina.cur');
   memoatribute(false);
   hidemouse;
   lun:=imagesize(300,300,400,420);
   getmem(pm,lun);
   getimage(300,300,400,420,pm^);
   panou(300,300,400,420,1);
   showmouse;
with dbut do Begin lungime:=80;latime:=20;End;
cbut.interior:=darkgray;
setlinestyle(0,0,0);settextstyle(smallfont,0,4);
punebuton(310,310,'Bara');
punebuton(310,350,'Triunghi');
punebuton(310,390,'Paralelogram');
testbuton(false);
Apasa;
hidemouse;
refafer(300,300,pm,copyput);
memoatribute(true);
showmouse;
case but of
1 : com:=50;
2 : com:=51;
3 : com:=52;
end;selectcursor('semn.cur');
end;

{----------------------------------------------------------------------------}

Procedure cerc;
var h,v,x0,y0,x1,y1:integer;ra:word;

Procedure cer(x0,y0,x1,y1:integer);
var x,y:integer;f:word;
Begin
{$R-}ra:=sqr(x1-x0)+sqr(y1-y0);{$R+}ra:=round(sqrt(ra));f:=0;
repeat
  x:=round(x0+ra*cos(f));y:=round(y0+ra*sin(f));
  Line(x,y,x,y);f:=f+5;
until f>=260;
End;

Begin
If mousey<430 then Begin
cursor('semn.cur');
x1:=mousex;y1:=mousey;setwritemode(xorput);
If LeftPressed1 then If (lin=false) and (mousey<430) then
 Begin MemoAtribute(false);setLinestyle(0,0,0);SetColor(white);
       bell;x0:=mousex;y0:=mousey;lin:=true;End;
while lin=true do Begin
 If LeftPressed1 then Begin lin:=false;
   HideMouse;cer(x0,y0,x1,y1);ShowMouse;
   MemoAtribute(true);setwritemode(copyput);HideMouse;
   Case tipb of false:Begin Circle(x0,y0,ra);
                            sir:='  Circle ('+stri(x0)+','+stri(y0)+','+stri(ra)+');';End;
                true: Begin fillellipse(x0,y0,ra,ra);
                            sir:='  FillEllipse ('+stri(x0)+','+stri(y0)+','+stri(ra)+','+stri(ra)+');';End;End;
   ShowMouse;writeln(fis,sir);End;
 If (mousex<>x1) or (mousey<>y1) then Begin
   HideMouse;cer(x0,y0,x1,y1);
   x1:=mousex;y1:=mousey;cer(x0,y0,x1,y1);ShowMouse;
   End;End;lin:=false;
End;End;

{----------------------------------------------------------------------------}

Procedure elipsa;
var h,v,x0,y0,x1,y1:integer;rx,ry:longint;

Procedure cer(x0,y0,x1,y1:integer);
var x,y:integer;f:word;
Begin
rx:=abs(x1-x0);ry:=abs(y1-y0);f:=0;repeat
x:=round(x0+rx*cos(f));y:=round(y0+ry*sin(f));
Line(x,y,x,y);f:=f+5;
until f>=260;
End;

Begin
If mousey<430 then Begin
cursor('semn.cur');
x1:=mousex;y1:=mousey;setwritemode(xorput);
If LeftPressed1 then If (lin=false) and (mousey<430) then
 Begin MemoAtribute(false);setLinestyle(0,0,0);SetColor(white);
       bell;x0:=mousex;y0:=mousey;lin:=true;End;
while lin=true do Begin
 If LeftPressed1 then Begin lin:=false;
   HideMouse;cer(x0,y0,x1,y1);ShowMouse;
   MemoAtribute(true);setwritemode(copyput);HideMouse;
   Case tipb of false:Begin ellipse(x0,y0,0,360,rx,ry);
                            sir:='  Ellipse ('+stri(x0)+','+stri(y0)+',0,360,'+stri(rx)+','+stri(ry)+');';End;
                true :Begin fillellipse(x0,y0,rx,ry);
                            sir:='  FillEllipse ('+stri(x0)+','+stri(y0)+','+stri(rx)+','+stri(ry)+');';End;End;
   ShowMouse;writeln(fis,sir);End;
 If (mousex<>x1) or (mousey<>y1) then Begin
   HideMouse;cer(x0,y0,x1,y1);
   x1:=mousex;y1:=mousey;cer(x0,y0,x1,y1);ShowMouse;
   End;End;lin:=false;
End;End;

{----------------------------------------------------------------------------}

Procedure spray;
var f      : byte;
    culr   : string[10];
    stridi : string;
Begin
cursor('spray.cur');
If mousey<430 then Begin
If LeftPressed1 then Begin HideMouse;
for f:=1 to sprm do Case sprc of
0:PutPixel(mousex+Random(sprm),mousey+Random(sprm),GetColor);
1:PutPixel(mousex+Random(sprm),mousey+Random(sprm),Random(15));End;
stridi:='';
If consti=false then Begin stridi:=stridi+#13#10'Const'#13#10;consti:=true;End;
If spric=false then Begin stridi:=stridi+'  Sprm : byte = 30 ; Sprc : byte = 0;'#13#10;spric:=true;End;
If stridi<>'' then insfis(0,stridi);
If spri=false then Begin insproc('spray.prc');spri:=true;End;
sir:='  Spray ('+stri(mousex)+','+stri(mousey)+');';writeln(fis,sir);
ShowMouse;End;End;
End;

{----------------------------------------------------------------------------}

Procedure tipspray;
var f,g,h : byte;
    strdi : string;
function fu(f:byte):word;
Begin Case f of 0:fu:=0;1:fu:=Random(14);End;End;
Begin
HideMouse;
           MemoAtribute(false);
           lun:=imagesize(94,94,204,164+150);
           getmem(pm,lun);
           getimage(94,94,204,164+150,pm^);
Panou(94,94,204,164+150,1);
aftext(94,94,204,314,'Alegeti spray-ul',true);
setfillstyle(solidfill,white);
for f:=0 to 1 do for h:=0 to 3 do Begin
         Rectangle(104+f*50,104+h*50,144+f*50,144+h*50);
         fiebuton(104+f*50,104+h*50,144+f*50,144+h*50);
         bar(104+f*50,104+h*50,144+f*50,144+h*50);
         for g:=1 to 120 do PutPixel((3-h)*5+104+f*50+Random(10*h+10),
                            (3-h)*5+104+h*50+Random(10*h+10),fu(f));
                                  End;
                           ShowMouse;
                           {setcolor(yellow);outtextxy(300,0,'Tip '+stri(sprc));  }
                           testbuton(false);
                           {setcolor(green);outtextxy(0,0,'Tip '+stri(sprc));  }
        Case but of
        1..4 : Begin
                 sprm:=but*10;
                 sprc:=0;
               End;
        5..8 : Begin
                 sprm:=(but-4)*10;
                 sprc:=1;
               End;
        End;

                           HideMouse;
                           refafer(94,94,pm,copyput);com:=0;
                           ShowMouse;MemoAtribute(true);
strdi:='';
If consti=false then Begin strdi:=strdi+#13#10'Const'#13#10;consti:=true;End;
If spric=false then Begin strdi:=strdi+'  Sprm : byte = 30 ; Sprc : byte = 0;'#13#10;spric:=true;End;
If strdi<>'' then insfis(0,strdi);
sir:='  Sprm := '+stri(sprm)+'; Sprc := '+stri(sprc)+';';writeln(fis,sir);
End;

{----------------------------------------------------------------------------}

Procedure tipg;Begin tipb:=false;End;
Procedure tipp;Begin tipb:=true ;End;
Procedure tipfig;
Begin
with dbut do Begin lungime:=50;latime:=30;End;
cbut.interior:=green;
sirbut[1]:='Goala';sirbut[2]:='Plina';
@sircom[1]:=addr(tipg);@sircom[2]:=addr(tipp);
ferbut(198,198,2,'Alegeti tipul figurii',true);
refafer(198,198,pmf,copyput);
com:=0;
End;

{----------------------------------------------------------------------------}

procedure verificahelp;
var f:byte;
begin
for f:=1 to paramcount do
  If ((paramstr(f)='/?') or (paramstr(f)='/h') or (paramstr(f)='/H')
  or (paramstr(f)='/ajutor') or (paramstr(f)='/AJUTOR'))
  or (paramstr(f)='/HELP') or (paramstr(f)='/help') then  begin
 clrscr;
 writeln('ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
 writeln('บ                                                                           บ');
 writeln('บ               ARTIST '+versiune+' - Utilitar pentru programare vizuala             บ');
 writeln('บ                         Autor : Veteanu Marian Adrian                     บ');
 writeln('บ                                                                           บ');
 writeln('ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
 writeln;
 writeln;
 writeln('  Utilizare : ARTIST [Nume.pas] [/r] [/?]');
 writeln('      Nume.pas  - Numele programului .PAS care va fi creat');
 writeln('      /r        - Initializare rapida');
 writeln('      /m        - Anuleaza producerea de sunete la apasarea butoanelor');
 writeln('      /?        - Aceasta pagina');
 halt(4);End;
end;


{----------------------------------------------------------------------------}

procedure VerificaMouse;
begin
If not existmouse then
   Begin
     restorecrtmode;
     writeln('   Trebuie sa aveti mouse si driver de mouse !!!');
     Halt(1);
   End;
end;

{----------------------------------------------------------------------------}

Procedure VerificaMicroProcesor;
function Is286Able: Boolean; assembler;
asm
        PUSHF
        POP     BX
        AND     BX,0FFFH
        PUSH    BX
        POPF
        PUSHF
        POP     BX
        AND     BX,0F000H
        CMP     BX,0F000H
        MOV     AX,0
        JZ      @@1
        MOV     AX,1
@@1:
End;
begin
If not Is286Able then
   Begin
     Writeln('   Trebuie sa aveti cel putin un ๆP 80286 !!!');
     Halt(2);
   End;
end;

{----------------------------------------------------------------------------}

Procedure setcul;
   Begin
   com:=cl;
   If culo<>GetColor then Begin
   SetColor(culo);
   sir:='  SetColor ('+culs[culo]+');';writeln(fis,sir);End;
   End;

{----------------------------------------------------------------------------}

Procedure nou;
Begin
 stpl:=true;
 if wtg=false then begin insproc('wtg.prc');wtg:=true;end;
 sir:='  AsteaptaOTasta;ClearDevice;'#13#10#13#10+
      '{ --------------------  Aici incepe o noua plansa ------------------------- }'#13#10;
 writeln(fis,sir);com:=0;
End;

{----------------------------------------------------------------------------}

Procedure setl;
const fu3:word=0;
var f,g:integer;
function fu1(f:byte):byte;
Begin
Case f of
01..04 : fu1:=f-1;
05..08 : Begin fu1:=4;fu3:=modlin[f-4];End;
09..12 : fu1:=f-9;
13..16 : Begin fu1:=4;fu3:=modlin[f-12];End;End;End;
function fu2(f:byte):byte;
Begin
Case f of
1..08 : fu2:=0;
9..16 : fu2:=1;End;End;
Begin
HideMouse;MemoAtribute(false);
                lun:=imagesize(100,100-50,260,430-50);
                getmem(pm,lun);
                getimage(100,100-50,260,430-50,pm^);
Panou(100,100-50,260,430-50,2);setfillstyle(solidfill,darkgray);
for f:=1 to 2 do Begin
                 for g:=1 to 4 do Begin
                  setLinestyle(0,0,0);
                  bar(30+f*80,70+g*40-50,90+f*80,90+g*40-50);
                  Rectangle(30+f*80,70+g*40-50,90+f*80,90+g*40-50);
                  setLinestyle(g-1,0,3*(f-1));
                  Line(35+f*80,80+g*40-50,85+f*80,80+g*40-50);
                  fiebuton(30+f*80,70+g*40-50,90+f*80,90+g*40-50);
                                  End;
for g:=1 to 4 do Begin
                  setLinestyle(0,0,0);
                  bar(30+f*80,230+g*40-50,90+f*80,250+g*40-50);
                  Rectangle(30+f*80,230+g*40-50,90+f*80,250+g*40-50);
                  setLinestyle(4,modlin[g],3*(f-1));
                  Line(35+f*80,240+g*40-50,85+f*80,240+g*40-50);
                  fiebuton(30+f*80,230+g*40-50,90+f*80,250+g*40-50);
                 End;
                 End;
aftext(100,100-50,260,430-50,'Alegeti tipul de linie',true);
ShowMouse;MemoAtribute(true);testbuton(false);
HideMouse;refafer(100,100-50,pm,copyput);ShowMouse;
setLinestyle(fu1(but),fu3,3*fu2(but));
sir:='  SetLineStyle ('+Linestyles[fu1(but)]+','+strw(fu3)+','+grosimi[fu2(but)]+');';
writeln(fis,sir);com:=0;End;

{----------------------------------------------------------------------------}

Procedure setculumplere;
var f,g:integer;c:word;
Begin
HideMouse;MemoAtribute(false);
                              lun:=imagesize(94,94,266,276);
                              getmem(pm,lun);
                              getimage(94,94,266,276,pm^);
Panou(94,94,266,276,2);
setLinestyle(0,0,0);
for f:=1 to 4 do for g:=1 to 4 do
         Begin
            setfillstyle(solidfill,(f-1)*4+(g-1));
            bar(60+g*40,60+f*40,100+g*40,100+f*40);
            Rectangle(60+g*40,60+f*40,100+g*40,100+f*40);
         End;
aftext(94,94,266,276,'Alegeti culoarea de umplere',true);
ShowMouse;MemoAtribute(true);
movemouse(180,180);setarea(100,100,260,260);
repeat If LeftPressed1 then
         Begin
            c:=(4*((mousey-100) div 40))+((mousex-100) div 40);break;
         End;
until false;setarea(5,5,635,475);
culu:=c;
HideMouse;refafer(94,94,pm,copyput);ShowMouse;
com:=0;
End;

{----------------------------------------------------------------------------}

Procedure text;
var   x1p,y1p,xp,yp,zp,tp : integer;
      c                   : char;
      sr                  : string;
      xsr,ysr             : integer;
Procedure atrt;
Begin
     setwritemode(xorput);
     SetColor(white);
     setLinestyle(3,0,0);
End;
Begin
MemoAtribute(false);setwritemode(xorput);setLinestyle(3,0,0);SetColor(white);
x1p:=mousex;y1p:=mousey;
MoveMouse(320,240);
repeat
If ((mousex<>x1p) or (mousey<>y1p)) then
                  Begin
                    HideMouse;
                    Rectangle(x1p,y1p,x1p+2+textwidth('D'),y1p+2+textheight('M'));
                    x1p:=mousex;y1p:=mousey;
                    Rectangle(x1p,y1p,x1p+2+textwidth('D'),y1p+2+textheight('M'));ShowMouse;
                  End;
until LeftPressed1;
xp:=x1p;yp:=y1p;zp:=x1p+2+textwidth('D');tp:=y1p+2+textheight('M');
sr:='';xsr:=xp;ysr:=yp;hidemouse;
repeat
If keypressed then
                  Begin
                    HideMouse;Rectangle(xp,yp,zp,tp);
                    c:=readkey;If c in [' '..'z'] then
                       Begin
                         sr:=sr+c;setwritemode(copyput);
                         MemoAtribute(true);outtextxy(xp+2,yp-2,c);
                         inc(xp,textwidth(c));
                         inc(zp,textwidth(c));atrt;
                       End;
                    Rectangle(xp,yp,zp,tp);
                    ShowMouse;
                  End;
until ((c=#13) or LeftPressed1);showmouse;
sir:='  OutTextXY ( '+stri(xsr)+', '+stri(ysr)+', '''+sr+''');';writeln(fis,sir);
com:=0;HideMouse;Rectangle(xp,yp,zp,tp);ShowMouse;setwritemode(copyput);MemoAtribute(true);
End;

{----------------------------------------------------------------------------}

Procedure settipumpl;
var f,g,c:integer;
Begin
HideMouse;MemoAtribute(false);
lun:=imagesize(84,54,306,380);getmem(pm,lun);getimage(84,54,306,380,pm^);
Panou(84,54,306,380,2);setLinestyle(0,0,0);
for f:=1 to 3 do for g:=1 to 4 do
                   Begin
                     setfillstyle((f-1)*4+(g-1),white);
                     bar((g+1)*50,20+f*50,90+g*50,60+f*50);
                     fiebuton((g+1)*50,20+f*50,90+g*50,60+f*50);
                     Rectangle(50+g*50,20+f*50,90+g*50,60+f*50);
                   End;
for f:=1 to 3 do for g:=1 to 4 do
                   Begin
                     setfillpattern(patterns[(f-1)*4+(g-1)],white);
                     bar((g+1)*50,170+f*50,90+g*50,210+f*50);
                     fiebuton((g+1)*50,170+f*50,90+g*50,210+f*50);
                     Rectangle(50+g*50,170+f*50,90+g*50,210+f*50);
                   End;
aftext(84,54,306,380,'Alegeti tipul de umplere',true);
ShowMouse;MemoAtribute(true);testbuton(false);butu:=but;
HideMouse;refafer(84,54,pm,copyput);ShowMouse;
com:=0;End;

{----------------------------------------------------------------------------}

Procedure aimp;Begin refafer(198,198,pmf,copyput);rasp:=1;End;
Procedure rimp;Begin refafer(198,198,pmf,copyput);If existimprim then rasp:=2;End;
Procedure noimp;
Begin
with dbut do Begin lungime:=60;latime:=30;End;
cbut.interior:=blue;
repeat
sirbut[1]:='Renunta';sirbut[2]:='Insista';
@sircom[1]:=addr(aimp);@sircom[2]:=addr(rimp);
ferbut(198,198,2,'Nu aveti imprimanta',true);
until rasp<>0;
Case rasp of
1: Begin End;
2: printscr;End;
rasp:=0;com:=0;
End;
Procedure tipareste;
Begin
If existimprim then Begin printscr;com:=0;end else noimp;
End;

{----------------------------------------------------------------------------}

Procedure alegean;Begin coml:=0;End;
Procedure alege;
var modsb:0..11;
    sirdi:string;
Begin
coml:=com;
with dbut do Begin lungime:=50;latime:=30;End;
cbut.interior:=magenta;
sirbut[1]:='Culoare';sirbut[2]:='Model';sirbut[3]:='Revenire';
@sircom[1]:=addr(setculumplere);@sircom[2]:=addr(settipumpl);@sircom[3]:=addr(alegean);
ferbut(198,198,3,'Alegeti atributele de umplere',true);
com:=coml;
refafer(198,198,pmf,copyput);
If com=0 then       Begin
Case butu of
01..12 : Begin sir:='  SetFillStyle ('+fillstyles[butu-1]+','+culs[culu]+');';
               setfillstyle(butu-1,culu);End;
13..24 : Begin sirdi:='';If mods[butu-13]=0 then  Begin
               If consti=false then Begin sirdi:=#13#10'Const'#13#10;consti:=true;End;
               mods[butu-13]:=nrajuns;
               insfis(0,sirdi+'  Model'+stri(nrajuns)+' : FillPatternType = '+model[butu-13]);inc(nrajuns);
                                                  End;
         modsb:=butu-13;
         sir:='  SetFillPattern(Model'+stri(mods[modsb])+','+culs[culu]+');';
         setfillpattern(patterns[modsb],culu);
         End;
End;     writeln(fis,sir);
                    End;
End;

{----------------------------------------------------------------------------}

Procedure selectfont;
var stilft,marimeft:word;
Procedure preview;
Begin
  settextjustify(1,1);
  setviewport(124,124,376,196+50,clipon);
  setfillstyle(solidfill,white);SetColor(black);
  bar(0,0,252,72+50);settextstyle(stilf,horizdir,marimef);
  outtextxy(126,36+25,'Artist');
  setviewport(0,0,638,429,clipon);
End;
Begin
cursor('mina.cur');
HideMouse;MemoAtribute(false);stilft:=stilf;marimeft:=marimef;
lun:=imagesize(100,100,400,370);getmem(pm,lun);getimage(100,100,400,370,pm^);
Panou(100,100,400,370,1);
Panou(120,120,380,250,2);setLinestyle(0,0,0);
  with dbut do Begin
                 lungime:=60;latime:=30;
               End;
  cbut.interior:=lightgray;
 settextstyle(smallfont,0,4);
 aftext(100,100,400,370,'Alegeti stilul si marimea fontului',true);
        punebuton(120,270,'Font +');
        punebuton(120,310,'Font -');
        punebuton(315,270,'Accepta');
        punebuton(315,310,'Anuleaza');
        punebuton(220,270,'Marime +');
        punebuton(220,310,'Marime -');
preview;ShowMouse;
repeat nrbut:=6;
testbuton(false);
Apasa;
Case but of
1 : Begin If stilf=10 then stilf:=09;inc(stilf);End;
2 : Begin If stilf=00 then stilf:=01;dec(stilf);End;
5 : Begin If marimef=10 then marimef:=09;inc(marimef);End;
6 : Begin If marimef=00 then marimef:=01;dec(marimef);End;
End;bell;preview;
until ((but=4) or (but=3));nrbut:=0;
HideMouse;MemoAtribute(true);refafer(100,100,pm,copyput);ShowMouse;com:=0;
If but=4 then Begin stilf:=stilft;marimef:=marimeft;End;
settextstyle(stilf,horizdir,marimef);
If but=3 then  Begin sir:='  SetTextStyle('+stiluri[stilf]+', HorizDir,'+stri(marimef)+');';writeln(fis,sir);End;
End;

{----------------------------------------------------------------------------}

Procedure selectplansa;
procedure sunet;
var f     : integer;
    a,i,j : word;
begin
case efs of
 0 : begin
       sound(1000);
       delay(100);
       nosound;
     end;
 1 : for f:=1 to 3 do
              begin
                sound(1000);
                delay(10);
                nosound;
                delay(200);
              end;
 2 : begin
        for f:=01 to 20 do
                     begin
                       sound(080*f);
                       delay(08);
                       nosound;
                     end;
        for f:=20 downto 01 do
                     begin
                       sound(080*f);
                       delay(08);
                       nosound;
                     end;
     end;
 3 : for f:=1  to 45 do
                 Begin
                   sound(100*f);
                   delay(10);
                   nosound;
                 End;
 4 : for f:=1000 to 1050 do
                 begin
                    sound(f+500);
                    delay(10);
                    sound(f-500);
                    delay(10);
                    nosound;
                 end;
 5 : for f:=1 to 200 do
                 begin
                    sound(f*Random(50));
                    delay(5);
                    nosound;
                 end;
 6 :  Begin
        a:=391;
        Sound(a);
        Delay(210);
        Inc(a,247);
        Sound(a);
        Delay(410);
        NoSound;
      End;
 7 :  Begin
        a:=100;
         Repeat
            Inc(a,100);
            Sound(a);
            Delay(8);
            NoSound;
         Until a>3500
       end;
 8 : Begin
       For i:=1 To 4 Do
       For j:=401 To 412 Do
           Begin
              Sound(i);
              Delay(11);
              Sound(j);
              Delay(11);
              NoSound;
           End
       End;
 9 :   Begin
          For i:=1 To 99 Do
              Begin
                Sound(1234);
                Delay(11);
                NoSound;
                Delay(2);
              End;
       End;
 10: Begin
        a:=100;
        Repeat
          Inc(a,100);
          Sound(a);
          Delay(33);
          NoSound;
        Until a>3500
        End;

end;end;

procedure grafic;
var f,a       : word;
    FillInfop : FillSettingsType;
    X,Y       : Word;
begin
case efg of
  0 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for f:=1 to 5000 do begin
               x:=Random(640);y:=Random(480);Bar(x,y,x+7,y+7);
                          End;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  1 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for f:=1 to 500 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+40,y+40);
                       End;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  2 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for F:=1 to 100 do begin Y:=Random(480);
                             Bar(0,y,640,y+Random(10));
                       End;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  3 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for F:=1 to 100 do begin X:=Random(640);
                             Bar(X,0,x+Random(10),480);
                       End;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  4 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for F:=1 to 300 do begin X:=Random(640);
                             Bar(X,Random(640),x+Random(20),Random(480));
                       End;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  5 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for x:=0 to 31 do begin
        delay(4);
        for y:=0 to 23 do
        Bar(X*10,y*10,X*10+10,y*10+10);
                        end;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  6 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      for x:=0 to 23 do begin
         delay(4);
         for y:=0 to 31 do
         Bar(y*10,x*10,y*10+10,x*10+10);
                        end;
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
  7 : begin
      GetFillSettings(FillInfop);
      SetFillStyle(SolidFill,White);
      bar(0,0,126,61);delay(100);
      bar(126,61,252,122);delay(100);
      bar(126,0,252,61);delay(100);
      bar(0,61,126,122);
      with FillInfop do SetFillStyle(Pattern, Color);
      end;
end;end;

Procedure preview;
Begin
  settextjustify(1,1);
  setviewport(124,124,376,196+50,clipon);
  if ((but=1) or (but=2))then begin
  setfillstyle(solidfill,white);
  bar(0,0,252,122);
  setfillstyle(5,green);fillellipse(126,61,120,60);setfillstyle(solidfill,white);
  SetColor(black);grafic;end;
  sunet;settextstyle(smallfont,0,7);
  bar(10,5,242,35);Rectangle(11,6,241,34);
  outtextxy(126,16,'Efect sonor : '+stri(efs));
  setviewport(0,0,638,429,clipon);
End;
Begin
cursor('mina.cur');
HideMouse;MemoAtribute(false);
lun:=imagesize(100,100,400,370);getmem(pm,lun);getimage(100,100,400,370,pm^);
Panou(100,100,400,370,1);
Panou(120,120,380,250,2);setLinestyle(0,0,0);
with dbut do Begin lungime:=60;latime:=30;End;cbut.interior:=lightgray;
settextstyle(smallfont,0,4);aftext(100,100,400,370,'Alegeti efectul grafic si sonor',true);
punebuton(120,270,'Grafica +');punebuton(120,310,'Grafica -');
punebuton(315,270,'Accepta');punebuton(315,310,'Anuleaza');
punebuton(220,270,'Sunet +');punebuton(220,310,'Sunet -');setfillstyle(solidfill,white);
but:=1;Preview;ShowMouse;
repeat nrbut:=6;
testbuton(false);
Apasa;
Case but of
1 : Begin If efg=07 then efg:=06;inc(efg);End;
2 : Begin If efg=00 then efg:=01;dec(efg);End;
5 : Begin If efs=10 then efs:=09;inc(efs);End;
6 : Begin If efs=00 then efs:=01;dec(efs);End;
End;preview;
until ((but=4) or (but=3));nrbut:=0;
HideMouse;MemoAtribute(true);refafer(100,100,pm,copyput);ShowMouse;com:=0;
If but=3 then  Begin
 if wtg=false then begin insproc('wtg.prc');wtg:=true;end;
 if sirs[efs]=0 then begin
    insproc('efects'+stri(efs)+'.prc');sirs[efs]:=1;
                     end;
    writeln(fis,'  EfectSonor'+stri(efs)+';');
 if sird[efg]=0 then begin
    insproc('efectg'+stri(efg)+'.prc');sird[efg]:=1;
                     end;
    writeln(fis,'  EfectGrafic'+stri(efg)+';');
 sir:=#13#10'{ --------------------  Aici incepe o noua plansa ------------------------- }'#13#10;
 writeln(fis,sir);stpl:=true;
               End;
End;

{----------------------------------------------------------------------------}

procedure alegeefectan;begin end;
Procedure alegeefect;
Begin
with dbut do Begin lungime:=60;latime:=30;End;
cbut.interior:=lightblue;
sirbut[1]:='Da';sirbut[2]:='Nu';sirbut[3]:='Anulare';
@sircom[1]:=addr(selectplansa);@sircom[2]:=addr(nou);@sircom[3]:=addr(alegeefectan);
ferbut(198,198,3,'Doriti efect grafic intre planse ?',true);
hidemouse;refafer(198,198,pmf,copyput);if stpl then clearviewport;
showmouse;com:=0;stpl:=false;
End;

{----------------------------------------------------------------------------}

Procedure sfirsit;
Begin
closegraph;
if wtg then sir:='  AsteaptaOTasta;' else sir:='  Readln;';
sir:=sir+' Closegraph;'#13#10'end.';writeln(fis,sir);
{$IFDEF shareware}
sir:=#13#10'{Daca va place ARTIST comandati acum versiunea inregistrata !}';writeln(fis,sir);
{$ENDIF}
close(fis);
chdir(dircurent);

{$IFDEF shareware} ThisProgramIsShareware2; {$ENDIF}

writeln('  ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ');
writeln('  ณ  Multumesc pentru folosirea programului ARTIST '+versiune+'  ณ');
writeln('  ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู');
halt;End;

Procedure cmnu;
Begin
refafer(198,198,pmf,copyput);
com:=0;
End;

Procedure sf;
Begin
with dbut do Begin lungime:=40;latime:=40;End;cbut.interior:=red;
sirbut[1]:='Da';sirbut[2]:='Nu';
@sircom[1]:=addr(sfirsit);@sircom[2]:=addr(cmnu);
ferbut(198,198,2,'Doriti sa iesiti ?',true);
End;


{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ    Aceasta este procedura ce deseneaza plansa de prezentare    บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}

Procedure prezentare;
const s1:string = 'Autor : Marian Veteanu';
      s2:string = '                      ';
      rapid : boolean = false;
      help  : boolean = false;
var   f       : integer;
      Palette : PaletteType;
      ch      : char;
Begin
for f:=1 to paramcount do Begin
 If ((paramstr(f)='/r') or (paramstr(f)='/R') or (paramstr(f)='/rapid')
  or (paramstr(f)='/RAPID') or (paramstr(f)='/Rapid')) then  rapid:=true;
 If ((paramstr(f)='/m') or (paramstr(f)='/M') or (paramstr(f)='/mut')
  or (paramstr(f)='/MUT') or (paramstr(f)='/Mut')) then  mute:=true;
 If copy (paramstr(f),1,1)<>'/' then nume:=paramstr(f);
End;

If not rapid then Begin
getpalette(palette);
for f:=1 to 15 do setpalette(f,0);
SetFillPattern(patterns[8],Brown);Bar(30,30,610,450);
SetColor (Yellow);
SetTextStyle(GothicFont, HorizDir,4);
OutTextXY ( 159, 399, 'Autor : Marian Veteanu');
setcolor(blue);
               settextstyle(10,0,6);
               setusercharsize(3,1,1,1);
               outtextxy(100,200,'Artist');
               setusercharsize(1,1,1,1);
setfillstyle(1,10);
floodfill(120,250,blue);floodfill(220,250,blue);
floodfill(290,250,blue);floodfill(330,250,blue);
floodfill(330,223,blue);floodfill(380,254,blue);
floodfill(475,250,blue);
ellipse(305,220,0,180,110,165);ellipse(195,297,90,125,60,80);
ellipse(195,297,145,280,60,80);ellipse(416,299,260,30,60,80);
ellipse(416,299,43,50,60,80);ellipse(416,299,57,90,60,80);
ellipse(305,240,230,310,195,160);setfillstyle(1,lightblue);
floodfill(305,300,blue);ellipse(305,290,185,353,80,20);
ellipse(305,290,180,359,80,50);ellipse(305,270,0,360,11,6);
setfillstyle(1,7);floodfill(305,270,blue);
ellipse(250,220,235,206,20,25);ellipse(355,220,235,180,20,25);
ellipse(355,220,192,200,20,25);circle(354,235,10);
ellipse(250,235,210,150,10,10);ellipse(305,310,174,3,29,21);
setfillstyle(1,15);floodfill(250,220,blue);floodfill(355,220,blue);
setfillstyle(1,0);floodfill(300,335,blue);setfillstyle(1,4);
floodfill(300,315,blue);
setfillstyle(1,darkgray);
floodfill(354,235,blue);floodfill(254,238,blue);
ellipse(250,190,0,165,15,9);ellipse(250,190,0,156,16,3);
setfillstyle(1,green);floodfill(245,184,blue);
ellipse(354,190,0,165,15,9);ellipse(354,190,0,156,16,3);
setfillstyle(1,green);floodfill(349,184,blue);
setallpalette(palette);
      repeat until keypressed;
      Ch := ReadKey;
      if ch = #0 then ch := readkey;
      SetFillStyle(0,black);
      for f:=1 to 500 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+40,y+40);
                       End;
      cleardevice;
End;End;


{----------------------------------------------------------------------------}


Procedure legenda;
const comenzi : array [1..16] of string[6]=
    ('Iesire','Nou','TipFig','TipSpr','TipLin','TipUmp','TipTxt',
     'Trasat','Linie','Figuri','Cerc','Elipsa','Spray','Umple','Print','Text');
var dr:integer;
Procedure ButonLegenda3D(xb,yb,zb,tb:integer);
 Begin
  setfillstyle(solidfill,lightgray);
  bar(xb+1,yb+2,zb,tb);
  SetColor(white);Line(xb+1,yb+2,zb,yb+2);Line(zb,yb+2,zb,tb);
  SetColor(black);Line(zb,tb,xb+1,tb);Line(xb+1,tb,xb+1,yb+2);
  SetColor(white);
 End;
Begin
Rectangle(0,430,638,472);Line(0,451,638,451);
settextstyle(smallfont,horizdir,4);
dr:=0;repeat  ButonLegenda3D(dr,430,dr+38,430+19);ButonLegenda3D(dr,451,dr+38,451+19);
setfillstyle(solidfill,dr div 40);bar(dr+11,458,dr+28,465);
Line(dr,430,dr,472);SetColor(black);Rectangle(dr+10,457,dr+29,466);
outtextxy(dr+4,432,comenzi[1+(dr div 40)]);SetColor(white);
inc(dr,40);until dr>=640;
setfillstyle(solidfill,white);settextstyle(stilf,0,marimef);
End;

{----------------------------------------------------------------------------}

procedure Input;

procedure InputString(xp,yp:integer;var nume:string);
var x,y:integer;
    c:char;
Begin
  settextstyle(smallfont,0,6);
  setfillstyle(solidfill,white);
  outtextxy(xp-310,yp,'Introduceti numele programului >');
  x:=xp;y:=yp;nume:='';
  repeat
  if keypressed then begin c:=upcase(readkey);
     if c=#8 then if x>xp then
               begin bell;
               bar(x,y,x+3+textwidth('A'),y+3+textheight('A'));
               dec(x,textwidth('A'));
               bar(x,y,x+3+textwidth('A'),y+3+textheight('A'));
               outtextxy(x,y,'<');
               nume:=copy(nume,1,length(nume)-1);
               end;
     if c in ['A'..'Z','0'..'9','.'] then if x<xp+120 then
               begin bell;
               bar(x,y,x+textwidth('A'),y+textheight('A'));
               outtextxy(x,y,c);inc(x,textwidth('A'));
               outtextxy(x,y,'<');
               nume:=nume+c;
               end;
                     end;
     until c=#13;
end;
begin
if nume='' then begin
                  cleardevice;
                  panou(60,100,580,180,1);
                  panou(80,120,560,160,2);
                  settextstyle(5,0,3);
                  setcolor(red);
                  outtextxy(90,120,' Artist - Utilitar pentru programare vizuala');
                  panou(60,200,580,300,1);
                  panou(80,220,560,280,2);
                  inputstring(400,240,nume);
                  setlinestyle(0,0,0);cleardevice;
                end;
If nume<>'' then If pos('.',nume)=0 then nume:=nume+'.pas';
If nume='' then nume:='Rezultat.pas';
assign(fis,dircurent+'\'+nume);rewrite(fis);writeln(fis,sir);

sir:='Program Grafica_Vizuala;'#13#10#13#10+'{'#13#10+
'        ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ'#13#10+
'        ณ Program creat cu ajutorul utilitarului ARTIST '+versiune+' ณ';

writeln(fis,sir);

{$IFDEF shareware}
sir:=
'        ณ             VERSIUNE NEINREGISTRATA               ณ';writeln(fis,sir);
{$ENDIF}

sir:=
'        ณ                 (c) VMA soft                      ณ'#13#10+
'        ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู'#13#10+
'}'#13#10#13#10+
'uses graph,crt;';writeln(fis,sir);
sir:='Var dr,mo:integer;'#13#10#13#10'Begin'#13#10'  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,''c:\bp\bgi'');'#13#10;
writeln(fis,sir);sir:='';
End;


{----------------------------------------------------------------------------}

procedure IntroducereNumeProgram;
begin
Input;
setbkcolor(black);SetColor(culo);
initmouse;legenda;
setarea(5,5,635,475);setviewport(0,0,638,429,clipon);ShowMouse;
end;

{----------------------------------------------------------------------------}

Procedure InitializareModGrafic;
Procedure VitezaCursor;      assembler;
asm
        MOV AX,0305H
        XOR BX,BX
        INT 16H
End;
Begin
dr:=9;mo:=2;com:=0;culo:=white;initgraph(dr,mo,'');vitezacursor;
If graphresult<>0 then
   Begin
     Writeln('   Eroare la initializarea modului video VGA 640x480x16 !!!');
     Halt(3);
   End;
End;

{----------------------------------------------------------------------------}

procedure SareInDirectorulArtist;
 var numeartist     : namestr;
     extensieartist : extstr;
     catalogartist  : dirstr;
 begin
   getdir(0,dircurent);
   fsplit(fexpand(paramstr(0)),catalogartist,numeartist,extensieartist);
   if numeartist<>'ARTIST' then
         begin
           writeln('   Programul nu functioneaza decit cu numele ARTIST.EXE');
           halt(5);
         end;
   delete(catalogartist,length(catalogartist),1);
   chdir(catalogartist);
 end;

{----------------------------------------------------------------------------}

Procedure InregistreazaDrivereSiFonturi;
Begin
If RegisterBGIDriver(@egavgaproc)<0 then Begin writeln(' Eroare la inregistrarea fisierului egavga.obj');halt(2);End;
If RegisterBGIFont  (@boldproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului bold.obj'  );halt(2);End;
If RegisterBGIFont  (@europroc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului euro.obj'  );halt(2);End;
If RegisterBGIFont  (@gothproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului goth.obj'  );halt(2);End;
If RegisterBGIFont  (@lcomproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului lcom.obj'  );halt(2);End;
If RegisterBGIFont  (@littproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului litt.obj'  );halt(2);End;
If RegisterBGIFont  (@sansproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului sans.obj'  );halt(2);End;
If RegisterBGIFont  (@scriproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului scri.obj'  );halt(2);End;
If RegisterBGIFont  (@simpproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului simp.obj'  );halt(2);End;
If RegisterBGIFont  (@tripproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului trip.obj'  );halt(2);End;
If RegisterBGIFont  (@tscrproc)  <0 then Begin writeln(' Eroare la inregistrarea fisierului tscr.obj'  );halt(2);End;
End;

{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ Aceasta este procedura care preda controlul comenzii selectate บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}


Procedure VerificaDacaSeApasaUnButon;
begin
repeat
FereastraCuCeas;
If mousey>430 then Begin
If LeftPressed1 then Begin dr:=mousex;mo:=mousey;setwritemode(copyput);
   If (mo>430) and (mo<451) then Begin com:=(dr+40) div 40;bell;marcbuton;
   cursorales:=false;selectcursor('sageata.cur');
   End;
   If (mo>451) and (mo<638) then Begin culo:=dr div 40;cl:=com;com:=17;bell;marcbuton;End;
End;
If RightPressed1 then Begin dr:=mousex;mo:=mousey;setwritemode(copyput);
   If (mo>430) and (mo<451) then com:=17+(dr+40) div 40;
   If (mo>451) and (mo<638) then com:=33+(dr+40) div 40;bell;
End;
End;

if ((cursorales=true) and (com=0)) then
                          begin
                             cursorales:=false;
                             selectcursor('sageata.cur');
                          end;
mark(heap);
Case com of
1:  sf;
2:  alegeefect;
3:  tipfig;
4:  tipspray;
5:  setl;
6:  alege;
7:  selectfont;
8:  drag;
9:  linie;
10: figuri;
11: cerc;
12: elipsa;
13: spray;
14: umple;
15: tipareste;
16: text;
17: setcul;
18     : help('Iese din programul ARTIST');
19     : help('Sterge plansa curenta');
20     : help('Selecteaza tipul figurilor');
21     : help('Selecteaza tipul de spray');
22     : help('Selecteaza tipul de linie');
23     : help('Selecteaza atributele de umplere');
24     : help('Selecteaza tipul de font');
25     : help('Traseaza linii curbe');
26     : help('Deseneaza segmente de dreapta');
27     : help('Deseneaza forme poligonale');
28     : help('Deseneaza forme circulare');
29     : help('Deseneaza forme elipsoidale');
30     : help('Deseneaza efect de spray');
31     : help('Umple o figura');
32     : help('Tipareste plansa la imprimanta');
33     : help('Scriere de texte');
34..49 : help('Selecteaza culoarea ( '+culs[com-34]+' )');

50 : bara;            { Extra comenzi }
51 : triunghi;        { Extra comenzi }
52 : paralelogram;    { Extra comenzi }

End;
release(heap);
until false;
end;

{

     ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
     บ                 Aici incepe programul principal                บ
     ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

}


Begin

VerificaMicroProcesor;
VerificaHelp;
InregistreazaDrivereSiFonturi;

{$IFDEF shareware} ThisProgramIsShareware; {$ENDIF}

SareInDirectorulArtist;
InitializareModGrafic;
Prezentare;
VerificaMouse;
IntroducereNumeProgram;
VerificaDacaSeApasaUnButon;
End.
