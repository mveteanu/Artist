@echo off
cls
echo       здддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo       Ё Acesta este programul de instalare al utilitarului ARTIST  Ё
echo       Ё                  Autor : Marian Veteanu                    Ё
echo       Ё                                                            Ё
echo       Ё                     ASTEPTATI PUTIN !                      Ё
echo       юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
if not exist ARTIST#.EXE goto eroare1
if %1x==x goto nuexistacale

if exist %1\nul goto cont
md %1
if not exist %1\nul goto eroare2
:cont
if exist %1\config.sys goto eroare3
if exist %1\*.* goto eroare4
copy ARTIST#.EXE %1 > nul
c:
cd %1
%1\ARTIST#.EXE > nul
if exist %1\ARTIST#.EXE del %1\ARTIST#.EXE > nul
echo м┬Юо╢Lм! > %1\ask.com
echo    зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo    Ё Doriti sa adaug calea spre program in fisierul Autoexec.Bat ? (D/N) Ё
echo    юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
ask
if not errorlevel 1 goto sari1
echo. >> C:\Autoexec.bat
echo PATH = %%PATH%%;%1  >> C:\Autoexec.BAT
     path = %%path%%;%1
:sari1
if exist %1\ask.com del %1\ask.com > nul

goto end

:nuexistacale
if exist C:\ARTIST\NUL goto cont2
md C:\ARTIST
:cont2
if exist C:\ARTIST\*.* goto eroare4
copy ARTIST#.EXE C:\ARTIST > nul
c:
cd C:\ARTIST
ARTIST#.EXE > nul
if exist ARTIST#.EXE del ARTIST#.EXE > nul
echo м┬Юо╢Lм! > ask.com
echo    зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo    Ё Doriti sa adaug calea spre program in fisierul Autoexec.Bat ? (D/N) Ё
echo    юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
ask
if not errorlevel 1 goto sari2
echo. >> C:\Autoexec.bat
echo PATH = %%PATH%% ;C:\ARTIST  >> C:\Autoexec.BAT
     path = %%path%%;C:\ARTIST
:sari2
if exist ask.com del ask.com > nul
goto end

:eroare1
echo   зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo   Ё Eroare : Fisierul ARTIST#.EXE trebuie sa se afle in directorul curent Ё
echo   юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
goto sfirsit

:eroare2
echo   зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo   Ё       Eroare : Trebuie sa specificati un nume valid de director       Ё
echo   Ё                Exemplu : Instal C:\UTIL\ARTIST                        Ё
echo   юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
goto sfirsit

:eroare3
echo   зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo   Ё             Eroare : Trebuie sa specificati calea completa            Ё
echo   Ё                      Exemplu : Instal C:\UTIL\ARTIST                  Ё
echo   юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
goto sfirsit

:eroare4
echo   зддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
echo   Ё  Eroare : Directorul in care doriti sa instalati ARTIST nu este gol   Ё
echo   Ё           Stergeti toate fisierele din director si incercati din nou  Ё
echo   юддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
echo.
echo.
goto sfirsit

:end
echo                            зддддддддддддддддддддд©
echo                            Ё Instalare reusita ! Ё
echo                            юддддддддддддддддддддды
echo.
echo.
goto sfirsit

:sfirsit






