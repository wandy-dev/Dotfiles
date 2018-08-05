#!/bin/bash
# I'm not quite sure why, but a new non-recording instance of ffmpeg will start after
# being killed the first time, so the core command here runs twice after a break.
pkill -P $(pgrep -x screencast\|audio\|video) 2>/dev/null && sleep .5 &&
  pkill -P $(pgrep -x screencast\|audio\|video) 2>/dev/null

# Update i3bar.
echo "" > ~/.config/scripts/.recording
