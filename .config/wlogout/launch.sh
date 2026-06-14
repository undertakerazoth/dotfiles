#!/usr/bin/env bash

if pgrep -x wlogout >/dev/null; then
    pkill -x wlogout
else
    wlogout \
        --buttons-per-row 5 \
        --column-spacing 20 \
       
fi