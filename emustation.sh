#!/bin/sh

# Set up the home directory and paths
export APP=/home/apps/emustation
export PATH=$APP:$PATH
export LD_LIBRARY_PATH=$APP:$LD_LIBRARY_PATH
export DBUS_SESSION_BUS_ADDRESS=$(cat /tmp/DBUS_SESSION_BUS_ADDRESS)
export SDL_GAMECONTROLLERCONFIG_FILE=/etc/controller_map.txt

# Check to see if we're already running
# This can happen if the power manager crashes and tries to restart us
PIDFILE=/var/run/emu_run.pid
if [ -f "$PIDFILE" ]; then
    running=$(ps | fgrep $(cat "$PIDFILE") | fgrep "{$(basename $0)} /bin/sh")
    if [ "$running" != "" ]; then
        echo "$0 already running, exiting"
        exit 0
    fi
fi
echo $$ >"$PIDFILE"

# Shutdown the shell in case it got wedged somehow
if killall shell 2>/dev/null; then
    sleep 3;
fi

# Run the shell application and launch applications

export http_proxy=""
export https_proxy=""
cd $APP
HOME="/home/apps/emustation/.home"  /home/apps/emustation/emulationstation
