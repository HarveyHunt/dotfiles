setxkbmap gb
xrdb /home/harvey/.Xresources
sh ~/.fehbg &
pulseaudio --start
compton --config ~/.compton.conf -b
unclutter &
exec i3
