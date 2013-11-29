@echo off
:: Get StarCraft game path
set starcraft=..\..\starcraft
set /p starcraft=Enter StarCraft path (without double quotes): %=%
echo StarCraft path: %starcraft%

echo Setting up IStrategizer environment ...
echo Copying BWAPI files ...
xcopy "Files\chaoslauncher\*.*" "%starcraft%\chaoslauncher\*.*" /Y /I /E /Q
xcopy "Files\bwapi.ini" "%starcraft%\bwapi-data" /Y /Q

echo Compiling Serialization Libraries
cd ..\Serialization
msbuild Serialization.sln /p:configuration=debug /p:platform=win32 /t:clean
msbuild Serialization.sln /p:configuration=debug /p:platform=win32

echo Congratulations, setup is done!

pause
set bwapi=
set starcraft=
