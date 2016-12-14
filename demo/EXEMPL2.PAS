
Program Grafica_Vizuala;

{
        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        ³ Program creat cu ajutorul utilitarului ARTIST 1.0 ³
        ³                 (c) VMA soft                      ³
        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
}

uses graph,crt;
Var dr,mo:integer;

procedure AsteaptaOTasta;              { Asteapta utilizatorul sa apese o tasta }
const
  Esc = #27;
var
  Ch : char;
begin
  repeat until KeyPressed;
  Ch := ReadKey;
  if ch = #0 then ch := readkey;
  if Ch = Esc then
    Halt(0)                            { Daca se apasa ESC se termina programul}
end;                                   { AsteaptaOTasta; }

procedure EfectSonor3;                 { Efecte sonore }
  var f : byte;
    Begin;
      for f:=1  to 45 do Begin
          sound(100*f);delay(10);nosound;
                         End;
    end;                               { Efecte sonore }

procedure EfectGrafic3;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for F:=1 to 100 do begin X:=Random(640);
                             Bar(X,0,x+Random(10),480);
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

procedure EfectGrafic5;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for x:=0 to 31 do for y:=0 to 23 do
        Bar(X*20,y*20,X*20+20,y*20+20);
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

procedure EfectGrafic6;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for x:=0 to 23 do for y:=0 to 31 do
        Bar(y*20,x*20,y*20+20,x*20+20);
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

Begin
  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,'c:\bp\bgi');

  SetLineStyle (SolidLn,0,ThickWidth);
  SetColor (LightBlue);
  Line(189,121,454,121);Line(454,121,386,201);Line(386,201,121,201);Line(121,201,189,121);
  Line(189,279,459,279);Line(459,279,392,347);Line(392,347,122,347);Line(122,347,189,279);
  Line (122,200,123,345);
  Line (192,120,190,278);
  Line (454,121,456,279);
  Line (386,201,389,346);
  EfectSonor3;
  EfectGrafic3;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetFillStyle (SolidFill,Yellow);
  SetColor (LightRed);
  FillEllipse (183,178,51,51);
  FillEllipse (243,155,47,47);
  FillEllipse (301,146,48,48);
  FillEllipse (362,186,48,48);
  FillEllipse (382,253,45,45);
  FillEllipse (355,304,39,39);
  FillEllipse (283,328,46,46);
  FillEllipse (220,328,40,40);
  FillEllipse (163,289,44,44);
  FillEllipse (156,239,37,37);
  SetColor (LightMagenta);
  FillEllipse (265,246,92,52);
  SetColor (LightRed);
  FillEllipse (210,204,16,16);
  FillEllipse (238,197,14,14);
  FillEllipse (274,193,17,17);
  FillEllipse (307,200,18,18);
  FillEllipse (340,214,13,13);
  FillEllipse (356,239,13,13);
  FillEllipse (348,268,12,12);
  FillEllipse (324,286,12,12);
  FillEllipse (294,294,15,15);
  FillEllipse (263,297,13,13);
  FillEllipse (236,295,13,13);
  FillEllipse (209,285,14,14);
  FillEllipse (183,268,15,15);
  FillEllipse (176,236,12,12);
  FillEllipse (186,217,12,12);
  SetColor (LightBlue);
  SetTextStyle(TriplexFont, HorizDir,5);
  OutTextXY ( 207, 224, 'VMA');
  EfectSonor3;
  EfectGrafic5;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetColor (Red);
  SetLineStyle (UserBitLn,65534,ThickWidth);
  Line(207,138,438,138);Line(438,138,111,237);Line(111,237,207,138);
  Line(207,327,446,328);Line(446,328,122,419);Line(122,419,207,327);
  Line (112,235,123,420);
  Line (207,137,208,327);
  Line (436,139,443,329);
  SetColor (LightCyan);
  MoveTo (401,62);
  LineTo(402,61);
  LineTo(407,53);
  LineTo(411,41);
  LineTo(413,37);
  LineTo(414,36);
  LineTo(415,35);
  LineTo(415,34);
  LineTo(415,35);
  LineTo(415,41);
  LineTo(415,60);
  LineTo(415,87);
  LineTo(415,104);
  MoveTo (451,42);
  LineTo(451,41);
  LineTo(451,39);
  LineTo(450,39);
  LineTo(450,38);
  LineTo(445,38);
  LineTo(444,39);
  LineTo(443,39);
  LineTo(442,41);
  LineTo(438,57);
  LineTo(441,58);
  LineTo(446,38);
  LineTo(447,35);
  LineTo(447,34);
  LineTo(447,42);
  LineTo(448,45);
  LineTo(448,52);
  LineTo(448,61);
  LineTo(448,71);
  LineTo(445,99);
  LineTo(439,95);
  LineTo(436,86);
  LineTo(435,86);
  MoveTo (496,34);
  LineTo(494,33);
  LineTo(491,33);
  LineTo(485,33);
  LineTo(480,33);
  LineTo(479,37);
  LineTo(479,39);
  LineTo(479,41);
  LineTo(480,44);
  LineTo(481,44);
  LineTo(483,44);
  LineTo(483,43);
  LineTo(484,42);
  LineTo(486,37);
  LineTo(487,34);
  LineTo(489,31);
  LineTo(489,29);
  LineTo(490,28);
  LineTo(490,35);
  LineTo(490,44);
  LineTo(490,65);
  LineTo(490,77);
  LineTo(488,88);
  LineTo(486,98);
  LineTo(479,120);
  LineTo(478,120);
  LineTo(476,119);
  LineTo(476,118);
  LineTo(475,113);
  LineTo(474,111);
  LineTo(474,109);
  LineTo(473,107);
  MoveTo (566,42);
  LineTo(565,42);
  LineTo(561,41);
  LineTo(560,41);
  LineTo(556,41);
  LineTo(550,42);
  LineTo(540,46);
  LineTo(536,48);
  LineTo(530,50);
  LineTo(526,53);
  LineTo(514,65);
  LineTo(511,77);
  LineTo(511,79);
  LineTo(511,80);
  LineTo(511,82);
  LineTo(511,83);
  LineTo(511,85);
  LineTo(513,90);
  LineTo(514,91);
  LineTo(515,92);
  LineTo(516,93);
  LineTo(517,94);
  LineTo(518,95);
  LineTo(520,95);
  LineTo(522,94);
  LineTo(525,90);
  LineTo(528,85);
  LineTo(529,80);
  LineTo(528,69);
  LineTo(525,70);
  LineTo(523,70);
  LineTo(517,72);
  LineTo(515,73);
  LineTo(513,75);
  MoveTo (111,440);
  SetColor (LightGreen);
  Ellipse (471,68,0,360,115,60);
  EfectSonor3;
  EfectGrafic6;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetTextStyle(SansSerifFont, HorizDir,9);
  OutTextXY ( 135, 150, 'Sfirsit');
  AsteaptaOTasta; Closegraph;
end.
