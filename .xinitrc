setxkbmap us -option ctrl:swapcaps
xrdb -merge /home/harvey/.Xresources
sh ~/.wallpaper.sh &
pulseaudio --start
xsetroot -cursor_name left_ptr &
dunst &
#exec /home/harvey/code/howm/bar.sh
exec i3
