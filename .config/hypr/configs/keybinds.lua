-- ####################
-- ### KEYBINDINGSS ###
-- ####################
require("globals")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Toggle Waybar
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- Reload Waybar
hl.bind(mainMod .. "+ SHIFT + B", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- Basic & launch
hl.bind(mainMod .. "+ T", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. "+ E", hl.dsp.exec_cmd(Terminal .. "-e nvim"))
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. "+ SHIFT + E", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. "+ SHIFT + K", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Rofi script
hl.bind(mainMod .. "+ SUPER_L", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window")) -- Rofi
hl.bind(mainMod .. "+ CTRL + W", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/wallpaper_select.sh"))
hl.bind(mainMod .. "+ period", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/clip_manager.sh"))

-- Rice
hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/random_wallpaper.sh"))
hl.bind(mainMod .. "+ SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. "+ D", hl.dsp.exec_cmd(FileManager))

-- Fullscreen & Floating
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ V", hl.dsp.window.float())
-- hl.bind(mainMod .. "+ SHIFT + V", hl.dsp.exec_cmd("hyprctl dispatch 'workspaceopt allfloat'"))

-- Dwindle
hl.bind(mainMod .. "+ P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. "+ J", hl.dsp.layout("togglesplit")) -- dwindle

-- Gamemode
hl.bind(mainMod .. "+ G", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/gamemode.sh"))

-- Move focus with mainMod + arrow keys
-- Move windows

local directions = {"left", "right", "up", "down"}

for _,dir in ipairs(directions) do
    hl.bind(mainMod .. "+" .. dir, hl.dsp.focus({ direction = dir }))
    hl.bind(mainMod .. "+ SHIFT +" .. dir, hl.dsp.window.move({ direction = dir }))
end

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. "+" .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "+ SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. "+ S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. "+ CTRL + S", hl.dsp.window.move({ workspace = "special:magic"}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. "+ CTRL + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+ CTRL + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio adjusting
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume_control.sh --inc"), {locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume_control.sh --dec"), {locked = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume_control.sh --toggle"), {locked = true})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/volume_control.sh --toggle-mic"), {locked = true})

-- Brightness adjusting
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/Brightness.sh --inc"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/Brightness.sh --dec"), {locked = true, repeating = true})

-- Screenshot
hl.bind(mainMod .. "+ Print", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/screenshot.sh --now"))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/screenshot.sh --area"))
hl.bind(mainMod .. "+ SHIFT + T", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/screenshot.sh --jpn"));
hl.bind(mainMod .. "+ CTRL + Print", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/screenshot.sh --in5")) -- screenshot in 5 secs

-- Zoom
hl.bind(mainMod .. "+ mouse_down", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.1')"), {repeating = true})
hl.bind(mainMod .. "+ mouse_up", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.9) | if . < 1 then 1 else . end')"), {repeating = true})

hl.bind(mainMod .. "+ equal", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.1')"), {repeating = true})
hl.bind(mainMod .. "+ minus", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.9) | if . < 1 then 1 else . end')"), {repeating = true})

hl.bind(mainMod .. "+ CTRL + 0", hl.dsp.exec_cmd("hyprctl -q keyword cursor:zoom_factor 1"))

 -- Switch into resize mode
hl.bind(mainMod .. "+ SHIFT + R", hl.dsp.submap("resize"))

-- Submap name
hl.define_submap("resize", function()

    -- Keybinds
    hl.bind("right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), {repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), {repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), {repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), {repeating = true })

    -- Reset mode
    hl.bind("escape", hl.dsp.submap("reset"))
end)
