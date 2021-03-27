cls
@ECHO Off
color 0b & cls
color 0a

GOTO MENU
:MENU
ECHO.
ECHO.              ---------menu list--------
ECHO.
ECHO.                       1  proxy on
ECHO.                       2  proxy off
ECHO.                       3  build
ECHO.                       4  exit
echo.                choice:1 2 3 4

set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

IF "%id%"=="4"  exit
PAUSE

set /p  ID=
if "%id%"=="1"  goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

IF "%id%"=="4"  exit
PAUSE

:cmd1
@ECHO On
git config --global http.proxy  http://127.0.0.1:8119
git config --global https.proxy https://127.0.0.1:8119
echo "set proxy on"
@echo off
goto MENU

:cmd2
git config --global --unset http.proxy
git config --global --unset https.proxy
echo "set proxy off"
goto MENU

:cmd4
exit


