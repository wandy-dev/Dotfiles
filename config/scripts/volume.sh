#!/bin/bash
if [ "$1" == "low" ]
then
 amixer -D pulse set Master 5%- unmute
 ICON=""
 TEXT=$(amixer -D pulse get Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "high" ]
then
 amixer -D pulse set Master 5%+ unmute
 ICON=""
 TEXT=$(amixer -D pulse get Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "mute" ]
then
 amixer -D pulse set Master toggle
 ICON=""
 TEXT=$(amixer -D pulse get Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
else
 echo "Usage volume [low | high | mute]\n"
fi

ID=$(cat /home/andy/.config/scripts/.dunst_volume)
if [ $ID > "0" ]
then
 dunstify -p -r $ID "$ICON $TEXT" >/home/andy/.config/scripts/.dunst_volume
else
 dunstify -p "$ICON $TEXT" >/home/andy/.config/scripts/.dunst_volume
fi
