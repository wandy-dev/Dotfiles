#!/bin/bash
st -t 'Text'        & disown
st -t 'Environment' & disown
exec slack & disown
xrandr --output VIRTUAL1 --off \
       --output DP2 --off \
       --output DP1 --off \
       --output HDMI3 --off \
       --output HDMI1 --off \
       --output LVDS1 --off \
       --output VGA1 --off \
       --output DP3 --mode 1920x1200 --pos 1960x0 --rotate left \
       --output HDMI2 --primary --mode 1920x1080 --pos 0x296 --rotate normal
exec feh --bg-fill ~/.config/wall.png

exec ~/.screenlayout/work-bar.sh & disown
