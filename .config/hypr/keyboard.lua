-- ~/.config/hypr/keyboard.lua

hl.config({
    input = {
        -- First layout is used for Hyprland binds, so keep "us" first
        kb_layout = "us,cz",
        kb_variant = ",qwerty",

        -- Switch layout with Alt + Shift
        -- Caps Lock becomes Escape
        kb_options = "grp:win_space_toggle,caps:escape",

        -- Keyboard repeat
        repeat_rate = 40,
        repeat_delay = 300,

        -- NumLock on startup
        numlock_by_default = true,

        -- Mouse / touchpad
        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
        },
    },
})