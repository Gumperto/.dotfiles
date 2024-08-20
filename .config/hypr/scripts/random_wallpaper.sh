#!/bin/bash

directory=~/wallpaper

if [ -d "$directory" ]; then
    random_background=$(ls $directory/wallpaper-* | shuf -n 1)
    cp "$random_background" ~/current-wallpaper/current-wallpaper
fi
