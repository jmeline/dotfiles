# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jmeline/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jmeline/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jmeline/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jmeline/.fzf/shell/key-bindings.zsh"

# Extras
#

source "/home/jmeline/.fzf.extras/git.zsh"
source "/home/jmeline/.fzf.extras/extras.zsh"

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
  }
# Base16 Dracula
# Author: Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)

_gen_fzf_default_opts() {

local color00='#282936'
local color01='#3a3c4e'
local color02='#626483'
local color03='#4d4f68'
local color04='#62d6e8'
local color05='#e9e9f4'
local color06='#f1f2f8'
local color07='#f7f7fb'
local color08='#ea51b2'
local color09='#b45bcf'
local color0A='#ebff87'
local color0B='#00f769'
local color0C='#a1efe4'
local color0D='#62d6e8'
local color0E='#b45bcf'
local color0F='#00f769'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts
