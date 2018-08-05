#!/bin/bash
pkill -f /dev/video || mpv --no-osc --no-input-default-bindings --input-conf=/dev/null --geometry=-13-10 --autofit=30% av://v4l2:/dev/video0 
