@echo off
echo Restarting Mosquitto SERVICE...
net stop mosquitto >nul
net start mosquitto
echo ✅ Mosquitto restarted successfully.
pause
