@ECHO OFF

SET msfs_2020_copy_folder="SSC3"

SET msfs_2024_copy_folder="SSC3"

:: ************************************************************************************************************************************************
:: ************************************************************************************************************************************************

:: Install script for SSC Weather presets MSFS2020/MSFS2024 Steam or MS Store versions.

:: The MSFS Weather Presets folders are:

:: MSFS 2020 MS Store version: %localappdata%\Packages\Microsoft.FlightSimulator_[random-letters-&-numbers]\LocalState\Weather\Presets
:: MSFS 2020 Steam version:    %appdata%\Microsoft Flight Simulator\Weather\Presets
:: MSFS 2024 MS Store Version: %localappdata%\Packages\Microsoft.Limitless_8wekyb3d8bbwe\LocalState\Weather\Presets
:: MSFS 2024 Steam version:    %appdata%\Microsoft Flight Simulator 2024\Weather\Presets

:: This script will DELETE all SSCxxx.WPR files in the Presets folder before installing the ones in this package

:: ************************************************************************************************************************************************
:: ************************************************************************************************************************************************

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

ECHO ---------------------------------------------------------------
ECHO -------       SSC Weather Preset File Copy       --------------
ECHO ---------------------------------------------------------------

IF %msfs_2020_copy_folder% NEQ "" (
    CALL :msfs_2020_ms_store
    CALL :msfs_2020_steam
)

IF %msfs_2024_copy_folder% NEQ "" (
    CALL :msfs_2024_ms_store
    CALL :msfs_2024_steam
)

ECHO ---------------------------------------------------------------
ECHO SSC Weather copy completed
PAUSE
goto :eof

:: ************************************************************************************************************************************************
:: ****************                 MSFS 2020          ********************************************************************************************
:: ************************************************************************************************************************************************

:msfs_2020_ms_store
ECHO ---------------------------------------------------------------
:: MSFS 2020 MS Store

SET msfs_2020_store_prefix="%localappdata%\Packages\Microsoft.FlightSimulator_*"
SET msfs_2020_store_presets=""
IF EXIST %msfs_2020_store_prefix% (
    :: ECHO MSFS 2020 ^(MS Store version^) found on this PC
    FOR /D %%D in (%msfs_2020_store_prefix%) do (
        :: ECHO MSFS 2020 MS Store found: %%~D
        SET msfs_2020_store_presets="%%~D\LocalState\Weather\Presets"
    )
) ELSE (
    ECHO MSFS 2020 ^(MS Store version^) not found.
)

