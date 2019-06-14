PATH=$PATH
compton &
slstatus &
sxhkd &
xrdb -load /home/andy/.Xdefaults
feh --bg-fill ~/.config/wall.png
exec dbus-launch dwm
