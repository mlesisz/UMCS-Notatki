@echo off
if "%1"=="" GOTO COM1
set COM=%1
goto MODE
:COM1
set COM=COM1
:MODE
echo Ustawiam parametry portu %COM%...
mode %COM% 110,n,8,1 >nul
echo ==  W ci¥gu dw¢ch sekund naci˜nij  ==
echo dowolny przycisk RESET zestawu DSM-51
echo €€€€€€€€€€€€€€€€€€€€ >%COM%
echo Czas min¥ˆ.
mode %COM% 19200,n,8,1 >nul
