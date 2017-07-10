#!/bin/bash

TOUCHPAD_NAME="Elantech Touchpad"
TOUCHPAD_ID=$(xinput list | sed -n "s/.*${TOUCHPAD_NAME}.*id=\([0-9]\+\).*$/\1/p")
xinputcmd=$(xinput list-props $TOUCHPAD_ID | awk '/Device Enabled/ {print $4}')
echo "$xinputcmd"
if [ "$xinputcmd" -eq 1 ] ; then
	xinput --disable $TOUCHPAD_ID
	echo "disable"
else
	xinput --enable $TOUCHPAD_ID
	echo "enable"
fi
