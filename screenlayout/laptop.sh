#!/bin/sh
xrandr --output VIRTUAL1 --off \
       --output DP3 --off \
       --output DP2 --off \
       --output DP1 --off \
       --output HDMI3 --off \
       --output HDMI2 --off \
       --output HDMI1 --off \
       --output VGA1 --off \
       --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal
exec feh --bg-fill ~/.config/wall.png

sleep 5
exec pkill -f 'polybar secondary'
