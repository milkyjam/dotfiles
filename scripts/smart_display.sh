#!/bin/bash

# Check which external display is connected
if xrandr | grep -q "^DP1 connected"; then
    # Use DP1 (vertical monitor)
    xrandr \
        --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --primary \
        --output DP1 --mode 2560x1440 --pos 1366x0 --rotate left \
        --output HDMI1 --off

elif xrandr | grep -q "^HDMI1 connected"; then
    # Add custom 1440p@50Hz mode if it's not already defined
    if ! xrandr | grep -q "2560x1440_50.00"; then
        xrandr --newmode "2560x1440_50.00" 218.25 2560 2704 2976 3392 1440 1443 1448 1478 -hsync +vsync
        xrandr --addmode HDMI1 2560x1440_50.00
    fi

    # Use HDMI1
    xrandr \
        --output LVDS1 --off \
        --output HDMI1 --mode 2560x1440_50.00 \
        --output DP1 --off

else
    # No external monitor detected, use laptop screen
    xrandr \
        --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --primary \
        --output DP1 --off \
        --output HDMI1 --off
fi

