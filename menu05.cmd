@echo off
REM Menu
:menu5
cls
echo ----------------------------------------------------------
echo --- Menu5          ---  ---          CREATED BY MRLSx7 ---
echo ----------------------------------------------------------
echo [1]
echo [2]
echo [3]
echo [4]
echo [5]
echo [6]
echo [7]
echo [8]
echo [9]
echo [10]
echo ----------------------------------------------------------
echo [0] Exit                                                   
echo ----------------------------------------------------------
::---------------------------------------------------------------------------------------------------------------------------
set /p choice="Enter your choice (0,1,2,3...): "
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="1" 
if "%choice%"=="2" 
if "%choice%"=="3" 
if "%choice%"=="4" 
if "%choice%"=="5" 
if "%choice%"=="6" 
if "%choice%"=="7" 
if "%choice%"=="8" 
if "%choice%"=="9" 
if "%choice%"=="10" 
::---------------------------------------------------------------------------------------------------------------------------
if "%choice%"=="0" exit
::---------------------------------------------------------------------------------------------------------------------------
::pause
goto menu5
::---------------------------------------------------------------------------------------------------------------------------
