#!/bin/bash

ONOFF=$(amixer get Master | awk '/Front Left:/ {print $6}')
VOLUME=$(amixer get Master | awk '/Front Left:/ {print $5}')
VNUM=${VOLUME:1:-2}

if [[ "$ONOFF" = "[off]" ]]; then
	echo " off"
else
	if [[ $VNUM = 0% ]]; then
		echo "$VNUM%"
	elif [[ $VNUM -ge 50 ]]; then 
		echo " $VNUM%"
	elif [[ $VNUM -ge 0 ]]; then
		echo "$VNUM%" 
	fi
fi
