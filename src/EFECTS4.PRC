procedure EfectSonor4;                 { Efecte sonore }
  var f : word;
    Begin;
      for f:=1000 to 1050 do begin
          sound(f+500);delay(10);sound(f-500);delay(10);nosound;
                             end;
    end;                               { Efecte sonore }

