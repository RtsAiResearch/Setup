@echo off

:: Clone user repos
set /p user=Enter your GitHub username:
mkdir RtsAiResearch
echo Cloning RTS AI Research repos ...
git clone https://%user%@github.com/%user%/IStrategizer.git RtsAiResearch\IStrategizer
git clone https://%user%@github.com/%user%/CaseVisualizer.git RtsAiResearch\CaseVisualizer
git clone https://%user%@github.com/RtsAiResearch/Serialization.git RtsAiResearch\Serialization
git clone https://%user%@github.com/RtsAiResearch/Setup.git RtsAiResearch\Setup

echo Please make sure to install Starcraft:Broodwar game and then install BWAPI from RtsAiResearch\Setup\Files\BWAPI_Setup.exe before continue with the installation
pause

:: Preparing development environment
cd RtsAiResearch\Setup
call Prepare.bat
cd ..\..