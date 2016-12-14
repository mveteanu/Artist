Procedure EfectSonor6;                 { Efecte sonore }
 Var a :   Word;
 Begin
   a:=391;
   Sound(a);
   Delay(210);
   Inc(a,247);
   Sound(a);
   Delay(410);
   NoSound;
 End;                                  { Efecte sonore }

