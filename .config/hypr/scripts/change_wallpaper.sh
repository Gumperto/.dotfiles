#!/bin/bash

choice=$1

swww img $choice --transition-type wipe --transition-angle 45 --transition-duration 1.2 --transition-step 250 --transition-fps 60

cp $choice ~/current-wallpaper/current-wallpaper

wal -i $choice

# For Waybar
# killall -SIGUSR2 waybar
# No longer necessary as reload_style_on_change is now true

# For Konsole (no longer exits)
# cat $HOME/.local/share/konsole/colors-konsole.colorscheme > $HOME/.local/share/konsole/colors-konsole-copy.colorscheme

# for instance in $(qdbus | grep 'org.kde.konsole'); do
#     for session in $(qdbus $instance | grep -E 'Sessions/[0-9]+'); do
#     # just run `konsoleprofile ColorScheme=...` for all Konsole sessions
#         qdbus $instance $session org.kde.konsole.Session.setProfile Profile-copy
#         qdbus $instance $session org.kde.konsole.Session.setProfile Profile
#     done
# done

# For swaync
swaync-client -rs

# For Firefox
pywalfox update
