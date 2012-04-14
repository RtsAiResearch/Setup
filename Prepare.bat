:: Get BWAPI framework path
set bwapi=..\bwapi 3.7.2
set /p bwapi=Enter BWAPI path: %=%
echo BWAPI path: %bwapi%
:: Get StarCraft game path
set starcraft=..\starcraft
set /p starcraft=Enter StarCraft path: %=%
echo StarCraft path: %starcraft%

echo Setting up IStrategizer environment ...
echo Copying BWAPI files ...
xcopy "%bwapi%\include" "..\IStrategizer\Build\IStrategizerBWAPIClient\include" /Y /I /E /Q
xcopy "%bwapi%\lib" "..\IStrategizer\Build\IStrategizerBWAPIClient\lib" /Y /I /E /Q
xcopy "%bwapi%\windows\*.*" "..\IStrategizer\Build\Debug\*.*" /Y /I /E /Q
xcopy "%bwapi%\starcraft\*.*" "%starcraft%\*.*" /Y /I /E /Q
xcopy "%bwapi%\chaoslauncher\*.*" "%starcraft%\chaoslauncher\*.*" /Y /I /E /Q
xcopy "bwapi.ini" "%starcraft%\bwapi-data" /Y /Q

echo Compiling Serialization Libraries
cd ..\Serialization
msbuild Serialization.sln /p:configuration=debug /p:platform=win32 /t:clean
msbuild Serialization.sln /p:configuration=debug /p:platform=win32
cd ..

echo Congratulations, setup is done!

pause
set bwapi=
set starcraft=
