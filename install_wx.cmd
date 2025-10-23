@ECHO OFF
REM Install script for SSC Weather presets MSFS2020/MSFS2024 Steam or MS Store versions.

REM ************************************************************************************************************************************************
REM The MSFS Weather Presets folders are:

REM 2020 MS Store version: C:\Users\Admin\AppData\Local\Packages\Microsoft.FlightSimulator_[random-letters-&-numbers]\LocalState\Weather\Presets 
REM 2020 Steam version:    C:\Users\[Your Name]\AppData\Roaming\Microsoft Flight Simulator\Weather\Presets
REM 2024 MS Store Version: C:\Users\[Your Name]\AppData\Local\Packages\Microsoft.Limitless_8wekyb3d8bbwe\LocalState\Weather\Presets
REM 2024 Steam version:    C:\Users\[Your Name]\AppData\Roaming\Microsoft Flight Simulator 2024\Weather\Presets

REM This script will DELETE all SSCxxx.WPR files in the Presets folder before installing the ones in this folder
REM ************************************************************************************************************************************************

SETLOCAL ENABLEEXTENSIONS

SET ms_store_root=%LOCALAPPDATA%

ECHO MS Store root is %ms_store_root%

REM ************************************************************************************************************************************************
REM 2020 MS Store

IF EXIST "C:\Users\Admin\AppData\Local\Packages\Microsoft.FlightSimulator_*" (
    ECHO MS Store MSFS 2020 exists
    FOR /D %%D in ("C:\Users\Admin\AppData\Local\Packages\Microsoft.FlightSimulator_*") do ( 
        ECHO MSFS 2020 MS Store found: %%~D 
        SET WX_DIR=%%~D\LocalState\Weather\Presets
    )
) ELSE (
    ECHO MSFS 2020 MS STORE WX PRESETS NOT FOUND
)

if "%WX_DIR%" NEQ "" (
    ECHO MSFS 2020 MS STORE WX_DIR is %WX_DIR%
    ECHO Deleting existing SSC weather files
    del /f "%WX_DIR%\SSC*.WPR"
    ECHO Copying new SSC weather files
    copy *.WPR "%WX_DIR%"
    attrib +r "%WX_DIR%\SSC*.WPR"
)
