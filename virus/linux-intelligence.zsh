#!/bin/zsh

SCRIPT_TO_RUN="./linux-secret-agent.zsh"
PID_FILE="/tmp/script_pid.txt"

function start_script() {
    $SCRIPT_TO_RUN 5 &
    echo $! > $PID_FILE
}

function check_and_restart() {
    if [ -f $PID_FILE ]; then
        PID=$(cat $PID_FILE)
        if ! kill -0 $PID 2>/dev/null; then
            echo "Script is not running. Restarting..."
            start_script
        fi
    else
        echo "PID file not found. Starting script..."
        start_script
    fi
}

# Start the script initially
start_script

# Check every 5 seconds and restart if necessary
while true; do
    sleep 5
    check_and_restart
done
