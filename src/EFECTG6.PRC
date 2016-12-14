procedure EfectGrafic6;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for x:=0 to 23 do for y:=0 to 31 do
        Bar(y*20,x*20,y*20+20,x*20+20);
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

