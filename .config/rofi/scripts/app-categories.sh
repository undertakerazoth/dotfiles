#!/bin/bash

THEME="$HOME/.config/rofi/themes/omnissiah.rasi"

# Toggle behavior:
# If rofi is already open, pressing the bind again closes it.
if pgrep -x rofi >/dev/null; then
    pkill -x rofi
    exit 0
fi

launch_desktop() {
    local desktop_id="$1"

    if command -v gtk-launch >/dev/null 2>&1; then
        gtk-launch "$desktop_id" >/dev/null 2>&1 &
    else
        notify-send "Rofi" "gtk-launch not found. Install gtk3."
    fi
}

make_app_list() {
    local category="$1"
    local tmp="$2"

    printf "󰁍 Return\t__BACK__\n" > "$tmp"

    find /usr/share/applications "$HOME/.local/share/applications" \
        -name "*.desktop" 2>/dev/null | while read -r file; do

        grep -q "^NoDisplay=true" "$file" && continue
        grep -q "^Hidden=true" "$file" && continue

        name=$(grep -m1 "^Name=" "$file" | cut -d= -f2-)
        cats=$(grep -m1 "^Categories=" "$file" | cut -d= -f2-)
        id=$(basename "$file" .desktop)

        [ -z "$name" ] && continue

        case "$category" in
            ALL)
                match=1
                ;;
            GAME)
                [[ "$cats" == *"Game"* ]] && match=1 || match=0
                ;;
            INTERNET)
                [[ "$cats" == *"Network"* ]] && match=1 || match=0
                ;;
            DEVELOPMENT)
                [[ "$cats" == *"Development"* ]] && match=1 || match=0
                ;;
            GRAPHICS)
                [[ "$cats" == *"Graphics"* ]] && match=1 || match=0
                ;;
            MULTIMEDIA)
                [[ "$cats" == *"AudioVideo"* ]] && match=1 || match=0
                ;;
            OFFICE)
                [[ "$cats" == *"Office"* ]] && match=1 || match=0
                ;;
            SYSTEM)
                [[ "$cats" == *"System"* ]] && match=1 || match=0
                ;;
            SETTINGS)
                [[ "$cats" == *"Settings"* ]] && match=1 || match=0
                ;;
            UTILITY)
                [[ "$cats" == *"Utility"* ]] && match=1 || match=0
                ;;
            *)
                match=0
                ;;
        esac

        [ "$match" -eq 1 ] && printf "󰣆 %s\t%s\n" "$name" "$id" >> "$tmp"
    done
}

open_apps() {
    local category="$1"
    local title="$2"
    local tmp
    local menu
    tmp=$(mktemp)
    menu=$(mktemp)

    make_app_list "$category" "$tmp"

    # Keep Return first, sort the rest alphabetically
    {
        grep "__BACK__" "$tmp" | cut -f1
        grep -v "__BACK__" "$tmp" | sort | cut -f1
    } > "$menu"

    selected_index=$(cat "$menu" | rofi \
        -dmenu \
        -i \
        -no-custom \
        -format i \
        -p "$title" \
        -theme "$THEME")

    [ -z "$selected_index" ] && rm -f "$tmp" "$menu" && exit 0

    selected_line=$(sed -n "$((selected_index + 1))p" "$menu")

    # Find matching desktop ID from original tmp file
    desktop_id=$(grep -F "$selected_line" "$tmp" | head -n1 | cut -f2)

    rm -f "$tmp" "$menu"

    if [ "$desktop_id" = "__BACK__" ]; then
        return 0
    fi

    launch_desktop "$desktop_id"
    exit 0
}

while true; do
    choice=$(printf "󰚩 All Applications\n󰊴 Games\n󰅩 Internet\n󰅨 Development\n󰏘 Graphics\n󰕧 Multimedia\n󰏖 Office\n󰒓 System\n Settings\n󰈙 Utilities\n Power Menu" | \
        rofi -dmenu -i -no-custom -p "Noosphere Archives" -theme "$THEME")

    case "$choice" in
        "󰚩 All Applications")
            open_apps "ALL" "All Applications"
            ;;
        "󰊴 Games")
            open_apps "GAME" "Games"
            ;;
        "󰅩 Internet")
            open_apps "INTERNET" "Internet"
            ;;
        "󰅨 Development")
            open_apps "DEVELOPMENT" "Development"
            ;;
        "󰏘 Graphics")
            open_apps "GRAPHICS" "Graphics"
            ;;
        "󰕧 Multimedia")
            open_apps "MULTIMEDIA" "Multimedia"
            ;;
        "󰏖 Office")
            open_apps "OFFICE" "Office"
            ;;
        "󰒓 System")
            open_apps "SYSTEM" "System"
            ;;
        " Settings")
            open_apps "SETTINGS" "Settings"
            ;;
        "󰈙 Utilities")
            open_apps "UTILITY" "Utilities"
            ;;
        
        *)
            exit 0
            ;;
    esac
done