#!/bin/bash

current_wallpaper="$HOME/current-wallpaper/current-wallpaper"
monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

hyprctl hyprpaper unload all
hyprctl hyprpaper preload $current_wallpaper
hyprctl hyprpaper wallpaper "$monitor, $current_wallpaper"

wal -i $current_wallpaper

# For Waybar
# killall -SIGUSR2 waybar
# No longer necessary as reload_style_on_change is now true

# For Konsole
# cat ~/.local/share/konsole/colors-konsole.colorscheme > ~/.local/share/konsole/colors-konsole-copy.colorscheme

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
