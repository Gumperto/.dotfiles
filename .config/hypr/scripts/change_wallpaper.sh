#!/bin/bash

choice=$1

awww img $choice --transition-type wipe --transition-angle 45 --transition-duration 1.2 --transition-step 250 --transition-fps 60

cp $choice ~/current-wallpaper/current-wallpaper

wal -i $choice

# For swaync
swaync-client -rs

# For Firefox
pywalfox update
