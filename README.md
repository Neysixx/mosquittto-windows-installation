# Mosquitto Windows Installer

An automated setup tool for installing and configuring Mosquitto MQTT Broker on Windows systems.

## Overview

This project provides batch scripts to automate the installation and configuration of the Eclipse Mosquitto MQTT broker on Windows. It handles downloading, installation, configuration, and setting up the Windows service.

## Files

- **setup_mosquitto.bat** - The main installation script
- **mosquitto.conf** - Custom configuration file for Mosquitto
- **restart_mosquitto.bat** - Utility script to restart the Mosquitto service

## Features

- Automatic download and silent installation of Mosquitto
- Custom configuration deployment
- Windows service setup
- Firewall rule creation
- Creation of data persistence and log folders

## Requirements

- Windows operating system
- Administrative privileges
- Internet connection (for initial download)

## Installation

1. Download or clone this repository
2. Right-click on `setup_mosquitto.bat` and select "Run as administrator"
3. The script will automatically:
   - Download Mosquitto v2.0.21a (this version can be changed in the script)
   - Install it silently
   - Copy the custom configuration
   - Create necessary folders
   - Configure Windows Firewall
   - Install and start the Windows service

## Configuration

The default configuration (`mosquitto.conf`) includes:

- Listener on port 1883
- Anonymous connections allowed
- Logging to `C:\Program Files\mosquitto\log\mosquitto.log`
- Data persistence in `C:\Program Files\mosquitto\data\`

You can modify the `mosquitto.conf` file before running the installation script.

## Post-Installation

After installation, Mosquitto will:
- Run as a Windows service (auto-start on boot)
- Listen on port 1883 for MQTT connections
- Allow anonymous connections

## Restarting the Service

If you need to restart the Mosquitto service, simply run the `restart_mosquitto.bat` script as administrator.

## Customization

You can modify the following parameters in `setup_mosquitto.bat`:
- `MOSQ_VER`: Mosquitto version to install
- `MOSQ_INSTALL_DIR`: Installation directory
- `FIREWALL_RULE`: Name of the Windows Firewall rule

## License

This project is provided as-is for educational and practical purposes.

## Acknowledgments

- [Eclipse Mosquitto](https://mosquitto.org/) - Open source MQTT broker