@echo off
setlocal

if "%~1"=="" (
    echo Usage: run filename.cpp
    exit /b 1
)

set FILE=%~1
set NAME=%~n1
set INPUT=%NAME%_in.txt
set EXE=%NAME%.exe

echo Compiling %FILE%...

g++ "%FILE%" -o "%EXE%"

if %errorlevel% neq 0 (
    echo Compilation failed.
    pause
    exit /b 1
)

echo Running %EXE%...

if exist "%INPUT%" (
    "%EXE%" < "%INPUT%"
) else (
    echo Input file %INPUT% not found.
    "%EXE%"
)

pause