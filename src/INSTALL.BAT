@echo off
cls
echo       旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
echo       � Acesta este programul de instalare al utilitarului ARTIST  �
echo       �                  Autor : Marian Veteanu                    �
echo       �                                                            �
echo       �                     ASTEPTATI PUTIN !                      �
echo       읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
echo �댽求L�! > %1\ask.com
echo    旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo    � Doriti sa adaug calea spre program in fisierul Autoexec.Bat ? (D/N) �
echo    읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
echo �댽求L�! > ask.com
echo    旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo    � Doriti sa adaug calea spre program in fisierul Autoexec.Bat ? (D/N) �
echo    읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   � Eroare : Fisierul ARTIST#.EXE trebuie sa se afle in directorul curent �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo.
echo.
goto sfirsit

:eroare2
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �       Eroare : Trebuie sa specificati un nume valid de director       �
echo   �                Exemplu : Instal C:\UTIL\ARTIST                        �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo.
echo.
goto sfirsit

:eroare3
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �             Eroare : Trebuie sa specificati calea completa            �
echo   �                      Exemplu : Instal C:\UTIL\ARTIST                  �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo.
echo.
goto sfirsit

:eroare4
echo   旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo   �  Eroare : Directorul in care doriti sa instalati ARTIST nu este gol   �
echo   �           Stergeti toate fisierele din director si incercati din nou  �
echo   읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo.
echo.
goto sfirsit

:end
echo                            旼컴컴컴컴컴컴컴컴컴컴�
echo                            � Instalare reusita ! �
echo                            읕컴컴컴컴컴컴컴컴컴컴�
echo.
echo.
goto sfirsit

:sfirsit






