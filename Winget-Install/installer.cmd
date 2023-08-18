REM @ECHO off

SET MyDir=%~dp0
SET SOURCEDIR=%MyDir:~0,-1%
SET logpath=%programfiles%\support\logs
IF NOT EXIST "%logPath%" ( mkdir "%logPath%" )

ECHO Launching %~dp0installer.ps1 %1 %2 > "%logPath%\%2-install.log"
START /MIN /WAIT Powershell.exe -NoProfile -ExecutionPolicy ByPass -File %~dp0installer.ps1 %1 %2 >> "%logPath%\%2-install1.log"
