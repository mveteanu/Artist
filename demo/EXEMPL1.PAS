
Program Grafica_Vizuala;

{
        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        ³ Program creat cu ajutorul utilitarului ARTIST 1.0 ³
        ³                 (c) VMA soft                      ³
        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
}

uses graph,crt;

Const
  Sprm : byte = 30 ; Sprc : byte = 0;
  Model1 : FillPatternType = ($02, $02, $FF, $20, $20, $20, $FF, $02);
Var dr,mo:integer;

Procedure Spray (x,y : Integer);       { Deseneaza efectul de spray }
  var f : Byte;
  Begin
    For f:=1 To sprm Do
         Case Sprc Of
             0 : PutPixel (x+Random(Sprm),y+Random(Sprm),GetColor);
             1 : PutPixel (x+Random(Sprm),y+Random(Sprm),Random(GetMaxColor));
         End; {Case}
  End;                                 { Spray }

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

Procedure EfectSonor0;                 { Efecte sonore }
   Begin
     Sound(1000);Delay(100);Nosound;
   End;                                { Efecte sonore }

procedure EfectGrafic0;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillPattern(OldPater);
    GetFillSettings(FillInfo);
    SetFillStyle(EmptyFill,GetBkColor);
    for f:=1 to 5000 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+7,y+7);
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

procedure EfectSonor1;                 { Efecte sonore }
  var f : byte;
    Begin;
      for f:=1 to 3 do begin
          sound(1000);delay(10);nosound;delay(200);
                       end;
    end;                               { Efecte sonore }

procedure EfectGrafic1;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for f:=1 to 500 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+40,y+40);
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

procedure EfectGrafic2;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for F:=1 to 100 do begin Y:=Random(480);
                             Bar(0,y,640,y+Random(10));
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

