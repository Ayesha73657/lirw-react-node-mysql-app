#!/bin/bash

# Docker Compose project directory
APP_DIR="/home/ubuntu/lirw-react-node-mysql-app"

# Log file
LOG_FILE="/var/log/docker-schedule.log"

# Move to application directory
cd "$APP_DIR" || {
    echo "$(date): ERROR - Cannot access $APP_DIR" >> "$LOG_FILE"
    exit 1
}

# Check argument
case "$1" in

    start)
        echo "$(date): Starting Docker Compose application..." 
        /usr/bin/docker compose up -d >> "$LOG_FILE" 2>&1

        if [ $? -eq 0 ]; then
            echo "$(date): Application started successfully." 
        else
            echo "$(date): ERROR - Failed to start application." 
            exit 1
        fi
        ;;

    stop)
        echo "$(date): Stopping Docker Compose application..."  
        /usr/bin/docker compose down >> "$LOG_FILE" 2>&1

        if [ $? -eq 0 ]; then
            echo "$(date): Application stopped successfully." 
        else
            echo "$(date): ERROR - Failed to stop application." 
            exit 1
        fi
        ;;

    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;

esac