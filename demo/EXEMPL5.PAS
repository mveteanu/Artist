
Program Grafica_Vizuala;

{
        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
        ³ Program creat cu ajutorul utilitarului ARTIST 1.0 ³
        ³                 (c) VMA soft                      ³
        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
}

uses graph,crt;

Const
  Model1 : FillPatternType = ($AA, $55, $AA, $55, $AA, $55, $AA, $55);
  Model2 : FillPatternType = ($33, $33, $CC, $CC, $33, $33, $CC, $CC);
  Model3 : FillPatternType = ($F0, $F0, $F0, $F0, $0F, $0F, $0F, $0F);
  Model4 : FillPatternType = ($00, $10, $28, $44, $28, $10, $00, $00);
  Model5 : FillPatternType = ($00, $A0, $A0, $AA, $4E, $0A, $0A, $00);
  Model6 : FillPatternType = ($00, $00, $00, $18, $18, $00, $00, $00);
  Model7 : FillPatternType = ($00, $00, $3C, $3C, $3C, $3C, $00, $00);
  Model8 : FillPatternType = ($FF, $7E, $3C, $18, $18, $3C, $7E, $FF);
  Model9 : FillPatternType = ($00, $10, $10, $7C, $10, $10, $00, $00);
  Model10 : FillPatternType = ($00, $42, $24, $18, $18, $24, $42, $00);
  Model11 : FillPatternType = ($02, $02, $FF, $20, $20, $20, $FF, $02);
  Model12 : FillPatternType = ($00, $7E, $7E, $7E, $7E, $7E, $7E, $00);
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

procedure EfectSonor5;                 { Efecte sonore }
  var f : byte;
    Begin;
       for f:=1 to 200 do begin
           sound(f*Random(50));delay(5);nosound;
                          end;
    end;                               { Efecte sonore }

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

Begin
  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,'c:\bp\bgi');

  SetColor (Yellow);
  Line(81,85,602,161);Line(602,161,549,403);Line(549,403,28,327);Line(28,327,81,85);
  Line (241,108,184,350);
  Line (431,135,380,379);
  Line (146,94,151,215);
  Line (151,215,79,334);
  Line (354,125,292,223);
  Line (292,223,305,369);
  Line (518,148,520,285);
  Line (520,285,447,388);
  Line (62,173,293,224);
  Line (293,224,520,286);
  Line (520,286,582,261);
  Line (46,247,152,216);
  Line (152,216,200,288);
  Line (200,288,298,285);
  Line (298,285,391,326);
  Line (391,326,484,339);
  Line (484,339,556,376);
  SetColor (White);
  SetFillStyle (SolidFill,White);
  SetColor (Yellow);
  SetFillStyle (LineFill,Red);
  FloodFill (94,138,Yellow);
  SetFillStyle (LtSlashFill,LightGreen);
  FloodFill (173,138,Yellow);
  SetFillStyle (SlashFill,Cyan);
  FloodFill (284,170,Yellow);
  SetFillStyle (BkSlashFill,Red);
  FloodFill (378,196,Yellow);
  SetFillStyle (LtBkSlashFill,Magenta);
  FloodFill (456,198,Yellow);
  SetFillStyle (HatchFill,Brown);
  FloodFill (533,237,Yellow);
  SetFillStyle (XHatchFill,LightGray);
  FloodFill (92,198,Yellow);
  SetFillStyle (InterleaveFill,DarkGray);
  FloodFill (175,223,Yellow);
  SetFillStyle (WideDotFill,LightBlue);
  FloodFill (260,255,Yellow);
  SetFillStyle (CloseDotFill,LightGreen);
  FloodFill (339,257,Yellow);
  SetFillPattern(Model1,LightCyan);
  FloodFill (423,288,Yellow);
  SetFillPattern(Model2,LightRed);
  FloodFill (535,324,Yellow);
  SetFillPattern(Model3,LightMagenta);
  FloodFill (71,274,Yellow);
  SetFillPattern(Model4,Yellow);
  FloodFill (159,287,Yellow);
  SetFillPattern(Model5,White);
  FloodFill (255,310,Yellow);
  SetFillPattern(Model6,Blue);
  FloodFill (322,333,Yellow);
  SetFillPattern(Model7,Red);
  FloodFill (422,355,Yellow);
  SetFillPattern(Model8,DarkGray);
  FloodFill (498,367,Yellow);
  Line(259,85,583,135);Line(583,135,635,5);Line(635,5,259,85);
  Line (423,50,433,111);
  Line (482,38,506,125);
  Line (543,25,585,135);
  Line (635,7,506,123);
  SetFillPattern(Model9,Brown);
  FloodFill (386,84,Yellow);
  SetFillPattern(Model10,LightGreen);
  FloodFill (435,77,Yellow);
  SetFillPattern(Model11,Brown);
  FloodFill (514,59,Yellow);
  SetFillPattern(Model12,Yellow);
  FloodFill (562,42,Yellow);
  SetFillPattern(Model4,LightCyan);
  FloodFill (547,106,Yellow);
  SetFillPattern(Model9,Green);
  FloodFill (582,72,Yellow);
  EfectSonor5;
  EfectGrafic0;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetTextStyle(10 {BoldFont}, HorizDir,7);
  OutTextXY ( 105, 123, 'Sfirsit');
  SetFillPattern(Model11,Brown);
  FloodFill (148,221,Yellow);
  FloodFill (182,221,Yellow);
  FloodFill (210,221,Yellow);
  FloodFill (211,168,Yellow);
  FloodFill (245,193,Yellow);
  FloodFill (293,186,Yellow);
  FloodFill (335,202,Yellow);
  FloodFill (334,167,Yellow);
  FloodFill (370,188,Yellow);
  OutTextXY ( 345, 271, '1');
  OutTextXY ( 414, 217, '9');
  OutTextXY ( 476, 145, '9');
  OutTextXY ( 548, 73, '6');
  SetFillPattern(Model10,LightGreen);
  FloodFill (372,330,Yellow);
  FloodFill (451,296,Yellow);
  FloodFill (514,223,Yellow);
  FloodFill (559,148,Yellow);
  AsteaptaOTasta; Closegraph;
end.
