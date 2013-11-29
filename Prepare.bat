@echo off
:: Get StarCraft game path
set starcraft=..\..\starcraft
set /p starcraft=Enter StarCraft path (without double quotes): %=%
echo StarCraft path: %starcraft%

echo Setting up IStrategizer environment ...
echo Copying BWAPI files ...
xcopy "Files\chaoslauncher\*.*" "%starcraft%\chaoslauncher\*.*" /Y /I /E /Q
xcopy "Files\bwapi.ini" "%starcraft%\bwapi-data" /Y /Q

echo Configuring Visual Studio 2010 environment variables
call Files\vsvars32.bat

echo Compiling Serialization Libraries
cd ..\Serialization

msbuild Serialization.sln /p:configuration=debug /p:platform=win32 /t:clean
msbuild Serialization.sln /p:configuration=debug /p:platform=win32

echo Make sure to set IStrategizerBWAPIClient working directory to $(OutDir)
echo Congratulations, setup is done!

pause
set bwapi=
set starcraft=
