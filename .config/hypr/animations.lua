hl.config({
    animations = {
        enabled = true,
    },
})

-- Curves
hl.curve("forgeOut", {
    type = "bezier",
    points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("machineSnap", {
    type = "bezier",
    points = { { 0.15, 0 }, { 0.1, 1 } },
})

-- Animations
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "forgeOut",
    style = "popin 85%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 2,
    bezier = "machineSnap",
    style = "popin 80%",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "forgeOut",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 8,
    bezier = "forgeOut",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "forgeOut",
    style = "slide",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3,
    bezier = "forgeOut",
    style = "slide",
})