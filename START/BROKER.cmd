:onCrash
echo [%date% %time%] Restarting BROKER...

F:
cd F:\pydarkstar\bin

set ***REMOVED***=C:\ProgramData\Anaconda3
call %***REMOVED***%\Scripts\activate.bat pydarkstar

python .\broker.py

echo BROKER was stopped or crashed!
GOTO onCrash