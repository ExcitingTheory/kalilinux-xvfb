#!/bin/bash
FILE=/opt/.x.pid
if [[ -f "$FILE" ]]; then
    echo "$FILE exist"
    echo "PID: " `cat $FILE`
else
    # Fell down a rabbit hole and definitely wanted to block xvfb from network, probably ridiculous
    # https://superuser.com/questions/855019/make-xvfb-listen-only-on-local-ip
    Xvfb -nolisten tcp $DISPLAY &
    echo $? > $FILE
fi
