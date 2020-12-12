#!/bin/bash

ONOFF=$(pacmd list-sinks | awk '/muted/ { print $2 }')
VNUM=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

if [[ "$ONOFF" = "yes" ]]; then
	echo " off"
else
	if [[ $VNUM = 0 ]]; then
		echo " $VNUM%"
	elif [[ $VNUM -ge 50 ]]; then 
		echo " $VNUM%"
	elif [[ $VNUM -ge 0 ]]; then
		echo " $VNUM%" 
	fi
fi
