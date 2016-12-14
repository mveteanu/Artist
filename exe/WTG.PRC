procedure AsteaptaOTasta;              { Asteapta utilizatorul sa apese o tasta }
const
  Esc = #27;
var
  Ch : char;
begin
  repeat until KeyPressed;
  Ch := ReadKey;
  if ch = #0 then ch := readkey;
  if Ch = Esc then
    Halt(0)                            { Daca se apasa ESC se termina programul}
end;                                   { AsteaptaOTasta; }

