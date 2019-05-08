#!/bin/sh

# Set up the home directory and paths
export APP=/home/apps/emustation
export PATH=$APP:$PATH
export LD_LIBRARY_PATH=$APP:$LD_LIBRARY_PATH
export DBUS_SESSION_BUS_ADDRESS=$(cat /tmp/DBUS_SESSION_BUS_ADDRESS)
export SDL_GAMECONTROLLERCONFIG_FILE=/etc/controller_map.txt

# Run the shell application and launch applications
cd $APP
HOME="/home/apps/emustation/.home"  /home/apps/emustation/emulationstation