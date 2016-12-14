procedure EfectSonor3;                 { Efecte sonore }
  var f : byte;
    Begin;
      for f:=1  to 45 do Begin
          sound(100*f);delay(10);nosound;
                         End;
    end;                               { Efecte sonore }

