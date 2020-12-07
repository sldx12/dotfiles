#!/bin/bash

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity)
STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {print $2}')

# 0 - 10 / 10 - 30 / 30 - 60 / 60 - 90 / 90 - 100

if [[ "$STATE" = "charging" ]]; then
	echo "" "$BATTERY%"
elif [[ "$STATE" = "discharging" ]]; then
	if [[ "$BATTERY" -ge 90 ]]; then
		echo "" "$BATTERY%"
	elif [[ "$BATTERY" -ge 60 ]]; then
		echo "" "$BATTERY%"
	elif [[ "$BATTERY" -ge 30 ]]; then
		echo "" "$BATTERY%"
	elif [[ "$BATTERY" -ge 10 ]]; then
		echo "" "$BATTERY%"
	else
		echo "" "$BATTERY%" 
	fi
fi
