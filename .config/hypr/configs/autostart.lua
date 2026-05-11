-- #################
-- ### AUTOSTART ###
-- #################

hl.on("hyprland.start", function()
    -- Basic
    hl.exec_cmd("waybar 2>&1 > $HOME/errors/waybar-log.txt")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hyprctl setcursor Marisa-Kirisame 24")
    hl.exec_cmd("awww-daemon")
    -- Others
    hl.exec_cmd("$HOME/.config/hypr/scripts/change_wallpaper.sh & $HOME/.config/hypr/scripts/change_wallpaper_timer.sh")
    hl.exec_cmd("$HOME/.config/hypr/scripts/float_yomitan.sh")
    hl.exec_cmd("$HOME/.config/hypr/scripts/low_battery.sh")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("hyprctil reload")
end)
