@echo off
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
cd ..
:onCrash
echo [%date% %time%] Restarting SEARCH Server...
DSSearch-server_64.exe --log "B:\FFIvalice\Process Logs\search_%mydate%.log"
REM DSSearch-server_64.exe
echo Server was stopped or crashed!
GOTO onCrash