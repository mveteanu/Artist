procedure EfectGrafic0;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
    F,X,Y    : Word;
begin
    AsteaptaOTasta;
    GetFillPattern(OldPater);
    GetFillSettings(FillInfo);
    SetFillStyle(EmptyFill,GetBkColor);
    for f:=1 to 5000 do begin x:=Random(640);y:=Random(480);
                             Bar(x,y,x+7,y+7);
                       End;
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

