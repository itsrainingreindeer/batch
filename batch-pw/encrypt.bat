@echo off
setlocal enableDelayedExpansion

set ENCRYPTION=%1
set chars=0abcdefghijklmnopqrstuvwxyz
for /L %%N in (1 1 26) do (
for /F %%C in ("!chars:~%%N,1!") do (
set "ENCRYPTION=!ENCRYPTION:%%C=-%%N!"
)
)
echo !ENCRYPTION!
start decrypt.bat !ENCRYPTION!
exit
