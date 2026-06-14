-- ~/.config/hypr/binds.lua

local terminal = "kitty"
local launcher = "~/.config/rofi/scripts/app-categories.sh"
local files = "kitty -e yazi"
local monitor = "kitty -e btop"

--Q,Super,E,P,C,F,V,L,
--1-9,shift 1-9,print,shift print,N,ctrl-shift-n,
--B,shift P,

-- Apps
hl.bind(
    "SUPER + Q", 
    hl.dsp.exec_cmd(terminal)
)
hl.bind(
    "SUPER + SUPER_L", 
    hl.dsp.exec_cmd(launcher)
)
hl.bind(
    "SUPER + E", 
    hl.dsp.exec_cmd(files)
)
hl.bind(
    "SUPER + P", 
    hl.dsp.exec_cmd(monitor)
)

-- Windows
hl.bind(
    "SUPER + C", 
    hl.dsp.window.kill()
)
hl.bind(
    "SUPER + F", 
    hl.dsp.window.fullscreen({ action = "toggle" })
)
hl.bind(
    "SUPER + V", 
    hl.dsp.window.float({ action = "toggle" })
)



-- Workspaces
for i = 1, 9 do
    hl.bind(
        "SUPER + " .. i, 
        hl.dsp.focus({ workspace = tostring(i) })
    )
    hl.bind(
        "SUPER + SHIFT + " .. i, 
        hl.dsp.window.move({ workspace = tostring(i) })
    )
end

-- Screenshots
hl.bind(
    "Print",
    hl.dsp.exec_cmd("grimblast copy area")
)
hl.bind(
    "SHIFT + Print", 
    hl.dsp.exec_cmd("grimblast copy screen")
)


-- Mouse window controls
hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag()
)
hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize()
)


--Notifications
hl.bind(
    "SUPER + N",
    hl.dsp.exec_cmd("makoctl dismiss")
)

hl.bind(
    "SUPER + SHIFT + N",
    hl.dsp.exec_cmd("makoctl dismiss-all")
)

hl.bind(
    "SUPER + CTRL + N",
    hl.dsp.exec_cmd("makoctl restore")
)

-- Color picker: copies HEX color and sends notification
hl.bind(
    "SUPER + B",
    hl.dsp.exec_cmd("hyprpicker -a -f hex -n")
)

-- Volume knob / media keys
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
)

-- Brightness
hl.bind(
    "XF86MonBrightnessUp", 
    hl.dsp.exec_cmd("brightnessctl set +5%")
)
hl.bind(
    "XF86MonBrightnessDown", 
    hl.dsp.exec_cmd("brightnessctl set 5%-")
)

-- Media playback
hl.bind(
    "XF86AudioPlay", 
    hl.dsp.exec_cmd("playerctl play-pause")
)
hl.bind(
    "XF86AudioNext", 
    hl.dsp.exec_cmd("playerctl next")
)
hl.bind(
    "XF86AudioPrev", 
    hl.dsp.exec_cmd("playerctl previous")
)
--Power menu
hl.bind(
    "SUPER + SHIFT + P",
    hl.dsp.exec_cmd("~/.config/wlogout/launch.sh")
)

--Lock
hl.bind(
    "SUPER + L",
    hl.dsp.exec_cmd("hyprlock")
)
