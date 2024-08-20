#!/bin/bash

X=30  # Set the interval in minutes

while true; do
    ~/.config/hypr/scripts/random_wallpaper.sh
    ~/.config/hypr/scripts/change_wallpaper.sh
    sleep $((X * 60))  # Convert minutes to seconds
done
