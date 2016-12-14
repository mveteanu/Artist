procedure EfectGrafic2;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for F:=1 to 100 do begin Y:=Random(480);
                             Bar(0,y,640,y+Random(10));
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

