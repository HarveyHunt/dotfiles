#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
