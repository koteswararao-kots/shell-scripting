#!/bin/bash

APP_LOGS_DIR=/tmp/app-logs

DATE=$(date +%F:%H:%M:%S)

LOGS_DIR=/tmp/shellscript-logs

SCRIPT_NAME=$0

LOG_FILE=$LOGS_DIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo $FILES_TO_DELETE


while read line 
do 
    echo "Deleting file $line" >> $LOG_FILE
    rm -rf $line
done <<< "$FILES_TO_DELETE"

#touch -t 202308150700 postgres.log
#bash delete-old-logs.sh




