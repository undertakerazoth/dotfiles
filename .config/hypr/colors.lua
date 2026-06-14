-- colors.lua

local MARS_RED = "rgba(8b0000ff)"
local FORGE_RED = "rgba(c1121fff)"
local STEEL = "rgba(1a1a1aff)"

hl.config({
    general = {
        col = {
            active_border = {
                colors = {MARS_RED, FORGE_RED},
                angle = 45,
            },
            inactive_border = STEEL,
        },
    },
})