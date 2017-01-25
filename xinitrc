#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export OPTIMUS_PREFIX="primusrun"

xrdb -merge -I$HOME $HOME/.Xresources/index
xset -dpms
xset s off
xinput --disable 'ETPS/2 Elantech Touchpad'
xkbcomp $HOME/.config/xkb $DISPLAY
compton -b --config $HOME/.config/compton.conf

start-pulseaudio-x11

#notification
dunst -config ~/.i3/dunstrc &

>> /dev/null which parcellite && parcellite &
>> /dev/null which pasystray  && pasystray &

exec i3
