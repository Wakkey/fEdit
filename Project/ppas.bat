@echo off
SET THEFILE=fedit.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.0.2\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o fedit.exe link.res
if errorlevel 1 goto linkend
C:\lazarus\fpc\3.0.2\bin\i386-win32\postw32.exe --subsystem gui --input fedit.exe --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
