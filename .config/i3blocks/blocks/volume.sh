#!/bin/bash

VOLUME=$(amixer get Master | awk '/Front Left:/ {print $5}')
VNUM=${VOLUME:1:-2}

if [[ $VNUM = 0% ]]; then
	echo "$VNUM"
elif [[ $VNUM -ge 50 ]]; then 
	echo " $VNUM"
elif [[ $VNUM -ge 0 ]]; then
	echo "$VNUM" 
fi
