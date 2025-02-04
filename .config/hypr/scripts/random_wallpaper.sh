#!/bin/bash

directory=$HOME/wallpaper

if [ -d "$directory" ]; then
    random_background=$(ls $directory/* | shuf -n 1)
    swww img $random_background --transition-type wipe --transition-angle 45 --transition-duration 0.33 --transition-step 250 --transition-fps 60
    cp $random_background ~/current-wallpaper/current-wallpaper

    wal -i $random_background
    swaync-client -rs
    pywalfox update
fi
