setxkbmap us
xrdb /home/harvey/.Xresources
sh ~/.wallpaper.sh &
pulseaudio --start
compton --config ~/.compton.conf -b
xbanish -d &
exec i3
