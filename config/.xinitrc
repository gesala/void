setxkbmap es
feh --bg-scale $HOME/wallpapers/bg.jpg
picom &
pipewire &
sleep 1
wireplumber &
pipewire-pulse &
dwmblocks &
dunst &
nm-applet &
pa-applet &
spotifyd &
exec dbus-run-session dwm 
