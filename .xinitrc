setxkbmap gb -option ctrl:swapcaps
xrdb -merge /home/harvey/.Xresources
sh ~/.wallpaper.sh &
pulseaudio --start
xsetroot -cursor_name left_ptr &
dunst &
rm ~/.config/sxhkd/sxhkdrc
ln -s ~/.config/sxhkd/sxhkdrc_normal ~/.config/sxhkd/sxhkdrc
sxhkd &
exec /home/harvey/.config/howm/bar.sh
