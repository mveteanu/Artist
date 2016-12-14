
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

Procedure EfectSonor10;                { Efecte sonore }
Var a : Word;
Begin
  a:=100;
  Repeat
    Inc(a,100);
    Sound(a);
    Delay(33);
    NoSound;
  Until a>3500
End;                                   { Efecte sonore }

procedure EfectGrafic7;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill, GetBkColor);
    Bar(0,0,320,240);Delay(100);
    Bar(320,240,640,480);Delay(100);
    Bar(320,0,640,240);Delay(100);
    Bar(0,240,320,480);
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

Begin
  dr:=Vga;mo:=VgaHi;initgraph(dr,mo,'c:\bp\bgi');

  SetTextStyle(DefaultFont, HorizDir,3);
  OutTextXY ( 209, 71, 'Artist');
  SetTextStyle(TriplexFont, HorizDir,7);
  SetColor (Yellow);
  OutTextXY ( 184, 110, 'Artist');
  SetTextStyle(SmallFont, HorizDir,10);
  SetColor (LightMagenta);
  OutTextXY ( 229, 192, 'Artist');
  SetLineStyle (DashedLn,0,NormWidth);
  SetColor (LightGreen);
  Line(160,45,448,45);Line(448,45,358,265);Line(358,265,70,265);Line(70,265,160,45);
  Line(358,265,91,330);Line(91,330,350,404);Line(350,404,617,339);Line(617,339,358,265);
  SetColor (LightRed);
  SetTextStyle(SansSerifFont, HorizDir,6);
  OutTextXY ( 234, 296, 'Artist');
  SetTextStyle(GothicFont, HorizDir,5);
  SetColor (LightCyan);
  OutTextXY ( 306, 349, 'Artist');
  EfectSonor10;
  EfectGrafic7;

{ --------------------  Aici incepe o noua plansa ------------------------- }

  SetColor (LightBlue);
  Circle (296,224,191);
  SetTextStyle(7 {TriplexScriptFont}, HorizDir,8);
  SetColor (Magenta);
  OutTextXY ( 131, 190, 'Artist');
  SetColor (Green);
  OutTextXY ( 156, 275, 'Sfirsit');
  SetColor (LightCyan);
  OutTextXY ( 252, 118, 'VMA');
  AsteaptaOTasta; Closegraph;
end.
