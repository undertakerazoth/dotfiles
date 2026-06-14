-- ~/.config/hypr/environment.lua

-- Cursor
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

-- Wayland / desktop
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt apps
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- GTK / Electron
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Mozilla / Firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Java apps
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

-- Nvidia only, keep if you use Nvidia
 hl.env("LIBVA_DRIVER_NAME", "nvidia")
 hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")