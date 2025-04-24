@echo off
echo Restarting Mosquitto SERVICE...
net stop mosquitto >nul
net start mosquitto
echo ✅ Mosquitto restarted successfully.
if exist "C:\Program Files\MQTT Explorer\MQTT-Explorer.exe" (
    start "" "C:\Program Files\MQTT Explorer\MQTT-Explorer.exe"
) else (
    echo ⚠️ MQTT Explorer does not exist.
)
pause
