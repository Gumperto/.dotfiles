#!/bin/bash

# Define the card name
CARD_NAME="alsa_card.usb-Plantronics_Plantronics_Blackwire_3220_Series_597AB1DFF6AE6744A17516D74681F4F2-00"

get_mode() {
    CURRENT_PROFILE=$(pactl list cards | grep -A 100 "Name: $CARD_NAME" | grep "Active Profile" | awk '{print $3}')
    if [[ "$CURRENT_PROFILE" == "output:analog-stereo" ]]; then
        echo "{\"text\": \"Listening\", \"alt\": \"listening\"}" 
    elif [[ "$CURRENT_PROFILE" == "output:analog-stereo+input:analog-stereo" ]]; then
        echo "{\"text\": \"Meeting\", \"alt\": \"meeting\"}"
    else
        echo "{\"text\": \"Unknown\", \"alt\": \"unknown\"}"
    fi
}

if [[ "$1" == "--toggle" ]]; then
    CURRENT_PROFILE=$(pactl list cards | grep -A 100 "Name: $CARD_NAME" | grep "Active Profile" | awk '{print $3}')
    if [[ "$CURRENT_PROFILE" == "output:analog-stereo" ]]; then
        pactl set-card-profile "$CARD_NAME" output:analog-stereo+input:analog-stereo
        notify-send "🎤 Meeting Mode" "Mic enabled (Headset)"
    elif [[ "$CURRENT_PROFILE" == "output:analog-stereo+input:analog-stereo" ]]; then
        pactl set-card-profile "$CARD_NAME" output:analog-stereo
        notify-send "🎧 Listening Mode" "Mic disabled, high-quality audio"
    fi
fi

get_mode | jq --unbuffered --compact-output
