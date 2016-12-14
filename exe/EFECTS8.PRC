Procedure EfectSonor8;                 { Efecte sonore }
Var i,j:Word;
Begin
  For i:=1 To 4 Do
  For j:=401 To 412 Do
  Begin
    Sound(i);
    Delay(11);
    Sound(j);
    Delay(11);
    NoSound;
  End
End;                                   { Efecte sonore }
