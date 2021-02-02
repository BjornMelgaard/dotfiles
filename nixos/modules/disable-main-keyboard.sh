#!/bin/sh


################################################################################
# Disable the built~in keyboard when using an external keyboard.
set -e
set -u

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/tmp/myscriptlog.out 2>&1

################################################################################
export PATH=@nixpath@:$PATH
export USER=srghma
export HOME=/home/$USER
export DISPLAY=":0.0"
export XAUTHORITY=$HOME/.Xauthority

echo "HOME=$HOME"

################################################################################
list_builtin_keyboard() {
  xinput --list --name-only | \
    grep -Ei '^AT .*keyboard' | \
      head -n 1
}


################################################################################
name=$(list_builtin_keyboard)

echo "name = $name"

if [ -z "$name" ]; then
  >&2 echo "ERROR: can't find built-in keyboard!"
  exit 1
fi

# https://config.qmk.fm/#/redox/rev1/LAYOUT

if [ $# -eq 1 ] && [ "$1" = "add" ]; then
  # An external keyboard was added.
  # xinput --disable "$name"

  # setxkbmap -layout "us,ru" -option "grp:ctrl_shift_toggle" -variant "qwerty"
  # setxkbmap -layout -option -variant
  setxkbmap -model "pc104" -layout "us,ru" -variant "qwerty" -option "" -symbols ""
  xkbcomp /home/srghma/.dotfiles/layouts/en_ru $DISPLAY
  setxkbmap -print -verbose 10
else
  # An external keyboard was removed.
  # xinput --enable "$name"

  setxkbmap -model "pc104" -layout "us,ru" -variant "qwerty" -option "" -symbols ""
  setxkbmap -model "pc104" -layout "us,ru" -variant "qwerty" -option "caps:swapescape,grp:rctrl_rshift_toggle"
  xkbcomp /home/srghma/.dotfiles/layouts/en_ru_swapped $DISPLAY
  setxkbmap -print -verbose 10
fi

# setxkbmap -print -verbose 10
