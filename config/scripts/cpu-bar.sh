notify-send "🖥 CPU hogs:
$(ps axch -o cmd:15,%cpu --sort=-%cpu | head)"
