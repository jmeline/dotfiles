#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# If changing colors, make sure to change ~/.vimrc colorscheme and AirlineTheme settings
# BASE16_SHELL="$HOME/Projects/base16-shell/base16-eighties.dark.sh"
# BASE16_SHELL="$HOME/Projects/base16-shell/base16-ocean.dark.sh"
# BASE16_SHELL="$HOME/Projects/base16-shell/base16-tomorrow.dark.sh"
# BASE16_SHELL="$HOME/Projects/base16-shell/base16-flat.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# 10ms for key sequences, really helps with vi mode in zsh
# KEYTIMEOUT=1

# want your terminal to support 256 color schemes? I do ...
# export TERM="xterm-256color"

# enable vi mode
bindkey -v

# kill the lag
export KEYTIMEOUT=1
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

# Customize to your needs...
# XDG_CONFIG_HOME+=("$HOME/.config")
# export XDG_CONFIG_HOME

# setting up autojump
#[[ -s /home/jmeline/.autojump/etc/profile.d/autojump.sh ]] && source /home/jmeline/.autojump/etc/profile.d/autojump.sh
#autoload -U compinit && compinit -u

# Fish-like syntax highlighting
## Mac after doing brew install 'zsh-syntax-highlighting'
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Linux
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autojump
# source /etc/profile.d/autojump.zsh
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# (set -x; sudo mount -t vboxsf -o gid=1000,uid=1000 VBox /home/$(whoami)/Shared)
