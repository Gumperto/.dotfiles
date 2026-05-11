-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################

hl.window_rule({
    name = "idleinhibit_fullscreen",
    match = {
        fullscreen = 1
    },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    name = "float_polkit",
    match = {
        class = "org.kde.polkit-kde-authentication-agent-1"
    },
    float = true,
})

hl.window_rule({
    name = "float_blue_wifi_man",
    match = {
        class = "nm-connection-editor|blueman-manager"
    },
    float = true,
})

hl.window_rule({
    name = "float_pavucontrol",
    match = {
        class = "org.pulseaudio.pavucontrol"
    },
    float = true,
})

hl.window_rule({
    name = "float_rofi",
    match = {
        class = "rofi",
    },
    float = true,
})

hl.window_rule({
    name = "float_htop",
    match = {
        class = "htop"
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "float_ranger",
    match = {
        class = "ranger"
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "float_debug_godot",
    match = {
        title = ".*(DEBUG).*"
    },
    float = true,
})

hl.window_rule({
    name = "float_gdscript_editor",
    match = {
        class = "gdscipt",
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "float_nwg_look",
    match = {
        class = "nwg-look"
    },
    float = true,
})

hl.window_rule({
    name = "float_fileManager",
    match = {
        class = "$fileManager"
    },
    float = true,
    persistent_size = true,
})

hl.window_rule({
    name = "tile_aseprite",
    match = {
        class = "Aseprite",
    },
    tile = true,
})

hl.window_rule({
    name = "tile_godot",
    match = {
        class = "Godot",
    },
    tile = true,
})

-- Special
hl.window_rule({
    name = "firefox_override",
    match = {
        class = "^(firefox)$"
    },
    opacity = "1 override 1 override 1 override",
})

hl.window_rule({
    name = "workspace_override",
    match = {
        workspace = -98
    },
    opacity = "1 override 1 override 1 override",
})

-- opacity (transparent) #enable as desired
 -- first value: focused, second:not focused
hl.window_rule({
    name = "spotify_override",
    match = {
        class = "^(Spotify)$"
    },
    opacity = "0.9 0.7",
})

hl.window_rule({
    name = "steam_override",
    match = {
        class = "^(steam)$"
    },
    opacity = "1 override 1 override",
})

hl.window_rule({
    name = "picture_in_picture_override",
    match = {
        class = "^(Picture-in-Picture)$",
    },
    opacity = "1 1",
    pin = true,
    float = true,
    size = {"(monitor_w * 0.75", "monitor_h * 0.25"},
    move = {"(cursor_x - (window_w * 0.72))", "(cursor_y - (window_y * 0.07))"},
})

-- Blur -----------------------------------------------------
-- Wlogout
hl.layer_rule({
    name = "blur_logout",
    match = {
        namespace = "logout_dialog"
    },
    blur = true,
})

-- hl.layerrule({
--     name = "blur_rofi",
--     match = {
--         namespace = "rofi"
--     },
--     blur = true,
-- })

-- hl.layerrule({
--     name = "blur_waybar",
--     match = {
--         namespace = "waybar"
--     },
--     blur = true,
-- })

hl.layer_rule({
    name = "blur_swaync",
    match = {
        namespace = "swaync-control-center"
    },
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule ({
    name = "blur_swaync_2",
    match = {
        namespace = "swaync-notification-window"
    },
    blur = true,
    ignore_alpha = 0.5,
})

-- Tweaks to work with blur -----------------------------------

-- Interestingly, the opacity rule above doesn't need the reduplication?
hl.window_rule({
    name = "xwayland_override",
    match = {
        class = "^(xwaylandvideobridge)$"
    },
    opacity = "0.0 override 0.0 override",
    no_anim = true,
    no_initial_focus = true,
    max_size = {"monitor_w", "monitor_h"},
    no_blur = true,
})

hl.window_rule({
    name = "suppress_maximize",
    match = {
        class = ".*"
    },
    suppress_event = "maximize",
})
