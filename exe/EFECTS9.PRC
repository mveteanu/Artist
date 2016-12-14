Procedure EfectSonor9;                 { Efecte sonore }
Var a,i:Integer;
  Begin
          For i:=1 To 99 Do
              Begin
                Sound(1234);
                Delay(11);
                NoSound;
                Delay(2);
              End;
  End;                                 { Efecte sonore }

