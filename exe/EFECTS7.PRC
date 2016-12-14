Procedure EfectSonor7;                 { Efecte sonore }
Var a:Word;
Begin
 a:=100;
 Repeat
   Inc(a,100);
   Sound(a);
   Delay(8);
   NoSound;
 Until a>3500
end;                                   { Efecte sonore }