if %msfs_2020_store_presets% NEQ "" (
    ECHO MSFS 2020 ^(MS Store version^) Presets found in:
    ECHO ----^> %msfs_2020_store_presets%
    ECHO Deleting existing SSC weather files
    DEL /f "%msfs_2020_store_presets:"=%\SSC*.WPR"
    ECHO Copying new SSC weather files
    COPY "%msfs_2020_copy_folder:"=%\*.WPR" %msfs_2020_store_presets% > nul
    REM ATTRIB +r "%msfs_2020_store_presets:"=%\SSC*.WPR"
    REM Show completion message with file count
    SET msfs_2020_store_count=0
    @FOR %%x in ("%msfs_2020_store_presets:"=%\SSC*.WPR") DO @SET /A msfs_2020_store_count+=1
    IF !msfs_2020_store_count! NEQ 0 (
        ECHO Copy of SSC Weather to MSFS 2020 ^(MS Store version^) complete ^(!msfs_2020_store_count! files^)
    ) ELSE (
        ECHO MSFS 2020 ^(MS Store version^) no WPR files.
    )
)
goto :eof

:msfs_2020_steam
ECHO ---------------------------------------------------------------
:: MSFS 2020 Steam

SET msfs_2020_steam_presets="%appdata%\Microsoft Flight Simulator\Weather\Presets"

IF EXIST %msfs_2020_steam_presets% (
    ECHO MSFS 2020 ^(Steam version^) Presets found in:
    ECHO ----^> %msfs_2020_steam_presets%
    ECHO Deleting existing SSC weather files
    DEL /f "%msfs_2020_steam_presets:"=%\SSC*.WPR"
    ECHO Copying new SSC weather files
    COPY "%msfs_2020_copy_folder:"=%\*.WPR" %msfs_2020_steam_presets% > nul
    REM ATTRIB +r "%msfs_2020_steam_presets:"=%\SSC*.WPR"
    REM Show completion message with file count
    SET msfs_2020_steam_count=0
    @FOR %%x in ("%msfs_2020_steam_presets:"=%\SSC*.WPR") DO @SET /A msfs_2020_steam_count+=1
    IF !msfs_2020_steam_count! NEQ 0 (
        ECHO Copy of SSC Weather to MSFS 2020 ^(Steam version^) complete ^(!msfs_2020_steam_count! files^)
    ) ELSE (
        ECHO MSFS 2020 ^(MS Steam version^) no WPR files.
    )
) ELSE (
    ECHO MSFS 2020 ^(Steam version^) not found.
)
goto :eof

:: ************************************************************************************************************************************************
:: ****************                 MSFS 2024          ********************************************************************************************
:: ************************************************************************************************************************************************

:msfs_2024_ms_store
ECHO ---------------------------------------------------------------
:: MSFS 2024 MS Store

SET msfs_2024_store_presets="%localappdata%\Packages\Microsoft.Limitless_8wekyb3d8bbwe\LocalState\Weather\Presets"

IF EXIST %msfs_2024_store_presets% (
    ECHO MSFS 2024 ^(MS Store version^) Presets found in:
    ECHO ----^> %msfs_2024_store_presets%
    ECHO Deleting existing SSC weather files
    DEL /f "%msfs_2024_store_presets:"=%\SSC*.WPR"
    ECHO Copying new SSC weather files
    COPY "%msfs_2024_copy_folder:"=%\*.WPR" %msfs_2024_store_presets% > nul
    REM ATTRIB +r "%msfs_2024_store_presets:"=%\SSC*.WPR"
    REM Show completion message with file count
    SET msfs_2024_store_count=0
    @FOR %%x in ("%msfs_2024_store_presets:"=%\SSC*.WPR") DO @SET /A msfs_2024_store_count+=1
    IF !msfs_2024_store_count! NEQ 0 (
        ECHO Copy of SSC Weather to MSFS 2024 ^(MS Store version^) complete ^(!msfs_2024_store_count! files^)
    ) ELSE (
        ECHO MSFS 2024 ^(MS store version^) no WPR files.
    )
) ELSE (
    ECHO MSFS 2024 ^(MS Store version^) not found.
)
goto :eof

:msfs_2024_steam
ECHO ---------------------------------------------------------------
:: MSFS 2024 Steam

SET msfs_2024_steam_presets="%appdata%\Microsoft Flight Simulator 2024\Weather\Presets"

IF EXIST %msfs_2024_steam_presets% (
    ECHO MSFS 2024 ^(Steam version^) Presets found in:
    ECHO ----^> %msfs_2024_steam_presets%
    ECHO Deleting existing SSC weather files
    DEL /f "%msfs_2024_steam_presets:"=%\SSC*.WPR"
    ECHO Copying new SSC weather files
    COPY "%msfs_2024_copy_folder:"=%\*.WPR" %msfs_2024_steam_presets% > nul
    REM ATTRIB +r "%msfs_2024_steam_presets:"=%\SSC*.WPR"
    REM Show completion message with file
    SET msfs_2024_steam_count=0
    @FOR %%x in ("%msfs_2024_steam_presets:"=%\SSC*.WPR") DO @SET /A msfs_2024_steam_count+=1
    IF !msfs_2024_steam_count! NEQ 0 (
        ECHO Copy of SSC Weather to MSFS 2024 ^(Steam version^) complete ^(!msfs_2024_steam_count! files^)
    ) ELSE (
        ECHO MSFS 2024 ^(MS Steam version^) no WPR files.
    )
) ELSE (
    ECHO MSFS 2024 ^(Steam version^) not found.
)
goto :eof
