setxkbmap us -option ctrl:swapcaps
xrdb -merge /home/hunt/.Xresources
xsetroot -cursor_name left_ptr &
feh --bg-scale .walls/greenfog.jpg &
polybar bottom &
picom -CG -D 5 &
ssh-agent bspwm
