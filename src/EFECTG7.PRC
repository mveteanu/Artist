procedure EfectGrafic7;                { Efect de stergere a plansei }
var FillInfo : FillSettingsType;
    OldPater : FillPatternType;
begin
    AsteaptaOTasta;
    GetFillSettings(FillInfo);
    GetFillPattern(OldPater);
    SetFillStyle(EmptyFill, GetBkColor);
    Bar(0,0,320,240);Delay(100);
    Bar(320,240,640,480);Delay(100);
    Bar(320,0,640,240);Delay(100);
    Bar(0,240,320,480);
    SetFillPattern(OldPater,FillInfo.Color);
    with FillInfo do SetFillStyle(Pattern, Color);
    ClearDevice;
end;                                   { Efect de stergere a plansei }

