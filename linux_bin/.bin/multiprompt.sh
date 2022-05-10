#!/bin/bash
# dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.
# For example:
# `./prompt "Do you want to shutdown?" "shutdown -h now"`


# [ "$(printf "No\\nYes" | dmenu -i -p "$1" -nb darkred -sb red -sf white -nf gray )" = "Yes" ] && $2
RESULT="$(printf "No\\nYes" | dmenu -i -p "$1" -fn 'mononoki Bold Nerd Font Complete:size=15' -nb '#282a36' -sb '#282a36' -sf '#f8f8f2' -nf '#ff79c6' )"
echo "$2"
