Procedure Spray (x,y : Integer);       { Deseneaza efectul de spray }
  var f : Byte;
  Begin
    For f:=1 To sprm Do
         Case Sprc Of
             0 : PutPixel (x+Random(Sprm),y+Random(Sprm),GetColor);
             1 : PutPixel (x+Random(Sprm),y+Random(Sprm),Random(GetMaxColor));
         End; {Case}
  End;                                 { Spray }

