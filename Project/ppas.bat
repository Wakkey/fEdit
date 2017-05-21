@echo off
SET THEFILE=utf.dll
echo Linking %THEFILE%
C:\lazarus14\fpc\2.6.4\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  --gc-sections  -s --dll  --entry _DLLMainCRTStartup   --base-file base.$$$ -o utf.dll link.res
if errorlevel 1 goto linkend
C:\lazarus14\fpc\2.6.4\bin\i386-win32\dlltool.exe -S C:\lazarus14\fpc\2.6.4\bin\i386-win32\as.exe -D utf.dll -e exp.$$$ --base-file base.$$$ 
if errorlevel 1 goto linkend
C:\lazarus14\fpc\2.6.4\bin\i386-win32\ld.exe -b pei-i386 -m i386pe  -s --dll  --entry _DLLMainCRTStartup   -o utf.dll link.res exp.$$$
if errorlevel 1 goto linkend
C:\lazarus14\fpc\2.6.4\bin\i386-win32\postw32.exe --subsystem console --input utf.dll --stack 16777216
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
