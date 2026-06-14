-- Floating windows
hl.window_rule({
    name = "float-dialogs",
    match = {
        modal = true,
    },
    float = true,
    center = true,
    size = { 700, 450 },
})

hl.window_rule({
    name = "float-pavucontrol",
    match = {
        class = "pavucontrol",
    },
    float = true,
    center = true,
    size = { 800, 500 },
})

hl.window_rule({
    name = "float-blueman",
    match = {
        class = "blueman-manager",
    },
    float = true,
    center = true,
    size = { 800, 500 },
})

-- Browser
hl.window_rule({
    name = "zen-browser",
    match = {
        class = "zen",
    },
    workspace = "2",
})

-- VSCodium
hl.window_rule({
    name = "codium-workspace",
    match = {
        class = "codium",
    },
    workspace = "3",
})

-- Yazi / Kitty terminal look
hl.window_rule({
    name = "kitty-opacity",
    match = {
        class = "kitty",
    },
    opacity = "0.95 0.90",
    rounding = 6,
})

-- No blur for games / fullscreen
hl.window_rule({
    name = "no-blur-fullscreen",
    match = {
        fullscreen = true,
    },
    no_blur = true,
})

-- Smart gaps when only one tiled window
hl.workspace_rule({
    workspace = "w[tv1]s[false]",
    gaps_out = 0,
    gaps_in = 0,
})

hl.window_rule({
    name = "no-border-single-window",
    match = {
        float = false,
        workspace = "w[tv1]s[false]",
    },
    border_size = 0,
    rounding = 0,
})