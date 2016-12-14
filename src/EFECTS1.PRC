procedure EfectSonor1;                 { Efecte sonore }
  var f : byte;
    Begin;
      for f:=1 to 3 do begin
          sound(1000);delay(10);nosound;delay(200);
                       end;
    end;                               { Efecte sonore }

