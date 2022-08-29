@echo off
title VapourSynth Portable r59

:: Download URLs (VapourSynth r59 + Python 3.10.6)
SET dl_7z=https://xidl.github.io/7za.exe
SET dl_python=https://www.python.org/ftp/python/3.10.6/python-3.10.6-embed-amd64.zip
SET dl_vs=https://github.com/vapoursynth/vapoursynth/releases/download/R59/VapourSynth64-Portable-R59.7z
SET dl_vsrepogui=https://github.com/theChaosCoder/VSRepoGUI/releases/download/v0.9.7/VSRepoGUI-0.9.7.zip
SET dl_pedeps=https://github.com/brechtsanders/pedeps/releases/download/0.1.11/pedeps-0.1.11-win64.zip
SET dl_pip=https://bootstrap.pypa.io/get-pip.py

:: Getting wget
echo Downloading required components... & echo.
if not exist "_temp" mkdir "_temp"
if exist "_temp\wget.exe" goto :dl
if exist "wget.exe" move /y "wget.exe" "_temp\wget.exe">NUL & goto :dl
if not exist "wget.exe" curl -L -sS "https://xidl.github.io/wget.exe" -o wget.exe >NUL
if not exist "wget.exe" powershell (New-Object Net.WebClient).DownloadFile('https://xidl.github.io/wget.exe', 'wget.exe') >NUL
if exist "wget.exe" move /y "wget.exe" "_temp\wget.exe">NUL & goto :dl
if not exist "wget.exe" (echo.
echo Your system can't download stuff via command line.
echo Please download wget from https://github.com/webfolderio/wget-windows/releases,
echo rename it to "wget.exe" and put it in the same directory as this batch script.) & goto :end

:dl
:: Donwloading temp files with wget
if exist "_temp" cd "_temp"
SET wgetparams=-nc --no-hsts -q --show-progress
wget.exe %wgetparams% -O "7z.exe" "%dl_7z%"
wget.exe %wgetparams% "%dl_vs%"
wget.exe %wgetparams% "%dl_vsrepogui%"
wget.exe %wgetparams% "%dl_pedeps%"
wget.exe %wgetparams% "%dl_python%"
wget.exe %wgetparams% "%dl_pip%"
echo Done! & echo.

echo Uncompressing files...
7z.exe x -y "python*" -o"..\VapourSynth">NUL
copy "get-pip.py" "..\VapourSynth">NUL
7z.exe x -y "VapourSynth64*" -o"..\VapourSynth">NUL
7z.exe x -y "VSRepoGUI*" -o"..\VapourSynth">NUL
7z.exe e -y "pedeps*" "bin\listpedeps.exe" -o"..\VapourSynth">NUL
echo Done! & echo.

echo Preparing Python...
::TODO - insert python310._pth
cd "..\VapourSynth"
python.exe get-pip.py

:end
pause