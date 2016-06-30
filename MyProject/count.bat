@echo off
cls
setlocal EnableDelayedExpansion
rem set TST=%~1
set "cmd=findstr /R /N "Dpt-10" %filename% | find /C ":""
 for /f %%a in ('!cmd!') do set number=%%a
rem set %2=%number%
echo %number%
pause
