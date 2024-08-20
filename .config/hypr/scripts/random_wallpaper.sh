#!/bin/bash

directory=$HOME/wallpaper

if [ -d "$directory" ]; then
    random_background=$(ls $directory/wallpaper-* | shuf -n 1)
    cp "$random_background" $HOME/current-wallpaper/current-wallpaper
fi
