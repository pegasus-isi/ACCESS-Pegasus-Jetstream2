#!/bin/bash

# shut down the VM when the master exists

# ignore shutdown in the beginning of the uptime - let's the system settle down
UPTIME=$(cat /proc/uptime | sed 's/[\. ].*//')
if [ $UPTIME -lt 900 ]; then
    exit 0
fi

# if somebody is logged in (debugging), leave it running
USER_COUNT=$(w --no-header | wc -l)
if [ $USER_COUNT -gt 0 ]; then
    exit 0
fi

logger "Shutting down node due to lack of work!"

/sbin/shutdown -h now


