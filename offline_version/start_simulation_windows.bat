@echo off
setlocal

:: === Configuration ===
set PORT=8000
set HOST=localhost
set FOLDER=.
set URL=http://%HOST%:%PORT%
set BROWSER="C:\Program Files\Mozilla Firefox\firefox.exe"

:: === Start Python HTTP server ===
echo Starting local HTTP server at %URL%...
start "" /B python -m http.server %PORT% --directory %FOLDER%

:: === Give the server a moment to start ===
timeout /t 2 >nul

:: === Launch Firefox in kiosk mode ===
echo Launching Firefox in kiosk mode...
start "" %BROWSER% --kiosk %URL%

:: === Optional: Wait for user to close browser, then kill server ===
:: echo Waiting for Firefox to close...
:: taskkill /IM firefox.exe /T
:: echo Stopping HTTP server...
:: taskkill /F /IM python.exe

exit
