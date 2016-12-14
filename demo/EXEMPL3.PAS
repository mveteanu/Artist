
Program Grafica_Vizuala;

{
        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        ³ Program creat cu ajutorul utilitarului ARTIST 1.0 ³
        ³                 (c) VMA soft                      ³
        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
}

uses graph,crt;

Const
  Model1 : FillPatternType = ($00, $7E, $7E, $7E, $7E, $7E, $7E, $00);
  Model2 : FillPatternType = ($33, $33, $CC, $CC, $33, $33, $CC, $CC);
  Model3 : FillPatternType = ($F0, $F0, $F0, $F0, $0F, $0F, $0F, $0F);
Var dr,mo:integer;

Begin
  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,'c:\bp\bgi');

  SetColor (LightGreen);
  Circle (300,146,80);
  SetColor (LightBlue);
  Rectangle (286,344,339,384);
  SetFillPattern(Model1,LightBlue);
  FloodFill (308,361,LightBlue);
  SetColor (LightGreen);
  Line (220,153,287,346);
  Line (381,154,340,344);
  Line (283,225,303,345);
  Line (328,223,320,345);
  MoveTo (240,93);
  LineTo(240,94);
  LineTo(241,95);
  LineTo(243,98);
  LineTo(256,105);
  LineTo(258,106);
  LineTo(259,106);
  LineTo(265,108);
  LineTo(280,109);
  LineTo(288,109);
  LineTo(298,109);
  LineTo(308,109);
  LineTo(316,109);
  LineTo(320,109);
  LineTo(334,109);
  LineTo(352,107);
  LineTo(355,105);
  LineTo(355,104);
  LineTo(356,103);
  LineTo(357,101);
  LineTo(359,99);
  LineTo(359,98);
  LineTo(360,96);
  LineTo(360,95);
  MoveTo (260,213);
  LineTo(267,210);
  LineTo(268,209);
  LineTo(271,206);
  LineTo(272,205);
  LineTo(273,205);
  LineTo(274,205);
  LineTo(282,204);
  LineTo(297,203);
  LineTo(298,203);
  LineTo(304,203);
  LineTo(306,203);
  LineTo(306,204);
  LineTo(307,204);
  LineTo(308,204);
  LineTo(315,206);
  LineTo(322,208);
  LineTo(324,208);
  LineTo(326,209);
  LineTo(327,210);
  LineTo(332,211);
  LineTo(334,213);
  LineTo(337,215);
  LineTo(338,215);
  SetFillPattern(Model2,LightGreen);
  FloodFill (286,92,LightGreen);
  SetFillStyle (InterleaveFill,LightGreen);
  FloodFill (301,218,LightGreen);
  SetFillPattern(Model3,LightGreen);
  FloodFill (317,153,LightGreen);
  Readln; Closegraph;
end.
