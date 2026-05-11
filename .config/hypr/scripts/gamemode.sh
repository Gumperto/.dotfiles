#!/usr/bin/bash
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" == true ] ; then
    hyprctl eval '
        hl.config({
            animations = { enabled = false },
            decoration = {
                shadow = {enabled = false},
                blur = { enabled = false },
                rounding = 0,
                active_opacity = 1.0,
                inactive_opacity = 1.0
            },
            general = {
                gaps_in = 0,
                gaps_out = 0,
                border_size = 1
            }
        })
    '
    exit

fi
hyprctl reload
