@echo off
cls
echo      旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
echo      � Acest fisier .BAT va compila automat programul ARTIST �
echo      �                 Autor : Marian Veteanu                �
echo      읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

if not exist    MOUSE.PAS goto eroare
if not exist FONTURI1.PAS goto eroare
if not exist FONTURI2.PAS goto eroare
if not exist FONTURI3.PAS goto eroare
if not exist   ARTIST.PAS goto eroare
if not exist SHAREWAR.INC goto eroare

bpc -B -CD ARTIST.PAS                  > nul

if exist    mouse.tpu del    mouse.tpu > nul
if exist fonturi1.tpu del fonturi1.tpu > nul
if exist fonturi2.tpu del fonturi2.tpu > nul
if exist fonturi3.tpu del fonturi3.tpu > nul
goto end

:eroare
echo.
echo      Eroare : Nu exista toate fisierele sursa ale programului !
echo.
goto sfirsit

:end
echo.
echo                     Compilare reusita.
echo.

:sfirsit
