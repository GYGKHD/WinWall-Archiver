@echo off
:: Set encoding to UTF-8
chcp 65001 >nul

:: Get the date using PowerShell in YYYY-MM-DD format
for /f "delims=" %%i in ('powershell -Command "Get-Date -Format 'yyyy-MM-dd'"') do set datestr=%%i

:: Source path for the current Windows wallpaper
set "sourcePath=%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper"

:: Target directory
set "targetFolder=.\img"

:: Create the folder if it doesn't exist
if not exist "%targetFolder%" (
    mkdir "%targetFolder%"
    echo Created directory: %targetFolder%
)

:: Define the final destination path
set "targetPath=%targetFolder%\%datestr%.jpg"

:: Copy the file if it exists
if exist "%sourcePath%" (
    copy "%sourcePath%" "%targetPath%" >nul
    echo Wallpaper successfully saved to: %targetPath%
) else (
    echo Error: Source file not found at %sourcePath%
)

pause