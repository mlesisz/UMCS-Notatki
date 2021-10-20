@echo off
if "%2"=="" goto COM1
set COM=%2
goto ECHO
:COM1
set COM=COM1
:ECHO
rem echo !!! RESET DSM !!!
rem ping -n 3 127.0.0.1 >nul
mode %COM% 19200,n,8,1
echo X3 >%COM%
echo Wysyˆam plik %1...
copy %1 %COM%
