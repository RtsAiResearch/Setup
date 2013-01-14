@echo off

:: Clone user repos
set /p user=Enter your GitHub username:
mkdir RtsAiResearch
echo Cloning RTS AI Research repos ...
git clone https://%user%@github.com/%user%/IStrategizer.git RtsAiResearch\IStrategizer
git clone https://%user%@github.com/%user%/CaseVisualizer.git RtsAiResearch\CaseVisualizer
git clone https://%user%@github.com/RtsAiResearch/Serialization.git RtsAiResearch\Serialization
git clone https://%user%@github.com/RtsAiResearch/Setup.git RtsAiResearch\Setup

:: Preparing development environment
cd RtsAiResearch\Setup
call Prepare.bat
cd ..\..