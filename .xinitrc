setxkbmap gb
xrdb /home/harvey/.Xresources
sh ~/.fehbg &
pulseaudio --start
compton --config ~/.compton.conf -b
xbanish -d &
exec i3
