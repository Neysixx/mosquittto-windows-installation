@echo off
echo Restarting Mosquitto SERVICE...
net stop mosquitto >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Warning: Could not stop the service. It may not be running.
) else (
    echo Mosquitto service stopped.
)

net start mosquitto
if %ERRORLEVEL% NEQ 0 (
    echo Failed to start Mosquitto service. Please check if it's properly installed.
) else (
    echo ✅ Mosquitto restarted successfully.
)
pause
