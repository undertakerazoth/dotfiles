hl.on("hyprland.start", function()

    -- Wallpaper
    hl.exec_cmd("hyprpaper")

    -- Bar
    hl.exec_cmd("waybar")

    -- Notifications
    hl.exec_cmd("mako")

    -- Clipboard
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Network applet
    hl.exec_cmd("nm-applet")

    -- Bluetooth
    hl.exec_cmd("blueman-applet")

    --Background Apps
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
    hl.exec_cmd("hypridle")

end)