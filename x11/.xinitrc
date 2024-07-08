#!/bin/sh

udiskie &
setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape' &
setxkbmap -model abnt2 -layout br -variant abnt2
xrdb -merge ~/.config/X11/.Xresources
urxvtd -o -q -f &
exec i3
