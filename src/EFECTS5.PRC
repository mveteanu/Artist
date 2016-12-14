procedure EfectSonor5;                 { Efecte sonore }
  var f : byte;
    Begin;
       for f:=1 to 200 do begin
           sound(f*Random(50));delay(5);nosound;
                          end;
    end;                               { Efecte sonore }

