procedure EfectGrafic1;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill,GetBkColor);
    for f:=1 to 500 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+40,y+40);
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

