procedure EfectSonor2;                 { Efecte sonore }
  var f : byte;
    Begin;
       for f:=01 to 20 do begin
           sound(080*f);delay(08);nosound;
                          end;
       for f:=20 downto 01 do begin
           sound(080*f);delay(08);nosound;
                          end;
    end;                               { Efecte sonore }

