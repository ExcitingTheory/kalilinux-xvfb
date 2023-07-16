#!/bin/bash
FILE=~/.vnc.pid
if [[ -f "$FILE" ]]; then
    echo "$FILE exist"
    echo "PID: " `cat $FILE`
else

    #if the USER env exists then use it, otherwise use root
    if [[ -f "$USER" ]]; then
        vncserver -geometry 1920x1080 -depth 24
    else
        USER="root" vncserver -geometry 1920x1080 -depth 24
    fi

    echo $? > $FILE
fi
