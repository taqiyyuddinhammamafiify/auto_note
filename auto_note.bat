@echo off
:: === Auto Versioned Notes Manager ===

:: Get today's date (YYYY-MM-DD)
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set MM=%%a
    set DD=%%b
    set YY=%%c
)
set TODAY=%YY%-%MM%-%DD%

set FILE=note_%TODAY%.txt

echo Creating %FILE%...

:: Create file with template
echo === Notes for %TODAY% === > %FILE%
echo. >> %FILE%
echo - Summary: >> %FILE%
echo - What I learned today: >> %FILE%
echo - Next steps: >> %FILE%

:: Git operations
git add %FILE%
git commit -m "Add note for %TODAY%"
git push origin main

echo Done!
pause