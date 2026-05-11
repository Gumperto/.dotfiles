-- #####################
-- ### LOOK AND FEEL ###
-- #####################

hl.config({
    general = { 
        gaps_in = 5,
        gaps_out = 20,
        -- gaps_in = 0,
        -- gaps_out = 0,

        border_size = 4,

        col = {
            active_border = { colors = {"rgba(bbffddee)", "rgba(dd77ffee)"}, angle = 60 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,

        allow_tearing = false,

        -- This layout sets one thing to the left, the rest go right
        -- layout = "master",

        -- This layout is like i3 where you can stack things according to how you want it
        layout = "dwindle"
    },


    decoration = {
        rounding = 10,

        active_opacity = 0.85,
        fullscreen_opacity = 1,
        inactive_opacity = 0.65,
        
        -- active_opacity = 1,
        -- fullscreen_opacity = 1,
        -- inactive_opacity = 1,
        --
        shadow = {
            enabled = true,
            -- enabled = false,
            range = 4,
            render_power = 7,
            color = 0x1a1a1aee,
        },

        blur = {
            -- enabled = false,
            enabled = true,

            size = 7,
            passes = 2,
            contrast = 0.8916,

            noise = 0.0217,

            vibrancy = 0.2,

            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
        -- enabled = false,
    },
})


hl.curve("shot", { type = "bezier", points = { {0.2, 1.0}, {0.2, 1.0} } })
hl.curve("swipe", { type = "bezier", points = { {0.6, 0.0}, {0.2, 1.05} } })
hl.curve("linear", { type = "bezier", points = { {0.0, 0.0}, {1.0, 1.0} } })
hl.curve("progressive", { type = "bezier", points = { {1.0, 0.0}, {0.6, 1.0} } })

hl.animation( {leaf = "windows", enabled = true, speed = 6, bezier = "shot", style = "slide" })
hl.animation( {leaf = "workspaces", enabled = true, speed = 6, bezier = "shot", style = "slide" })
hl.animation( {leaf = "fade", enabled = true, speed = 4, bezier = "progressive" })
hl.animation( {leaf = "border", enabled = true, speed = 6, bezier = "linear" })
hl.animation( {leaf = "borderangle", enabled = true, speed = 100, bezier = "linear" }) -- used by rainbow borders and rotating colors

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
        permanent_direction_override = true,
    },
})

hl.config({
    master = {
        new_status = "slave",
        mfact = 0.4,
        new_on_top = true,
    },
})



hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.config({
    misc = {
        middle_click_paste = false,
        force_default_wallpaper = 1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})
