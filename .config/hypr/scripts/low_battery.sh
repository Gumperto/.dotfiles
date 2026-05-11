#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    charging=$(upower -i "$(upower -e | grep BAT)" | grep -E "state" | awk '{print $2}' )
    if [ "$charging" == "charging" ]; then
        sleep 240
    else
        if [ "$battery" -le "30" ] && [ "$battery" -gt "20" ]; then
            notify-send --expire-time=5000 --urgency=normal "Low battery: ${battery}%. Consider charging."
            sleep 240
        elif [ "$battery" -le "20" ]; then
            notify-send --expire-time=10000 --urgency=critical "Critical battery: ${battery}%. Please plug in now!"
            sleep 120
        else
            sleep 240
        fi
    fi
done 
