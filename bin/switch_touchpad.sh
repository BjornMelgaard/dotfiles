#!/bin/bash

TOUCHPAD_ID=16
xinputcmd=$(xinput list-props $TOUCHPAD_ID | awk '/Device Enabled/ {print $4}')
echo "$xinputcmd"
if [ "$xinputcmd" -eq 1 ] ; then
	xinput --disable $TOUCHPAD_ID
	echo "disable"
else
	xinput --enable $TOUCHPAD_ID
	echo "enable"
fi
