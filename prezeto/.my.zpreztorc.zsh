xset r rate 200 25 > /dev/null

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow 2> /dev/null"
export FZF_CTRLT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export XDG_CONFIG_HOME="$HOME/.config"

# building xanmod with modprobe-db to include only the modules I need
# export _localmodcfg="y"
export _microarchitecture=99
export use_numa="n"
export use_tracers="n"
export use_pds="n"

export VISUAL=nvim
export EDITOR=nvim
export DRACULA_PRO_VIM_DIR="~/.dracula_pro_nvim_theme/vim"
export KEYTIMEOUT=1
# export DOTNET_ROOT=/usr/share/dotnet
export DOTNET_ROOT=~/.dotnet
export MSBuildSDKsPath=${DOTNET_ROOT}/sdk/$(${DOTNET_ROOT}/dotnet --version)/Sdks
export PATH=${PATH}:${DOTNET_ROOT}
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export CHROME_BIN=/usr/bin/chromium
# Customize to your needs...

# git aliases
alias g='git'
alias gs='git status'

# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

alias cat='bat'
alias ls='exa --icons -h'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# convenience aliases for editing configs
alias ev='vim ~/.config/nvim/init.lua'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
alias ekitty='v ~/.config/kitty/kitty.conf'
alias ebspwm='vim ~/.config/bspwm/bspwmrc'
alias esxkhd='vim ~/.config/sxhkd/sxhkdrc'
alias epoly='vim ~/.config/polybar/config'
alias epolylaunch='vim ~/.config/polybar/launch.sh'
alias vim='nvim'
alias vi='vim'
alias v='vim'
alias cpr='rsync -avzz'
alias g++='g++ -O3'
alias ara='paru'
alias rm='trash-put'
alias ff='fastfetch'

alias yt="yt-dlp"

function lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

function pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

function cpr() {
  rsync -v --archive -hh --partial --info=stats1 --info=progress2 --modify-window=1 "$@"
}

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

if [[ `uname` == 'Linux' ]] then
    ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    AUTO_JUMP_PATH="/etc/profile.d/autojump.zsh"
fi

[[ -s $ZSH_SYNTAX_HIGHLIGHTING_PATH ]] && source $ZSH_SYNTAX_HIGHLIGHTING_PATH
[[ -s $AUTO_JUMP_PATH ]] && source $AUTO_JUMP_PATH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(ssh-agent)

# PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
# export GEM_HOME=$HOME/.gem

# export GOPATH=$(go env GOPATH)
# export GOBIN=$GOPATH/bin

# Find the command support for zsh using pacman
#source /usr/share/doc/find-the-command/ftc.zsh quiet noprompt info

pathadd ~/.bin

fpath+=~/.zfunc

## Add powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# BEGIN_KITTY_SHELL_INTEGRATION
# if test -e "$HOME/code/kitty/shell-integration/kitty.zsh"; then source "$HOME/code/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION
