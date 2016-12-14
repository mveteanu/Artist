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

