#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#
export _JAVA_AWT_WM_NONREPARENTING=1

## Set the keyboard repeat rate to something much faster
xset r rate 175 25

picom --config ~/.dotfiles/picom/.picom.conf &
# redshift -l 40.76:-111.89 & # salt lake city
redshift &
# nitrogen --restore &
~/.fehbg &
sxhkd &
~/.dotfiles/bspwm/.config/bspwm/updateScreen.sh
# sudo ~/bin/enableSpdif.sh
# sudo ~/bin/archlinux/sleep.sh
exec bspwm
