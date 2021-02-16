#!/bin/bash
# xrandr --output DisplayPort-0 --off --output DVI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-0 --off --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate normal


LEFT_MONITOR=DVI-I-1
RIGHT_MONITOR=HDMI-A-0
TV=DVI-I-0

  xrandr --output DVI-I-1 --mode 1920x1080 --set underscan off --primary --output HDMI-A-0 --mode 1920x1080 --right-of DVI-I-1 --output DVI-I-0 --mode 1920x1080 --right-of HDMI-A-0 --set underscan off --set "underscan vborder" 35 --set "underscan hborder" 50
