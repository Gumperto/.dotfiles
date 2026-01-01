#!/bin/bash

directory=$HOME/wallpaper
SCRIPTSDIR="$HOME/.config/hypr/scripts"

if [ -d "$directory" ]; then
    random_background=$(ls $directory/* | shuf -n 1)
    $SCRIPTSDIR/change_wallpaper.sh "$random_background"
fi
