#!/bin/bash

if xrandr | grep -q "DP1 connected"; then
  xrandr \
    --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
    --output DP1 --mode 2560x1440 --pos 1366x0 --rotate left
else
  xrandr --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal
fi

