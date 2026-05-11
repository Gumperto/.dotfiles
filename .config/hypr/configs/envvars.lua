-- #############################
-- ### ENVIRONMENT VARIABLES ###
-- #############################

hl.env("XCURSOR_SIZE","24")
-- hl.env = env("XCURSOR_THEME", "Marisa-Kirisame")

hl.env("HYPRCURSOR_THEME", "Marisa-Kirisame")
hl.env("HYPRCURSOR_SIZE","48")

hl.env("QT_QPA_PLATFORM","wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME","qt5ct")
hl.env("XDG_SESSION_TYPE","wayland")

-- vulkan
hl.env("WLR_RENDERER","vulkan")

-- firefox
hl.env("MOZ_ENABLE_WAYLAND","1")

-- IME
hl.env("QT_IM_MODULE","fcitx")
