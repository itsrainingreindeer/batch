@echo off
setlocal enableDelayedExpansion

:pre
cls
set woo=%1
echo %woo%
echo Continue to decrypt...
pause
cls
set bool=1
if bool==1 (
set bool=0
goto decrypt
)

:start
cls
echo -create (create password)
echo -check (check password)
echo.
set /p PROGRAM= What do you want to do?: 
goto %PROGRAM%

:decrypt
set chars=0abcdefghijklmnopqrstuvwxyz
for /L %%N in (1 1 26) do (
for /F %%C in ("!chars:~%%N,1!") do (
set "woo=!woo:-%%N=%%C!"
)
)
echo !woo!
pause
goto start

:create
cls
set /p PASSWORD= What do you want your password to be?: 
echo %PASSWORD% > test.txt
pause
goto start

:check
cls
set /p PASSWORD1= What is your password?: 
for /f "Delims=" %%a in (test.txt) do (
set TEXT=%%a
)
if %PASSWORD1%==%TEXT% (
echo Correct Password
pause
goto correct
)
echo Wrong Password
pause
goto start

:correct
cls
start encrypt.bat %PASSWORD1%
exit
