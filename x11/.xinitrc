#!/bin/sh

udiskie &
unclutter &
setxkbmap -model abnt2 -layout br -variant abnt2
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'&
xrdb -load ~/.Xresources
exec i3
