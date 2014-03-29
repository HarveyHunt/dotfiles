setxkbmap us
xrdb /home/harvey/.Xresources
sh ~/.wallpaper.sh &
pulseaudio --start
xbanish -i Mod3 &
exec i3 
