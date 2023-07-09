#!/bin/bash
FILE=/opt/.x.pid
if [[ -f "$FILE" ]]; then
    echo "$FILE exist"
    echo "PID: " `cat $FILE`
else
    Xvfb -nolisten tcp $DISPLAY &
    echo $? > $FILE
fi