Begin
  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,'c:\bp\bgi');

  Sprm := 40; Sprc := 1;
  Spray (194,178);
  Spray (192,195);
  Spray (192,202);
  Spray (192,209);
  Spray (192,223);
  Spray (192,230);
  Spray (192,248);
  Spray (191,269);
  Spray (190,291);
  Spray (190,314);
  Spray (189,336);
  Spray (201,146);
  Spray (203,164);
  Spray (230,186);
  Spray (246,196);
  Spray (258,214);
  Spray (269,226);
  Spray (283,234);
  Spray (290,238);
  Spray (308,237);
  Spray (312,226);
  Spray (319,206);
  Spray (334,198);
  Spray (343,193);
  Spray (350,185);
  Spray (369,148);
  Spray (370,153);
  Spray (373,160);
  Spray (378,185);
  Spray (380,193);
  Spray (382,211);
  Spray (384,226);
  Spray (385,240);
  Spray (385,248);
  Spray (386,267);
  Spray (388,291);
  Spray (389,311);
  Spray (389,322);
  Spray (389,336);
  Spray (389,342);
  Spray (194,148);
  Spray (194,152);
  Spray (192,165);
  Spray (192,186);
  Spray (192,203);
  Spray (192,226);
  Spray (192,261);
  Spray (192,280);
  Spray (192,308);
  Spray (192,319);
  Spray (192,337);
  Spray (235,192);
  Spray (258,201);
  Spray (281,216);
  Spray (294,228);
  Spray (331,221);
  Spray (339,210);
  Spray (347,199);
  Spray (357,191);
  Spray (366,186);
  Spray (398,155);
  Spray (398,167);
  Spray (400,186);
  Spray (405,221);
  Spray (406,233);
  Spray (407,265);
  Spray (408,284);
  Spray (409,299);
  Spray (410,321);
  Spray (411,332);
  Spray (413,340);
  SetColor (Yellow);
  Sprm := 10; Sprc := 0;
  Spray (342,333);
  Spray (347,329);
  Spray (351,325);
  Spray (356,320);
  Spray (359,318);
  Spray (362,315);
  Spray (366,313);
  Spray (369,310);
  Spray (343,321);
  Spray (341,326);
  Spray (337,329);
  Spray (334,331);
  Spray (331,334);
  Spray (329,335);
  Spray (327,337);
  Spray (325,338);
  Spray (323,341);
  Spray (346,329);
  Spray (347,329);
  Spray (347,332);
  Spray (349,335);
  Spray (351,338);
  Spray (352,340);
  Spray (353,342);
  Spray (357,346);
  Spray (359,347);
  Spray (361,350);
  Spray (363,351);
  Spray (364,354);
  Spray (366,356);
  Spray (369,359);
  Spray (371,362);
  Spray (373,366);
  Spray (375,369);
  Spray (377,373);
  Spray (378,375);
  Spray (380,378);
  Spray (385,304);
  Spray (388,306);
  Spray (394,308);
  Spray (398,311);
  Spray (403,313);
  Spray (407,316);
  Spray (409,317);
  Spray (410,318);
  Spray (414,321);
  Spray (417,323);
  Spray (420,324);
  Spray (423,327);
  Spray (424,328);
  Spray (426,329);
  Spray (432,332);
  Spray (434,333);
  Spray (436,334);
  Spray (439,336);
  Spray (441,336);
  Spray (444,338);
  Spray (444,337);
  Spray (444,331);
  Spray (444,327);
  Spray (444,322);
  Spray (444,320);
  Spray (444,316);
  Spray (444,311);
  Spray (443,307);
  Spray (443,305);
  Spray (442,300);
  Spray (442,296);
  Spray (442,293);
  Spray (441,289);
  Spray (441,285);
  Spray (441,282);
  Spray (441,281);
  EfectSonor0;
  EfectGrafic0;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetTextStyle(10 {BoldFont}, HorizDir,10);
  OutTextXY ( 100, 74, 'VMA');
  SetFillPattern(Model1,Brown);
  FloodFill (153,285,Yellow);
  FloodFill (292,276,Yellow);
  FloodFill (424,266,Yellow);
  SetLineStyle (SolidLn,0,ThickWidth);
  SetColor (LightRed);
  Ellipse (300,231,0,360,269,152);
  EfectSonor1;
  EfectGrafic1;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetColor (LightGreen);
  MoveTo (205,212);
  LineTo(212,205);
  LineTo(215,205);
  LineTo(217,205);
  LineTo(218,206);
  LineTo(221,262);
  LineTo(221,270);
  LineTo(221,280);
  LineTo(221,296);
  LineTo(221,301);
  LineTo(222,301);
  LineTo(244,301);
  LineTo(253,292);
  LineTo(255,280);
  LineTo(256,246);
  LineTo(257,205);
  LineTo(257,203);
  LineTo(256,201);
  LineTo(254,202);
  LineTo(254,203);
  LineTo(253,203);
  LineTo(253,204);
  LineTo(253,206);
  LineTo(253,207);
  LineTo(256,211);
  LineTo(257,211);
  LineTo(258,212);
  LineTo(259,212);
  LineTo(264,211);
  LineTo(266,209);
  LineTo(270,206);
  LineTo(278,192);
  LineTo(279,190);
  LineTo(283,188);
  LineTo(300,167);
  LineTo(304,165);
  MoveTo (272,254);
  LineTo(280,247);
  LineTo(284,241);
  LineTo(288,234);
  LineTo(294,231);
  LineTo(294,244);
  LineTo(295,261);
  LineTo(295,276);
  LineTo(295,281);
  LineTo(296,265);
  LineTo(299,248);
  LineTo(300,244);
  LineTo(306,267);
  LineTo(306,273);
  LineTo(306,283);
  LineTo(308,279);
  LineTo(309,272);
  LineTo(310,264);
  LineTo(312,250);
  LineTo(313,248);
  LineTo(313,246);
  LineTo(315,245);
  LineTo(316,245);
  LineTo(317,249);
  LineTo(320,263);
  LineTo(321,269);
  LineTo(321,275);
  LineTo(322,281);
  LineTo(327,294);
  LineTo(332,295);
  LineTo(348,291);
  LineTo(366,282);
  LineTo(391,262);
  LineTo(395,255);
  MoveTo (432,240);
  LineTo(431,240);
  LineTo(429,240);
  LineTo(428,240);
  LineTo(426,240);
  LineTo(424,240);
  LineTo(422,241);
  LineTo(414,245);
  LineTo(412,246);
  LineTo(410,247);
  LineTo(407,249);
  LineTo(405,251);
  LineTo(404,252);
  LineTo(399,259);
  LineTo(398,264);
  LineTo(397,268);
  LineTo(397,274);
  LineTo(397,277);
  LineTo(426,271);
  LineTo(434,262);
  LineTo(437,248);
  LineTo(438,236);
  LineTo(438,233);
  LineTo(438,232);
  LineTo(437,232);
  LineTo(436,234);
  LineTo(435,237);
  LineTo(432,260);
  LineTo(432,270);
  LineTo(432,278);
  LineTo(433,279);
  LineTo(451,279);
  LineTo(474,265);
  LineTo(480,255);
  LineTo(482,244);
  LineTo(483,237);
  MoveTo (186,347);
  LineTo(216,328);
  LineTo(239,327);
  LineTo(255,327);
  LineTo(361,328);
  LineTo(411,328);
  LineTo(431,328);
  LineTo(473,328);
  LineTo(505,327);
  LineTo(523,325);
  LineTo(535,323);
  LineTo(547,317);
  LineTo(559,311);
  LineTo(575,293);
  LineTo(575,289);
  LineTo(576,283);
  LineTo(577,278);
  LineTo(578,274);
  LineTo(579,269);
  EfectSonor1;
  EfectGrafic2;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetTextStyle(GothicFont, HorizDir,10);
  SetColor (LightCyan);
  OutTextXY ( 133, 129, 'Sfirsit');
  AsteaptaOTasta; Closegraph;
end.
