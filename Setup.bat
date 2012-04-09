@Echo off

set user=
set /p user=Enter your GitHub username:
echo Cloning RTS AI Research repos ...
git clone https://%user%@github.com/%user%/IStrategizer.git ..\IStrategizer
git clone https://%user%@github.com/%user%/CaseVisualizer.git ..\CaseVisualizer
git clone https://%user%@github.com/%user%/Serialization.git ..\Serialization

set bwapi=..\bwapi 3.7.2
set starcraft=..\starcraft
:: set bwapi_default=
:: set starcraft_default=

:: Todo: Ask user for bwapi and starcraft pathes, if user press enter and the provided path was empty assume a default path and show it to him
:: else use the provided path
:: Echo Enter BWAPI path:
:: Echo Etner StarCraft path:
:: if provided pathes are empty, then use defaults, else use provided ones

Echo Setting up IStrategizer environment ...

Echo Copying BWAPI files ...
xcopy "%bwapi%\include" "..\IStrategizer\Build\IStrategizerBWAPIClient\include" /Y /I /E /Q
xcopy "%bwapi%\lib" "..\IStrategizer\Build\IStrategizerBWAPIClient\lib" /Y /I /E /Q
xcopy "%bwapi%\windows\*.*" "..\IStrategizer\Build\Debug\*.*" /Y /I /E /Q
xcopy "%bwapi%\starcraft\*.*" "%starcraft%\*.*" /Y /I /E /Q
xcopy "%bwapi%\chaoslauncher\*.*" "%starcraft%\chaoslauncher\*.*" /Y /I /E /Q
xcopy "bwapi.ini" "%starcraft%\bwapi-data" /Y /Q

Echo Compiling Serialization Libraries
cd ..\Serialization
msbuild Serialization.sln /p:configuration=debug /p:platform=win32 /t:clean
msbuild Serialization.sln /p:configuration=debug /p:platform=win32

Echo Done!
pause
set bwapi=
set starcraft=
