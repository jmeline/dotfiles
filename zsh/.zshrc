
exists() {
  command -v "$1" > /dev/null 2>&1
}

if exists archey; then
  archey
elif exists archey3; then
  archey3
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# If changing colors, make sure to change ~/.vimrc colorscheme and AirlineTheme settings
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# 10ms for key sequences, really helps with vi mode in zsh kill the lag
export KEYTIMEOUT=1

# want your terminal to support 256 color schemes? I do ...
# export TERM="xterm-256color"

# enable vi mode
bindkey -v

# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'
# alias vim='nvim'

setopt HIST_IGNORE_DUPS # Prevent duplicate lines in the history
# alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
# Customize to your needs...
# XDG_CONFIG_HOME+=("$HOME/.config")
# export XDG_CONFIG_HOME

#autoload -U compinit && compinit -u

# Fish-like syntax highlighting && Autojump setup
if [[ `uname` == 'Linux' ]] then
    ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    AUTO_JUMP_PATH="/etc/profile.d/autojump.zsh"
fi
if [[ `uname` == 'Darwin' ]] then
    ## Mac after doing brew install 'zsh-syntax-highlighting'
    ZSH_SYNTAX_HIGHLIGHTING_PATH="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    AUTO_JUMP_PATH="$(brew --prefix)/etc/profile.d/autojump.sh "
fi
[[ -s $ZSH_SYNTAX_HIGHLIGHTING_PATH ]] && source $ZSH_SYNTAX_HIGHLIGHTING_PATH
[[ -s $AUTO_JUMP_PATH ]] && source $AUTO_JUMP_PATH

# (set -x; sudo mount -t vboxsf -o gid=1000,uid=1000 VBox /home/$(whoami)/Shared)
