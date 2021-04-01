#!/bin/bash

RIGHT_MONITOR=DisplayPort-0
LEFT_MONITOR=HDMI-A-0
# TV=DVI-I-0
  # xrandr --output DVI-I-1 --mode 1920x1080 --set underscan off --primary --output HDMI-A-0 --mode 1920x1080 --right-of DVI-I-1 --output DVI-I-0 --mode 1920x1080 --right-of HDMI-A-0 --set underscan off --set "underscan vborder" 35 --set "underscan hborder" 50

xrandr \
  --output $LEFT_MONITOR --mode 2560x1440 --primary \
  --output $RIGHT_MONITOR --mode 2560x1440 --right-of $LEFT_MONITOR

nitrogen --restore
