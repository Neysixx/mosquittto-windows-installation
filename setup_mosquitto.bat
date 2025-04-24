@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: === PARAMETERS ===
set MOSQ_VER=2.0.21a
set MOSQ_URL=https://mosquitto.org/files/binary/win64/mosquitto-%MOSQ_VER%-install-windows-x64.exe
set MOSQ_INSTALL_DIR=C:\Program Files\mosquitto
set CONF_FILE=mosquitto.conf
set FIREWALL_RULE=MQTT_PORT_1883

:: === DOWNLOAD AND INSTALLATION ===
echo Downloading Mosquitto version %MOSQ_VER%...
powershell -Command "Invoke-WebRequest -Uri '%MOSQ_URL%' -OutFile 'mosquitto-installer.exe'"

echo Silent installation...
start /wait mosquitto-installer.exe /S

:: === COPYING CONFIGURATION FILE ===
IF EXIST "%~dp0%CONF_FILE%" (
    echo Copying custom configuration file...
    copy /Y "%~dp0%CONF_FILE%" "%MOSQ_INSTALL_DIR%\mosquitto.conf"
)

:: === CREATING PERSISTENCE & LOG FOLDERS ===
if not exist "%MOSQ_INSTALL_DIR%\log" mkdir "%MOSQ_INSTALL_DIR%\log" >nul 2>&1
if not exist "%MOSQ_INSTALL_DIR%\data" mkdir "%MOSQ_INSTALL_DIR%\data" >nul 2>&1

:: === FIREWALL CONFIGURATION ===
echo Adding firewall rule for port 1883...
netsh advfirewall firewall add rule name="%FIREWALL_RULE%" dir=in action=allow protocol=TCP localport=1883 >nul 2>&1

:: === INSTALLING AS WINDOWS SERVICE ===
sc query mosquitto >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing Mosquitto service...
    cd /d "%MOSQ_INSTALL_DIR%"
    "%MOSQ_INSTALL_DIR%\mosquitto.exe" -install
)

:: === STARTING THE SERVICE ===
echo Starting Mosquitto service...
net start mosquitto

echo.
echo ✅ Installation completed successfully.
pause
