#!/bin/bash

swww img $(fzf --layout=reverse --border) --transition-type grow --transition-pos "$(hyprctl cursorpos)" --transition-duration 1
